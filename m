Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA231EEC29A
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 22:07:45 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6830.1771884460781176731
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 14:07:41 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Fv1sWpj4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.35, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qBDYt4+3aXClJ8Pqc33Qzu/S8bz+JYW1hy2Z+sUKylyqRxjqocZhjwIriGm1BYyXuDhCa3beoQYzZ0Li+GWWQlTcUap5d44CdV9GqE1IsifQ3V9UdBazxJW3hAVoQe/cDDj8Z9tyDJo+/D0wliZDD3UScdf4czaarqi22pEb7ZFbNZ0zSBj8UYP7LqnCrErogmyp/Gvj0eLN72T2faUp0CDpvCND4nDpot8+50t5osF/k04qUoJ9b0jFN0RQFyUVTm4cMMCWDFnA/o/03wDPEa2jJoO8E4wv6htRtK2xi26eKDAdHw/mQNTk+JQBSDYF55Tv6f7p50vQs6WNYXiHDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCL2VZqlF0Bd1Mb2o3FTKzNTwa/dlovQRRfZ8UFNQQw=;
 b=W/aRv3fnDCRCkxzZEWr5LUzwWz38FXTUQcnIcUQyT3ZFKDUNia4tDvIuN9HS6oR+M+DT7YHeFrO12/f78WKq9idyhE6M4PwAhqBwTSG6d/A/vHLB7jH93VG/q5XBEzaETgYC2hC3VbbYB20/IysQE3j464fHAwXqykoDYnXIg/nofb5GPdTIixhdIQU4Hn8otvZtNUb0qJlHx/5B8jYtRmbna+JKHq+vk/cN8+yx/YmrGvixAIAWrTFOgJoF8PHkfaxaX6X3pXxxDHIyMWkku4z0glsLm3+ARntdtlnsf7GYtBCUf/5oe9Fy7CIsA3vFLqdkLIaqs4waa2NunvPbZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCL2VZqlF0Bd1Mb2o3FTKzNTwa/dlovQRRfZ8UFNQQw=;
 b=Fv1sWpj4I/fpOriLrbIB9zkY7kSgPMp2l9HYEXzCjumXymFzZg2s9ppNg2kOXufAP03hQjtR8eTtBpZvkI/gY4Cdqxn9Hm9vSNgGoJh3zpWr5694xNUxRMfNYPE3B09iL2zuI31bPZ7vF4FKwNm05O+22w9osVRszfKno7qEM5U=
Received: from BL0PR05CA0025.namprd05.prod.outlook.com (2603:10b6:208:91::35)
 by DS7PR10MB7179.namprd10.prod.outlook.com (2603:10b6:8:ef::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:07:34 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::18) by BL0PR05CA0025.outlook.office365.com
 (2603:10b6:208:91::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 22:06:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Mon, 23 Feb 2026 22:07:33 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:07:32 -0600
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 23 Feb
 2026 16:07:31 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 23 Feb 2026 16:07:31 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61NM7Vlm1566664;
	Mon, 23 Feb 2026 16:07:31 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vue5T-000000058RW-2tYk;
	Mon, 23 Feb 2026 16:07:31 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] *: Remove unused patches
