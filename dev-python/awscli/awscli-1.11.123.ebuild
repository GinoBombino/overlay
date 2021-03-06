# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_4,3_5} )

inherit distutils-r1

DESCRIPTION="Universal Command Line Environment for AWS"
HOMEPAGE="http://pypi.python.org/pypi/awscli"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	<=dev-python/pyyaml-3.12[${PYTHON_USEDEP}]
	dev-python/botocore[${PYTHON_USEDEP}]
	<=dev-python/colorama-0.3.7[${PYTHON_USEDEP}]
	dev-python/docutils[${PYTHON_USEDEP}]
	<=dev-python/rsa-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/s3transfer-0.1.10[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	"
