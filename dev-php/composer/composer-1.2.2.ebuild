# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils

DESCRIPTION="Dependency Manager for PHP"
HOMEPAGE="https://github.com/composer/composer"

SRC_URI="https://github.com/composer/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="test"

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

# justinrainbow/json-schema": "^1.6 || ^2.0 || ^3.0 || ^4.0",
# composer/ca-bundle": "^1.0",
# composer/semver": "^1.0",
# composer/spdx-licenses": "^1.0",
# seld/jsonlint": "^1.4",
# symfony/console": "^2.7 || ^3.0",
# symfony/finder": "^2.7 || ^3.0",
# symfony/process": "^2.7 || ^3.0",
# symfony/filesystem": "^2.7 || ^3.0",
# seld/phar-utils": "^1.0",
# seld/cli-prompt": "^1.0",
# psr/log": "^1.0"

src_unpack() {
	unpack ${A}
	cd "${S}"
	# We need to patch the main composer file to load our autoloader
	EPATCH_SOURCE="${FILESDIR}" EPATCH_SUFFIX="patch" EPATCH_FORCE="yes" epatch
}

src_install() {
	# I've kept the same path name that Fedora use
	insinto "/usr/share/php/Composer/Composer"
	doins -r src/Composer/*
	doins -r res
	doins LICENSE
	# Install the autoloader
	doins "${FILESDIR}"/autoload.php
	# Install the comoser main file
	dobin bin/composer
	#Install the doc
	dodoc README.md
}

# src_test() {
# 	# The tests did not run error
# 	# 'PHP Fatal error:  Cannot redeclare class Symfony\Component\Finder\Tests\FinderTest'
# 	phpunit --bootstrap /usr/share/php/Symfony/Finder/autoload.php || die "test suite failed"
# }
