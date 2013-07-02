Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E55CE52979
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2013 18:45:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r62IjuoX026882
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:45:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r62Ijurb028547
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2013 13:45:56 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 2 Jul 2013 13:45:56 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [master & danny][PATCH 5/6]
	packagegroup-arago-tisdk-addons-sdk-host: Add	oprofile-example sources
	to SDK
Thread-Index: AQHOd0YBcsd8RwS960OBQtKwGFotN5lRujTw
Date: Tue, 2 Jul 2013 18:45:54 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015963057A@DLEE11.ent.ti.com>
References: <1372785354-1920-1-git-send-email-fcooper@ti.com>
	<1372785354-1920-5-git-send-email-fcooper@ti.com>
In-Reply-To: <1372785354-1920-5-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [master & danny][PATCH 5/6]	packagegroup-arago-tisdk-addons-sdk-host: Add	oprofile-example sources to SDK
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
X-List-Received-Date: Tue, 02 Jul 2013 18:45:57 -0000
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
>Subject: [meta-arago] [master & danny][PATCH 5/6] packagegroup-
>arago-tisdk-addons-sdk-host: Add oprofile-example sources to SDK
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> .../packagegroup-arago-tisdk-addons-sdk-host.bb    |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-addons-sdk-host.bb
>index 0f13c46..1285d68 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-addons-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install sources for additional
>utilities/demos for SDKs"
> LICENSE =3D "MIT"
>-PR =3D "r5"
>+PR =3D "r6"
>
> inherit packagegroup
>
>@@ -9,6 +9,7 @@ PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> UTILS =3D " \
>     am-sysinfo-src \
>     arm-benchmarks-src \
>+    oprofile-example-src \
> "
>
> # Add pru and profibus sources for omapl138 devices
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

