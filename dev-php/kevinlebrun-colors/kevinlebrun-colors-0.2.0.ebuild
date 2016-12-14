# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="An easy way to add colors in your CLI scripts"
HOMEPAGE="https://github.com/kevinlebrun/colors.php"
SRC_URI="https://github.com/kevinlebrun/colors.php/archive/${PV}.tar.gz -> ${P}.tar.gz"

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

S="${WORKDIR}/colors.php-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		sed -i -e "s:__DIR__:'${S}/lib/Colors':" "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/kevinlebrun/Colors"
	doins -r lib/Colors/. "${FILESDIR}"/autoload.php
	dodoc README.mkd
}

# tests  phpunit --configuration tests/phpunit.xml --bootstrap tests/bootstrap.php
src_test() {
	phpunit  --configuration "${S}"/tests/phpunit.xml --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
