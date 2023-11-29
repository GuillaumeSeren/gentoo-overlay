# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit xdg cmake

MY_PV="${PV:0:4}-${PV:4:2}-${PV:6:2}-Release-2.9.0"

DESCRIPTION="Open-source multiplatform software for playing card games over a network"
HOMEPAGE="https://github.com/Cockatrice/Cockatrice"
SRC_URI="https://github.com/Cockatrice/Cockatrice/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/Cockatrice-${MY_PV}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+client +oracle test server qt6"
RESTRICT="!test? ( test )"

RDEPEND="
    !qt6? (
        dev-qt/qtcore:5
        dev-qt/qtnetwork:5
        dev-qt/qtwidgets:5
        client? (
            dev-qt/qtconcurrent:5
            dev-qt/qtgui:5
            dev-qt/qtmultimedia:5
            dev-qt/qtprintsupport:5
            dev-qt/qtsvg:5
            dev-qt/qtwebsockets:5
        )
        oracle? (
            dev-qt/qtconcurrent:5
            dev-qt/qtsvg:5
            sys-libs/zlib
            app-arch/xz-utils
        )
        server? (
            dev-qt/qtsql:5
            dev-qt/qtwebsockets:5
            dev-db/mysql-connector-c
        )
    )
    qt6? (
        dev-qt/qtbase:6[network,widgets]
        client? (
            dev-qt/qtbase:6[concurrent,gui]
            dev-qt/qtmultimedia:6
            dev-qt/qtsvg:6
            dev-qt/qtwebsockets:6
        )
        oracle? (
            dev-qt/qtbase:6[concurrent]
            dev-qt/qtsvg:6
            sys-libs/zlib
            app-arch/xz-utils
        )
        server? (
            dev-qt/qtbase:6[sql]
            dev-qt/qtwebsockets:6
            dev-db/mysql-connector-c
        )
    )"
DEPEND="
    ${RDEPEND}
    test? ( dev-cpp/gtest )"
BDEPEND="
    !qt6? ( dev-qt/linguist-tools:5 )
    qt6? ( dev-qt/qttools:6[linguist] )
    dev-libs/protobuf"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=OFF
		-DUSE_CCACHE=OFF
		-DWITH_CLIENT=$(usex client)
		-DWITH_ORACLE=$(usex oracle)
		-DWITH_SERVER=$(usex server)
		-DTEST=$(usex test)
		-DICONDIR="${EPREFIX}/usr/share/icons"
		-DDESKTOPDIR="${EPREFIX}/usr/share/applications"
	)

	# Add date in the help about, come from git originally
	sed -e 's/^set(PROJECT_VERSION_FRIENDLY.*/set(PROJECT_VERSION_FRIENDLY \"'${MY_PV}'\")/' \
		-i cmake/getversion.cmake || die "sed failed!"

	cmake_src_configure
}
