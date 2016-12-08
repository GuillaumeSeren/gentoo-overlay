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
IUSE="test"

RDEPEND="
	dev-lang/php:*[curl]
	~dev-php/ca-bundle-1.0
	~dev-php/cli-prompt-1.0
	~dev-php/fig-log-1.0
	dev-php/fedora-autoloader
	~dev-php/json-schema-2.0
	~dev-php/jsonlint-1.4
	~dev-php/phar-utils-1.0
	~dev-php/semver-1.0
	~dev-php/spdx-licenses-1.0
	~dev-php/symfony-console-2.7.9
	~dev-php/symfony-filesystem-2.7.20
	~dev-php/symfony-finder-2.7.20
	~dev-php/symfony-process-2.8.12"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit )"

PATCHES=(
	"${FILESDIR}/${PN}-update-paths.patch"
)

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
		sed -i -e "s:__DIR__:'${S}/src/Composer':" "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/Composer/Composer"
	doins -r src/Composer/. res LICENSE "${FILESDIR}"/autoload.php
	dobin bin/composer
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
