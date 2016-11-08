# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
# inherit cmake-utils eutils gnome2-utils games
inherit cmake-utils gnome2-utils

DESCRIPTION="A cross-platform virtual tabletop for multiplayer card games"
HOMEPAGE="https://cockatrice.github.io"

SRC_URI="https://github.com/Cockatrice/${PN}/archive/2016-10-30-Release.tar.gz -> ${P}.tar.gz"

S=${WORKDIR}/"Cockatrice-2016-10-30-Release"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="dedicated server debug"

DEPEND="
	dev-libs/protobuf
	dev-qt/qtcore:5
	!dedicated? (
		dev-qt/qtmultimedia:5
	)
	dedicated? (
		dev-qt/qtwebsockets
	)"

src_configure() {
	local mycmakeargs=(
		$(usex dedicated "-DWITHOUT_CLIENT=1 -DWITH_SERVER=1" "$(usex server "-DWITH_SERVER=1" "")")
		$(usex debug "-DCMAKE_BUILD_TYPE=Debug")
		-DCMAKE_INSTALL_BINDIR="${GAMES_BINDIR}"
		-DCMAKE_INSTALL_PREFIX="${GAMES_PREFIX}"
		-DDATADIR="${GAMES_DATADIR}/${PN}"
		-DICONDIR="/usr/share/icons"
		-DDESKTOPDIR="/usr/share/applications"
	)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install
	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
	use dedicated || gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	elog "Please update your card database (run Oracle) after installation"
	use dedicated || gnome2_icon_cache_update
}

pkg_postrm() {
	use dedicated || gnome2_icon_cache_update
}
