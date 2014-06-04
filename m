Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D53B0529A6
	for <meta-arago@arago-project.org>;
	Wed,  4 Jun 2014 14:38:44 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54EchOw027669
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:43 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54Echda013698
	for <meta-arago@arago-project.org>; Wed, 4 Jun 2014 09:38:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 4 Jun 2014 09:38:43 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 08/11]
	packagegroup-arago-tisdk-multimedia-sdk-host: Add	image-gallery app
	sources
Thread-Index: AQHPe203DnUd+OFMFEqPL+S/P/iphJthDn6g
Date: Wed, 4 Jun 2014 14:38:42 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D08C293@DLEE11.ent.ti.com>
References: <1401388695-30526-1-git-send-email-fcooper@ti.com>
	<1401388695-30526-8-git-send-email-fcooper@ti.com>
In-Reply-To: <1401388695-30526-8-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 08/11]	packagegroup-arago-tisdk-multimedia-sdk-host: Add	image-gallery app sources
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
X-List-Received-Date: Wed, 04 Jun 2014 14:38:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Thursday, May 29, 2014 1:38 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 08/11] packagegroup-arago-tisdk-
>multimedia-sdk-host: Add image-gallery app sources
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> ...packagegroup-arago-tisdk-multimedia-sdk-host.bb |    3 ++-
> 1 files changed, 2 insertions(+), 1 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-multimedia-sdk-host.bb
>index 38b52b6..307e712 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add multimedia related sources into the
>SDK"
> LICENSE =3D "MIT"
>-PR =3D "r3"
>+PR =3D "r4"
>
> inherit packagegroup
>
>@@ -18,6 +18,7 @@ MULTIMEDIA_append_am3517-evm =3D " \
>
> MULTIMEDIA_append_ti43x =3D " \
>     dual-camera-demo-src \
>+    image-gallery-src \
> "
>
> RDEPENDS_${PN} =3D "\
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

