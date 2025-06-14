# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=(python3_{11..13})
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1 pypi

DESCRIPTION="Initial tagging script for Notmuch"
HOMEPAGE="https://github.com/afewmail/afew"

LICENSE="ISC"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="doc"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/chardet[${PYTHON_USEDEP}]
		dev-python/dkimpy[${PYTHON_USEDEP}]
		net-mail/notmuch[python,${PYTHON_USEDEP}]
	')"
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/sphinx[${PYTHON_USEDEP}]
	')
	test? (
		$(python_gen_cond_dep '
			dev-python/freezegun[${PYTHON_USEDEP}]
		')
	)"

DOCS=("README.rst")

distutils_enable_tests pytest

python_prepare_all() {
	sed -r \
		-e "s/^([[:space:]]+)use_scm_version=.*,$/\1version='${PV}',/" \
		-e "/^([[:space:]]+)setup_requires=.*,$/d" \
		-i setup.py || die
	distutils-r1_python_prepare_all
}

# python_compile_all() {
# 	# sphinx-build -b man docs docs/build/man || die
#
# 	# if use doc; then
# 	# 	sphinx-build -b html docs docs/build/html || die
# 	# fi
# }

# python_install_all() {
# 	doman docs/build/man/*
# 	# dodoc afew/defaults/afew.config
# 	# use doc && HTML_DOCS=(docs/build/html/.)
# 	# einstalldocs
# }