Date: Mon, 23 Feb 2026 16:07:31 -0600
Message-ID: <20260223220731.1224087-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|DS7PR10MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: a30a6279-8612-401a-fda5-08de7327f213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mff64Irm0nRqVJzxdSAuwV4galpJY7k5rCPtG8j1zfWlfuPzHgdiN/vrxEUE?=
 =?us-ascii?Q?7GE5wrCgqhEsi51EnWKRCM4OsUy28+XCT0jqjX6VCf9ONcfb8u+sRYzwVXIG?=
 =?us-ascii?Q?CecOavJCpOaazqath6DsYp1NvuhUXQTyJIUs1AO3pZsaeDDH3QDxXtY24A5X?=
 =?us-ascii?Q?CnfrcaC7Ej8IsXaGw/97qOyPPbLChwSEQIC7b6cM33LQ8VS01mEpXQAE9DoY?=
 =?us-ascii?Q?EfagN6e0UgklE1cjbkCdlnx/dTlNFzD/BIzYLwjQ9ZvPoJzQyva15vz0iJ1r?=
 =?us-ascii?Q?dX6mC6CgYoOPQk8mB1fO6fajm42a7xVYyujfxNxT4qnQ1tAEUDV9/ihgh6N2?=
 =?us-ascii?Q?kjYFX2wUYT/d9RyX5n+lF13w+y6u3tfOtHQBQI8P2aDQRwqSLj7+14ypyKVZ?=
 =?us-ascii?Q?8nfxJm0CEDOm/4hn62L0jx4JwgG3WCs+1k1qXFoiUnsQkHkf2uko70JkqHME?=
 =?us-ascii?Q?bIi7sYZkTmSBGnZmXG/ieGx/KrWbKtA+zi4YrrRYOjvS0sspa2RGz5pbZnL1?=
 =?us-ascii?Q?b+PJBi98YogaK0kBoZbmfVnV4UYLpUx35xvEp5HI7Ajo67aVcjaqGtORBllY?=
 =?us-ascii?Q?ikRRGPCUMWeFNWrB4xN1BOYkfh3PSF2Tse7yHtyEM0f8occHugYA0XjJveWR?=
 =?us-ascii?Q?BYOP3u/cgsqY/glP4xI+UaYbyhNB61HnZsl9roo060v0I6vI4/LFOSqR17yC?=
 =?us-ascii?Q?1lGCygVVkxTArXwz6LaCAnSUctCQKC/1UJuRprQsmXY87yZuFjOOuDpQIMzb?=
 =?us-ascii?Q?8prKFrBlVLzqjvQfsFpuUUXxqs2RW7Xto3N5iKmVURxZI1onFTspKR0scCM4?=
 =?us-ascii?Q?xOcPKlhY1diOq8FXJJfc4GuwemNka3TfnKOcrJLRriKE8iJE2jSqUnp0bE0K?=
 =?us-ascii?Q?2b9f+TmMDicMp1w4OzPYKvc4jZS2O1hxifJ3WbRB/SJKrEQMlhcfL6D3MjP/?=
 =?us-ascii?Q?l0kQGtMs3Nrha96wjGC7bVF+eLk5FGop18ZoEcAQAVWw+oAX6tKaQ7c9vUM0?=
 =?us-ascii?Q?HLKS2VT0hyLME8OZEbezRf82NBwujyJvGXIRqI6sKI9VXlWQkZgjJnhLeFVK?=
 =?us-ascii?Q?IgO8uCaRzKv86wsbeHuFu2AxmUb0Y6Mtbl1n8koZSpZ/iS6Uz2b7x8torHDB?=
 =?us-ascii?Q?w0FruJPQofqlPU3K6w7oP0Rk6U+XJd5F9/eYoC4pE1ANJyqDy+mllQfNHqAF?=
 =?us-ascii?Q?9RMLm/MyIAROESeq5maHL9OK3vCiFpyoOPiIQgnBvTkqlms1jTWn4lyDaazi?=
 =?us-ascii?Q?3l2ZdeQZ5rAJ4iEAk+EWVrC9vIcNKweMhrZQQLcXnfDfC8BioOcWLJxxER5o?=
 =?us-ascii?Q?9pXg2D7IUhZcy9dZZOc7tTPMjugDBspR2mFJFb8OMTdeRqI+JaaGV3EGE5eB?=
 =?us-ascii?Q?gFLXRq1S6ZYTuCD0ztiJKBjHkCasenUVDqPB+lPSdTaOs0XbdVT/ut8gn3f4?=
 =?us-ascii?Q?xmntNoI10ZVPxG0CRbj7315Z6J3WtPwZQGVRc6kZnH/BO7RwiTl3VPp/DW/z?=
 =?us-ascii?Q?NmOiczhuy0HJ/s87MaNe09bx263BVfTd8LDH/YEPD/UJiserntvdikn6Pz8e?=
 =?us-ascii?Q?iMMCDHhJeUXYvGlP/hJnQYeuIEuUCKJCEGCWA5aUDGprEkJbXzO4R4EQ/Z3h?=
 =?us-ascii?Q?baBy1TJTlQvqXW7cm+8Sy3Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ml4csXdKY8YOUI9h30BCaCmtO6R+EJjlWwm/GSTOQdi12iA15LQGb2I4KZe2F5t8tJGdyd/q1hBtr7TkxpFQll02jmjiMKksCo6MFkO99EgM95pGq8JY4cccuZOlqCOWx4TT+J9vUJ3wuIwZg13ukcec0VvdsX8K/TzsFEfWBUlLnr2pmW7MAiOOvj+yLZY9EEB62XEiZIz+KkYbd7axrc+LzoclKfGyZ6xUJyp9TLE5YCrofYRJanexRdLGXNKtHkHJUk4LOJb/jEgZEF9F3CzC6sV78FwECCnKWa5yIH7h/0uFD0qo60jS3kiFzUKvPtCjsFXFpcgxMpRxE5TyloCfHttZ3tSGuWLF6jgwBJYvAHh4hQv0RAIof/n+zN6/EP9IB7ymQf98OlO4vXyn6gFdJYBowtdhuk2gPE7fMsGcuKHDCushEoTQ+Q34C+6H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 22:07:33.4243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a30a6279-8612-401a-fda5-08de7327f213
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7179
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 23 Feb 2026 22:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17134

