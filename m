Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E3C77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 13:18:01 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8473.1686057470732460887
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 06:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GnCm4JCp;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356DHoGv130413
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 08:17:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686057470;
	bh=6DimTJ4FM1AOuNV5ecoHld+DkG85PhrSsID9DvTtXsI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=GnCm4JCp7gs16WXyF0l05HuT1pcuqzy0gZHNNjASczsVKqLTrSoRAfgTgmTH+g9yo
	 i1G2PCowpmn/RA0ZyBd1DMhGbJKniOAgnnQDEjNBcgw7Egtiy+U08SIVk4kCn5oBQH
	 rFrrRoXJX1UrJwHQuozQ0rjx1+mRPR22ULsWB4qs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356DHn7R025752
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 6 Jun 2023 08:17:49 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 08:17:49 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.023; Tue, 6 Jun 2023 08:17:49 -0500
From: "Bhagat, Paresh" <p-bhagat@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>
CC: "Gupta, Gyan" <g-gupta@ti.com>, "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek" <s-adivi@ti.com>,
        "Khasim, Syed Mohammed"
	<khasim@ti.com>,
        "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
Subject: RE: [EXTERNAL] [meta-arago] [kirkstone][PATCH] meta-arago-distro: Add
 branding for jailhouse build and recipe for jailhouse image
Thread-Topic: [EXTERNAL] [meta-arago] [kirkstone][PATCH] meta-arago-distro:
 Add branding for jailhouse build and recipe for jailhouse image
Thread-Index: AQHZlTOG2oXLJU7ffEqO1QQ1epCYS699xgfA
Date: Tue, 6 Jun 2023 13:17:49 +0000
Message-ID: <68c454fe35154e7b9cc12d6c236af38f@ti.com>
References: <1764CD12E99F644A.11185@lists.yoctoproject.org>
In-Reply-To: <1764CD12E99F644A.11185@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.135.14]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 13:18:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14495

Hi,

An update needs to be done for this patch. New branding for jailhouse needs=
 to be dropped. I will send a v2 some time today. don't merge this please.

Thanks

-----Original Message-----
From: meta-arago@lists.yoctoproject.org <meta-arago@lists.yoctoproject.org>=
 On Behalf Of Paresh Bhagat via lists.yoctoproject.org
Sent: Friday, June 2, 2023 2:50 PM
To: meta-arago@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>;=
 Eatmon, Ryan <reatmon@ti.com>
Cc: Khasim, Syed Mohammed <khasim@ti.com>; Shilwant, Chirag <c-shilwant@ti.=
com>; Adivi, Sai Sree Kartheek <s-adivi@ti.com>; Gupta, Gyan <g-gupta@ti.co=
m>; Dannenberg, Andreas <dannenberg@ti.com>
Subject: [EXTERNAL] [meta-arago] [kirkstone][PATCH] meta-arago-distro: Add =
branding for jailhouse build and recipe for jailhouse image

Add a branding for jailhouse to change preferred uboot and kernel which wil=
l be used for building a jailhouse image.
Add recipe to build and package jailhouse image. image will be named as tis=
dk-jailhouse-image.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 .../include/branding-processor-sdk-jailhouse.inc   |  5 +++++
 .../recipes-core/images/tisdk-jailhouse-image.bb   | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-processo=
r-sdk-jailhouse.inc
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-jailhouse-i=
mage.bb

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk-j=
ailhouse.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk=
-jailhouse.inc
new file mode 100644
index 00000000..952c7057
--- /dev/null
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk-jailh
+++ ouse.inc
@@ -0,0 +1,5 @@
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-ti-jailhouse"
+
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-ti-jailhouse"
+
+PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-jailhouse"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb=
 b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
new file mode 100644
index 00000000..af880d30
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-jailhouse-image.bb
@@ -0,0 +1,14 @@
+# Produces wic image for jailhouse
+
+require recipes-core/images/tisdk-default-image.bb
+
+COMPATIBLE_MACHINE =3D "am62xx-evm"
+
+IMAGE_INSTALL:append:am62xx-evm =3D " jailhouse"
+
+# Package overlay for jailhouse
+KERNEL_DEVICETREE:append:am62xx-evm =3D " ti/k3-am625-base-board-jailhouse=
.dtbo"
+
+export IMAGE_BASENAME =3D "tisdk-jailhouse-image"
+
+WIC_CREATE_EXTRA_ARGS:append =3D " --no-fstab-update"
--
2.34.1



-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#14489): https://lists.yoctoproject.org/g/meta-arago/mes=
sage/14489
Mute This Topic: https://lists.yoctoproject.org/mt/99282849/7067447
Group Owner: meta-arago+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [p-bhagat@ti=
.com]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-



