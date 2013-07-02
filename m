Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B989C52979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:43:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IhIJT026611
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62IhI84024711
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:43:18 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:43:17 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 1/6] u-boot-am33x: Update
	to	latest u-boot versoin for 3.2 kernel
Thread-Index: AQHOd0YBTcfOuGjcMESx68Hx7ciINJlRuWMA
Date: Tue, 2 Jul 2013 18:43:17 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596304CA@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 1/6] u-boot-am33x: Update to	latest u-boot versoin for 3.2 kernel
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
X-List-Received-Date: Tue, 02 Jul 2013 18:43:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, July 02, 2013 12:16 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [master & danny][PATCH 1/6] u-boot-am33x:
>Update to latest u-boot versoin for 3.2 kernel
>
>* Update to latest u-boot included in AMSDK 6.0.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../u-boot/u-boot-am33x_2013.01.01.bbappend        |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot-
>am33x_2013.01.01.bbappend b/meta-arago-distro/recipes-bsp/u-
>boot/u-boot-am33x_2013.01.01.bbappend
>index e62018b..d849fb5 100644
>--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot-
>am33x_2013.01.01.bbappend
>+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot-
>am33x_2013.01.01.bbappend
>@@ -1,5 +1,5 @@
>-PR_append =3D "-arago0"
>+PR_append =3D "-arago1"
>
> # PSPREL and UVER are used by arago-source-ipk.conf
>-PSPREL =3D "05.07.00.00"
>+PSPREL =3D "06.00.00.00"
> UVER =3D "2013.01.01"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

