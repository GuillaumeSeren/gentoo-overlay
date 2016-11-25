# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="PHAR file format utilities, for when PHP phars you up"
HOMEPAGE="https://github.com/Seldaek/phar-utils"

SRC_URI="https://github.com/Seldaek/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Seld/PharUtils"
	doins -r src/*
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	# The tests did not run error
# 	# 'PHP Fatal error:  Cannot redeclare class Symfony\Component\Finder\Tests\FinderTest'
# 	phpunit --bootstrap /usr/share/php/Symfony/Finder/autoload.php || die "test suite failed"
# }
