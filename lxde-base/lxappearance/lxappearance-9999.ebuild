# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="LXDE GTK+ theme switcher"
HOMEPAGE="http://lxde.sourceforge.net"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3 autotools
	EGIT_REPO_URI="git://git.lxde.org/git/lxde/${PN}.git"
else
	SRC_URI="mirror://sourceforge/lxde/${P}.tar.xz"
fi

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha amd64 arm ~arm64 ~mips ppc x86 ~x86-interix ~amd64-linux ~arm-linux ~x86-linux"
IUSE="dbus"

RDEPEND="x11-libs/gtk+:2
	dbus? ( dev-libs/dbus-glib )"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	dev-util/intltool
	sys-devel/gettext"

src_prepare() {
	eautoreconf
}
src_configure() {
	XSLTPROC="xsltproc" econf \
		$(use_enable dbus)
}