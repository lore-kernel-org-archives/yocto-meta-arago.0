Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id C31E9529B9
	for <meta-arago@arago-project.org>;
	Wed, 13 Mar 2019 14:06:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2DE6ZNl026588
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 09:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552485995;
	bh=6pitGeag9rmgvaeglFQOEtO2ZS4tlB9VQJTiIeqQ6tQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Y8iSdQeV+73TsZWWZrOHmmZv/6htLl/LdCjMqGzgSSXKTiLL5d2cZPjl7106bAf9S
	/l9yhekv0A5K/hKgrOwSakp07f9x7V1bOgRWr5worFhZAquHRwmhCe3fCwofVz4QLq
	hITDnuRGyKbsWKgFPo08wYC3Afw6+QAs8l7sG64c=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2DE6Yfh069575
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 09:06:35 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 09:06:34 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Wed, 13 Mar 2019 09:06:34 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: build
	the kernel module for acontis EtherCAT master
Thread-Index: AQHU1gZtlID22aluhESk6Mn4AZID0qYGorKwgABlOID//6ywUIACSV2AgAChspA=
Date: Wed, 13 Mar 2019 14:06:34 +0000
Message-ID: <77fd577864a64d528df691d3ac4bc6fb@ti.com>
References: <1551895171-20664-1-git-send-email-a0271529@ti.com>
	<20190308232659.GF26510@beryl>
	<20333d3a8ffb43c7af5c66feda6e651b@ti.com>
	<579d032b3cb24af68753d4f5675647ee@ti.com>
	<4c8c8f7e7cdd4881a2ed11c5534eaca6@ti.com>
	<20190312232702.GI28041@beryl>
In-Reply-To: <20190312232702.GI28041@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.170]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master] [PATCH 1/2] acontis-atemsys: build the kernel module for acontis EtherCAT master
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
X-List-Received-Date: Wed, 13 Mar 2019 14:06:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Tuesday, March 12, 2019 7:27 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: bui=
ld
> the kernel module for acontis EtherCAT master
>=20
> On Mon, Mar 11, 2019 at 01:32:32PM -0400, Gou, Hongmei wrote:
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, March 11, 2019 1:30 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
> build
> > > the kernel module for acontis EtherCAT master
> > >
> > > > acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
> > >
> > > Any derivatives of those?
> >
> > No as far as I know.
>=20
> Ok, thanks for verifying.
>=20
> Is it needed on rocko?

Yes, this is needed for rocko, as specified in the subject.

>=20
>=20
> > > -----Original Message-----
> > > From: Gou, Hongmei
> > > Sent: Monday, March 11, 2019 12:30 PM
> > > To: Dmytriyenko, Denys
> > > Cc: meta-arago@arago-project.org
> > > Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
> build
> > > the kernel module for acontis EtherCAT master
> > >
> > > > -----Original Message-----
> > > > From: Dmytriyenko, Denys
> > > > Sent: Friday, March 08, 2019 6:27 PM
> > > > To: Gou, Hongmei
> > > > Cc: meta-arago@arago-project.org
> > > > Subject: Re: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsy=
s:
> > > build
> > > > the kernel module for acontis EtherCAT master
> > > >
> > > > On Wed, Mar 06, 2019 at 12:59:30PM -0500, Hongmei Gou wrote:
> > > > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > > > ---
> > > > >  .../acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb  | 18
> > > > ++++++++++++++++++
> > > > >  1 file changed, 18 insertions(+)
> > > > >  create mode 100644 meta-arago-extras/recipes-apps/acontis-
> ethercat-
> > > > demo/acontis-atemsys_3.0.1.28.bb
> > > > >
> > > > > diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-
> > > > demo/acontis-atemsys_3.0.1.28.bb b/meta-arago-extras/recipes-
> > > > apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
> > > > > new file mode 100644
> > > > > index 0000000..94e0c56
> > > > > --- /dev/null
> > > > > +++ b/meta-arago-extras/recipes-apps/acontis-ethercat-
> demo/acontis-
> > > > atemsys_3.0.1.28.bb
> > > > > @@ -0,0 +1,18 @@
> > > > > +SUMMARY =3D "acontis atemsys kernel module for EtherCAT master"
> > > > > +HOMEPAGE =3D "https://www.acontis.com/en/ethercat-for-ti-
> > > > processors.html"
> > > > > +LICENSE =3D "GPLv2"
> > > > > +LIC_FILES_CHKSUM =3D
> > > > "file://COPYING;md5=3D65dd37ccb3e888dc57e47d925b80b38a"
> > > > > +
> > > > > +SRC_URI =3D "https://www.acontis.com/files/support/ethercat/EC-
> > > Master-
> > > > Atemsys-V${PV}-Linux.tar.gz;subdir=3D${P}"
> > > > > +SRC_URI[md5sum] =3D "d8d92ae671c5cf78ae22bc5386d7f44f"
> > > > > +SRC_URI[sha256sum] =3D
> > > >
> "dd3d83eb984b17b8378e0a5e5dfae8c77e25c5428a26319f59f44f805aff9e89"
> > > > > +
> > > > > +COMPATIBLE_MACHINE =3D "am335x-evm|am57xx-evm"
> > > >
> > > > Why is it so strict? Can it be used on non-EVM devices in AM335x an=
d
> > > AM57x
> > > > families?
> > >
> > > acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
> > >
> > > >
> > > > > +PR =3D "r0"
> > > > > +
> > > > > +S =3D "${WORKDIR}/${P}/yocto/meta-acontis/recipes-
> > > kernel/atemsys/files"
> > > > > +
> > > > > +inherit module
> > > > > +
> > > > > +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}"'
> > > > > --
> > > > > 1.9.1
> > > > >
> > > > > _______________________________________________
> > > > > meta-arago mailing list
> > > > > meta-arago@arago-project.org
> > > > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

