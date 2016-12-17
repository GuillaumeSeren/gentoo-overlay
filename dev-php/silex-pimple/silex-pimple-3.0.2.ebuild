# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A small PHP 5.3 dependency injection container"
HOMEPAGE="https://github.com/silexphp/Pimple"
# https://github.com/silexphp/Pimple/archive/v3.0.2.tar.gz
SRC_URI="https://github.com/silexphp/Pimple/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit )"

S="${WORKDIR}/Pimple-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		# sed -i -e "s:__DIR__:'${S}/src/Pimple':" "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/silex/Pimple"
	doins -r src/Pimple/. "${FILESDIR}"/autoload.php
	dodoc README.rst
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
