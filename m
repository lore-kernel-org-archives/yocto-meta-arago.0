Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D1C6052A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKHbuK022848;
	Fri, 20 Jun 2014 15:17:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKHbRI028358;
	Fri, 20 Jun 2014 15:17:37 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:37 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 10/19] gadget-init: LICENSE from oe-core
	has changed, update hash
Thread-Index: AQHPjLJxHZr5SzTj9Eyp8Ekk4JqUp5t6sHuA//+/eCA=
Date: Fri, 20 Jun 2014 20:17:36 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D6650@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-11-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9279@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D9279@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 10/19] gadget-init: LICENSE from oe-core has changed, update hash
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:09 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 10/19] gadget-init: LICENSE from oe-core=
 has
> changed, update hash
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 10/19] gadget-init: LICENSE from oe- core
> >has changed, update hash
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-
> >init.bb b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-
> >init.bb
> >index 477f16a..3f69c53 100644
> >--- a/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
> >+++ b/meta-arago-distro/recipes-tisdk/gadget-init/gadget-init.bb
> >@@ -1,7 +1,7 @@
> > # This recipe is based on the recipe by Koen in meta- texasinstruments
> >DESCRIPTION =3D "Scripts to initialize usb gadgets"
> > LICENSE =3D "MIT"
> >-LIC_FILES_CHKSUM =3D
> >"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
> >+LIC_FILES_CHKSUM =3D
> >"file://${COREBASE}/LICENSE;md5=3D4d92cd373abda3937c2bc47fbc49d690"
> >
> > COMPATIBLE_MACHINE =3D "ti33x"
> > PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >--
> >2.0.0
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

