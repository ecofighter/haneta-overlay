# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="A run-or-raise application switcher for any X11 desktop"
HOMEPAGE="https://github.com/mkropat/jumpapp"
EGIT_REPO_URI="https://github.com/mkropat/jumpapp.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

IUSE=""
RDEPEND="
	app-shells/bash
	x11-misc/wmctrl
"

DEPEND="${RDEPEND}
	app-text/pandoc
"

src_compile() {
	emake jumpapp.1
}

src_install() {
	sed -i -e 's/^PREFIX =/PREFIX ?=/' Makefile || echo "Sed Failed!"
	env PREFIX=${ED}/usr emake install
}
