# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="This component provides apcu_* functions and the APCUIterator class to users of the legacy APC extension"
HOMEPAGE="https://github.com/symfony/polyfill-apcu"
SRC_URI="https://github.com/symfony/polyfill-apcu/archive/v${PV}.tar.gz -> ${P}.tar.gz"
# Test exist in the main project, but now (2017-01-19) not in the subtree,
# For the moment only mbstring is needed but we could provide the main project
# if needed https://github.com/symfony/polyfill

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*"
DEPEND="
	dev-php/theseer-Autoload"

S="${WORKDIR}/polyfill-apcu-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php "${S}"/bootstrap.php || die
}

src_install() {
	insinto "/usr/share/php/Symfony/Polyfill/APCu"
	doins -r bootstrap.php LICENSE "${S}"/autoload.php
	dodoc README.md
}
