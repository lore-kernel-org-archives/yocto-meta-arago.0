Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 75B0F52A8C
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 12:36:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3OCaZ7N010331;
	Thu, 24 Apr 2014 07:36:35 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3OCaZTw021459;
	Thu, 24 Apr 2014 07:36:35 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 07:36:35 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 8/8] linux-ti-staging: disable AUTOREV
Thread-Index: AQHPX1+8LSrlkTUj+0OdfN/dCVB47JsgtMSA
Date: Thu, 24 Apr 2014 12:36:35 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015CFB2056@DLEE11.ent.ti.com>
References: <1398304280-15426-1-git-send-email-denis@denix.org>
	<1398304280-15426-8-git-send-email-denis@denix.org>
In-Reply-To: <1398304280-15426-8-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 8/8] linux-ti-staging: disable AUTOREV
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
X-List-Received-Date: Thu, 24 Apr 2014 12:36:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, April 23, 2014 8:51 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 8/8] linux-ti-staging: disable
>AUTOREV
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.12.bbappend | 4 +---
> 1 file changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.12.bbappend b/meta-arago-distro/recipes-
>kernel/linux/linux-ti-staging_3.12.bbappend
>index f99482c..2a6f090 100644
>--- a/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.12.bbappend
>+++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-
>staging_3.12.bbappend
>@@ -1,11 +1,9 @@
>-MACHINE_KERNEL_PR_append =3D "-arago0"
>+MACHINE_KERNEL_PR_append =3D "-arago1"
>
> FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${P}:"
>
> require copy-defconfig.inc
>
>-SRCREV =3D "${AUTOREV}"

Any reason not to autorev to pickup the latest stable releases?

>-
> KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV',
>True).partition('+')[2][0:7]}"
>
> kernel_do_configure_prepend() {
>--
>1.9.2
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

