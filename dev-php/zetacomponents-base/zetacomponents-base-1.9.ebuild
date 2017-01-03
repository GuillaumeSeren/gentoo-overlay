# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The Base package provides the basic infrastructure that all packages rely on"
HOMEPAGE="https://github.com/zetacomponents/Base"
SRC_URI="https://github.com/zetacomponents/Base/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"
# 20160103-Restricted because phpunit phar error
# PHPUnit 5.7.3 by Sebastian Bergmann and contributors.
# 
# .................................................S.............  63 / 125 ( 50%)
# .......SSSSSSSSSSSSSSSSS................EEEEE.E......SSSSSSS..  125 / 125 (100%)
# 
# Time: 663 ms, Memory: 15.25MB
# 
# There were 6 errors:
# 
# 1) ezcBaseFileFindRecursiveTest::testRecursive2
# PHP Fatal error:  Method PHPUnit_Framework_ExceptionWrapper::__toString() must
# not throw an exception in
# phar:///usr/share/php/phpunit/phpunit.phar/phpunit/TextUI/ResultPrinter.php on
# line 0
# 
# Fatal error: Method PHPUnit_Framework_ExceptionWrapper::__toString() must not
# throw an exception in
# phar:///usr/share/php/phpunit/phpunit.phar/phpunit/TextUI/ResultPrinter.php on
# line 0

RDEPEND="
	dev-lang/php:*"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		dev-php/zetacomponents-unit-test
		)"

PATCHES=(
	"${FILESDIR}/${PN}-fix-tests-1.9.patch"
)
S="${WORKDIR}/Base-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		sed -i -e "s:__DIR__:__DIR__.'/src':" "${S}"/autoload-test.php || die
		echo "require_once '/usr/share/php/zetacomponents/UnitTest/autoload.php';
		
// Needed to define ezc_autoload() done in tests/bootstrap.php
function ezc_autoload( \$className )
{
    if ( strpos( \$className, '_' ) === false )
    {
        ezcBase::autoload( \$className );
    }
}

spl_autoload_register( 'ezc_autoload' );

ezcBase::setWorkingDirectory(__DIR__.'/tests');
" >> "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/zetacomponents/Base"
	doins -r  src/. "${FILESDIR}"/autoload.php
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
