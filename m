Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A480CD4F24
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:10:13 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11607.1762989006807546865
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:10:07 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HNX4NGXz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.43, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYh0lGjsU5wkS6bMKaXeAMUJoRynWsAV39KGnw/wAC7lxbzV4uECQeLvETACS4wC6tY63/VeiZ8UWBXlCFpGuGHhlpfwWIS97aJ+6ZfygSn+KQ5NQvHZZpSY6K2sX4UC4Rm51OV5RS1aLK6vwiQOT3as6YiMK0o8qmIw3ILGop1Kwlqy053C7+z6newKT5r5eWbrcwYCEQq61iLnoZI8wdRuRIXx9BIxwR3J5PCi6k3BaKq/UnPooA08k1cQnMI0bv2UBXAahlfcOFaoGuJF8Pb97+LL0bwUqVEsS657JKF1FskOLkqqEZR/8dHjDvPz7+e+rWZ9kXVj4d9QrcusyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeFHMhPg4bxsJitjAwP9Y/+S+fXDabHpW8vYilxhI3s=;
 b=pDXsllmW16ej/rj+NdxyL3fjh5hdVHIqV/Uc3oId5u/TQwpymlYxLD0OxQALpUaPFnyRMr8q0vJEaDdMYpd27MimvtpsrJNeMmdFqstWz7Rp0RJCp6pOQvg51zIytVbcHKDYaPF1o+t58Q9vM0rFBSdg1bulMSV73VXSYxj+sMqr5z6SDbGJAltZTtgB8pnBDrzdrTWKjTdcVQtDcXmMvGxodkoadosUDPyagRp4+IvBbwM+C1IfwF0yvQ64/WO8LZTV4UFbud4eszKm72IrTaufsTQUYeAYaqRaoGQXBr08lIzIQm/OKEafT/mQtUox+BgEFGwMQFBB7Q384xPoqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeFHMhPg4bxsJitjAwP9Y/+S+fXDabHpW8vYilxhI3s=;
 b=HNX4NGXzyBnW0XkGQ06aP6+/7NApUVBL6B3m5A83YumGuiDkQI0Lt4PxGk3q5xdoT0vJA4sGdVLw8jXvsJ0kwiXtR4hPvD0DHz50QSfKwOfGe90C3lt8u68ow6+Zv1Lrq+ZtLja1pq69yw1UsJotANWJarJlcgSKe4AnI21HHlg=
Received: from SA1P222CA0096.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::23)
 by LV0PR10MB997588.namprd10.prod.outlook.com (2603:10b6:408:33f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 23:10:04 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:806:35e:cafe::fe) by SA1P222CA0096.outlook.office365.com
 (2603:10b6:806:35e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Wed,
 12 Nov 2025 23:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:10:03 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:10:01 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:10:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:10:01 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACNA10X3491300;
	Wed, 12 Nov 2025 17:10:01 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] libdrm: remove any rogue specific overrides
