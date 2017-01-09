# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Wrapper around PHP's tokenizer extension"
HOMEPAGE="https://github.com/sebastianbergmann/php-token-stream"
SRC_URI="https://github.com/sebastianbergmann/php-token-stream/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	dev-lang/php:*[tokenizer]"
DEPEND="
	dev-php/theseer-Autoload
	test? (
		${RDEPEND}
		dev-php/phpunit
		)"

S="${WORKDIR}/php-token-stream-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
		# Remove link to vendor in bootstrap
		sed -i -e "s:require __DIR__ . '/../vendor/autoload.php';::" "${S}"/tests/bootstrap.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/php-token-stream"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php "${S}"/tests/TokenTest.php || die "test suite failed"
}
