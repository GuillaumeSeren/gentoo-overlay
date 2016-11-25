# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Config Component"
HOMEPAGE="https://github.com/symfony/config"

SRC_URI="https://github.com/symfony/config/archive/v${PV}.tar.gz -> symfony-config-${PV}.tar.gz"

S="${WORKDIR}/config-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Config"
	doins -r *
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap /usr/share/php/Symfony/Config/autoload.php || die "test suite failed"
}
