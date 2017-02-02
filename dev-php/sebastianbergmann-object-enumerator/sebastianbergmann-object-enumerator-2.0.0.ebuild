# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Traverses array structures and object graphs to enumerate all referenced objects"
HOMEPAGE="https://github.com/sebastianbergmann/object-enumerator"
SRC_URI="https://github.com/sebastianbergmann/object-enumerator/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	>=dev-php/sebastianbergmann-recursion-context-2.0.0"
DEPEND="
	${RDEPEND}
	dev-php/theseer-Autoload
	test? (
		dev-php/phpunit
		)"

S="${WORKDIR}/object-enumerator-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	echo "
require_once '/usr/share/php/SebastianBergmann/RecursionContext/autoload.php';
" >> "${S}"/autoload.php || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/ObjectEnumerator"
	doins -r src/. LICENSE "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
