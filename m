Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 85EE55298F
	for <meta-arago@arago-project.org>;
	Mon,  9 Sep 2013 16:46:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r89GkN7R003921
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:46:23 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r89GkNbi004250
	for <meta-arago@arago-project.org>; Mon, 9 Sep 2013 11:46:23 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 9 Sep 2013 11:46:23 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2]
	packagegroup-arago-tisdk-amsdk-sdk-host:	Include install script in the
	sdk
Thread-Index: AQHOkluDAx2/WY4cIkGD6lFD5scztZm90w8A
Date: Mon, 9 Sep 2013 16:46:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C54B8FB@DFLE08.ent.ti.com>
References: <1375733834-21322-1-git-send-email-fcooper@ti.com>
	<1375733834-21322-2-git-send-email-fcooper@ti.com>
	<7D46E86EC0A8354091174257B2FED10159693961@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159693961@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host:	Include install script in the sdk
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
X-List-Received-Date: Mon, 09 Sep 2013 16:46:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

ping.

Also based on PATCH 1/2 comment if the recipe is going to be shorten to tis=
dk-install then this patch will need to be tweaked also.


> -----Original Message-----
> From: Maupin, Chase
> Sent: Monday, August 05, 2013 11:15 PM
> To: Cooper Jr., Franklin; meta-arago@arago-project.org
> Subject: RE: [meta-arago] [PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-
> host: Include install script in the sdk
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
> >Sent: Tuesday, August 06, 2013 1:47 AM
> >To: meta-arago@arago-project.org
> >Cc: Cooper Jr., Franklin
> >Subject: [meta-arago] [PATCH 2/2] packagegroup-arago-tisdk-amsdk-
> >sdk-host: Include install script in the sdk
> >
> >Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> >---
> > .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    3 ++-
> > 1 files changed, 2 insertions(+), 1 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-
> >core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
> >b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >tisdk-amsdk-sdk-host.bb
> >index e1c35dd..70f767d 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-amsdk-sdk-host.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >arago-tisdk-amsdk-sdk-host.bb
> >@@ -1,6 +1,6 @@
> > DESCRIPTION =3D "Task to install additional scripts and applications
> >into the SDK"
> > LICENSE =3D "MIT"
> >-PR =3D "r10"
> >+PR =3D "r11"
> >
> > inherit packagegroup
> >
> >@@ -28,4 +28,5 @@ RDEPENDS_${PN} =3D "\
> >     ti-tisdk-makefile \
> >     ${U-BOOT_SRC} \
> >     ${KERNEL_SRC} \
> >+    ti-tisdk-install \
> > "
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

