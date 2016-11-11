# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="PHP implementation of JSON schema"
HOMEPAGE="https://github.com/justinrainbow/json-schema"

# here we use autoloadder as it is the upstream name
SRC_URI="https://github.com/justinrainbow/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	=dev-php/fedora-autoloader-0.2.1"

# # Change the name accordin to the archive
# S=${WORKDIR}/${PN}"-"${PV}

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/JsonSchema2"
	doins -r src/JsonSchema/*
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	phpunit || die "test suite failed"
# }
