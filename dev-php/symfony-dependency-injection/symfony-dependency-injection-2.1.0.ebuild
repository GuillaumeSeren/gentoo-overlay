# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony DependencyInjection Component"
HOMEPAGE="https://github.com/symfony/dependency-injection"
SRC_URI="https://github.com/symfony/dependency-injection/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/dependency-injection-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-lang/php:*
	dev-php/fedora-autoloader
	=dev-php/symfony-config-2.1.0
	=dev-php/symfony-yaml-2.1.0"
DEPEND="${RDEPEND}"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/DependencyInjection"
	doins -r *
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap /usr/share/php/Symfony/DependencyInjection/autoload.php || die "test suite failed"
}