Date: Wed, 12 Nov 2025 17:09:56 -0600
Message-ID: <20251112230956.191245-1-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV0PR10MB997588:EE_
X-MS-Office365-Filtering-Correlation-Id: 38563dde-8d3a-4ef8-38f4-08de22409cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H3quJ3znPvz2D9YL0PEq/cvyAjBiNLGhVc6EKzs5JRCjzc3Uo1NLbL7+6Y22?=
 =?us-ascii?Q?uBZIgvp/T6QchYcOjn4gm6Xy2TRNnBNuvDAcdFOVmQMxmcs7eC5Bwl9b/kiU?=
 =?us-ascii?Q?0SEAoRhYf78j9vjLDlNe0qEBiH5YiIdblSwBkTGv2RS736w5z8MsLgOSAlTP?=
 =?us-ascii?Q?xF2NqP5oekRtUg1M9ikaPVQ44rWE3DJAdfzsAMh9Nipk5S6uG+Ij6qbza+zS?=
 =?us-ascii?Q?T64jUEhFazgE6ToNuvqoTfbMh1bX4KGT7ivbVbEBwM7gviUw64NZ5eKzru+P?=
 =?us-ascii?Q?GUk/x/O2MBOkuA1HL5147wUR57ZE01GS4vxs90ZCaieK+FbdhEAKbl/2S0Ic?=
 =?us-ascii?Q?mBxHLiz5Kx8Av4rNdCcBQQlE3O/wLKCIfTr8GtcGFMf6oNjREHAqTLypZ/qn?=
 =?us-ascii?Q?HmSAqMKp7LGGYPEp7tdQ2xCqGtjtZu9vl9xx8B1ixG/zB/wFpR0z+mkEPLgZ?=
 =?us-ascii?Q?sQJ97+84sz657QEHtMJLhJ2BmPqy+dcpytFGIBosPpSGUbO5gkDXMtEUmMAK?=
 =?us-ascii?Q?jY/Faakg8j2fuPSxjuWtO+80kvzySlt1HkPmXsr/0szNA7LMt16LPPCOd6GR?=
 =?us-ascii?Q?rE/zxhZmihij5Da2TdO/Mfy+DLS8+EeAyOTThi2YL6QZ/YIHAdE/OUxg0dUL?=
 =?us-ascii?Q?yXWaaTOAg2yL5KIi87Wct7ZUrg2D1pTjIdmsxcWsV90mGVBjzsOCUuNVaEAa?=
 =?us-ascii?Q?qx3ptXK/kJ+wXwMk93mAniKK2UhiJZVPbFmeaG7hDykCM4INYMyeS4DGeD+4?=
 =?us-ascii?Q?ghefqY7ISFDA3oxm1b2YcjqOqxGwysCr7KEeolXd5xqaJpAxQBpTS68vQBY1?=
 =?us-ascii?Q?QBYz5qsOWmjmwCrgNWc/5WqIqZWzEF2iSZrEaBHw5VTKuhbk0pXc6iH0n6MR?=
 =?us-ascii?Q?R/P0K60iJJ4NvgyeUhxgg7vV3FNQHsqDyizMa+jAgprbzQNkWmjBXlvwuwbq?=
 =?us-ascii?Q?J92pwl38f+DrkEXnf0P4X6PKJampA88NtptSvQVDBdUhuJSGQIr1v95RD4Lr?=
 =?us-ascii?Q?NgBi17e7oyKGNElDIMWYLD2MzTLMPlyewHCYv8+NFQspROlIxUFRiGCcYSDJ?=
 =?us-ascii?Q?lzSCo2zuyCvDCUNSos/hfwHcyOgEpFN4y9Q1wC1HIiUeNJyMIadRdGK0VDXr?=
 =?us-ascii?Q?CWBTP2xLLeTB2/yiMuFdYF+1P9IWd66zudNY27epjECzKmswRHuEjHyvmlhM?=
 =?us-ascii?Q?DhEFM8N5iAXvDlGfCfwF5FpYfDHvIiZJItACwCvgqHf8uEeitfG4J8Jfmwik?=
 =?us-ascii?Q?7J3zh3+WzxzQWihXbi3uREloe716jobIA/wYSH7iGActYtcbchY+VOIUx8bb?=
 =?us-ascii?Q?ECwZ1EW1BU3J0wWjlF6brBjeZHDh6N2QiJeEw8tERyDG1OmW71jWKzLTqou0?=
 =?us-ascii?Q?HNEzWaw0IppYH9z4uKrhdTLdjRe4Qebsp5oPRSXUByKSS1alJjxOJPYM89Se?=
 =?us-ascii?Q?v0+C694UkraIDOMM4yG6ugLwAR7fC5uaKig/xQ2l8i1d5ojfo9jgdDLDC5qU?=
 =?us-ascii?Q?Kb2y/q01MWEHK83/JS5IehJmHKphw4p6Gwhki2DHfCbQQPqTTEA/C7juITlz?=
 =?us-ascii?Q?V+WDJuadbkQzbTx/8t0=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:10:03.7584
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38563dde-8d3a-4ef8-38f4-08de22409cdc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR10MB997588
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:10:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16751

From: Randolph Sapp <rs@ti.com>