We have added checking for unused patches in our repo checking tool.
Remove two patch files that it found.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-galUtil-Fix-compile-error.patch      | 182 -----------------
 ...6ead3d6ef504c82551b12306e751d23ddb45.patch | 193 ------------------
 2 files changed, 375 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/ti-gc320-tests/files=
/0001-galUtil-Fix-compile-error.patch
 delete mode 100644 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066e=
ad3d6ef504c82551b12306e751d23ddb45.patch

diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-g=
alUtil-Fix-compile-error.patch b/meta-arago-extras/recipes-graphics/ti-gc32=
0-tests/files/0001-galUtil-Fix-compile-error.patch
deleted file mode 100644
index 6f94771f..00000000
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/files/0001-galUtil-=
Fix-compile-error.patch
+++ /dev/null
@@ -1,182 +0,0 @@
-From 01cda63954dd7eb5468550f44c666eedc2706741 Mon Sep 17 00:00:00 2001
-From: Ryan Eatmon <reatmon@ti.com>
-Date: Wed, 12 Mar 2025 10:37:01 -0500
-Subject: [PATCH] galUtil: Fix compile error
-
-Fix several compile errors realted to incompatible pointers.  The fourth
-argument is defined as void *.
-
-galUtil.c: In function 'GalLoadDIBitmap':
-galUtil.c:137:65: error: passing argument 4 of 'gcoOS_Open' from incompati=
ble pointer type [-Wincompatible-pointer-types]
-  137 |     if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, &f=
p)))
-      |                                                                 ^~=
~
-      |                                                                 |
-      |                                                                 FI=
LE **
-
-Upstream-Status: Inactive-Upstream [lastcommit: 2017-01-16]
-
-Signed-off-by: Ryan Eatmon <reatmon@ti.com>
----
- .../hal/common/UnitTest/galUtil/galUtil.c     | 30 +++++++++----------
- 1 file changed, 15 insertions(+), 15 deletions(-)
-
-diff --git a/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c b/tests/=
src/test/hal/common/UnitTest/galUtil/galUtil.c
-index c2aefa6..f235f3a 100755
---- a/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c
-+++ b/tests/src/test/hal/common/UnitTest/galUtil/galUtil.c
-@@ -134,7 +134,7 @@ unsigned char * CDECL GalLoadDIBitmap(const char *file=
name, BMPINFO **info)
-     BMPFILEHEADER   header;       /* File header */
-=20
-     /* Try opening the file; use "rb" mode to read this *binary* file. */
--    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, &fp)))
-+    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_READ, (void*) &=
fp)))
-     {
-         /* Failed to open the file. */
-         GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the file =
%s", filename);
-@@ -335,7 +335,7 @@ int static GalSaveDIBitmap(const char *filename, BMPIN=
FO *info, unsigned char *b
-         return -1;
-     }
-=20
--    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_CREATE, &fp)))
-+    if (gcmIS_ERROR(gcoOS_Open(gcvNULL, filename, gcvFILE_CREATE, (void*)=
 &fp)))
