# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Symfony YAML Component"
HOMEPAGE="https://github.com/symfony/yaml"
SRC_URI="https://github.com/symfony/yaml/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit )"

S="${WORKDIR}/yaml-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Component/Yaml"
	doins -r . "${FILESDIR}"/autoload.php
	dodoc README.md
}
