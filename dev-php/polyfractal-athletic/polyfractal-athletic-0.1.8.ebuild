# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="PHP Benchmarking Framework"
HOMEPAGE="https://github.com/polyfractal/athletic"
SRC_URI="https://github.com/polyfractal/athletic/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
# Test will be activated when all deps will be packaged
RESTRICT="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/nategood-commando-0.2.1
	>=dev-php/pimple-3.0
	>=dev-php/zeptech-annotations-1.1.0"
DEPEND="
	test? (
		${RDEPEND}
		>=dev-php/phpunit-4.0
		>=dev-php/mikey179-vfsStream-1.2.0
		>=dev-php/mockery-0.8.0
		>=dev-php/satooshi/php-coveralls-0.6.0
		>=dev-php/PHP_CodeSniffer-2.0
		)"

S="${WORKDIR}/athletic-${PV}"

src_install() {
	insinto "/usr/share/php/polyfractal/athletic"
	doins -r  src/Athletic/. "${FILESDIR}"/autoload.php
	dodoc readme.md
}
