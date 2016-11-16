# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Filesystem Component"
HOMEPAGE="https://github.com/symfony/filesystem"

SRC_URI="https://github.com/symfony/filesystem/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/filesystem-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Filesystem"
	doins -r *
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	# The window test is skipped:
# 	# OK, but incomplete, skipped, or risky tests!
# 	# Tests: 107, Assertions: 172, Skipped: 1. 
# 	# 1) Symfony\Component\Filesystem\Tests\FilesystemTest::testFilesExistsFails
# 	# Test covers edge case on Windows only.
# 	phpunit --bootstrap /usr/share/php/Symfony/Filesystem/autoload.php || die "test suite failed"
# }
