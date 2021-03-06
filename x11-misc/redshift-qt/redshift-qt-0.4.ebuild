# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Redshift QT5 Based Frontend"
HOMEPAGE="https://github.com/Chemrat/redshift-qt/"
SRC_URI="https://github.com/Chemrat/${PN}/archive/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+icons"

DEPEND="dev-qt/qtgui:5
		dev-qt/qtcore:5
		dev-qt/qtwidgets:5"
RDEPEND="${DEPEND}
		x11-misc/redshift
		icons? ( x11-misc/redshift[-gtk] )"


inherit qmake-utils

src_configure() {
	eqmake5 redshift-qt.pro
}

src_install() {
	dobin redshift-qt
	if use icons; then
		insinto /usr/share/icons/hicolor/scalable/apps/
		doins icons/redshift-status-off.svg
		doins icons/redshift-status-on.svg
	fi

}
