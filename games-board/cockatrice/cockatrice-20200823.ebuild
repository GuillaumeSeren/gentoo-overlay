# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake

MY_PV="2020-08-23-Release-2.7.5"
DESCRIPTION="An open-source multiplatform software for playing card games over a network"
HOMEPAGE="https://github.com/Cockatrice/Cockatrice"
SRC_URI="https://github.com/Cockatrice/Cockatrice/archive/${MY_PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+client +oracle server"

RDEPEND="
	dev-qt/qtconcurrent:5
	dev-qt/qtcore:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtprintsupport:5
	dev-qt/qtwebsockets:5
	dev-qt/qtwidgets:5
	client? (
		dev-libs/protobuf:=
		dev-qt/qtmultimedia:5
		dev-qt/qtsvg:5
	)
	oracle? ( sys-libs/zlib )
	server? (
		dev-libs/protobuf:=
		dev-qt/qtsql:5
	)
"
BDEPEND="
	dev-qt/linguist-tools:5
	client? ( dev-libs/protobuf )
	server? ( dev-libs/protobuf )
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/Cockatrice-${MY_PV}"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DUSE_CCACHE=OFF
		-DWITH_CLIENT=$(usex client)
		-DWITH_ORACLE=$(usex oracle)
		-DWITH_SERVER=$(usex server)
		-DICONDIR="${EPREFIX}/usr/share/icons"
		-DDESKTOPDIR="${EPREFIX}/usr/share/applications" )

	# Add date in the help about, come from git originally
	sed -e 's/^set(PROJECT_VERSION_FRIENDLY.*/set(PROJECT_VERSION_FRIENDLY \"'${MY_PV}'\")/' \
		-i cmake/getversion.cmake || die "sed failed!"

	cmake_src_configure
}
