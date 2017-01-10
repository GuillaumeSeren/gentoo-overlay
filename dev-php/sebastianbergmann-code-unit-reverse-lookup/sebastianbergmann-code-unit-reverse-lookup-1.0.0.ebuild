# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Looks up which function or method a line of code belongs to"
HOMEPAGE="https://github.com/sebastianbergmann/code-unit-reverse-lookup"
# https://github.com/sebastianbergmann/code-unit-reverse-lookup/archive/1.0.0.tar.gz
SRC_URI="https://github.com/sebastianbergmann/code-unit-reverse-lookup/archive/${PV}.tar.gz -> ${P}.tar.gz"

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

S="${WORKDIR}/code-unit-reverse-lookup-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/code-unit-reverse-lookup"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