These are being carried as local overrides in the rogue userspace
libraries, and are only exercised in required paths. These patches were
only ever required for the userspace side of the server itself, not for
individual applications.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/drm/libdrm-arago.inc     |   2 -
 ...ync-add-support-for-pre-v4.7-kernels.patch |  91 --------
 ...Add-sync_fence_info-and-sync_pt_info.patch | 211 ------------------
 3 files changed, 304 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0001-libs=
ync-add-support-for-pre-v4.7-kernels.patch
 delete mode 100644 meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-=
sync_fence_info-and-sync_pt_info.patch

diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc b/meta=
-arago-distro/recipes-graphics/drm/libdrm-arago.inc
index 68496668..80c607ca 100644
--- a/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
+++ b/meta-arago-distro/recipes-graphics/drm/libdrm-arago.inc
@@ -4,8 +4,6 @@ SRC_URI +=3D " \
 file://0001-Add-option-to-run-a-test-indefinitely.patch \
 file://0001-omap-fix-omap_bo_size-for-tiled-buffers.patch \
 file://0002-omap-add-OMAP_BO-flags-to-affect-buffer-allocation.patch \
-file://0001-libsync-add-support-for-pre-v4.7-kernels.patch \
-file://0002-Add-sync_fence_info-and-sync_pt_info.patch \
 "
