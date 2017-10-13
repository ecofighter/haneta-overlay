# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit git-r3

DESCRIPTION="create a dropdown/scratchpad on the fly with a hotkey"
HOMEPAGE="https://github.com/noctuid/tdrop"
EGIT_REPO_URI="https://github.com/noctuid/tdrop.git"
EGIT_CLONE_TYPE="shallow"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS=""

IUSE="+xrandr"
RDEPEND="
	app-shells/bash
	x11-apps/xprop
	x11-apps/xwininfo
	x11-misc/xdotool

	xrandr? ( x11-apps/xrandr )
"

DEPEND="${RDEPEND}"

src_compile() {
	return
}

src_install() {
	env PREFIX=${ED}/usr emake install
	doman tdrop.1
}
