# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg udev

MY_PV=$(ver_cut 1-2)
DESCRIPTION="Advanced Digital DJ tool based on Qt"
HOMEPAGE="https://mixxx.org/"
if [[ ${PV} == *9999 ]]; then
	inherit git-r3
	if [[ ${PV} == ?.?.9999 ]]; then
		EGIT_BRANCH=${PV%.9999}
	fi
	EGIT_REPO_URI="https://github.com/mixxxdj/${PN}.git"
else
	SRC_URI="https://github.com/mixxxdj/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
	#S="${WORKDIR}/${PN}-release-${PV}"
	KEYWORDS="amd64 ~arm64 x86"
fi
LICENSE="GPL-2"
SLOT="0"
# IUSE="aac ffmpeg hid keyfinder lv2 modplug mp3 mp4 opus qtkeychain shout wavpack"
IUSE="aac doc ffmpeg hid keyfinder lv2 mp3 mp4 opus qtkeychain shout wavpack"

RDEPEND="
	dev-db/sqlite
	dev-libs/glib:2
	dev-libs/protobuf:=
	dev-qt/qtconcurrent:6
	dev-qt/qtcore:6
	dev-qt/qtdbus:6
	dev-qt/qtgui:6
	dev-qt/qtnetwork:6
	dev-qt/qtopengl:6
	dev-qt/qtscript:5[scripttools]
	dev-qt/qtsql:6
	dev-qt/qtsvg:6
	dev-qt/qtwidgets:6
	dev-qt/qtx11extras:6
	dev-qt/qtxml:6
	media-libs/chromaprint
	media-libs/flac:=
	media-libs/libebur128
	media-libs/libid3tag:=
	media-libs/libogg
	media-libs/libsndfile
	media-libs/libsoundtouch
	media-libs/libvorbis
	media-libs/portaudio
	media-libs/portmidi
	media-libs/rubberband
	<media-libs/taglib-2
	media-libs/vamp-plugin-sdk
	sci-libs/fftw:3.0=
	sys-power/upower
	virtual/glu
	virtual/libusb:1
	virtual/opengl
	virtual/udev
	x11-libs/libX11
	aac? (
		media-libs/faad2
		media-libs/libmp4v2
	)
	ffmpeg? ( media-video/ffmpeg:= )
	hid? ( dev-libs/hidapi )
	keyfinder? ( media-libs/libkeyfinder )
	lv2? ( media-libs/lilv )
	mp3? ( media-libs/libmad )
	mp4? ( media-libs/libmp4v2:= )
	opus? (	media-libs/opusfile )
	qtkeychain? ( dev-libs/qtkeychain:=[qt5(+)] )
	shout? ( >=media-libs/libshout-2.4.5 )
	wavpack? ( media-sound/wavpack )
"
DEPEND="${RDEPEND}
	dev-cpp/ms-gsl
"
BDEPEND="
	dev-qt/qttest:6
	dev-qt/qtxmlpatterns:5
	virtual/pkgconfig
	dev-cpp/benchmark
"

PATCHES=(
	"${FILESDIR}"/${PN}-9999-docs.patch
)

src_configure() {
	local mycmakeargs=(
		-DFAAD="$(usex aac on off)"
		-DFFMPEG="$(usex ffmpeg on off)"
		-DHID="$(usex hid on off)"
		-DLILV="$(usex lv2 on off)"
		-DMAD="$(usex mp3 on off)"
		-DOPTIMIZE="off"
		-DCCACHE_SUPPORT="off"
		-DOPUS="$(usex opus on off)"
		-DBROADCAST="$(usex shout on off)"
		-DVINYLCONTROL="on"
		-DINSTALL_USER_UDEV_RULES=OFF
		-DWAVPACK="$(usex wavpack on off)"
		-DQTKEYCHAIN="$(usex qtkeychain on off)"
		-DKEYFINDER="$(usex keyfinder on off)"
		-DDOWNLOAD_MANUAL=OFF
		-DBUILD_SHARED_LIBS=OFF
		-DENGINEPRIME=OFF
	)

	if [[ ${PV} == 9999 ]]; then
		mycmakeargs+=(
			-DENGINEPRIME="OFF"
		)
	fi
	cmake_src_configure
}

src_install() {
	cmake_src_install
	udev_newrules "${S}"/res/linux/mixxx-usb-uaccess.rules 69-mixxx-usb-uaccess.rules

	if use doc; then
		dodoc README res/Mixxx-Keyboard-Shortcuts.pdf
	fi
}

pkg_postinst() {
	xdg_pkg_postinst
	udev_reload
}

pkg_postrm() {
	xdg_pkg_postrm
	udev_reload
}
