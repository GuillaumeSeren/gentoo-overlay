# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_DOCDIR="doc"
RUBY_FAKEGEM_EXTRADOC="CHANGES.txt README.md THANKS.txt"
RUBY_FAKEGEM_EXTRAINSTALL="support"

inherit ruby-fakegem

DESCRIPTION="Non-interactive SSH processing in pure Ruby"
HOMEPAGE="https://github.com/net-ssh/net-ssh"
SRC_URI="https://github.com/${PN}/${PN}/archive/v${PV}.rc1.tar.gz -> net-ssh-git-${PV}.tgz"

LICENSE="GPL-2"
SLOT="$(ver_cut 1)"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86"
IUSE="ed25519 test"

MY_P="net-ssh-6.2.0.rc1"
RUBY_S=${MY_P}

ruby_add_rdepend "
	virtual/ruby-ssl
		ed25519? (
			>=dev-ruby/ed25519-1.2:1
			dev-ruby/x25519 dev-ruby/bcrypt_pbkdf:1
	)
"
ruby_add_bdepend "
	test? (
		>=dev-ruby/mocha-0.13
		dev-ruby/test-unit:2
	)
"

all_ruby_prepare() {
	# Avoid bundler dependency
	sed -i -e '/\(bundler\|:release\)/ s:^:#:' Rakefile || die
}

src_test() {
	# prevent tests from trying to connect to ssh-agent socket and failing
	unset SSH_AUTH_SOCK
	if ! use ed25519; then
		export NET_SSH_NO_ED25519=true
	fi
	ruby-ng_src_test
}
