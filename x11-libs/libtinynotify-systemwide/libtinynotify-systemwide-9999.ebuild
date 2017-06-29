# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

#if LIVE
AUTOTOOLS_AUTORECONF=yes
EGIT_REPO_URI="https://github.com/mgorny/${PN}.git"

inherit git-r3
#endif

inherit autotools-utils

DESCRIPTION="A system-wide notifications module for libtinynotify"
HOMEPAGE="https://github.com/mgorny/libtinynotify-systemwide/"
SRC_URI="https://github.com/mgorny/libtinynotify-systemwide/releases/download/${P}/${P}.tar.bz2"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc static-libs"

RDEPEND="sys-process/procps:0=
	x11-libs/libtinynotify:0="
DEPEND="${RDEPEND}
	virtual/pkgconfig
	doc? ( dev-util/gtk-doc )"

#if LIVE
KEYWORDS=
SRC_URI=
DEPEND="${DEPEND}
	>=dev-util/gtk-doc-1.18"
#endif

src_configure() {
	myeconfargs=(
		$(use_enable doc gtk-doc)
	)

	autotools-utils_src_configure
}
