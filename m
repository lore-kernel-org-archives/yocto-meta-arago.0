Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BD92652A81
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2013 15:06:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7UF6bmL016496
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:37 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7UF6bGX027304
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2013 10:06:37 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Fri, 30 Aug 2013 10:06:37 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 5/6 v2]
	packagegroup-arago-tisdk-amsdk-sdk-host: Use new	board-port-labs recipe
Thread-Index: AQHOo1pAIRtegjHGh0qFVD/h3kzDO5mt3lKA
Date: Fri, 30 Aug 2013 15:06:36 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101596F81EE@DLEE11.ent.ti.com>
References: <1377633092-29917-1-git-send-email-fcooper@ti.com>
	<1377633092-29917-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1377633092-29917-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 5/6 v2]	packagegroup-arago-tisdk-amsdk-sdk-host: Use new	board-port-labs recipe
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
X-List-Received-Date: Fri, 30 Aug 2013 15:06:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, August 27, 2013 2:52 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 5/6 v2] packagegroup-arago-tisdk-
>amsdk-sdk-host: Use new board-port-labs recipe
>
>* Use new board-port-labs recipe
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
>Version 2 changes:
>Remove board-port-labs recipe removal from this patch.
>
> .../packagegroup-arago-tisdk-amsdk-sdk-host.bb     |    5 +++--
> 1 files changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-amsdk-sdk-host.bb
>index 70f767d..94d8288 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-amsdk-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install additional scripts and
>applications into the SDK"
> LICENSE =3D "MIT"
>-PR =3D "r11"
>+PR =3D "r12"
>
> inherit packagegroup
>
>@@ -24,7 +24,8 @@ RDEPENDS_${PN} =3D "\
>     ${TOOLS} \
>     ti-tisdk-setup \
>     ${EXTRA_FILES} \
>-    board-port-labs-src \
>+    board-port-labs-u-boot-src \
>+    board-port-labs-linux-src \
>     ti-tisdk-makefile \
>     ${U-BOOT_SRC} \
>     ${KERNEL_SRC} \
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

