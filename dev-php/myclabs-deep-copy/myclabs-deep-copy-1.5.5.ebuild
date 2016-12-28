# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Create deep copies (clones) of your objects"
HOMEPAGE="https://github.com/myclabs/DeepCopy"
SRC_URI="https://github.com/myclabs/DeepCopy/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"
# The tests are not available in the official release

S="${WORKDIR}/DeepCopy-${PV}"

src_install() {
	insinto "/usr/share/php/myclabs/DeepCopy"
	doins -r  src/DeepCopy/. "${FILESDIR}"/autoload.php
	dodoc README.md
}