-     {
-         /* Failed to open the file. */
-         GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the file =
%s", filename);
-@@ -1927,7 +1927,7 @@ gctBOOL GalSaveSurfaceToVimg(gcoSURF surface, const =
char *FileName)
-         head.imageStride =3D aStride =3D alignedWidth * bpp[0];
-         lineSize =3D width[0] * bpp[0];
-=20
--        if (gcmIS_ERROR(gcoOS_Open(gcvNULL, FileName, gcvFILE_CREATE, &fi=
le)))
-+        if (gcmIS_ERROR(gcoOS_Open(gcvNULL, FileName, gcvFILE_CREATE, (vo=
id*) &file)))
-         {
-             /* Failed to open the file. */
-             GalOutput(GalOutputType_Error, "*ERROR*  Failed to open the f=
ile %s", FileName);
-@@ -2070,7 +2070,7 @@ gceSTATUS GalSaveTSurfToVimg(
-             gcmONERROR(gcvSTATUS_NOT_SUPPORTED);
-         }
-=20
--        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_CREATE, &file));
-+        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_CREATE, (void*) &fi=
le));
-=20
-         gcmONERROR(gcoOS_Write(
-             gcvNULL,
-@@ -2808,7 +2808,7 @@ gceSTATUS CDECL GalLoadYUV2Surface2(
-         gceSURF_FORMAT format;
-         gctBOOL swap =3D gcvFALSE;
-=20
--        gcmONERROR(gcoOS_Open(Os, filename, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(Os, filename, gcvFILE_READ, (void*) &file))=
;
-=20
-         head.Width  =3D read_dword(file);
-         head.Height =3D read_dword(file);
-@@ -3444,7 +3444,7 @@ gceSTATUS GalCreateTSurfWithPool(
-         alignedBase =3D 256;
-     }
-=20
--    gcmONERROR(gcoOS_Allocate(gcvNULL, sizeof(T2D_SURF), &surf));
-+    gcmONERROR(gcoOS_Allocate(gcvNULL, sizeof(T2D_SURF), (void*) &surf));
-     memset(surf, 0, sizeof(T2D_SURF));
-=20
-     if (TileStatusConfig =3D=3D gcv2D_TSC_2D_COMPRESSED ||
-@@ -3869,7 +3869,7 @@ gceSTATUS GalLoadVimgToTSurfWithPool(
-         gctUINT n;
-         gctUINT32 vsupertile =3D ~0u;
-=20
--        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(NULL, Filename, gcvFILE_READ, (void*) &file=
));
-=20
-         gcmONERROR(gcoOS_Read(
-             NULL,
-@@ -4092,7 +4092,7 @@ gceSTATUS CDECL GalLoadVimgToSurface(
-         gceSURF_FORMAT format;
-         gctBOOL swap =3D gcvFALSE;
-=20
--        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file=
));
-=20
-         gcmONERROR(gcoOS_Read(
-                 NULL,
-@@ -4446,7 +4446,7 @@ gceSTATUS CDECL GalLoadVimgToSurfaceWithPool(
-         gceSURF_FORMAT format;
-         gctBOOL swap =3D gcvFALSE;
-=20
--        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file=
));
-=20
-         gcmONERROR(gcoOS_Read(
-                 NULL,
-@@ -4800,7 +4800,7 @@ gceSTATUS CDECL GalLoadRawToSurface(
-         gcoSURF surf;
-         gctBOOL swap =3D gcvFALSE;
-=20
--        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(NULL, filename, gcvFILE_READ, (void*) &file=
));
-=20
-         /* Check the type. */
-         switch (format)
-@@ -5441,7 +5441,7 @@ gceSTATUS CDECL GalCreateMonoStream(
-     GalMonoStream *stream =3D gcvNULL;
-=20
-     do {
--        gcmERR_BREAK(gcoOS_Allocate(Os, sizeof(GalMonoStream), &stream));
-+        gcmERR_BREAK(gcoOS_Allocate(Os, sizeof(GalMonoStream), (void*) &s=
tream));
-=20
-         memset(stream, 0, sizeof(GalMonoStream));
-=20
-@@ -6196,7 +6196,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-         ImageWidth, ImageHeight,
-         Pool, &surf));
-=20
--    gcmONERROR(gcoOS_Open(NULL, DataName0, gcvFILE_READ, &file));
-+    gcmONERROR(gcoOS_Open(NULL, DataName0, gcvFILE_READ, (void*) &file));
-=20
-     aStride =3D surf->aWidth * bpp[0];
-     lineSize =3D width[0] * bpp[0];
-@@ -6247,7 +6247,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-                 gcmONERROR(gcoOS_Close(gcvNULL, file));
-             }
-=20
--            gcmONERROR(gcoOS_Open(NULL, DataName1, gcvFILE_READ, &file));
-+            gcmONERROR(gcoOS_Open(NULL, DataName1, gcvFILE_READ, (void*) =
&file));
-         }
-=20
-         /* Copy data */
-@@ -6304,7 +6304,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-                     gcmONERROR(gcoOS_Close(gcvNULL, file));
-                 }
-=20
--                gcmONERROR(gcoOS_Open(NULL, DataName2, gcvFILE_READ, &fil=
e));
-+                gcmONERROR(gcoOS_Open(NULL, DataName2, gcvFILE_READ, (voi=
d*) &file));
-             }
-=20
-             /* Copy data */
-@@ -6348,7 +6348,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-     /* Tile status buffer */
-     if (TableName0 !=3D gcvNULL && surf->tileStatuslogical !=3D gcvNULL)
-     {
--        gcmONERROR(gcoOS_Open(NULL, TableName0, gcvFILE_READ, &file));
-+        gcmONERROR(gcoOS_Open(NULL, TableName0, gcvFILE_READ, (void*) &fi=
le));
-=20
-         /* Copy tile status data */
-         for (n =3D 0; n < height[0]; n++)
-@@ -6391,7 +6391,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-             gctUINT aStride1 =3D (surf->aWidth/2) * bpp[1];
-             gctUINT lineSize1 =3D width[1] * bpp[1];
-=20
--            gcmONERROR(gcoOS_Open(NULL, TableName1, gcvFILE_READ, &file))=
;
-+            gcmONERROR(gcoOS_Open(NULL, TableName1, gcvFILE_READ, (void*)=
 &file));
-=20
-             /* Copy tile status data */
-             for (n =3D 0; n < height[1]; n++)
-@@ -6443,7 +6443,7 @@ gceSTATUS CDECL GalLoadDECTPCRawToTSurfWithPool(
-                 aStride2 =3D (surf->aWidth/2) * bpp[2];
-                 lineSize2 =3D width[2] * bpp[2];
-=20
--                gcmONERROR(gcoOS_Open(NULL, TableName2, gcvFILE_READ, &fi=
le));
-+                gcmONERROR(gcoOS_Open(NULL, TableName2, gcvFILE_READ, (vo=
id*) &file));
-=20
-                 /* Copy tile status data */
-                 for (n =3D 0; n < height[1]; n++)
---=20
-2.17.1
-
diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066ead3d6ef=
504c82551b12306e751d23ddb45.patch b/meta-arago-test/recipes-devtools/ltp-dd=
t/ltp-ddt/2d066ead3d6ef504c82551b12306e751d23ddb45.patch
deleted file mode 100644
index 1c06e254..00000000
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt/2d066ead3d6ef504c825=
51b12306e751d23ddb45.patch
+++ /dev/null
@@ -1,193 +0,0 @@
-From 2d066ead3d6ef504c82551b12306e751d23ddb45 Mon Sep 17 00:00:00 2001
-From: Wei Gao <wegao@suse.com>
-Date: Sun, 14 Dec 2025 02:15:20 +0000
-Subject: [PATCH] listmount04.c: Update struct mnt_id_req support for kerne=
l >=3D 6.18
-
-Kernel change from v6.18-rc7
-78f0e33cd6c93 ("fs/namespace: correctly handle errors returned by grab_req=
uested_mnt_ns")
-causes the test failure with following error message:
-listmount04.c:128: TFAIL: invalid mnt_id_req.spare expected EINVAL: EBADF =
(9)
-
-The fix require following changes:
-
-* struct mnt_id_req got new member mnt_ns_fd in v6.18-rc7.  That is
-fixed in a fallback defintion in lapi/. If the fallback is used is now
-done via typedef (that requires also update in statmount.h).
-
-* New kernels (>=3D 6.18) have also different errno. This is fixed by
-runtime check.
-
-Link: https://lore.kernel.org/ltp/20251214021541.3256-1-wegao@suse.com/
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Reviewed-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Wei Gao <wegao@suse.com>
-[ pvorel: Shorten TCONF, rewrite commit message ]
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
----
- configure.ac                                  |  2 +-
- include/lapi/mount.h                          | 10 +++--
- .../kernel/syscalls/listmount/listmount.h     |  2 +-
- .../kernel/syscalls/listmount/listmount04.c   | 37 +++++++++++++++++--
- .../kernel/syscalls/statmount/statmount.h     |  2 +-
- 5 files changed, 44 insertions(+), 9 deletions(-)
-
-Upstream-Status: Backport
-
-Index: ltp-20250930/configure.ac
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ltp-20250930.orig/configure.ac
-+++ ltp-20250930/configure.ac
-@@ -262,7 +262,7 @@ AC_CHECK_TYPES([struct cachestat_range],
- AC_CHECK_TYPES([struct cachestat],,,[#include <sys/mman.h>])
-=20
- # Defined in <linux/mount.h>, but include/lapi/mount.h includes <sys/moun=
t.h> */
--AC_CHECK_TYPES([struct mnt_id_req],,,[#include <sys/mount.h>])
-+AC_CHECK_MEMBERS([struct mnt_id_req.mnt_ns_fd],,,[#include <sys/mount.h>]=
)
- AC_CHECK_TYPES([struct statmount],,,[#include <sys/mount.h>])
- AC_CHECK_MEMBERS([struct statmount.mnt_ns_id],,,[#include <unistd.h>
- #include <linux/mount.h>])
-Index: ltp-20250930/include/lapi/mount.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ltp-20250930.orig/include/lapi/mount.h
-+++ ltp-20250930/include/lapi/mount.h
-@@ -45,14 +45,18 @@
- # define MS_NOSYMFOLLOW 256
- #endif
-=20
--#ifndef HAVE_STRUCT_MNT_ID_REQ
--struct mnt_id_req {
-+struct mnt_id_req_fallback {
- 	uint32_t size;
--	uint32_t spare;
-+	uint32_t mnt_ns_fd;
- 	uint64_t mnt_id;
- 	uint64_t param;
- 	uint64_t mnt_ns_id;
- };
-+
-+#ifndef HAVE_STRUCT_MNT_ID_REQ_MNT_NS_FD
-+typedef struct mnt_id_req_fallback mnt_id_req;
-+#else
-+typedef struct mnt_id_req mnt_id_req;
- #endif
-=20
- #ifndef HAVE_STRUCT_STATMOUNT
-Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount.h
-+++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount.h
-@@ -15,7 +15,7 @@
- static inline ssize_t listmount(uint64_t mnt_id, uint64_t last_mnt_id,
- 			 uint64_t list[], size_t num, unsigned int flags)
- {
--	struct mnt_id_req req =3D {
-+	mnt_id_req req =3D {
- 		.size =3D MNT_ID_REQ_SIZE_VER0,
- 		.mnt_id =3D mnt_id,
- 		.param =3D last_mnt_id,
-Index: ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ltp-20250930.orig/testcases/kernel/syscalls/listmount/listmount04.c
-+++ ltp-20250930/testcases/kernel/syscalls/listmount/listmount04.c
-@@ -14,14 +14,18 @@
-=20
- #define _GNU_SOURCE
-=20
-+#include "config.h"
- #include "tst_test.h"
- #include "lapi/mount.h"
- #include "lapi/syscalls.h"
-=20
- #define MNT_SIZE 32
-+#define BEFORE_6_18 1
-+#define AFTER_6_18 2
-=20
--static struct mnt_id_req *request;
-+static mnt_id_req *request;
- static uint64_t mnt_ids[MNT_SIZE];
-+static int kver;
-=20
- static struct tcase {
- 	int req_usage;
-@@ -34,6 +38,7 @@ static struct tcase {
- 	uint64_t flags;
- 	int exp_errno;
- 	char *msg;
-+	int kver;
- } tcases[] =3D {
- 	{
- 		.req_usage =3D 0,
-@@ -79,6 +84,18 @@ static struct tcase {
- 		.nr_mnt_ids =3D MNT_SIZE,
- 		.exp_errno =3D EINVAL,
- 		.msg =3D "invalid mnt_id_req.spare",
-+		.kver =3D BEFORE_6_18,
-+	},
-+	{
-+		.req_usage =3D 1,
-+		.size =3D MNT_ID_REQ_SIZE_VER0,
-+		.spare =3D -1,
-+		.mnt_id =3D LSMT_ROOT,
-+		.mnt_ids =3D mnt_ids,
-+		.nr_mnt_ids =3D MNT_SIZE,
-+		.exp_errno =3D EBADF,
-+		.msg =3D "invalid mnt_id_req.mnt_ns_fd",
-+		.kver =3D AFTER_6_18,
- 	},
- 	{
- 		.req_usage =3D 1,
-@@ -113,7 +130,12 @@ static struct tcase {
- static void run(unsigned int n)
- {
- 	struct tcase *tc =3D &tcases[n];
--	struct mnt_id_req *req =3D NULL;
-+	mnt_id_req *req =3D NULL;
-+
-+	if (tc->kver && tc->kver !=3D kver) {
-+		tst_res(TCONF, "Test not suitable for current kernel version");
-+		return;
-+	}
-=20
- 	memset(mnt_ids, 0, sizeof(mnt_ids));
-=20
-@@ -122,7 +144,7 @@ static void run(unsigned int n)
- 		req->mnt_id =3D tc->mnt_id;
- 		req->param =3D tc->param;
- 		req->size =3D tc->size;
--		req->spare =3D tc->spare;
-+		req->mnt_ns_fd =3D tc->spare;
- 	}
-=20
- 	TST_EXP_FAIL(tst_syscall(__NR_listmount, req, tc->mnt_ids,
-@@ -130,8 +152,17 @@ static void run(unsigned int n)
- 		"%s", tc->msg);
- }
-=20
-+static void setup(void)
-+{
-+	if (tst_kvercmp(6, 18, 0) >=3D 0)
-+		kver =3D AFTER_6_18;
-+	else
-+		kver =3D BEFORE_6_18;
-+}
-+
- static struct tst_test test =3D {
- 	.test =3D run,
-+	.setup =3D setup,
- 	.tcnt =3D ARRAY_SIZE(tcases),
- 	.min_kver =3D "6.8",
- 	.bufs =3D (struct tst_buffers []) {
-Index: ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- ltp-20250930.orig/testcases/kernel/syscalls/statmount/statmount.h
-+++ ltp-20250930/testcases/kernel/syscalls/statmount/statmount.h
-@@ -16,7 +16,7 @@
- static inline int statmount(uint64_t mnt_id, uint64_t mask, struct statmo=
unt *buf,
- 		     size_t bufsize, unsigned int flags)
- {
--	struct mnt_id_req req =3D {
-+	mnt_id_req req =3D {
- 		.size =3D MNT_ID_REQ_SIZE_VER0,
- 		.mnt_id =3D mnt_id,
- 		.param =3D mask,
--=20
2.43.0


