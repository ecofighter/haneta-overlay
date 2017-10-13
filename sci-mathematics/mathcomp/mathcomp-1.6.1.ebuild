EAPI=6

DESCRIPTION="the Mathematical Components Library for the Coq system"
HOMEPAGE="http://math-comp.github.io/math-comp"
SRC_URI="https://github.com/math-comp/math-comp/archive/${P}.tar.gz"

LICENSE="CeCILL-B"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=sci-mathematics/coq-8.6[camlp5(+)]"
DEPEND="${RDEPEND}"

src_unpack(){
	unpack ${A}
	mv math-comp-${P} ${P}
}

src_compile() {
	cd mathcomp
	emake || die "emake failed"
}

src_install() {
	cd mathcomp
	emake DSTROOT="${D}" install
}
