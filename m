Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 4AF9A52A76
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2013 20:15:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAJKFlHI029292
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:47 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAJKFlKM025896
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2013 14:15:47 -0600
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 19 Nov 2013 14:15:47 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 3/7] packagegroups-arago-tisdk-graphics:
	Add	AM43x as a supported platform
Thread-Index: AQHO5VFWMVFwtzYZJEeTrxbzcXF53Zos/Zsw
Date: Tue, 19 Nov 2013 20:15:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159839D43@DLEE11.ent.ti.com>
References: <1384887728-8628-1-git-send-email-fcooper@ti.com>
	<1384887728-8628-3-git-send-email-fcooper@ti.com>
In-Reply-To: <1384887728-8628-3-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 3/7] packagegroups-arago-tisdk-graphics: Add	AM43x as a supported platform
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
X-List-Received-Date: Tue, 19 Nov 2013 20:15:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, November 19, 2013 1:02 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 3/7] packagegroups-arago-tisdk-
>graphics: Add AM43x as a supported platform
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> ...packagegroup-arago-tisdk-graphics-sdk-target.bb |    6 +++++-
> .../packagegroup-arago-tisdk-graphics.bb           |    6 +++++-
> 2 files changed, 10 insertions(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-graphics-sdk-target.bb
>index e96c4ad..8775cc5 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-graphics-sdk-target.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-graphics-sdk-target.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install graphics binaries on sdk target"
> LICENSE =3D "MIT"
>-PR =3D "r2"
>+PR =3D "r3"
>
> inherit packagegroup
>
>@@ -15,6 +15,10 @@ GRAPHICS_RDEPENDS_omap3 =3D "\
>     libgles-omap3-dev \
> "
>
>+GRAPHICS_RDEPENDS_ti43x =3D "\
>+    libgles-omap3-dev \
>+"
>+
> RDEPENDS_${PN} =3D "\
>     ${GRAPHICS_RDEPENDS} \
> "
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>graphics.bb
>index 17408c8..7036ae1 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-graphics.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-graphics.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to install graphics binaries"
> LICENSE =3D "MIT"
>-PR =3D "r2"
>+PR =3D "r3"
>
> inherit packagegroup
>
>@@ -22,6 +22,10 @@ GRAPHICS_RDEPENDS_ti33x =3D "\
>     ${GRAPHICS_SDK} \
> "
>
>+GRAPHICS_RDEPENDS_ti43x =3D "\
>+    ${GRAPHICS_SDK} \
>+"
>+
> GRAPHICS_RDEPENDS_omap3 =3D "\
>     ${GRAPHICS_SDK} \
> "
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

