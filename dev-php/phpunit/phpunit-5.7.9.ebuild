# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="The PHP Unit Testing framework"
HOMEPAGE="https://github.com/sebastianbergmann/phpunit"
SRC_URI="https://github.com/sebastianbergmann/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# Needed extensions
# ext-dom: * ext-json: * ext-mbstring: * ext-xml: * ext-libxml: *
RDEPEND="
	dev-lang/php:*[json,xml]
	>=dev-php/phpunit-php-file-iterator-1.4
	>=dev-php/phpunit-php-text-template-1.2
	>=dev-php/phpunit-php-code-coverage-4.0.4
	>=dev-php/phpunit-php-timer-1.0.6
	>=dev-php/phpunit-phpunit-mock-objects-3.2
	>=dev-php/phpspec-prophecy-1.6.2
	>=dev-php/symfony-yaml-3.0
	>=dev-php/sebastian-comparator-1.2.2
	>=dev-php/sebastian-diff-1.2
	>=dev-php/sebastian-environment-2.0
	>=dev-php/sebastian-exporter-2.0
	>=dev-php/sebastian-global-state-2.0
	>=dev-php/sebastian-object-enumerator-2.0
	>=dev-php/sebastian-resource-operations-1.0
	>=dev-php/sebastian-version-2.0
	>=dev-php/myclabs-deep-copy-1.3	"
DEPEND="
	${RDEPEND}
	dev-php/theseer-Autoload
	test? (
		dev-lang/php:*[pdo]
		dev-php/phpunit
		)"

S="${WORKDIR}/phpunit-${PV}"

src_prepare() {
	default
	/usr/bin/phpab -o "${S}"/autoload.php -b "${S}"/src "${S}"/composer.json || die
	if use test; then
		cp "${S}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/SebastianBergmann/phpunit"
	doins -r  src/. "${S}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php "${S}"/tests/ || die "test suite failed"
}
