Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B5D9E52099
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:11:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92DBiXo026812
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:11:44 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DBiMe006566
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:11:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 08:11:44 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/3] Don't package kernel files in boot
	partition for AMSDK 7.0
Thread-Index: AQHOvsplvboN2OOOx0+8NQrOOxAmj5nhZD8w
Date: Wed, 2 Oct 2013 13:11:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A82E@DLEE11.ent.ti.com>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<1380650659-16536-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1380650659-16536-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] Don't package kernel files in boot	partition for AMSDK 7.0
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
X-List-Received-Date: Wed, 02 Oct 2013 13:11:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, October 01, 2013 1:04 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 3/3] Don't package kernel files in
>boot partition for AMSDK 7.0
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> configs/amsdk-config-07.00.00.00.txt |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>
>diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-
>config-07.00.00.00.txt
>index a011f83..bf409d7 100644
>--- a/configs/amsdk-config-07.00.00.00.txt
>+++ b/configs/amsdk-config-07.00.00.00.txt
>@@ -241,7 +241,7 @@ SD_CARD_CONTENT=3D"/home/jenkins/extra-
>files/sd_content"
> # the boot partition tarball or not.  For newer kernel and u-boot
>combinations
> # the uImage and dtb files are kept in the rootfs partition and
>placing it in
> # the boot partition will cause confusion.
>-PACKAGE_BOOT_KERNEL_FILES=3D"true"
>+PACKAGE_BOOT_KERNEL_FILES=3D"false"
>
> # This variable points to the directory where the webgen tool has
>been
> # Installed.
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

