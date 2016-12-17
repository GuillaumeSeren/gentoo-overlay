# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="An Elegant CLI Library for PHP"
HOMEPAGE="https://github.com/nategood/commando"
SRC_URI="https://github.com/nategood/commando/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/kevinlebrun-colors-0.2"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit )"

S="${WORKDIR}/commando-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		# sed -i -e "s:__DIR__:'${S}/src/Commando/':" "${S}"/autoload-test.php || die
		# We also need to remove the require in the tests
		sed -i -e "s:^require://require:" "${S}"/tests/Commando/CommandTest.php || die
		sed -i -e "s:^require://require:" "${S}"/tests/Commando/OptionTest.php || die
		# rm "${S}"/tests/Commando/CommandTest.php || die

	fi
}

src_install() {
	insinto "/usr/share/php/nategood/Commando"
	doins -r  src/Commando/. "${FILESDIR}"/autoload.php
	dodoc README.md
}

# phpunit --configuration tests/phpunit.xml
src_test() {
	phpunit  --configuration "${S}"/tests/phpunit.xml --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
