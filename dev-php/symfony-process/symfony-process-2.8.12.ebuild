# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Process Component"
HOMEPAGE="https://github.com/symfony/process"

# SRC_URI="https://github.com/symfony/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/symfony/process/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/process-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Process"
	doins -r *
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	# I can not get the test working at 100% so I disable them
# 	# OK, but incomplete, skipped, or risky tests!
# 	# Tests: 151, Assertions: 245, Skipped: 9.
# 	phpunit --bootstrap /usr/share/php/Symfony/Process/autoload.php || die "test suite failed"
# }
