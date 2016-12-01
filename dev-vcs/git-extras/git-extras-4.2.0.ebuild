# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="GIT tools: repo summary, repl, changelog population, author commit percentages"
HOMEPAGE="https://github.com/tj/git-extras"
SRC_URI="https://github.com/tj/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ppc ppc64 x86 ~x86-fbsd"

RDEPEND="
	dev-vcs/git"
DEPEND="
	${RDEPEND}"

src_compile() {
	true
}

src_install() {
	emake DESTDIR="${D}" install
	dodoc Readme.md Commands.md
}
