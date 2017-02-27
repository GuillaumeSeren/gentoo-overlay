# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
inherit cmake-utils eutils gnome2-utils

DESCRIPTION="An open-source multiplatform software for playing card games over a network"
HOMEPAGE="https://github.com/Cockatrice/Cockatrice"
SRC_URI="${HOMEPAGE}/archive/2016-10-30-Release.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="server +client +oracle"

DEPEND="
	dev-libs/libgcrypt:0
	dev-libs/protobuf
	dev-qt/linguist-tools:5
	dev-qt/qtconcurrent:5
	dev-qt/qtprintsupport:5
	!client? (
		dev-qt/qtgui:5
		dev-qt/qtmultimedia:5
		dev-qt/qtsvg:5
	)"
RDEPEND="
	dev-qt/qtcore:5 "

# As the default help/about display the sha1 we need it
SHA1='3498b16'

S="${WORKDIR}/Cockatrice-2016-10-30-Release"

src_configure() {
	local mycmakeargs=(
		$(usex !client "-DWITH_CLIENT=0")
		$(usex !oracle "-DWITH_ORACLE=0")
		$(usex server "-DWITH_SERVER=1")
		-DICONDIR="/usr/share/icons"
		-DDESKTOPDIR="/usr/share/applications" )

	# Add date in the help about, come from git originally
	sed -i 's/^set(PROJECT_VERSION_FRIENDLY.*/set(PROJECT_VERSION_FRIENDLY \"'${SHA1}'\")/' cmake/getversion.cmake || die "Sed failed!"
	cmake-utils_src_configure
}
