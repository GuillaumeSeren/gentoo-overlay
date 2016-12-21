# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Provides the functionality to compare PHP values for equality"
HOMEPAGE="https://github.com/sebastianbergmann/comparator"
SRC_URI="https://github.com/sebastianbergmann/comparator/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/sebastianbergmann-diff-1.2
	>=dev-php/sebastianbergmann-exporter-2.0"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/comparator-${PV}"


src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		sed -i -e "s:));:\t\'${S}/tests/autoload.php\',\n));:" "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/Comparator"
	doins -r src/. LICENSE "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
