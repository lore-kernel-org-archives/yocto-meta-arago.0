Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C98DCD4F22
	for <webhook@archiver.kernel.org>; Wed, 12 Nov 2025 23:04:23 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.12])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11298.1762988657619382271
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Nov 2025 15:04:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=EEjmb3vj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.12, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wkA+qMsAvPJnDuPmbj6qcfVfqVK/y2gTdMes9ZWRTQ++R7xJbkquNm6bBc4nh6OFdkFftxM1aJEGUzcVx6our01LYhHaiOpsdYujCjpBjR/7PUxKOHQNl1p+BOZesPQNix4L6H8ohLbkLU26SxvQpzF3/T4SBIzCDSTHGi6U6/4VarBGKlFaakFoz1qgy9Y+oD3q1bU4Un8MoGOARyZOTTQSUFyB/ljubZy0p7usPLJ7kwi0L6DdWs+5nHp6DtP0bsRrgqxYtqX8Wrmq1y+BbmlkbxuBx8wiM5mgnqf+Dm9CnD2GiIYpab3mNt+8hfO/g5yZSFKuL2u5IVyFmUovFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OGvqAHKhP9jaYMGdeAxpID0K7VWqPbMMwMIpz/lgDvA=;
 b=WpQCgcaGHqnBsZVhwrbykKJXb4y+4vhAoBclpNlqnCD6+i0sQ4H3InwMtKHiBFMF4tDHBBHnIMgtb90pbzQSGEMxTRB3bHDtOqFWRhimP2K8dAqmm4iaWoubAwl6hrtCOvjBoTEOnPWiFrFLVOIZ2k6VbOFYOsiR6OAltLEFG+8KJN4Trmzww+5o4iplirblAb3JQKF8yNDnSLycwSnVqTPU8cfVHnNhPNxtjIIBfb/C17jAkGma7/u5aLuOi6Riu4vJ6VogW2o3OLR6p7Y3BTsOCrFxkg5lAHcBCkDEbjcif2pcgcMVehP9toYLbSDowW/24/xPLHLKfmkHN2ymSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OGvqAHKhP9jaYMGdeAxpID0K7VWqPbMMwMIpz/lgDvA=;
 b=EEjmb3vjnodYEGdqRw4GwQPt1q5q3EClRgQ0v+TFOjQsfUBvYES9vXkhrdkoORJY3xBY/dNksIdwjSqhvk+e3NGxEFyvPF8scwI9V//1knPo7u1njiwTSHkOa/DT87KT2NHGq32jvGDVJAcBV5iYRgnwZGBE/oMvyez6yM5LntU=
