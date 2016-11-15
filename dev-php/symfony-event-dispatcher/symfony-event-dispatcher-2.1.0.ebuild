# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony EventDispatcher Component"
HOMEPAGE="https://github.com/symfony/event-dispatcher"

# SRC_URI="https://github.com/symfony/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
SRC_URI="https://github.com/symfony/event-dispatcher/archive/v${PV}.tar.gz -> ${P}.tar.gz"
S=${WORKDIR}/event-dispatcher-${PV}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1
	=dev-php/symfony-dependency-injection-2.1.0"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/EventDispatcher"
	doins -r *
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

src_test() {
	phpunit --bootstrap /usr/share/php/Symfony/EventDispatcher/autoload.php || die "test suite failed"
}
