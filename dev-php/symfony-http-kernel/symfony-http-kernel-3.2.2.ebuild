# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Subtree split of the Symfony HttpKernel Component"
HOMEPAGE="https://github.com/symfony/http-kernel"
SRC_URI="https://github.com/symfony/http-kernel/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"
RESTRICT="test"

RDEPEND="
	dev-lang/php:*
	dev-php/fedora-autoloader
	>=dev-php/symfony-event-dispatcher-3.0
	>=dev-php/symfony-http-foundation-3.2
	>=dev-php/symfony-debug-3.0
	>=dev-php/psr-log-1.0"
DEPEND="
	test? (
		${RDEPEND}
		dev-php/phpunit
		>=dev-php/symfony-browser-kit-3.0
		>=dev-php/symfony-class-loader-3.0
		>=dev-php/symfony-config-3.0
		>=dev-php/symfony-console-3.0
		>=dev-php/symfony-css-selector-3.0
		>=dev-php/symfony-dependency-injection-3.0
		>=dev-php/symfony-dom-crawler-3.0
		>=dev-php/symfony-expression-language-3.0
		>=dev-php/symfony-finder-3.0
		>=dev-php/symfony-process-3.0
		>=dev-php/symfony-routing-3.0
		>=dev-php/symfony-stopwatch-3.0
		>=dev-php/symfony-templating-3.0
		>=dev-php/symfony-translation-3.0
		>=dev-php/symfony-var-dumper-3.2
		>=dev-php/symfony-expression-language-3.0 )"

S="${WORKDIR}/http-kernel-${PV}"

src_prepare() {
	default
	if use test; then
		cp "${FILESDIR}"/autoload.php "${S}"/autoload-test.php || die
	fi
}

src_install() {
	insinto "/usr/share/php/Symfony/Component/HttpKernel"
	# As there is no src dir we have to list needed dir + files
	doins -r Bundle CacheClearer CacheWarmer Config Controller \
	ControllerMetadata DataCollector Debug DependencyInjection \
	Event EventListener Exception Fragment HttpCache Log \
	Profiler Client.php HttpKernelInterface.php HttpKernel.php \
	KernelEvents.php KernelInterface.php Kernel.php \
	TerminableInterface.php UriSigner.php "${FILESDIR}"/autoload.php
	dodoc README.md
}

src_test() {
	phpunit --bootstrap "${S}"/autoload-test.php || die "test suite failed"
}
