# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Detect violations of PHP code standards"
HOMEPAGE="https://github.com/squizlabs/PHP_CodeSniffer"

# Test are not in the official tarball, we used PEAR package insteab but,
# to generate the classmap autoloader we need the composer,json missing from
# PEAR tarball wo lets go back to official and not enable tests
# https://github.com/squizlabs/PHP_CodeSniffer/issues/548
MY_PR=${PR/r/RC}
# http://download.pear.php.net/package/PHP_CodeSniffer-3.0.0RC2.tgz
# https://github.com/squizlabs/PHP_CodeSniffer/archive/3.0.0RC2.tar.gz
# SRC_URI="http://download.pear.php.net/package/${P}${MY_PR}.tgz"
SRC_URI="https://github.com/squizlabs/${PN}/archive/${PV}${MY_PR}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	dev-lang/php:*[cli,tokenizer,xmlwriter]
	dev-php/fedora-autoloader"
DEPEND="${RDEPEND}	
	dev-php/theseer-Autoload "

PATCHES=(
	"${FILESDIR}/${PN}-update-paths.patch"
)

S="${WORKDIR}/PHP_CodeSniffer-${PV}${MY_PR}"

src_prepare() {
	default
	# Copy the Autoload class needed in the project but strangely not in src
	cp "${S}"/autoload.php "${S}"/src/Autoload.php || die
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
}

src_install() {
	insinto "/usr/share/php/squizlabs/PHP_CodeSniffer"
	doins -r src/. licence.txt "${S}"/autoload.php
	dobin bin/phpcbf bin/phpcs
	dodoc CONTRIBUTING.md README.md
}
