# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony Process Component"
HOMEPAGE="https://github.com/symfony/process"

SRC_URI="https://github.com/symfony/process/archive/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/process-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="${RDEPEND}"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Symfony/Process"
	doins -r *
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}
