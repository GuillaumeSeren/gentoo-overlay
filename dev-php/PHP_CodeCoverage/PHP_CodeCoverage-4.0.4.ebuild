# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Library that provides collection, processing, and rendering functionality for PHP code coverage information"
HOMEPAGE="https://github.com/sebastianbergmann/php-code-coverage"
# https://github.com/sebastianbergmann/php-code-coverage/archive/4.0.4.tar.gz
SRC_URI="https://github.com/sebastianbergmann/php-code-coverage/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*
	>=dev-php/phpunit-php-file-iterator-1.3
	>=dev-php/phpunit-php-token-stream-1.4.2
	>=dev-php/phpunit-php-text-template-1.2
	>=dev-php/sebastian-code-unit-reverse-lookup-1.0
	>=dev-php/sebastian-environment-2.0
	>=dev-php/sebastian-version-2.0"
DEPEND="${RDEPEND}
	dev-php/theseer-Autoload
	dev-php/xdebug
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/php-code-coverage-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	echo "
require_once '/usr/share/php/Sebastian/php-file-iterator/autoload.php';
require_once '/usr/share/php/Sebastian/php-token-stream/autoload.php';
require_once '/usr/share/php/Sebastian/TextTemplate/autoload.php';
require_once '/usr/share/php/Sebastian/code-unit-reverse-lookup/autoload.php';
require_once '/usr/share/php/Sebastian/Environment/autoload.php';
require_once '/usr/share/php/Sebastian/Version/autoload.php';
" >> "${S}"/autoload.php || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
		echo "
<?php
require_once '"${S}"/autoload-test.php';
require_once __DIR__ . '/TestCase.php';
define('TEST_FILES_PATH', __DIR__ . '/_files/');" > "${S}"/tests/bootstrap.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/CodeCoverage"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --configuration "${S}"/build --verbose || die "test suite failed"
}
