# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

inherit eutils toolchain-funcs git-r3

DESCRIPTION="Utility to make modifier keys send custom key events when pressed on their own"
HOMEPAGE="https://github.com/alols/xcape"
EGIT_REPO_URI="https://github.com/alols/xcape.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="x11-libs/libX11
	x11-libs/libXtst"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

src_prepare() {
	# Fix path to man and to pkg-config
	sed -i \
		-e "/MANDIR/s:local:share:" \
		-e "s/pkg-config/$(tc-getPKG_CONFIG)/" \
		Makefile || die

	eapply_user
}

src_compile() {
	emake CC="$(tc-getCC)"
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install
}
