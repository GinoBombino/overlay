# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-misc/parcellite/parcellite-1.1.9.ebuild,v 1.3 2014/12/05 10:16:15 ago Exp $

EAPI=5
inherit eutils fdo-mime

MY_P=${PN}-${PV/_}

DESCRIPTION="A lightweight GTK+ based clipboard manager"
HOMEPAGE="http://sourceforge.net/projects/gtkclipit/"
SRC_URI="mirror://sourceforge/gtk${PN}/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="nls"

RDEPEND=">=dev-libs/glib-2.14
	>=x11-libs/gtk+-2.10:2"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	nls? (
		dev-util/intltool
		sys-devel/gettext
	)"

S=${WORKDIR}/${MY_P}

src_prepare() {
	sed -i data/${PN}.desktop.in -e 's:Application;::g' || die

	sed -i -e '/^ALL_LINGUAS=/d' configure || die
	strip-linguas -i po/
	export ALL_LINGUAS="${LINGUAS}"
}

src_configure() {
	econf $(use_enable nls)
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
