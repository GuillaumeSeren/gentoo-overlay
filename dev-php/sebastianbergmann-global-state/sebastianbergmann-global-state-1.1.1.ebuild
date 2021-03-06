# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Snapshotting of global state, factored out of PHPUnit into a stand-alone component"
HOMEPAGE="https://github.com/sebastianbergmann/global-state"
# https://github.com/sebastianbergmann/global-state/archive/1.1.1.tar.gz
SRC_URI="https://github.com/sebastianbergmann/global-state/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/global-state-${PV}"


src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		echo "\Fedora\Autoloader\Dependencies::required(array(
	'${S}/tests/SnapshotTest.php',
	'${S}/tests/BlacklistTest.php',
));" >> "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/GlobalState"
	doins -r src/. LICENSE "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
