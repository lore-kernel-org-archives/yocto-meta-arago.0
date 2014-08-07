Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A92EE52996
	for <meta-arago@arago-project.org>;
	Thu,  7 Aug 2014 12:48:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s77CmtGJ030755;
	Thu, 7 Aug 2014 07:48:55 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s77Cmt3R004518;
	Thu, 7 Aug 2014 07:48:55 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0174.001; Thu, 7 Aug 2014 07:48:55 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/4] packagegroups: conditionally disable
	dual-camera and image-gallery for Qt5 builds
Thread-Index: AQHPsclbQpMXNn48oUeFhDBz9zXbJZvFGDyQ
Date: Thu, 7 Aug 2014 12:48:55 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D1ACFC0@DLEE11.ent.ti.com>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
In-Reply-To: <1407365627-29059-1-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] packagegroups: conditionally disable dual-camera and image-gallery for Qt5 builds
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
X-List-Received-Date: Thu, 07 Aug 2014 12:48:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>


>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Wednesday, August 06, 2014 5:54 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 1/4] packagegroups: conditionally
>disable dual-camera and image-gallery for Qt5 builds
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>---
> .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
>| 5 ++---
> .../packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
>| 5 ++---
> .../packagegroups/packagegroup-arago-tisdk-multimedia.bb
>| 5 ++---
> 3 files changed, 6 insertions(+), 9 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>matrix.bb
>index ae502f1..109e1ad 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-matrix.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to include Matrix v2"
> LICENSE =3D "MIT"
>-PR =3D "r29"
>+PR =3D "r30"
>
> inherit packagegroup
>
>@@ -77,8 +77,7 @@ MATRIX_APPS_append_ti43x =3D "        \
>     matrix-multimedia-demo-mpeg4aacdec \
>     matrix-multimedia-demo-mpeg4dec \
>                                     \
>-    matrix-gui-apps-dual-camera     \
>-    matrix-gui-apps-image-gallery   \
>+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'matrix-gui-
>apps-dual-camera matrix-gui-apps-image-gallery', d)} \
>                                     \
>     matrix-gui-generic-pm           \
>     matrix-gui-pm-demos-suspend     \
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-host.bb
>b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
>tisdk-multimedia-sdk-host.bb
>index 307e712..40aa486 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia-sdk-host.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia-sdk-host.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add multimedia related sources into the
>SDK"
> LICENSE =3D "MIT"
>-PR =3D "r4"
>+PR =3D "r5"
>
> inherit packagegroup
>
>@@ -17,8 +17,7 @@ MULTIMEDIA_append_am3517-evm =3D " \
> "
>
> MULTIMEDIA_append_ti43x =3D " \
>-    dual-camera-demo-src \
>-    image-gallery-src \
>+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-
>demo-src image-gallery-src', d)} \
> "
>
> RDEPENDS_${PN} =3D "\
>diff --git a/meta-arago-distro/recipes-
>core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-
>arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-
>multimedia.bb
>index 417b0a8..7016ec0 100644
>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia.bb
>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
>arago-tisdk-multimedia.bb
>@@ -1,6 +1,6 @@
> DESCRIPTION =3D "Task to add multimedia related packages"
> LICENSE =3D "MIT"
>-PR =3D "r8"
>+PR =3D "r9"
>
> inherit packagegroup
>
>@@ -18,8 +18,7 @@ MULTIMEDIA_append_ti33x =3D " \
>
> MULTIMEDIA_append_ti43x =3D " \
>     amsdk-av-files \
>-    dual-camera-demo \
>-    image-gallery \
>+    ${@base_conditional('QT_PROVIDER', 'qt5', '', 'dual-camera-
>demo image-gallery', d)} \
> "
>
> MULTIMEDIA_append_omap-a15 =3D " \
>--
>2.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

