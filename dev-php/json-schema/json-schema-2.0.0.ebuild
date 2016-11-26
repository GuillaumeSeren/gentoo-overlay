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

RDEPEND="dev-lang/php:*
	=dev-php/fedora-autoloader-0.2.1"
DEPEND="${RDEPEND}"

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/JsonSchema2"
	doins -r src/JsonSchema/*
	doins "${FILESDIR}"/autoload.php
	dodoc README.md
}
