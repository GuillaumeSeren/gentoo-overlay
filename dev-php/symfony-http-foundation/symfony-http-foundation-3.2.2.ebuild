# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Object-oriented layer for the HTTP specification"
HOMEPAGE="https://github.com/symfony/http-foundation"
SRC_URI="https://github.com/symfony/http-foundation/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/symfony-polyfill-mbstring-1.1"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		>=dev-php/symfony-expression-language-3.0 )"

S="${WORKDIR}/http-foundation-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/Symfony/Component/HttpFoundation"
	# As there is no src dir we have to list needed dir + files
	doins -r Exception File Session AcceptHeaderItem.php \
	AcceptHeader.php ApacheRequest.php BinaryFileResponse.php \
	Cookie.php ExpressionRequestMatcher.php FileBag.php \
	HeaderBag.php IpUtils.php JsonResponse.php ParameterBag.php \
	RedirectResponse.php RequestMatcherInterface.php RequestMatcher.php \
	Request.php RequestStack.php ResponseHeaderBag.php Response.php \
	ServerBag.php StreamedResponse.php "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
