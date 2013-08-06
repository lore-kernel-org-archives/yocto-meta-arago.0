Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 07B9552A5C
	for <meta-arago@arago-project.org>;
	Tue,  6 Aug 2013 04:14:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r764Ex1m024955
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 23:14:59 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r764ExO4018845
	for <meta-arago@arago-project.org>; Mon, 5 Aug 2013 23:14:59 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Mon, 5 Aug 2013 23:14:58 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2]
	packagegroup-arago-tisdk-amsdk-sdk-host:	Include install script in the
	sdk
Thread-Index: AQHOkhUjcKbA4Tkwik2ZvnIQWsTMOpmHkmng
Date: Tue, 6 Aug 2013 04:14:58 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159693961@DLEE11.ent.ti.com>
References: <1375733834-21322-1-git-send-email-fcooper@ti.com>
	<1375733834-21322-2-git-send-email-fcooper@ti.com>
In-Reply-To: <1375733834-21322-2-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] packagegroup-arago-tisdk-amsdk-sdk-host:	Include install script in the sdk
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
X-List-Received-Date: Tue, 06 Aug 2013 04:15:00 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 06, 2013 1:47 AM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 2/2] packagegroup-arago-tisdk-amsdk-
>sdk-host: Include install script in the sdk
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-amsdk-sdk-host.bb
>index e1c35dd..70f767d 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install additional scripts and
>applications into the SDK"
> LICENSE =3D "MIT"
>-PR =3D "r10"
>+PR =3D "r11"
>
> inherit packagegroup
>
>@@ -28,4 +28,5 @@ RDEPENDS_${PN} =3D "\
>     ti-tisdk-makefile \
>     ${U-BOOT_SRC} \
>     ${KERNEL_SRC} \
>+    ti-tisdk-install \
> "
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

