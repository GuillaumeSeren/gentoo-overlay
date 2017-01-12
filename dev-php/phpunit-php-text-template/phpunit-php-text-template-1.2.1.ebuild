# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="A simple template engine"
HOMEPAGE="https://github.com/sebastianbergmann/php-text-template"
SRC_URI="https://github.com/sebastianbergmann/php-text-template/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*"
DEPEND="
	${RDEPEND}
	dev-php/theseer-Autoload"

S="${WORKDIR}/php-text-template-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/TextTemplate"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}
