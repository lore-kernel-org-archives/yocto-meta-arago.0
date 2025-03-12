Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA93C28B2F
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 16:09:43 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.326.1741795778064937710
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 09:09:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ao3rvxDN;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CG9aXI1109947
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 11:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741795776;
	bh=xBwOgWGGKY006VYRden6N0Gqi2n/uAREaKqTSDMAxCU=;
	h=From:To:Subject:Date;
	b=Ao3rvxDNvPRYTtyy+xBm7rzF5CVBJT1b9yJQvzNIHp43AQdpzWOit4Fgj7ujzCMZW
	 Vk5NuswQBUM9er/HJ5+L5OaKo832fDP/HvTFzqro8aW6be7LLuo4cL4vUirbBPDdPR
	 e4II0FrcDyGmJnnmP7HkvKAllLPJvJ7KkXKK05uM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CG9a8F020243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 11:09:36 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 11:09:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 11:09:36 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CG9atd045953;
	Wed, 12 Mar 2025 11:09:36 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsOeG-0007Ma-8V; Wed, 12 Mar 2025 11:09:36 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH] ti-gc320-tests: Fix compile error
Date: Wed, 12 Mar 2025 11:09:36 -0500
Message-ID: <20250312160936.28219-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 16:09:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16011

Fix compile errors in ti-gc320-tests:

galUtil.c:137:65: error: passing argument 4 of 'gcoOS_Open' from incompatible pointer type [-Wincompatible-pointer-types]

