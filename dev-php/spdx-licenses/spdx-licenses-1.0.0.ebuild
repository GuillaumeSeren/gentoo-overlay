# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Tools for working with the SPDX license list and validating licenses"
HOMEPAGE="https://github.com/composer/spdx-licenses"

SRC_URI="https://github.com/composer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/${PN}-change-res-path.patch"
)

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Composer/Spdx"
	doins -r src/*
	# we copy the res directory inside Sdpx
	doins -r res
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}
