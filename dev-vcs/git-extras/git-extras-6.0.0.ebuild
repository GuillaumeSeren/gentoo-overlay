# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit bash-completion-r1

DESCRIPTION="GIT tools: repo summary, repl, changelog population, author commit percentages"
HOMEPAGE="https://github.com/tj/git-extras"
SRC_URI="https://github.com/tj/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
IUSE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT=""

RDEPEND="
	dev-vcs/git"
DEPEND="
	${RDEPEND}"

src_prepare() {
	default
	mkdir prepare
	for i in bin/git-*; do
		i=$(basename $i suffix)
		echo "prepare $i"
		head -1 bin/$i >> prepare/$i
		cat helper/reset-env >> prepare/$i
		cat helper/git-extra-utility >> prepare/$i
		if ! grep "$i" not_need_git_repo >/dev/null; then
			cat helper/is-git-repo >> prepare/$i
		fi
		if grep "$i" need_git_commit >/dev/null; then
			cat helper/has-git-commit >> prepare/$i
		fi
		tail -n +2 bin/$i >> prepare/$i
	done
}

src_compile() {
	if [[ ${PV} == 9999* ]] ; then
		emake
	fi
}

src_install() {
	doman man/git-*.1
	dodoc AUTHORS Readme.md
	dobin prepare/*
}