Received: from MW4PR03CA0257.namprd03.prod.outlook.com (2603:10b6:303:b4::22)
 by DS0PR10MB8127.namprd10.prod.outlook.com (2603:10b6:8:203::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Wed, 12 Nov
 2025 23:04:15 +0000
Received: from SJ1PEPF00001CE4.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::d7) by MW4PR03CA0257.outlook.office365.com
 (2603:10b6:303:b4::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.15 via Frontend Transport; Wed,
 12 Nov 2025 23:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00001CE4.mail.protection.outlook.com (10.167.242.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 23:04:14 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:04:11 -0600
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 12 Nov
 2025 17:04:10 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 12 Nov 2025 17:04:10 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ACN4AKs3443099;
	Wed, 12 Nov 2025 17:04:10 -0600
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <j-choudhary@ti.com>,
	<tomi.valkeinen@ideasonboard.com>, <h-shenoy@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] libdrm: remove any rogue specific overrides
Date: Wed, 12 Nov 2025 17:02:44 -0600
Message-ID: <20251112230243.190593-2-rs@ti.com>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE4:EE_|DS0PR10MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: b1d972c0-37b7-4bf0-ff2e-08de223fccb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/KJ6xNw0nUq6b2CyKijRTQVMMZICqkatDJJ0LLJ6Lq5CLYXxryI9UNnZzaiW?=
 =?us-ascii?Q?uCYLHj/strR2EIva/J8QshHZ17AiGr0M4V5xMcyH1ZEekD4E44t2xqzUP4DA?=
 =?us-ascii?Q?vOy36Vu2OVsEtUp73B1PW78705+dcObJzimnnv0wb/21OdjwH1S5NSq0kLob?=
 =?us-ascii?Q?QIagUT+UmyT3nwu0b6orhWorBV0Pb1lFIqCydYc9Qfq+X1p5w7Ghznqc6Z4a?=
 =?us-ascii?Q?j3eD8n+IBWc3XspTGI9H5+Izv8xu2/ZYAfTixlRI72wDCR9oFP+3aH0pZyj1?=
 =?us-ascii?Q?cKN2X5VqZcc15dUKeGfzt0txmpIsiRReUN4WTo+9ZUu9IuCGWrTB/S7bpJt+?=
 =?us-ascii?Q?dhuiEDznPdIzrcDQc5zDyqzqekTg0uXww5Zq7U5aMl5LAxDvZxfpStILhz+j?=
 =?us-ascii?Q?1B+yVNqXMCT+bFmuYq8HJ5PYUKN6NCasIFtvbgm01CnYOitEo0irJH5ZyW2I?=
 =?us-ascii?Q?9fNfRbox5iUmudICDCxxq1Q6QBxbCwgSssUPLi2BCZtuS0F/xlkZaT++IeNj?=
 =?us-ascii?Q?kugyugJlRWD+Zn5xZ57Rjop43P6ybdGQ8Nv4fV3fUYmyYpQEgRZXGBkizw37?=
 =?us-ascii?Q?60jUh5f/TbgXcNdM9IsHrY2b5yagdqUg26ZfTt+BnrmU1VeTcUC+d65xzNKG?=
 =?us-ascii?Q?+L1cgktGskhVUjOvhmxISNxY86AIqvdrfUMQObPXBNlaak+NjQEpuUp1Hdtv?=
 =?us-ascii?Q?HuSPEwWqNFfoDsSBsyvDbfIcuoIhe69ywofRE8djNkcmF+Fkx/NZx4kpckW5?=
 =?us-ascii?Q?qLHmsPeQBld43HX5VI9xKsQjEL/c0zfJTUV0s5+tJBwQTrWI7Br+xXp4+mkC?=
 =?us-ascii?Q?haF99DqgelBD5DldruXrrcmfR5q24GSM5+D+hgoAqIYERnLk/yhb0azkBYUT?=
 =?us-ascii?Q?l3Uu9DNDgYMQCjzLjlcNw6a3VJ09xZH2KsmuDalRVaPkBjWrDlv/uLamfw1W?=
 =?us-ascii?Q?sXM8wVinECwvxO4Ujl+c/H6BJ0ANuMnGfEOzZ2ovyy3Qr7VNia4OvxCr3g6q?=
 =?us-ascii?Q?jw0zvLVvohnEKEbgF/ndDB6llX34s1B54RaQX9IEOQbaYw0TPT7uYhBonOfm?=
 =?us-ascii?Q?u28/TpzwYkL9360JNlH1AWE/KkVdCS+qsg939bP3hPQYcqzvWelyzwRkOutF?=
 =?us-ascii?Q?+4MNtESzqYfPNeKgiYVCYK316C7i1xx26aOFyvVk/YJLW1N+IoBj6RUD4V1C?=
 =?us-ascii?Q?cEsgF544EJ5yfVDcVGnvCmj6z7EL1KkSWGoi0jnHhb+lFwE68vZSIn+7vZ8v?=
 =?us-ascii?Q?2hvPJuAdljeNILb0uF3nxx/95vs+mgym6Hvdkx5AQikKuPZzHulYWD4g6T8X?=
 =?us-ascii?Q?SwzTRy3V7IEFS2DFaErzFViYCdsnDv4H39DVJrhIphX2h593FWMYu5ZuN4Ag?=
 =?us-ascii?Q?2MqItnoMF6evVsMmgHXESWQ9I6BVCJxwLOO2rSB+zAAxMEt1RhWTsEbCKQpI?=
 =?us-ascii?Q?Dc3B9CU566gH1tKTQydiwp63F5MXvl1z1J+GEiQZlFOUQ6FcKURQSx4PoKL7?=
 =?us-ascii?Q?1LYOw8KhP9Y5J2eJ9FITaz76yMx7mjwUb4LvMRZ8Z6NjTkSQ0FhDpH/JWp2C?=
 =?us-ascii?Q?Ob9COWRsrnXkR9q6Ov8=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 23:04:14.5165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1d972c0-37b7-4bf0-ff2e-08de223fccb8
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8127
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Nov 2025 23:04:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16749

From: Randolph Sapp <rs@ti.com>

These are being carried as local overrides in the rogue userspace
libraries, and are only exercised in required paths. These patches were
only ever required for the userspace side of the server itself, not for
individual applications.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

Any remaining patches on libdrm are required for display testing or are
functions specifically added for omapdrm and should be audited by the tagge=
d
maintainers.

 .../recipes-graphics/drm/libdrm-arago.inc     |   2 -
 ...ync-add-support-for-pre-v4.7-kernels.patch |  95 --------
 ...Add-sync_fence_info-and-sync_pt_info.patch | 215 ------------------
 3 files changed, 312 deletions(-)
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
index d645bab6..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0001-libsync-add-suppor=
t-for-pre-v4.7-kernels.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 900afd25d9a35b2b8fd29f8c424aa3c3cd170d6f Mon Sep 17 00:00:00 2001
-From: Brendan King <Brendan.King@imgtec.com>
-Date: Tue, 13 Jun 2017 15:52:44 +0100
-Subject: [PATCH 1/2] libsync: add support for pre-v4.7 kernels
-
-Add support for the the sync merge ioctl supported by older kernels.
-
-Upstream-Status: Pending
-
----
- libsync.h | 44 +++++++++++++++++++++++++++++++++++++++++---
- 1 file changed, 41 insertions(+), 3 deletions(-)
-
-diff --git a/libsync.h b/libsync.h
-index f1a2f96d..c3b8a385 100644
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
---=20
-2.17.1
-
diff --git a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fe=
nce_info-and-sync_pt_info.patch b/meta-arago-distro/recipes-graphics/drm/li=
bdrm/0002-Add-sync_fence_info-and-sync_pt_info.patch
deleted file mode 100644
index 2786c04d..00000000
--- a/meta-arago-distro/recipes-graphics/drm/libdrm/0002-Add-sync_fence_inf=
o-and-sync_pt_info.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From 09da458d04e048a80500feb7d167a4faac56f84e Mon Sep 17 00:00:00 2001
-From: Brendan King <Brendan.King@imgtec.com>
-Date: Thu, 24 Aug 2017 13:28:38 +0100
-Subject: [PATCH 2/2] Add sync_fence_info and sync_pt_info
-
-For pre-4.7 kernels, sync_fence_info returns the data from the
-SYNC_IOC_FENCE_INFO ioctl. For newer kernels, the SYNC_IOC_FILE_INFO
-ioctl is called, and the data converted to SYNC_IOC_FENCE_INFO form.
-
-Upstream-Status: Pending
-
----
- libsync.h | 172 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 172 insertions(+)
-
-diff --git a/libsync.h b/libsync.h
-index c3b8a385..44f7330d 100644
---- a/libsync.h
-+++ b/libsync.h
-@@ -31,6 +31,7 @@
- #include <assert.h>
- #include <errno.h>
- #include <stdint.h>
-+#include <stdlib.h>
- #include <string.h>
- #include <sys/ioctl.h>
- #include <sys/poll.h>
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
---=20
-2.17.1
-
--=20
2.51.1


