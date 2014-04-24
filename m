Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id BF0A252998
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 14:29:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OETPij031437;
	Thu, 24 Apr 2014 09:29:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OETOS8031125;
	Thu, 24 Apr 2014 09:29:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 09:29:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, Denys Dmytriyenko <denis@denix.org>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/8] u-boot-ti-staging: remove
	UBOOT_LOCALVERSION handling, now upstream
Thread-Index: AQHPX1/HI1uvMRbhVkGXobG4uF35cZshB4aA///M7KA=
Date: Thu, 24 Apr 2014 14:29:24 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C68E169@DFLE08.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-2-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CFB1ECB@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CFB1ECB@DLEE11.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/8] u-boot-ti-staging: remove UBOOT_LOCALVERSION handling, now upstream
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
X-List-Received-Date: Thu, 24 Apr 2014 14:29:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> bounces@arago-project.org] On Behalf Of Maupin, Chase
> Sent: Thursday, April 24, 2014 7:32 AM
> To: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH 2/8] u-boot-ti-staging: remove
> UBOOT_LOCALVERSION handling, now upstream
>=20
> Acked-by: Chase Maupin <chase.maupin@ti.com>
>=20
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, April 23, 2014 8:51 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 2/8] u-boot-ti-staging: remove
> >UBOOT_LOCALVERSION handling, now upstream
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-bsp/u-boot/u-boot-ti-staging_2013.01.01.bbappend | 10
> >----------
> > .../recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bbappend    | 12
> >+-----------
> > 2 files changed, 1 insertion(+), 21 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-
> >boot/u-boot-ti-staging_2013.01.01.bbappend
> >index 911a8ce..1fb654b 100644
> >--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.01.01.bbappend
> >+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.01.01.bbappend
> >@@ -1,13 +1,3 @@
> > PR_append =3D "-arago4"
> >
> > UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> >True).partition('+')[2][0:7]}"
> >-
> >-# the lines below can be removed once the U-Boot LOCALVERSION patches
> >are merged -# into the oe-core danny branch. Update: not coming to
> >danny, wait for dylan.
> >-do_compile_prepend() {
> >-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >-    then
> >-        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> >-        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> >-    fi
> >-}
> >diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.10.bbappend b/meta-arago-distro/recipes-bsp/u-boot/u-
> >boot-ti-staging_2013.10.bbappend
> >index 8174bc7..f015993 100644
> >--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.10.bbappend
> >+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-ti-
> >staging_2013.10.bbappend
> >@@ -1,13 +1,3 @@
> >-PR_append =3D "-arago0"
> >-
> >-SRCREV =3D "${AUTOREV}"
> >+PR_append =3D "-arago1"
> >
> > UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
> >True).partition('+')[2][0:7]}"
> >-
> >-do_compile_prepend() {
> >-    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> >-    then
> >-        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> >-        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> >-    fi
> >-}
> >--
> >1.9.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

