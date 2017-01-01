# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Utility class for timing"
HOMEPAGE="https://github.com/sebastianbergmann/php-timer"
SRC_URI="https://github.com/sebastianbergmann/php-timer/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*"

S="${WORKDIR}/php-timer-${PV}"

src_install() {
	insinto "/usr/share/php/SebastianBergmann/TextTemplate"
	doins -r  src/. "${FILESDIR}"/autoload.php
	dodoc README.md
}