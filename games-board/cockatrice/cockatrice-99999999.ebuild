# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils flag-o-matic git-r3

EGIT_REPO_URI="git://github.com/Cockatrice/Cockatrice.git"

DESCRIPTION="A cross-platform virtual tabletop for multiplayer card games"
HOMEPAGE="https://github.com/Cockatrice/Cockatrice"
LICENSE="GPLv2"
SLOT="0"


RDEPEND="dev-libs/boost sys-devel/gcc sys-libs/ncurses"

src_install() {
	cmake-utils_src_install
}
