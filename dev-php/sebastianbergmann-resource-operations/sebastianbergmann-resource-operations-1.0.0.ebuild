# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Provides a list of PHP built-in functions that operate on resources "
HOMEPAGE="https://github.com/sebastianbergmann/resource-operations"
# https://github.com/sebastianbergmann/global-state/archive/1.1.1.tar.gz
# https://github.com/sebastianbergmann/resource-operations/archive/1.0.0.tar.gz
SRC_URI="https://github.com/sebastianbergmann/resource-operations/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"

S="${WORKDIR}/resource-operations-${PV}"

src_install() {
	insinto "/usr/share/php/SebastianBergmann/ResourceOperations"
	doins -r src/. LICENSE "${FILESDIR}"/autoload.php
	dodoc README.md
}
