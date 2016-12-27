# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Collections Abstraction Library"
HOMEPAGE="https://github.com/doctrine/collections"
# https://github.com/doctrine/collections/archive/v1.3.0.tar.gz
SRC_URI="https://github.com/doctrine/collections/archive/v${PV}.tar.gz -> ${P}.tar.gz"

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
		dev-php/phpunit
		)"

S="${WORKDIR}/collections-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		sed -i -e "s:__DIR__:__DIR__.'/lib/Doctrine/Common/Collections':" "${S}"/autoload-test.php || die
		echo "
\Fedora\Autoloader\Autoload::addPsr4('Doctrine\\\Tests\\\', __DIR__ . '/tests/Doctrine/Tests');
" >> "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/Doctrine/Common/Collections"
	doins -r  lib/Doctrine/Common/Collections/. "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
