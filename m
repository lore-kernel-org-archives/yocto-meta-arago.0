Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECC70C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 19:25:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1806.1651692313973766107
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 May 2022 12:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RlwZXs7U;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244JPAYc125581;
	Wed, 4 May 2022 14:25:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651692310;
	bh=TIwPEhQXgJbvtR6ZyM2kCwLsldd1DofBQQc5JeChBbk=;
	h=From:To:Subject:Date;
	b=RlwZXs7U6ikNgQCgq/x30wvmH4JFfqucI1Az9rxGooyXQfakmyafgXA4dWBg1iYTb
	 //kz4OQzEgqg4VycGz+UstSfazmEkI2niYy2B+odKTY1osqe2Q7l3plVbZImBY43pc
	 NMANWRVQCQtlRGiExU+GhRoGsrio2FAE5bYQETXk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244JPA96115606
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 14:25:10 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 14:25:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 14:25:10 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244JPAb6039118;
	Wed, 4 May 2022 14:25:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmKcY-0001nu-3x; Wed, 04 May 2022 14:25:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH] psplash: Update patches to match
 newer psplash version
Date: Wed, 4 May 2022 14:25:10 -0500
Message-ID: <20220504192510.6895-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 May 2022 19:25:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13836

The headers files in psplash were updated for the SPDX and changed
the line numbering in the files.  This caused the patches to fail.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-psplash-Add-Arago-custom-color.patch | 19 +++++-----
 .../psplash/psplash/psplash-18bpp.patch       | 37 +++++++++++--------
 2 files changed, 32 insertions(+), 24 deletions(-)

diff --git a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
index c13790e1..80ba58e5 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
+++ b/meta-arago-distro/recipes-core/psplash/psplash/0001-psplash-Add-Arago-custom-color.patch
@@ -1,20 +1,21 @@
-From be4eb4c5c3992deee2cfaa5da8913473623f728b Mon Sep 17 00:00:00 2001
-From: Franklin S. Cooper Jr <fcooper@ti.com>
-Date: Fri, 21 Sep 2012 15:18:24 -0500
-Subject: [PATCH] psplash: Add Arago custom color
+From 02f63cdcff468e0b7e6dfe29cfb1e484497c38d6 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 4 May 2022 13:55:44 -0500
+Subject: [PATCH 1/2] psplash: Add Arago custom color
 
 * Port custom colors used in psplash-ti from oe-classic.
 
 Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
 ---
- psplash-colors.h |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ psplash-colors.h | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/psplash-colors.h b/psplash-colors.h
-index d701089..a6a5992 100644
+index 82a9893..427fff7 100644
 --- a/psplash-colors.h
 +++ b/psplash-colors.h
-@@ -20,15 +20,15 @@
+@@ -12,15 +12,15 @@
  #define _HAVE_PSPLASH_COLORS_H
  
  /* This is the overall background color */
@@ -35,5 +36,5 @@ index d701089..a6a5992 100644
  
  #endif
 -- 
-1.7.0.4
+2.17.1
 
diff --git a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
index 36ab43bf..1001a196 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
+++ b/meta-arago-distro/recipes-core/psplash/psplash/psplash-18bpp.patch
@@ -1,15 +1,22 @@
-upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=1764
+From c3f76ec5c4bc5867e30cbfaf6cc43cf847ae76f2 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 4 May 2022 13:56:39 -0500
+Subject: [PATCH 2/2] upstream: http://bugzilla.o-hand.com/show_bug.cgi?id=1764
 
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
 
 diff --git a/psplash-fb.c b/psplash-fb.c
-index 71740cd..860c0c0 100644
+index 2babb5f..0aff9bd 100644
 --- a/psplash-fb.c
 +++ b/psplash-fb.c
-@@ -160,6 +160,7 @@ psplash_fb_new (int angle)
+@@ -223,6 +223,7 @@ psplash_fb_new (int angle, int fbdev_id)
    fb->real_width  = fb->width  = fb_var.xres;
    fb->real_height = fb->height = fb_var.yres;
    fb->bpp    = fb_var.bits_per_pixel;
@@ -17,7 +24,7 @@ index 71740cd..860c0c0 100644
    fb->stride = fb_fix.line_length;
    fb->type   = fb_fix.type;
    fb->visual = fb_fix.visual;
-@@ -308,7 +309,7 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+@@ -399,7 +400,7 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
          break;
        }
    } else if (fb->rgbmode == BGR565 || fb->rgbmode == BGR888) {
@@ -25,10 +32,10 @@ index 71740cd..860c0c0 100644
 +    switch (fb->depth)
        {
        case 24:
-       case 32:
-@@ -316,6 +317,11 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
-         *(fb->data + off + 1) = green;
-         *(fb->data + off + 2) = blue;
+ #if __BYTE_ORDER == __BIG_ENDIAN
+@@ -416,6 +417,11 @@ psplash_fb_plot_pixel (PSplashFB    *fb,
+         *(volatile uint32_t *) (fb->bdata + off)
+           = (blue << 16) | (green << 8) | (red);
          break;
 +      case 18:
 +        *(fb->data + off)     = (red >> 2) | ((green & 0x0C) << 4);
@@ -36,13 +43,13 @@ index 71740cd..860c0c0 100644
 +        *(fb->data + off + 2) = (blue & 0xC0) >> 6;
 +        break;
        case 16:
-         *(volatile uint16_t *) (fb->data + off)
+         *(volatile uint16_t *) (fb->bdata + off)
  	  = ((blue >> 3) << 11) | ((green >> 2) << 5) | (red >> 3);
 diff --git a/psplash-fb.h b/psplash-fb.h
-index ef5b39e..160cdeb 100644
+index 16e2b20..cf17f51 100644
 --- a/psplash-fb.h
 +++ b/psplash-fb.h
-@@ -34,6 +34,7 @@ typedef struct PSplashFB
+@@ -27,6 +27,7 @@ typedef struct PSplashFB
    int            visual;		
    int            width, height;
    int            bpp;
@@ -51,5 +58,5 @@ index ef5b39e..160cdeb 100644
    char		*data;
    char		*base;
 -- 
-1.6.3.3
+2.17.1
 
-- 
2.17.1


