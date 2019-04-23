# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit desktop eutils pax-utils

DESCRIPTION="Multiplatform Visual Studio Code from Microsoft"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
		x86? (  https://vscode-update.azurewebsites.net/${PV}/linux-ia32/stable -> ${P}_i386.tar.gz )
		amd64? ( https://vscode-update.azurewebsites.net/${PV}/linux-x64/stable -> ${P}_amd64.tar.gz )"
RESTRICT="mirror strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	>=media-libs/libpng-1.6.35
	>=x11-libs/gtk+-3.24.1:3
	x11-libs/cairo"

RDEPEND="${DEPEND}"

pkg_setup() {
	use amd64 && S="${WORKDIR}/VSCode-linux-x64" || S="${WORKDIR}/VSCode-linux-ia32"
}

src_install() {
	pax-mark m code
	insinto "/opt/${PN}"
	doins -r *
	dosym "../../opt/${PN}/code" "usr/bin/${PN}"
	make_wrapper "${PN}" "../../opt/${PN}/code"
	make_desktop_entry "${PN}" "Visual Studio Code" "${PN}" "Development;IDE"
	newicon "resources/app/resources/linux/code.png" "visual-studio-code.png"
	dodoc "resources/app/LICENSE.txt"
	fperms +x "/opt/${PN}/code"
}

pkg_postinst() {
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
}
