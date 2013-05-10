Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 340FA52977
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2013 13:46:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ADkgRV025855
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:46:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ADkgIV009889
	for <meta-arago@arago-project.org>; Fri, 10 May 2013 08:46:42 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 10 May 2013 08:46:41 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Fri, 10 May 2013 08:46:42 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>, "Maupin, Chase" <chase.maupin@ti.com>, 
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/3] Add pciutils to the console package
Thread-Index: AQHOTWyBfut9/2B7zEe2LtuexfOeqJj+vK+AgAAFEAD//6x6MA==
Date: Fri, 10 May 2013 13:46:41 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C451F07@DFLE08.ent.ti.com>
References: <1368182794-8463-1-git-send-email-sam.nelson@ti.com>
	<7D46E86EC0A8354091174257B2FED10159554B57@DLEE11.ent.ti.com>
	<4F9216F96E5DF9428610502835A9F4905491D894@DLEE11.ent.ti.com>
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905491D894@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] Add pciutils to the console package
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
X-List-Received-Date: Fri, 10 May 2013 13:46:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Not all machines support PCI so it isn't a good fit to force all machines t=
o include this utility.

Use something like below:
ARAGO_UTILS_append_<machine> =3D "pci"

This will insure only the machine you care about is picking up this utility=
.

You also forgot to bump the PR.

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Nelson, Sam
> Sent: Friday, May 10, 2013 8:44 AM
> To: Maupin, Chase; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 1/3] Add pciutils to the console package
>=20
> Thanks for the response.
> Pciutils provides very basic utilities for pci, when you have pci interfa=
ce
> supported in the platform. ( I guess this is common).  There was customer
> request to have it in a minimal file system.
>=20
> If it does not belong in here. Please suggest any alternate recipes where=
 this will
> naturally belong.
>=20
> There is only 1 patch, I wanted to send.  The other patches are not relev=
ant,
> please ignore.
>=20
> With regards,
> sam
>=20
>=20
> -----Original Message-----
> From: Maupin, Chase
> Sent: Friday, May 10, 2013 9:26 AM
> To: Nelson, Sam; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 1/3] Add pciutils to the console package
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Nelson, Sam
> >Sent: Friday, May 10, 2013 5:47 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 1/3] Add pciutils to the console package
>=20
> Why are you adding this to the console package?  That is supposed to be a=
 small
> package so what is the use case for adding this here instead of somewhere=
 else?
>=20
> Also, I didn't see patches 2 and 3 of this set.  Did I miss them?
>=20
> >
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >---
> > .../packagegroups/packagegroup-arago-console.bb    |    1 +
> > 1 file changed, 1 insertion(+)
> >
> >diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-arago-console.bb b/meta-arago-
> >distro/recipes-core/packagegroups/packagegroup-arago-console.bb
> >index 5a80064..930049a 100755
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-console.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-console.bb
> >@@ -25,6 +25,7 @@ ARAGO_UTILS =3D "\
> >     i2c-tools \
> >     iproute2 \
> >     strace \
> >+    pciutils \
>=20
> You would need to bump the PR
>=20
> >     "
> >
> > ARAGO_SDK_PREREQ =3D "\
> >--
> >1.7.9.5
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

