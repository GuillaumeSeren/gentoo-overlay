# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"
RUBY_FAKEGEM_RECIPE_TEST="rspec3"
RUBY_FAKEGEM_RECIPE_DOC="none"

inherit ruby-fakegem

DESCRIPTION="Vagrant Cloud API Library"
HOMEPAGE="https://github.com/hashicorp/vagrant_cloud"
SRC_URI="https://github.com/hashicorp/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

ruby_add_rdepend ">=dev-ruby/excon-0.73"
ruby_add_bdepend ">=dev-ruby/rake-12.3
	test? (
		>=dev-ruby/webmock-3.0
	)
"

all_ruby_prepare() {
	sed -i -e 'require_relative' ${PN}.gemspec || die
	# loosen dependencies
	sed -e '/excon/s/~>/>=/' -i ${PN}.gemspec || die
	sed -e '/log4r/s/~>/>=/' -i ${PN}.gemspec || die
	sed -e '/rake/s/~>/>=/' -i ${PN}.gemspec || die
	sed -e '/rspec/s/~>/>=/' -i ${PN}.gemspec || die
	sed -e '/webmock/s/~>/>=/' -i ${PN}.gemspec || die
}
