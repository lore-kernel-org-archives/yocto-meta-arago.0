Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 97F10529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 17:56:16 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QHu2iQ119047
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 12:56:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553622962;
	bh=k79aTqK9+0pWZsGBakZ9lX1kZxa0JuR9OatdYYAW3sM=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=koGK3It85Meo2JQPApwfbuXFJIK3+QBrCP3FFHxXiPZMJt64B0TMob5vAB/E8/0Yq
	iIn/cVhFQa5mGWoISyg8mB7SEkLbhzz+W4onExTnM69Xkp9156ylMhfRZZFDeXj5k7
	veq1V7ExOVY6rRs6jRjI+2RZCl0SVicVB8dbhm0A=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QHu2lw114901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 12:56:02 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 12:56:01 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1713.004; Tue, 26 Mar 2019 12:56:01 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] [meta-arago] [thud/master][PATCH] weston: fix dual
	display issue
Thread-Index: AQHU491jeaiUqDqNa0+JTjjtA85iR6YeMndw
Date: Tue, 26 Mar 2019 17:56:01 +0000
Message-ID: <75c5e61adbc54393bc6ff7e4a6ae4941@ti.com>
References: <1553609294-62666-1-git-send-email-e-ruei1@ti.com>
In-Reply-To: <1553609294-62666-1-git-send-email-e-ruei1@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.148]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: Re: [EXTERNAL] [thud/master][PATCH] weston: fix dual display issue
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
X-List-Received-Date: Tue, 26 Mar 2019 17:56:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

NACK

A better one is coming.

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Ruei, Eric
Sent: Tuesday, March 26, 2019 10:08 AM
To: meta-arago@arago-project.org
Subject: [EXTERNAL] [meta-arago] [thud/master][PATCH] weston: fix dual disp=
lay issue

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../0005-weston-drm-fix-dual-display-issue.patch   | 62 ++++++++++++++++++=
++++
 .../recipes-graphics/wayland/weston_5.0.0.bbappend |  3 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0005-=
weston-drm-fix-dual-display-issue.patch

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-=
drm-fix-dual-display-issue.patch b/meta-arago-distro/recipes-graphics/wayla=
nd/weston/0005-weston-drm-fix-dual-display-issue.patch
new file mode 100644
index 0000000..b462fdb
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0005-weston-drm-fix=
-dual-display-issue.patch
@@ -0,0 +1,62 @@
+From 538f82f4f0fb8f57979f46a84620bb8dc5a46ed6 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Tue, 26 Mar 2019 09:31:14 -0400
+Subject: [PATCH 2/2] weston: drm: fix dual display issue
+
+This patch fixes the dual display issue by enhancing the primary plane
+search algorithm to keep the plane which is connected to the crtc of
+the output because the direct switching of active planes is not allowed.
+
+Upstream status: Pending
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ libweston/compositor-drm.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/libweston/compositor-drm.c b/libweston/compositor-drm.c
+index 3891176..232cb7f 100644
+--- a/libweston/compositor-drm.c
++++ b/libweston/compositor-drm.c
+@@ -428,6 +428,7 @@ struct drm_plane {
+=20
+ 	uint32_t possible_crtcs;
+ 	uint32_t plane_id;
++	uint32_t crtc_id;
+ 	uint32_t count_formats;
+=20
+ 	struct drm_property_info props[WDRM_PLANE__COUNT];
+@@ -4073,6 +4074,7 @@ drm_plane_create(struct drm_backend *b, const drmMod=
ePlane *kplane,
+ 	if (kplane) {
+ 		plane->possible_crtcs =3D kplane->possible_crtcs;
+ 		plane->plane_id =3D kplane->plane_id;
++		plane->crtc_id =3D kplane->crtc_id;
+=20
+ 		props =3D drmModeObjectGetProperties(b->drm.fd, kplane->plane_id,
+ 						   DRM_MODE_OBJECT_PLANE);
+@@ -4097,6 +4099,7 @@ drm_plane_create(struct drm_backend *b, const drmMod=
ePlane *kplane,
+ 	else {
+ 		plane->possible_crtcs =3D (1 << output->pipe);
+ 		plane->plane_id =3D 0;
++		plane->crtc_id =3D 0;
+ 		plane->count_formats =3D 1;
+ 		plane->formats[0].format =3D format;
+ 		plane->type =3D type;
+@@ -4204,6 +4207,14 @@ drm_output_find_special_plane(struct drm_backend *b=
, struct drm_output *output,
+ 		if (found_elsewhere)
+ 			continue;
+=20
++		/* The output should keep the primary plane connected to its
++		 * crtc since the direct switching of active plane is not
++		 * allowed. */
++		if ((plane->crtc_id !=3D 0) &&
++		    (type =3D=3D WDRM_PLANE_TYPE_PRIMARY) &&
++		    (plane->crtc_id !=3D output->crtc_id))
++			continue;
++
+ 		plane->possible_crtcs =3D (1 << output->pipe);
+ 		return plane;
+ 	}
+--=20
+1.9.1
+
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappe=
nd b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
index 68e53cc..cc456b4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_5.0.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor WESTON_NATIVE_BACKEND=
=3D"fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-compositor,d=
rm udev libgbm mtdev"
=20
-PR_append =3D ".arago30"
+PR_append =3D ".arago31"
=20
 FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
=20
@@ -13,6 +13,7 @@ SRC_URI +=3D " \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
 	file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
+	file://0005-weston-drm-fix-dual-display-issue.patch \
 "
=20
 INHIBIT_PACKAGE_STRIP =3D "1"
--=20
1.9.1

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

