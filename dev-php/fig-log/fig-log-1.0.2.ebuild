# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Common interface for logging libraries"
HOMEPAGE="https://github.com/symfony/process"
SRC_URI="https://github.com/php-fig/log/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"

S="${WORKDIR}/log-${PV}"

src_install() {
	insinto "/usr/share/php/Fig/Log"
	doins -r Psr/Log/. "${FILESDIR}"/autoload.php
	dodoc README.md
}
