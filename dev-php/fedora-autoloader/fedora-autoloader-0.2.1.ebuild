# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Fedora's Static PSR-4, PSR-0, and classmap autoloader"
HOMEPAGE="https://github.com/php-fedora/autoloader"

# here we use autoloadder as it is the upstream name
SRC_URI="https://github.com/php-fedora/autoloader/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-lang/php:*"
DEPEND="${RDEPEND}
	test? ( dev-php/phpunit )"

# Change the name according to the archive
S="${WORKDIR}/autoloader-${PV}"

src_install() {
	# To help with preserving the relative path we use the same directory
	insinto "/usr/share/php/Fedora/Autoloader"
	doins src/Autoload.php src/Dependencies.php src/autoload.php src/functions.php
	dodoc CHANGELOG.md README.md
}

src_test() {
	phpunit || die "test suite failed"
}
