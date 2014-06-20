Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 9566B52A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKHBvt027627;
	Fri, 20 Jun 2014 15:17:11 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKHBRc028153;
	Fri, 20 Jun 2014 15:17:11 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:11 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 18/19] tisdk-image: upstream got new
	rootfs/image framework, unbreak parsing
Thread-Index: AQHPjLEc8xoOtGuLjUaC+NJdKiCN45t6sUuA//++jYA=
Date: Fri, 20 Jun 2014 20:17:11 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D65C4@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-19-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D9542@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D9542@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 18/19] tisdk-image: upstream got new rootfs/image framework, unbreak parsing
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:11 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 18/19] tisdk-image: upstream got new
> rootfs/image framework, unbreak parsing
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 18/19] tisdk-image: upstream got new
> >rootfs/image framework, unbreak parsing
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >tisdk-image class requires further updating to better use the new
> >rootfs/image framework in oe-core, for now disable non-existent API
> >that breaks parsing.
> >
> >Note, that tisdk combined images may be broken for now.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/classes/tisdk-image.bbclass | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-
> >arago-distro/classes/tisdk-image.bbclass
> >index 59e467a..b100261 100644
> >--- a/meta-arago-distro/classes/tisdk-image.bbclass
> >+++ b/meta-arago-distro/classes/tisdk-image.bbclass
> >@@ -614,7 +614,7 @@ do_sdk_image () {
> >     mv ${IMAGE_ROOTFS}/etc ${IMAGE_ROOTFS}/.etc
> >
> >     # Create the image directory symlinks
> >-    ${@get_imagecmds(d)}
> >+    # $ { @ get_imagecmds(d) }
> > }
> >
> > license_create_manifest() {
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

