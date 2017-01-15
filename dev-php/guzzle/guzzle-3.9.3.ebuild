# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Extensible PHP HTTP client"
HOMEPAGE="https://github.com/guzzle/guzzle3"

# The 3.x branch is EOL, as soon as php-coverall goes to 2.x
# we should upgrade to https://github.com/guzzle/guzzle (v6.x)
# check backstory https://github.com/satooshi/php-coveralls/pull/157

# https://github.com/guzzle/guzzle3/archive/v3.9.3.tar.gz
SRC_URI="https://github.com/guzzle/guzzle3/archive/v${PV}${MY_PR}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/symfony-event-dispatcher-2.1"

S="${WORKDIR}/guzzle3-${PV}"

# src_prepare() {
# 	default
# 	# Copy the Autoload class needed in the project but strangely not in src
# 	# cp "${S}"/autoload.php "${S}"/src/Guzzle/Autoload.php || die
# }

src_install() {
	insinto "/usr/share/php/Guzzle"
	doins -r src/Guzzle/. LICENSE "${FILESDIR}"/autoload.php
	dodoc CHANGELOG.md README.md UPGRADING.md
}
