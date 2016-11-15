# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Subtree split of the Symfony Console Component"
HOMEPAGE="https://github.com/symfony/console"

# SRC_URI="https://github.com/symfony/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/symfony/console/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/console-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1
	=dev-php/symfony-event-dispatcher-2.1.0
	=dev-php/fig-log-1.0.2
	=dev-php/symfony-process-2.8.12"
# "symfony/event-dispatcher": "~2.1",
# "symfony/process": "~2.1",
# "psr/log": "~1.0"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Console"
	doins -r *
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	# The tests run 100% OK on my shell but return *strange* error by src_test
# 	# 'standard input: Inappropriate ioctl for device', seems related to dialog
# 	# LegacyDialogHelperTest.php:114 and QuestionHelperTest.php:150
# 	phpunit --bootstrap /usr/share/php/Symfony/Console/autoload.php || die "test suite failed"
# }
