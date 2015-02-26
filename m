Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C3F60529AF
	for <meta-arago@arago-project.org>;
	Thu, 26 Feb 2015 00:39:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1Q0dkg9019517
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 18:39:46 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1Q0djDN031793
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 18:39:45 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0224.002; Wed, 25 Feb 2015 18:39:45 -0600
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2]
	packagegroup-arago-mcsdk-toolchain-target:	Add package group for mcsdk
	toolchain
Thread-Index: AQHQUUBaUKFyBBBE40ahsM90plmfEp0CFhAw
Date: Thu, 26 Feb 2015 00:39:44 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F49058122FE9@DLEE11.ent.ti.com>
References: <1424897759-23944-1-git-send-email-sam.nelson@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C81E357@DLEE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C81E357@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-target:	Add package group for mcsdk toolchain
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Feb 2015 00:39:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think the intention was to allow users to choose either static or shared =
library based on their preference.
If we have to decide on one, not sure what is the criteria to be used.
Sam

> -----Original Message-----
> From: Cooper Jr., Franklin
> Sent: Wednesday, February 25, 2015 4:17 PM
> To: Nelson, Sam; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-
> target: Add package group for mcsdk toolchain
>=20
> Do you really need both shared libraries and static libraries? Usually I'=
ve seen
> people just include one or the other.
>=20
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Nelson, Sam
> > Sent: Wednesday, February 25, 2015 2:56 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH 1/2] packagegroup-arago-mcsdk-toolchain-
> > target: Add package group for mcsdk toolchain
> >
> > - Adds ti dev packages, platform specific packages and other additional
> > packages
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  .../packagegroup-arago-mcsdk-toolchain-target.bb   |   94
> > ++++++++++++++++++++
> >  1 file changed, 94 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-
> > core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
> >
> > diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-
> > arago-mcsdk-toolchain-target.bb b/meta-arago-extras/recipes-
> > core/packagegroups/packagegroup-arago-mcsdk-toolchain-target.bb
> > new file mode 100644
> > index 0000000..9265a8c
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-
> > arago-mcsdk-toolchain-target.bb
> > @@ -0,0 +1,94 @@
> > +DESCRIPTION =3D "Target dev packages for MCSDK SDK"
> > +LICENSE =3D "BSD-3-Clause"
> > +
> > +PR =3D "r0"
> > +
> > +inherit packagegroup
> > +
> > +TI_PKGS_DEV =3D "\
> > +	cmem-dev \
> > +	cmem-staticdev \
> > +	"
> > +TI_SECURE_STORAGE_DEV =3D "\
> > +	ti-softhsmv2-dev \
> > +	libp11-dev \
> > +	libp11-staticdev \
> > +	"
> > +
> > +TI_PKGS_DEV_append_keystone =3D "\
> > +	${TI_SECURE_STORAGE_DEV} \
> > +	udma-dev \
> > +	udma-staticdev \
> > +	traceframework-dev \
> > +	traceframework-staticdev \
> > +	cuia-dev \
> > +	cuia-staticdev \
> > +	common-csl-ip-dev \
> > +	cppi-lld-dev \
> > +	cppi-lld-staticdev \
> > +	qmss-lld-dev \
> > +	qmss-lld-staticdev \
> > +	pa-lld-dev \
> > +	pa-lld-staticdev \
> > +	rm-lld-dev \
> > +	rm-lld-staticdev \
> > +	hyplnk-lld-dev \
> > +	hyplnk-lld-staticdev \
> > +	sa-lld-dev \
> > +	sa-lld-staticdev \
> > +	hplib-dev \
> > +	hplib-staticdev \
> > +	nwal-lld-dev \
> > +	nwal-lld-staticdev \
> > +	pktlib-dev \
> > +	pktlib-staticdev \
> > +	mmap-lld \
> > +	mmap-lld-staticdev \
> > +	netapi-dev \
> > +	netapi-staticdev \
> > +	ipsecmgr-dev \
> > +	ipsecmgr-staticdev \
> > +	libnl-xfrm-dev \
> > +	libnl-xfrm-staticdev \
> > +	libnl-dev \
> > +	libnl-staticdev \
> > +	ti-ipc-dev \
> > +	ti-ipc-staticdev \
> > +	multiprocmgr-dev \
> > +	multiprocmgr-staticdev \
> > +	mpm-transport-dev \
> > +	mpm-transport-staticdev \
> > +	edma3-lld-dev \
> > +	edma3-lld-staticdev \
> > +	lksctp-tools-dev \
> > +	lksctp-tools-staticdev \
> > +	"
> > +
> > +TI_PKGS_DEV_append_k2l-evm =3D "\
> > +	dfe-lld-dev \
> > +	dfe-lld-staticdev \
> > +	iqn2-lld-dev \
> > +	iqn2-lld-staticdev \
> > +	"
> > +
> > +TI_PKGS_DEV_append_k2hk-evm =3D "\
> > +	srio-lld-dev \
> > +	srio-lld-staticdev \
> > +	"
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +	packagegroup-arago-standalone-sdk-target \
> > +	kernel-dev \
> > +	${TI_PKGS_DEV} \
> > +	libdnet-dev \
> > +	libdnet-staticdev \
> > +	binutils-dev \
> > +	binutils-staticdev \
> > +	elfutils-dev \
> > +	elfutils-staticdev \
> > +	libbz2-dev \
> > +	libbz2-staticdev \
> > +	libgl-mesa-dev \
> > +	boost-dev \
> > +	libsdl-dev \
> > +	"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