galUtil.c:137:65: error: passing argument 4 of 'gcoOS_Open' from incompatible pointer type [-Wincompatible-pointer-types]

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-galUtil-Fix-compile-error.patch      | 182 ++++++++++++++++++
 .../ti-gc320-tests_5.0.11.p7.bb               |   3 +-
 2 files changed, 184 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-galUtil-Fix-compile-error.patch

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-galUtil-Fix-compile-error.patch b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-galUtil-Fix-compile-error.patch
new file mode 100644
index 00000000..6f94771f
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-galUtil-Fix-compile-error.patch
@@ -0,0 +1,182 @@
+From 01cda63954dd7eb5468550f44c666eedc2706741 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 12 Mar 2025 10:37:01 -0500
+Subject: [PATCH] galUtil: Fix compile error
+
+Fix several compile errors realted to incompatible pointers.  The fourth
+argument is defined as void *.
+
+galUtil.c: In function 'GalLoadDIBitmap':
+galUtil.c:137:65: error: passing argument 4 of 'gcoOS_Open' from incompatible pointer type [-Wincompatible-pointer-types]
+  137 |     if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, &fp)))
+      |                                                                 ^~~
+      |                                                                 |
+      |                                                                 FILE **
+
+Upstream-Status: Inactive-Upstream [lastcommit: 2017-01-16]
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ .../hal/common/UnitTest/galUtil/galUtil.c     | 30 +++++++++----------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c b/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c
+index c2aefa6..f235f3a 100755
+--- a/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c
++++ b/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c
+@@ -134,7 +134,7 @@ unsigned char * CDECL GalLoadDIBitmap(const char *filename, BMPINFO **info)
+     BMPFILEHEADER   header;       /* File header */
+ 
+     /* Try opening the file; use "rb" mode to read this *binary* file. */
+-    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, &fp)))
++    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, (void*) &fp)))
+     {
+         /* Failed to open the file. */
+         GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the file %s", filename);
+@@ -335,7 +335,7 @@ int static GalSaveDIBitmap(const char *filename, BMPINFO *info, unsigned char *b
+         return -1;
+     }
+ 
+-    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_CREATE, &fp)))
++    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_CREATE, (void*) &fp)))
+     {
+         /* Failed to open the file. */
+         GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the file %s", filename);
+@@ -1927,7 +1927,7 @@ gctBOOL GalSaveSurfaceToVimg(gcoSURF surface, const char *FileName)
+         head.imageStride = aStride = alignedWidth * bpp[0];
+         lineSize = width[0] * bpp[0];
+ 
+-        if (gcmIS_ERROR(gcoOS_Open(gcvNULL, FileName, gcvFILE_CREATE, &file)))
++        if (gcmIS_ERROR(gcoOS_Open(gcvNULL, FileName, gcvFILE_CREATE, (void*) &file)))
+         {
+             /* Failed to open the file. */
+             GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the file %s", FileName);
+@@ -2070,7 +2070,7 @@ gceSTATUS GalSaveTSurfToVimg(
+             gcmONERROR(gcvSTATUS_NOT_SUPPORTED);
+         }
+ 
+-        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_CREATE, &file));
++        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_CREATE, (void*) &file));
+ 
+         gcmONERROR(gcoOS_Write(
+             gcvNULL,
+@@ -2808,7 +2808,7 @@ gceSTATUS CDECL GalLoadYUV2Surface2(
+         gceSURF_FORMAT format;
+         gctBOOL swap = gcvFALSE;
+ 
+-        gcmONERROR(gcoOS_Open(Os, filename, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(Os, filename, gcvFILE_READ, (void*) &file));
+ 
+         head.Width  = read_dword(file);
+         head.Height = read_dword(file);
+@@ -3444,7 +3444,7 @@ gceSTATUS GalCreateTSurfWithPool(
+         alignedBase = 256;
+     }
+ 
+-    gcmONERROR(gcoOS_Allocate(gcvNULL, sizeof(T2D_SURF), &surf));
++    gcmONERROR(gcoOS_Allocate(gcvNULL, sizeof(T2D_SURF), (void*) &surf));
+     memset(surf, 0, sizeof(T2D_SURF));
+ 
+     if (TileStatusConfig == gcv2D_TSC_2D_COMPRESSED ||
+@@ -3869,7 +3869,7 @@ gceSTATUS GalLoadVimgToTSurfWithPool(
+         gctUINT n;
+         gctUINT32 vsupertile = ~0u;
+ 
+-        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_READ, (void*) &file));
+ 
+         gcmONERROR(gcoOS_Read(
+             NULL,
+@@ -4092,7 +4092,7 @@ gceSTATUS CDECL GalLoadVimgToSurface(
+         gceSURF_FORMAT format;
+         gctBOOL swap = gcvFALSE;
+ 
+-        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file));
+ 
+         gcmONERROR(gcoOS_Read(
+                 NULL,
+@@ -4446,7 +4446,7 @@ gceSTATUS CDECL GalLoadVimgToSurfaceWithPool(
+         gceSURF_FORMAT format;
+         gctBOOL swap = gcvFALSE;
+ 
+-        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file));
+ 
+         gcmONERROR(gcoOS_Read(
+                 NULL,
+@@ -4800,7 +4800,7 @@ gceSTATUS CDECL GalLoadRawToSurface(
+         gcoSURF surf;
+         gctBOOL swap = gcvFALSE;
+ 
+-        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file));
+ 
+         /* Check the type. */
+         switch (format)
+@@ -5441,7 +5441,7 @@ gceSTATUS CDECL GalCreateMonoStream(
+     GalMonoStream *stream = gcvNULL;
+ 
+     do {
+-        gcmERR_BREAK(gcoOS_Allocate(Os, sizeof(GalMonoStream), &stream));
++        gcmERR_BREAK(gcoOS_Allocate(Os, sizeof(GalMonoStream), (void*) &stream));
+ 
+         memset(stream, 0, sizeof(GalMonoStream));
+ 
+@@ -6196,7 +6196,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+         ImageWidth, ImageHeight,
+         Pool, &surf));
+ 
+-    gcmONERROR(gcoOS_Open(NULL, DataName0, gcvFILE_READ, &file));
++    gcmONERROR(gcoOS_Open(NULL, DataName0, gcvFILE_READ, (void*) &file));
+ 
+     aStride = surf->aWidth * bpp[0];
+     lineSize = width[0] * bpp[0];
+@@ -6247,7 +6247,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+                 gcmONERROR(gcoOS_Close(gcvNULL, file));
+             }
+ 
+-            gcmONERROR(gcoOS_Open(NULL, DataName1, gcvFILE_READ, &file));
++            gcmONERROR(gcoOS_Open(NULL, DataName1, gcvFILE_READ, (void*) &file));
+         }
+ 
+         /* Copy data */
+@@ -6304,7 +6304,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+                     gcmONERROR(gcoOS_Close(gcvNULL, file));
+                 }
+ 
+-                gcmONERROR(gcoOS_Open(NULL, DataName2, gcvFILE_READ, &file));
++                gcmONERROR(gcoOS_Open(NULL, DataName2, gcvFILE_READ, (void*) &file));
+             }
+ 
+             /* Copy data */
+@@ -6348,7 +6348,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+     /* Tile status buffer */
+     if (TableName0 != gcvNULL && surf->tileStatuslogical != gcvNULL)
+     {
+-        gcmONERROR(gcoOS_Open(NULL, TableName0, gcvFILE_READ, &file));
++        gcmONERROR(gcoOS_Open(NULL, TableName0, gcvFILE_READ, (void*) &file));
+ 
+         /* Copy tile status data */
+         for (n = 0; n < height[0]; n++)
+@@ -6391,7 +6391,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+             gctUINT aStride1 = (surf->aWidth/2) * bpp[1];
+             gctUINT lineSize1 = width[1] * bpp[1];
+ 
+-            gcmONERROR(gcoOS_Open(NULL, TableName1, gcvFILE_READ, &file));
++            gcmONERROR(gcoOS_Open(NULL, TableName1, gcvFILE_READ, (void*) &file));
+ 
+             /* Copy tile status data */
+             for (n = 0; n < height[1]; n++)
+@@ -6443,7 +6443,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
+                 aStride2 = (surf->aWidth/2) * bpp[2];
+                 lineSize2 = width[2] * bpp[2];
+ 
+-                gcmONERROR(gcoOS_Open(NULL, TableName2, gcvFILE_READ, &file));
++                gcmONERROR(gcoOS_Open(NULL, TableName2, gcvFILE_READ, (void*) &file));
+ 
+                 /* Copy tile status data */
+                 for (n = 0; n < height[1]; n++)
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index 6c4ed631..f020194a 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -10,7 +10,8 @@ DEPENDS = "ti-gc320-libs"
 BRANCH = "ti-${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-test.git;protocol=https;branch=${BRANCH} \
-file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
+    file://0001-makefile.linux.def-relax-assignment-of-CC-and-other-.patch \
+    file://0001-galUtil-Fix-compile-error.patch \
 "
 SRCREV = "53207f8e360a3336276b62066a1d8a9e923de17e"
 PR = "r2"
-- 
2.17.1


