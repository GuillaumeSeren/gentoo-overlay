# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit git-r3 savedconfig

EGIT_REPO_URI="git://github.com/mawww/kakoune.git"

DESCRIPTION="mawww's experiment for a better code editor"
HOMEPAGE="http://kakoune.org/"
LICENSE="unlicense"
SLOT="0"


RDEPEND="
  dev-libs/boost
  sys-devel/gcc
  sys-libs/ncurses
"

DEPEND="
	${RDEPEND}
"

src_prepare() {
	epatch_user
}

src_compile() {
  cd src
  make
}

src_install() {
 cd src
 make DESTDIR="${D}" install
}
