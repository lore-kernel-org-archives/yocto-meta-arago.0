Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FA4C6FA94
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 04:02:56 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.933.1663041770122332712
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 21:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 91D7240D4B
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qOmvxrGX6-HB for <meta-arago@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 04:02:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8337D40D74
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 04:02:47 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 21AA11749D4
	for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Sep 2022 00:02:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 25/52] psplash: Update patches to match
 newer psplash version
Date: Tue, 13 Sep 2022 04:02:19 +0000
Message-Id: <20220913040246.2365077-26-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913040246.2365077-1-denis@denix.org>
References: <20220913040246.2365077-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Sep 2022 04:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14012

From: Ryan Eatmon <reatmon@ti.com>

The headers files in psplash were updated for the SPDX and changed
the line numbering in the files.  This caused the patches to fail.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../0001-psplash-Add-Arago-custom-color.patch | 19 +++++-----
 .../psplash/psplash/psplash-18bpp.patch       | 37 +++++++++++--------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-=
Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psp=
lash/0001-psplash-Add-Arago-custom-color.patch
index c13790e1..80ba58e5 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Ara=
go-custom-color.patch
+++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Ara=
go-custom-color.patch
@@ -1,20 +1,21 @@
-From be4eb4c5c3992deee2cfaa5da8913473623f728b Mon Sep 17 00:00:00 2001
-From: Franklin S. Cooper Jr <fcooper@ti.com>
-Date: Fri, 21 Sep 2012 15:18:24 -0500
-Subject: [PATCH] psplash: Add Arago custom color
+From 02f63cdcff468e0b7e6dfe29cfb1e484497c38d6 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 4 May 2022 13:55:44 -0500
+Subject: [PATCH 1/2] psplash: Add Arago custom color
=20
 * Port custom colors used in psplash-ti from oe-classic.
=20
 Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
- psplash-colors.h |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ psplash-colors.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
=20
 diff --git a/psplash-colors.h b/psplash-colors.h
-index d701089..a6a5992 100644
+index 82a9893..427fff7 100644
 --- a/psplash-colors.h
 +++ b/psplash-colors.h
-@@ -20,15 +20,15 @@
+@@ -12,15 +12,15 @@
  #define _HAVE_PSPLASH_COLORS_H
 =20
  /* This is the overall background color */
@@ -35,5 +36,5 @@ index d701089..a6a5992 100644
 =20
  #endif
 --=20
-1.7.0.4
+2.17.1
=20
diff --git a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp=
.patch b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.pat=
ch
index 36ab43bf..1001a196 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
+++ b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
@@ -1,15 +1,22 @@
-upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=3D1764
+From c3f76ec5c4bc5867e30cbfaf6cc43cf847ae76f2 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 4 May 2022 13:56:39 -0500
+Subject: [PATCH 2/2] upstream: http://bugzilla.o-hand.com/show_bug.cgi?i=
d=3D1764
=20
+This is a reworked patch to address a code update in psplash.
+Original source is unknown.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
- psplash-fb.c |    8 +++++++-
- psplash-fb.h |    1 +
- 2 files changed, 8 insertions(+), 1 deletions(-)
+ psplash-fb.c | 8 +++++++-
+ psplash-fb.h | 1 +
+ 2 files changed, 8 insertions(+), 1 deletion(-)
=20
 diff --git a/psplash-fb.c b/psplash-fb.c
-index 71740cd..860c0c0 100644
+index 2babb5f..0aff9bd 100644
 --- a/psplash-fb.c
 +++ b/psplash-fb.c
-@@ -160,6 +160,7 @@ psplash_fb_new (int angle)
+@@ -223,6 +223,7 @@ psplash_fb_new (int angle, int fbdev_id)
    fb->real_width  =3D fb->width  =3D fb_var.xres;
    fb->real_height =3D fb->height =3D fb_var.yres;
    fb->bpp    =3D fb_var.bits_per_pixel;
@@ -17,7 +24,7 @@ index 71740cd..860c0c0 100644
    fb->stride =3D fb_fix.line_length;
    fb->type   =3D fb_fix.type;
    fb->visual =3D fb_fix.visual;
-@@ -308,7 +309,7 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+@@ -399,7 +400,7 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
          break;
        }
    } else if (fb->rgbmode =3D=3D BGR565 || fb->rgbmode =3D=3D BGR888) {
@@ -25,10 +32,10 @@ index 71740cd..860c0c0 100644
 +    switch (fb->depth)
        {
        case 24:
-       case 32:
-@@ -316,6 +317,11 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
-         *(fb->data + off + 1) =3D green;
-         *(fb->data + off + 2) =3D blue;
+ #if __BYTE_ORDER =3D=3D __BIG_ENDIAN
+@@ -416,6 +417,11 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+         *(volatile uint32_t *) (fb->bdata + off)
+           =3D (blue << 16) | (green << 8) | (red);
          break;
 +      case 18:
 +        *(fb->data + off)     =3D (red >> 2) | ((green & 0x0C) << 4);
@@ -36,13 +43,13 @@ index 71740cd..860c0c0 100644
 +        *(fb->data + off + 2) =3D (blue & 0xC0) >> 6;
 +        break;
        case 16:
-         *(volatile uint16_t *) (fb->data + off)
+         *(volatile uint16_t *) (fb->bdata + off)
  	  =3D ((blue >> 3) << 11) | ((green >> 2) << 5) | (red >> 3);
 diff --git a/psplash-fb.h b/psplash-fb.h
-index ef5b39e..160cdeb 100644
+index 16e2b20..cf17f51 100644
 --- a/psplash-fb.h
 +++ b/psplash-fb.h
-@@ -34,6 +34,7 @@ typedef struct PSplashFB
+@@ -27,6 +27,7 @@ typedef struct PSplashFB
    int            visual;	=09
    int            width, height;
    int            bpp;
@@ -51,5 +58,5 @@ index ef5b39e..160cdeb 100644
    char		*data;
    char		*base;
 --=20
-1.6.3.3
+2.17.1
=20
--=20
2.25.1


