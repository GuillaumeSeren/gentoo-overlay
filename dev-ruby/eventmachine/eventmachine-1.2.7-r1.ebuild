# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_GEMSPEC="eventmachine.gemspec"

inherit ruby-fakegem

DESCRIPTION="EventMachine is a fast, simple event-processing library for Ruby programs"
HOMEPAGE="https://github.com/eventmachine/eventmachine"
SRC_URI="https://github.com/eventmachine/eventmachine/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="|| ( GPL-2 Ruby )"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x64-solaris ~x86-solaris"
IUSE=""

DEPEND="${DEPEND}
	dev-libs/openssl:0"
RDEPEND="${RDEPEND}
	dev-libs/openssl:0"

ruby_add_bdepend "test? ( dev-ruby/test-unit:2 )"

all_ruby_prepare() {
	# Remove package tasks to avoid dependency on rake-compiler.
	rm rakelib/package.rake || die

	sed -i -e '/git ls-files/d' ${RUBY_FAKEGEM_GEMSPEC} || die
	# Remove the resolver tests since they require network access and
	# the localhost test fails with an IPv6 localhost.
	rm tests/test_resolver.rb || die

	# Needs a tty
	rm tests/test_kb.rb || die

	# Avoid tests that require network access
	sed -e '/test_bind_connect/,/^  end/ s:^:#:' \
		-e '/test_invalid_address_bind_connect_src/,/^  end/ s:^:#:' \
		-e '/test_invalid_address_bind_connect_dst/,/^  end/ s:^:#:' \
		-i tests/test_basic.rb || die
	sed -i -e '/test_\(cookie\|http_client\|version_1_0\)/,/^  end/ s:^:#:' \
		tests/test_httpclient.rb || die
	sed -i -e '/test_\(get\|https_get\)/,/^  end/ s:^:#:' \
		tests/test_httpclient2.rb || die
	sed -i -e '/test_connect_timeout/,/^  end/ s:^:#:' \
		tests/test_unbind_reason.rb || die
	sed -i -e '/test_for_real/,/^    end/ s:^:#:' \
		tests/test_pending_connect_timeout.rb || die
	# Avoid tests for insecure SSL versions that may not be available
	sed -e '/test_any_to_v3/,/^    end/ s:^:#:' \
		-e '/test_v3_/,/^    end/ s:^:#:' \
		-e '/test_tlsv1_required_with_external_client/aomit "sslv3"' \
		-e '/test_any_to_any/,/^    end/ s:^:#:' \
		-e '/test_case_insensitivity/,/^    end/ s:^:#:' \
		-e '/test_default_to_default/,/^    end/ s:^:#:' \
		-i tests/test_ssl_protocols.rb || die
	sed -e '/test_ipv6_udp_local_server/,/^    end/ s:^:#:' \
		-e '/test_ipv6_tcp_local_server/,/^    end/ s:^:#:' \
		-i tests/test_ipv6.rb || die

	rm tests/test_{sock_opt,ssl_verify,ssl_methods,ssl_dhparam,ssl_ecdh_curve,idle_connection}.rb || die

	# Avoid test that deliberately triggers a C++ exception which causes
	# a SEGFAULT. This does not appear to happen upstream (on travis).
	rm tests/test_exc.rb || die
}

each_ruby_configure() {
	for extdir in ext ext/fastfilereader; do
		pushd "${extdir}" || die
		${RUBY} extconf.rb || die "extconf.rb failed for ${extdir}"
		popd || die
	done
}

each_ruby_compile() {
	for extdir in ext ext/fastfilereader; do
		pushd "${extdir}" || die
		# both extensions use C++, so use the CXXFLAGS not the CFLAGS
		emake V=1 CFLAGS="${CXXFLAGS} -fPIC" archflag="${LDFLAGS}"
		popd || die
		cp $extdir/*.so lib/ || die "Unable to copy extensions for ${extdir}"
	done
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb-2 tests/test_*.rb || die
}

all_ruby_install() {
	all_fakegem_install

	doins -r examples
}
