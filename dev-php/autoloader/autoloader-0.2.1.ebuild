# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Fedora's Static PSR-4, PSR-0, and classmap autoloader."
HOMEPAGE="https://github.com/php-fedora/autoloader"

SRC_URI="https://github.com/php-fedora/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND=">=dev-lang/php-5.3.3"
DEPEND="${RDEPEND}
	test? ( dev-php/phpunit )"

DOCS=( CHANGELOG.md README.md )
src_install() {
	insinto "/usr/share/${PN}"
	doins -r src/Autoload.php src/Dependencies.php src/autoload.php src/functions.php

	einstalldocs
}

src_test() {
	phpunit || die "test suite failed"
}
