# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Utility class for timing"
HOMEPAGE="https://github.com/sebastianbergmann/php-timer"
SRC_URI="https://github.com/sebastianbergmann/php-timer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*"
DEPEND="
	dev-php/theseer-Autoload
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/php-timer-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/php-timer"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php "${S}"/tests/ || die "test suite failed"
}
