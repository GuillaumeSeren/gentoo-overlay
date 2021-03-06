# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26 ruby27"

RUBY_FAKEGEM_EXTRADOC="changelog.txt README.md"
RUBY_FAKEGEM_GEMSPEC="${PN}.gemspec"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="none"

inherit ruby-fakegem

DESCRIPTION="EXtended http(s) CONnections"
HOMEPAGE="https://github.com/excon/excon"
SRC_URI="https://github.com/excon/excon/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_bdepend "
	dev-ruby/rake
	test? (
		dev-ruby/activesupport
		>=dev-ruby/eventmachine-1.0.4
		>=dev-ruby/json-1.8.5
		dev-ruby/open4
		dev-ruby/rdoc
		dev-ruby/sinatra
	)
"
all_ruby_prepare() {
	# delete server test
	rm spec/excon/test/server_spec.rb || die
}
