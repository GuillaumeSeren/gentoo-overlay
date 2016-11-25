# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Finder Component"
HOMEPAGE="https://github.com/symfony/finder"

SRC_URI="https://github.com/symfony/finder/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/finder-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Finder"
	doins -r *
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}
