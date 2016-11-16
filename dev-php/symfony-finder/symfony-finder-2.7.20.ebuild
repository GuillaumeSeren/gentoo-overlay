# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Finder Component"
HOMEPAGE="https://github.com/symfony/finder"

SRC_URI="https://github.com/symfony/finder/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/finder-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Finder"
	doins -r *
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
