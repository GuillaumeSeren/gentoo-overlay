# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Provides functionality to recursively process PHP variables"
HOMEPAGE="https://github.com/sebastianbergmann/recursion-context"
SRC_URI="https://github.com/sebastianbergmann/recursion-context/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/recursion-context-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		# sed -i -e "s:__DIR__:'${S}/src/':" "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/RecursionContext"
	doins -r  src/. "${FILESDIR}"/autoload.php
	dodoc README.md
}


src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
