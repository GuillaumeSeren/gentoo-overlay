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

# Missing php modules: ext-mbstring: * ext-dom: * ext-libxml: *
RDEPEND="
	dev-lang/php:*[json,xml]
	dev-php/fedora-autoloader
	>=myclabs-deep-copy-1.3
	>=phpspec-prophecy-1.6.2
	>=phpunit--mock-objects-3.2
	>=phpunit-php-code-coverage-4.0.3
	>=phpunit-php-file-iterator-1.4
	>=phpunit-php-text-template-1.2
	>=phpunit-php-timer-1.0.6
	>=sebastianbergmann-comparator-1.2.2
	>=sebastianbergmann-diff-1.2
	>=sebastianbergmann-environment-2.0
	>=sebastianbergmann-exporter-2.0
	>=sebastianbergmann-global-state-2.0
	>=sebastianbergmann-object-enumerator-2.0
	>=sebastianbergmann-resource-operations-1.0
	>=sebastianbergmann-version-2.0
	>=symfony-yaml-3.0"
# It suggest xdebug to run tests
RDEPEND="${DEPEND}
	dev-lang/php:*[pdo]
	dev-php/xdebug"
