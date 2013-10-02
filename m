Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 829C052099
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:11:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92DBOE6026768
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:11:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DBOTu006273
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2013 08:11:24 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Wed, 2 Oct 2013 08:11:24 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/3] Remove unnecessary binary from boot
	partition
Thread-Index: AQHOvspjUaXXEwH0i0+sg18SuCqUL5nhZAuQ
Date: Wed, 2 Oct 2013 13:11:24 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015977A7FB@DLEE11.ent.ti.com>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
	<1380650659-16536-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1380650659-16536-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] Remove unnecessary binary from boot	partition
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
X-List-Received-Date: Wed, 02 Oct 2013 13:11:25 -0000
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
>Subject: [meta-arago] [PATCH 2/3] Remove unnecessary binary from
>boot partition
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> lib/oesdk/package-sdks |    6 ++++++
> 1 files changed, 6 insertions(+), 0 deletions(-)
>
>diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
>index 49f1fe7..8f4e5e2 100644
>--- a/lib/oesdk/package-sdks
>+++ b/lib/oesdk/package-sdks
>@@ -42,6 +42,12 @@ create_sd_card_content() {
>         mv u-boot-$m.bin u-boot.bin
>     fi
>
>+    # Remove this binary since it wouldn't be used in the boot
>partition
>+    if [ -e u-boot-spl.bin-$m ]
>+    then
>+        rm u-boot-spl.bin-$m
>+    fi
>+
>     # For some devices the uImage  and dtb files are read from
>the /boot
>     # directory of the rootfs.  In this case do not package the
>uImage
>     # and device tree files into the boot partition as it will
>cause
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

