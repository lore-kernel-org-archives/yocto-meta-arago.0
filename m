Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 2A44752A58
	for <meta-arago@arago-project.org>;
	Mon, 11 Mar 2019 17:32:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2BHWXKK122618
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 12:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552325553;
	bh=rsIySwuBZCmRWhFR34OLhzF7FS5NkBywDBYX+7knsw8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GtCXKHumxZCv0URGFyluF6UABmICwEl8CXlwfMdx890egn6N+cTLez7qGPthQsWTt
	uEfnIra8QtLVYMdpogkLfsivHRPbospqeKZhkBbmmScG6BfRe+I/EvgW9KgwWaP1ii
	b+HfOZI3l73SmHavamUGIG+UfECGd17s3N+UDJ3w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2BHWXx7110023
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 11 Mar 2019 12:32:33 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 11 Mar 2019 12:32:32 -0500
Received: from DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f]) by
	DFLE113.ent.ti.com ([fe80::5de1:db32:7f81:772f%18]) with mapi id
	15.01.1591.008; Mon, 11 Mar 2019 12:32:32 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: build
	the kernel module for acontis EtherCAT master
Thread-Index: AQHU1gZtlID22aluhESk6Mn4AZID0qYGorKwgABlOID//6ywUA==
Date: Mon, 11 Mar 2019 17:32:32 +0000
Message-ID: <4c8c8f7e7cdd4881a2ed11c5534eaca6@ti.com>
References: <1551895171-20664-1-git-send-email-a0271529@ti.com>
	<20190308232659.GF26510@beryl>
	<20333d3a8ffb43c7af5c66feda6e651b@ti.com>
	<579d032b3cb24af68753d4f5675647ee@ti.com>
In-Reply-To: <579d032b3cb24af68753d4f5675647ee@ti.com>
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
X-List-Received-Date: Mon, 11 Mar 2019 17:32:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 11, 2019 1:30 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: bui=
ld
> the kernel module for acontis EtherCAT master
>=20
> > acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
>=20
> Any derivatives of those?

No as far as I know.

>=20
>=20
> -----Original Message-----
> From: Gou, Hongmei
> Sent: Monday, March 11, 2019 12:30 PM
> To: Dmytriyenko, Denys
> Cc: meta-arago@arago-project.org
> Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: bui=
ld
> the kernel module for acontis EtherCAT master
>=20
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Friday, March 08, 2019 6:27 PM
> > To: Gou, Hongmei
> > Cc: meta-arago@arago-project.org
> > Subject: Re: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
> build
> > the kernel module for acontis EtherCAT master
> >
> > On Wed, Mar 06, 2019 at 12:59:30PM -0500, Hongmei Gou wrote:
> > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > > ---
> > >  .../acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb  | 18
> > ++++++++++++++++++
> > >  1 file changed, 18 insertions(+)
> > >  create mode 100644 meta-arago-extras/recipes-apps/acontis-ethercat-
> > demo/acontis-atemsys_3.0.1.28.bb
> > >
> > > diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-
> > demo/acontis-atemsys_3.0.1.28.bb b/meta-arago-extras/recipes-
> > apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
> > > new file mode 100644
> > > index 0000000..94e0c56
> > > --- /dev/null
> > > +++ b/meta-arago-extras/recipes-apps/acontis-ethercat-demo/acontis-
> > atemsys_3.0.1.28.bb
> > > @@ -0,0 +1,18 @@
> > > +SUMMARY =3D "acontis atemsys kernel module for EtherCAT master"
> > > +HOMEPAGE =3D "https://www.acontis.com/en/ethercat-for-ti-
> > processors.html"
> > > +LICENSE =3D "GPLv2"
> > > +LIC_FILES_CHKSUM =3D
> > "file://COPYING;md5=3D65dd37ccb3e888dc57e47d925b80b38a"
> > > +
> > > +SRC_URI =3D "https://www.acontis.com/files/support/ethercat/EC-
> Master-
> > Atemsys-V${PV}-Linux.tar.gz;subdir=3D${P}"
> > > +SRC_URI[md5sum] =3D "d8d92ae671c5cf78ae22bc5386d7f44f"
> > > +SRC_URI[sha256sum] =3D
> > "dd3d83eb984b17b8378e0a5e5dfae8c77e25c5428a26319f59f44f805aff9e89"
> > > +
> > > +COMPATIBLE_MACHINE =3D "am335x-evm|am57xx-evm"
> >
> > Why is it so strict? Can it be used on non-EVM devices in AM335x and
> AM57x
> > families?
>=20
> acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
>=20
> >
> > > +PR =3D "r0"
> > > +
> > > +S =3D "${WORKDIR}/${P}/yocto/meta-acontis/recipes-
> kernel/atemsys/files"
> > > +
> > > +inherit module
> > > +
> > > +EXTRA_OEMAKE +=3D 'KERNELDIR=3D"${STAGING_KERNEL_DIR}"'
> > > --
> > > 1.9.1
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

