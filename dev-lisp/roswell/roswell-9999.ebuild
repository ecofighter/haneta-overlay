EAPI=5
inherit eutils autotools

DESCRIPTION="Common Lisp environment setup utility"
HOMEPAGE="https://github.com/roswell/roswell"
if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/roswell/roswell"
else
	SRC_URI="https://github.com/roswell/roswell/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

CDEPEND=""
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_prepare() {
	sh bootstrap || die
	eautoreconf
}
