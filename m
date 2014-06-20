Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id E49A952A0F
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 20:17:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s5KKHmDY030947;
	Fri, 20 Jun 2014 15:17:48 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s5KKHm8p005594;
	Fri, 20 Jun 2014 15:17:48 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 20 Jun 2014 15:17:48 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/19] icu: remove bbappend and patch to
	disable LDFLAGSICUDT, applied upstream
Thread-Index: AQHPjLEb7GzWj+hxd0W28c1Yhj2Pipt6sFWA//+/ryA=
Date: Fri, 20 Jun 2014 20:17:47 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C6D667C@DFLE08.ent.ti.com>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
	<1403287009-11256-9-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015D0D91BF@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D0D91BF@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 08/19] icu: remove bbappend and patch to disable LDFLAGSICUDT, applied upstream
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
X-List-Received-Date: Fri, 20 Jun 2014 20:17:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Friday, June 20, 2014 2:08 PM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 08/19] icu: remove bbappend and patch to
> disable LDFLAGSICUDT, applied upstream
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Friday, June 20, 2014 12:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 08/19] icu: remove bbappend and patch to
> >disable LDFLAGSICUDT, applied upstream
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-support/icu/icu/disable-ldflagsicudt.patch       | 12
> >------------
> > meta-arago-distro/recipes-support/icu/icu_51.2.bbappend      |  5
> >-----
> > 2 files changed, 17 deletions(-)
> > delete mode 100644 meta-arago-distro/recipes-
> >support/icu/icu/disable-ldflagsicudt.patch
> > delete mode 100644 meta-arago-distro/recipes-
> >support/icu/icu_51.2.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-support/icu/icu/disable-
> >ldflagsicudt.patch b/meta-arago-distro/recipes-
> >support/icu/icu/disable-ldflagsicudt.patch
> >deleted file mode 100644
> >index b26d388..0000000
> >--- a/meta-arago-distro/recipes-support/icu/icu/disable-
> >ldflagsicudt.patch
> >+++ /dev/null
> >@@ -1,12 +0,0 @@
> >-diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
> >---- icu-orig/config/mh-linux	2013-05-23 16:02:40.000000000 -0400
> >-+++ icu/config/mh-linux	2013-09-30 00:19:13.772269345 -0400
> >-@@ -21,7 +21,7 @@
> >- LD_RPATH_PRE =3D -Wl,-rpath,
> >-
> >- ## These are the library specific LDFLAGS
> >--LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
> >-+#LDFLAGSICUDT=3D-nodefaultlibs -nostdlib
> >-
> >- ## Compiler switch to embed a library name
> >- # The initial tab in the next line is to prevent icu-config from
> >reading it.
> >diff --git a/meta-arago-distro/recipes- support/icu/icu_51.2.bbappend
> >b/meta-arago-distro/recipes- support/icu/icu_51.2.bbappend deleted file
> >mode 100644 index f812148..0000000
> >--- a/meta-arago-distro/recipes-support/icu/icu_51.2.bbappend
> >+++ /dev/null
> >@@ -1,5 +0,0 @@
> >-FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> >-
> >-PR_append =3D "-arago0"
> >-
> >-SRC_URI +=3D "file://disable-ldflagsicudt.patch"
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

