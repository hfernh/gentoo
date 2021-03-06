# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit go-module

EGIT_COMMIT="d3d03a28b678b6e3af03a86d1998bfc051a9d896"

DESCRIPTION="Prometheus Utility Tool"
HOMEPAGE="https://github.com/prometheus/promu"
SRC_URI="https://github.com/prometheus/promu/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm"
IUSE=""

RESTRICT+=" test"

src_prepare() {
	default
	sed -i -e "s/{{.Revision}}/${EGIT_COMMIT}/" .promu.yml || die
}

src_compile() {
	go build -mod=vendor . || die "compile failed"
}

src_install() {
	dobin ${PN}
	dodoc -r {doc,{README,CONTRIBUTING}.md}
}