=20
 PR:append =3D ".arago4"
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add=
-support-for-pre-v4.7-kernels.patch b/meta-arago-distro/recipes-graphics/dr=
m/libdrm/0001-libsync-add-support-for-pre-v4.7-kernels.patch
deleted file mode 100644
index d3ac5593..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-suppor=
t-for-pre-v4.7-kernels.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From 74dc4b57e9d539944edf61ec7466ce029cf993d7 Mon Sep 17 00:00:00 2001
-From: Brendan King <Brendan.King@imgtec.com>
-Date: Tue, 13 Jun 2017 15:52:44 +0100
-Subject: [PATCH] libsync: add support for pre-v4.7 kernels
-
-Add support for the the sync merge ioctl supported by older kernels.
-
-Upstream-Status: Pending
----
- libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 41 insertions(+), 3 deletions(-)
-
-diff --git a/libsync.h b/libsync.h
-index c6b64ed..465871c 100644
---- a/libsync.h
-+++ b/libsync.h
-@@ -40,6 +40,10 @@
- extern "C" {
- #endif
-=20
-+#ifndef SYNC_IOC_MAGIC
-+#define SYNC_IOC_MAGIC		'>'
-+#endif
-+
- #ifndef SYNC_IOC_MERGE
- /* duplicated from linux/sync_file.h to avoid build-time dependency
-  * on new (v4.7) kernel headers.  Once distro's are mostly using
-@@ -53,10 +57,22 @@ struct sync_merge_data {
- 	uint32_t	flags;
- 	uint32_t	pad;
- };
--#define SYNC_IOC_MAGIC		'>'
- #define SYNC_IOC_MERGE		_IOWR(SYNC_IOC_MAGIC, 3, struct sync_merge_data)
- #endif
-=20
-+#ifndef SYNC_IOC_LEGACY_MERGE
-+/* the legacy definitions are based on the contents of
-+ * drivers/staging/android/uapi/sync.h in the v4.4 kernel.
-+ */
-+struct sync_legacy_merge_data {
-+	int32_t	fd2;
-+	char	name[32];
-+	int32_t	fence;
-+};
-+
-+#define SYNC_IOC_LEGACY_MERGE	_IOWR(SYNC_IOC_MAGIC, 1, \
-+	struct sync_legacy_merge_data)
-+#endif
-=20
- static inline int sync_wait(int fd, int timeout)
- {
-@@ -83,6 +99,24 @@ static inline int sync_wait(int fd, int timeout)
- 	return ret;
- }
-=20
-+static inline int sync_legacy_merge(const char *name, int fd1, int fd2)
-+{
-+	struct sync_legacy_merge_data data;
-+	int ret;
-+
-+	data.fd2 =3D fd2;
-+	strncpy(data.name, name, sizeof(data.name));
-+
-+	do {
-+		ret =3D ioctl(fd1, SYNC_IOC_LEGACY_MERGE, &data);
-+	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
-+
-+	if (ret < 0)
-+		return ret;
-+
-+	return data.fence;
-+}
-+
- static inline int sync_merge(const char *name, int fd1, int fd2)
- {
- 	struct sync_merge_data data =3D {0};
-@@ -95,8 +129,12 @@ static inline int sync_merge(const char *name, int fd1=
, int fd2)
- 		ret =3D ioctl(fd1, SYNC_IOC_MERGE, &data);
- 	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
-=20
--	if (ret < 0)
--		return ret;
-+	if (ret < 0) {
-+		if (errno =3D=3D ENOTTY)
-+			return sync_legacy_merge(name, fd1, fd2);
-+		else
-+			return ret;
-+	}
-=20
- 	return data.fence;
- }
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fe=
nce_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/drm/li=
bdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
deleted file mode 100644
index 57a282ef..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_inf=
o-and-sync_pt_info.patch
+++ /dev/null
@@ -1,211 +0,0 @@
-From 34d420f46a49d059d55f5b9ed87306207b76c15b Mon Sep 17 00:00:00 2001
-From: Brendan King <Brendan.King@imgtec.com>
-Date: Thu, 24 Aug 2017 13:28:38 +0100
-Subject: [PATCH] Add sync_fence_info and sync_pt_info
-
-For pre-4.7 kernels, sync_fence_info returns the data from the
-SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE_INFO
-ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO form.
-
-Upstream-Status: Pending
----
- libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 172 insertions(+)
-
-diff --git a/libsync.h b/libsync.h
-index 465871c..103b488 100644
---- a/libsync.h
-+++ b/libsync.h
-@@ -31,6 +31,7 @@
- #include <assert.h>
- #include <errno.h>
- #include <stdint.h>
-+#include <stdlib.h>
- #include <string.h>
- #include <sys/ioctl.h>
- #include <poll.h>
-@@ -74,6 +75,54 @@ struct sync_legacy_merge_data {
- 	struct sync_legacy_merge_data)
- #endif
-=20
-+#ifndef SYNC_IOC_FILE_INFO
-+/* duplicated from linux/sync_file.h to avoid a build-time dependency
-+ * on new (v4.7) kernel headers.
-+ */
-+struct sync_fence_info {
-+	char		obj_name[32];
-+	char		driver_name[32];
-+	int32_t		status;
-+	uint32_t	flags;
-+	uint64_t	timestamp_ns;
-+};
-+
-+struct sync_file_info {
-+	char		name[32];
-+	int32_t		status;
-+	uint32_t	flags;
-+	uint32_t	num_fences;
-+	uint32_t	pad;
-+	uint64_t	sync_fence_info;
-+};
-+
-+#define SYNC_IOC_FILE_INFO	_IOWR(SYNC_IOC_MAGIC, 4, struct sync_file_info=
)
-+#endif
-+
-+#ifndef SYNC_IOC_LEGACY_FENCE_INFO
-+/* the legacy definitions are based on the contents of
-+ * drivers/staging/android/uapi/sync.h in the v4.4 kernel.
-+ */
-+struct sync_pt_info {
-+	uint32_t	len;
-+	char		obj_name[32];
-+	char		driver_name[32];
-+	int32_t		status;
-+	uint64_t	timestamp_ns;
-+	uint8_t		driver_data[0];
-+};
-+
-+struct sync_fence_info_data {
-+	uint32_t	len;
-+	char		name[32];
-+	int32_t		status;
-+	uint8_t		pt_info[0];
-+};
-+
-+#define SYNC_IOC_LEGACY_FENCE_INFO	_IOWR(SYNC_IOC_MAGIC, 2, \
-+	struct sync_fence_info_data)
-+#endif
-+
- static inline int sync_wait(int fd, int timeout)
- {
- 	struct pollfd fds =3D {0};
-@@ -179,6 +228,129 @@ static inline int sync_accumulate(const char *name, =
int *fd1, int fd2)
- 	return 0;
- }
-=20
-+static inline struct sync_pt_info *sync_pt_info(
-+					struct sync_fence_info_data *info,
-+					struct sync_pt_info *pt_info)
-+{
-+	if (!pt_info)
-+		pt_info =3D (struct sync_pt_info *)info->pt_info;
-+	else
-+		pt_info =3D (struct sync_pt_info *)((uint8_t *)pt_info +
-+				pt_info->len);
-+
-+	if ((uint32_t)((uint8_t *)pt_info - (uint8_t *)info) >=3D info->len)
-+		return NULL;
-+
-+	return pt_info;
-+}
-+
-+static inline struct sync_fence_info_data *sync_legacy_fence_info(int fd)
-+{
-+	const uint32_t len =3D 4096;
-+	struct sync_fence_info_data *info =3D malloc(len);
-+	int ret;
-+
-+	if (!info)
-+		return NULL;
-+
-+	info->len =3D len;
-+
-+	do {
-+		ret =3D ioctl(fd, SYNC_IOC_LEGACY_FENCE_INFO, info);
-+	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
-+
-+	if (ret < 0) {
-+		free(info);
-+		return NULL;
-+	}
-+
-+	return info;
-+}
-+
-+static inline struct sync_fence_info_data *fence_info_from_file_info(
-+					struct sync_file_info *file_info,
-+					uint32_t num_fences)
-+{
-+	struct sync_fence_info_data *info;
-+	size_t info_len;
-+	struct sync_pt_info *pt_info =3D NULL;
-+	struct sync_fence_info *fence_info;
-+	uint32_t i;
-+
-+	info_len =3D sizeof(*info) + num_fences * sizeof(*pt_info);
-+	info =3D malloc(info_len);
-+	if (!info)
-+		return NULL;
-+
-+	info->len =3D info_len;
-+	strncpy(info->name, file_info->name, sizeof(info->name));
-+	info->status =3D file_info->status;
-+
-+	fence_info =3D (struct sync_fence_info *)(uintptr_t)
-+			file_info->sync_fence_info;
-+	for (i =3D 0; i < num_fences; i++) {
-+		pt_info =3D sync_pt_info(info, pt_info);
-+		assert(pt_info);
-+
-+		pt_info->len =3D sizeof(*pt_info);
-+		strncpy(pt_info->obj_name, fence_info->obj_name,
-+			sizeof(pt_info->obj_name));
-+		strncpy(pt_info->driver_name, fence_info->driver_name,
-+			sizeof(pt_info->driver_name));
-+		pt_info->status =3D fence_info->status;
-+		pt_info->timestamp_ns =3D fence_info->timestamp_ns;
-+
-+		fence_info++;
-+	}
-+
-+	return info;
-+}
-+
-+static inline struct sync_fence_info_data *sync_fence_info(int fd)
-+{
-+	struct sync_fence_info_data *info =3D NULL;
-+	struct sync_file_info initial_info =3D {""};
-+	struct sync_file_info *file_info;
-+	int ret;
-+
-+	do {
-+		ret =3D ioctl(fd, SYNC_IOC_FILE_INFO, &initial_info);
-+	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
-+
-+	if (ret < 0) {
-+		if (errno =3D=3D ENOTTY)
-+			return sync_legacy_fence_info(fd);
-+		else
-+			return NULL;
-+	}
-+
-+	file_info =3D calloc(1, sizeof(*file_info) + initial_info.num_fences *
-+				sizeof(struct sync_fence_info));
-+	if (!file_info)
-+		return NULL;
-+
-+	file_info->num_fences =3D initial_info.num_fences;
-+	file_info->sync_fence_info =3D (uint64_t)(uintptr_t)(file_info + 1);
-+
-+	do {
-+		ret =3D ioctl(fd, SYNC_IOC_FILE_INFO, file_info);
-+	} while (ret =3D=3D -1 && (errno =3D=3D EINTR || errno =3D=3D EAGAIN));
-+
-+	if (ret < 0)
-+		goto free_file_info;
-+
-+	info =3D fence_info_from_file_info(file_info, initial_info.num_fences);
-+
-+free_file_info:
-+	free(file_info);
-+
-+	return info;
-+}
-+
-+static inline void sync_fence_info_free(struct sync_fence_info_data *info=
)
-+{
-+	free(info);
-+}
- #if defined(__cplusplus)
- }
- #endif
--=20
2.51.1


