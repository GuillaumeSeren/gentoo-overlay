# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Library that helps with managing the version number of Git-hosted PHP projects"
HOMEPAGE="https://github.com/sebastianbergmann/version"
SRC_URI="https://github.com/sebastianbergmann/version/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"

S="${WORKDIR}/version-${PV}"

src_install() {
	insinto "/usr/share/php/SebastianBergmann/Version"
	doins -r src/. LICENSE "${FILESDIR}"/autoload.php
	dodoc README.md
}
