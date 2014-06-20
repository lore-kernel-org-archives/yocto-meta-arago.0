Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 64ED952A63
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:18:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKIDm8022913;
	Fri, 20 Jun 2014 15:18:13 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKIDMs006012;
	Fri, 20 Jun 2014 15:18:13 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:18:13 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 01/19] README: update with Daisy info
Thread-Index: AQHPjLEbLHUYiGCVxEepTG8U4Bo0WZt6rvmA///BJBA=
Date: Fri, 20 Jun 2014 20:18:12 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D671F@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D8FBD@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D8FBD@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 01/19] README: update with Daisy info
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
X-List-Received-Date: Fri, 20 Jun 2014 20:18:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:03 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 01/19] README: update with Daisy info
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 01/19] README: update with Daisy info
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > meta-arago-distro/README | 12 ++++++------  meta-arago-extras/README |
> >12 ++++++------
> > 2 files changed, 12 insertions(+), 12 deletions(-)
> >
> >diff --git a/meta-arago-distro/README b/meta-arago-distro/README index
> >aed3b58..05b0261 100644
> >--- a/meta-arago-distro/README
> >+++ b/meta-arago-distro/README
> >@@ -1,24 +1,24 @@
> > meta-arago-distro provides Arago distribution configuration for TI SDK
> >products
> >
> >-This layer works with the latest Yocto Project release (currently
> >1.5) and tracks
> >-the stable/maintenance branches (currently "dora") of the
> >corresponding layers:
> >+This layer works with the latest Yocto Project release (currently
> >1.6) and tracks
> >+the stable/maintenance branches (currently "daisy") of the
> >corresponding layers:
> >
> > URI: git://git.openembedded.org/openembedded-core
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta
> >
> > URI: git://git.openembedded.org/meta-openembedded
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta-oe, toolchain-layer, meta-networking
> >
> > URI: git://arago-project.org/git/meta-ti
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> >
> > URI: git://git.linaro.org/openembedded/meta-linaro
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta-linaro-toolchain
> >
> >diff --git a/meta-arago-extras/README b/meta-arago-extras/README index
> >f303d14..1c6e8e5 100644
> >--- a/meta-arago-extras/README
> >+++ b/meta-arago-extras/README
> >@@ -1,24 +1,24 @@
> > meta-arago-extras provides additional TI SDK applications that are
> >distro-agnostic
> >
> >-This layer works with the latest Yocto Project release (currently
> >1.5) and tracks
> >-the stable/maintenance branches (currently "dora") of the
> >corresponding layers:
> >+This layer works with the latest Yocto Project release (currently
> >1.6) and tracks
> >+the stable/maintenance branches (currently "daisy") of the
> >corresponding layers:
> >
> > URI: git://git.openembedded.org/openembedded-core
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta
> >
> > URI: git://git.openembedded.org/meta-openembedded
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta-oe, toolchain-layers, meta-networking
> >
> > URI: git://arago-project.org/git/meta-ti
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> >
> > URI: git://git.linaro.org/openembedded/meta-linaro
> >-branch: dora
> >+branch: daisy
> > revision: HEAD
> > layers: meta-linaro-toolchain
> >
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

