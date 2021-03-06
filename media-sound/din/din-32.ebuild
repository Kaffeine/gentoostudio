# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit autotools eutils

DESCRIPTION="Software musical instrument and audio synthesizer"
HOMEPAGE="https://dinisnoise.org"
SRC_URI=""https://archive.org/download/dinisnoise_source_code/${P}.tar.gz

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# Not sure if libsdl or libsdl2 is needed here.
# README has a condition for "if you want ALSA instead of JACK,"
# but there's generally no reason not to have both.

RDEPEND="virtual/opengl
	media-libs/libsdl2
	virtual/jack
	media-libs/alsa-lib"
DEPEND="${RDEPEND}
	dev-lang/tcl
	dev-libs/boost"

#PATCHES=( "${FILESDIR}/${P}-tcl-interp-sharedir.patch" )

#src_prepare() {
#	epatch -p0 "${FILESDIR}"/tcl_interp_sharedir.patch
#	epatch_user
#}

src_configure(){
	# from README:
	#autoreconf -fvi
	#./configure CXXFLAGS="-O3 -D__UNIX_JACK__" CFLAGS=-O3
	eautoreconf -fvi
	econf CXXFLAGS="-O3 -D__UNIX_JACK__" CFLAGS=-O3
}
