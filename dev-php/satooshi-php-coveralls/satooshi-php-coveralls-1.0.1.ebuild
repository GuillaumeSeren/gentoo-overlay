# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="PHP client library for Coveralls API"
HOMEPAGE="https://github.com/satooshi/php-coveralls"
# https://github.com/satooshi/php-coveralls/archive/v1.0.1.tar.gz
SRC_URI="https://github.com/satooshi/php-coveralls/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/php:*[json,simplexml]
	dev-php/fedora-autoloader
	>=dev-php/guzzlehttp-guzzle-3.0
	>=dev-php/psr-log-1.0
	>=dev-php/symfony-config-3.0
	>=dev-php/symfony-console-3.0
	>=dev-php/symfony-stopwatch-3.0
	>=dev-php/symfony-yaml-3.0"

# PATCHES=(
# 	"${FILESDIR}/${PN}-update-paths.patch"
# )

S="${WORKDIR}/php-coveralls-${PV}${MY_PR}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/satooshi/php-coveralls"
	doins -r src/Satooshi/. "${FILESDIR}"/autoload.php
	dobin bin/coveralls
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
