# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Dependency Manager for PHP"
HOMEPAGE="https://github.com/composer/composer"

SRC_URI="https://github.com/composer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	dev-lang/php[curl]
	=dev-php/fedora-autoloader-0.2.1
	=dev-php/json-schema-2.0.0
	=dev-php/ca-bundle-1.0.0
	=dev-php/semver-1.0.0
	=dev-php/spdx-licenses-1.0.0
	=dev-php/jsonlint-1.4.0
	=dev-php/symfony-console-2.7.9
	=dev-php/symfony-finder-2.7.20
	=dev-php/symfony-process-2.8.12
	=dev-php/symfony-filesystem-2.7.20
	=dev-php/phar-utils-1.0.0
	=dev-php/cli-prompt-1.0.0
	=dev-php/fig-log-1.0.2"
DEPEND="${RDEPEND}"

# Needed patches
PATCHES=(
	"${FILESDIR}/${PN}-fix-license-dir.patch"
	"${FILESDIR}/${PN}-json-change-res-dir.patch"
	"${FILESDIR}/${PN}-upgrade-autoloader-dir.patch"
)

src_prepare() {
	if declare -p PATCHES | grep -q "^declare -a "; then
		[[ -n ${PATCHES[@]} ]] && eapply "${PATCHES[@]}"
	else
		[[ -n ${PATCHES} ]] && eapply ${PATCHES}
	fi
	eapply_user
}

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Composer/Composer"
	doins -r src/Composer/*
	doins -r res
	doins LICENSE
	doins "${FILESDIR}"/autoload.php
	dobin bin/composer
	dodoc README.md
}
