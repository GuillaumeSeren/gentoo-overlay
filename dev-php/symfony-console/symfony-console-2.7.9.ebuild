# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Subtree split of the Symfony Console Component"
HOMEPAGE="https://github.com/symfony/console"
SRC_URI="https://github.com/symfony/console/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	~dev-php/fig-log-1.0.2
	~dev-php/symfony-event-dispatcher-2.1.0
	~dev-php/symfony-process-2.8.12"

S="${WORKDIR}/console-${PV}"

src_install() {
	insinto "/usr/share/php/Symfony/Console"
	doins -r . "${FILESDIR}"/autoload.php
	dodoc README.md
}
