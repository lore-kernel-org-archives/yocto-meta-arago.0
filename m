Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A39FF6E84
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 21:19:11 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86.1773782348120988068
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 14:19:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=CfsiOwtz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.57, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSOv7jh4lJL6J6QjjDuLDlDTqOpmPldDZCDmw1YFPBtmVszW8jb7XUUz9PTbUhxnCGSiINo3Ol33Qfl9iZip7RLhcQQZ6CHmTitlyGlTpslVHhMKtCIv9aXiOHocTfKM3WTszym6DD/hZkdzEkxe9/uWEIpxEdpj8IfMUwYyaCAS/3VPsWKNkiLJ1E/OT9NylB8qc4mZtYg4e+UgzBODyZY4p1NVeqmt7o9FiFOYdwgxmJoNtDRWpvuBHnigT9ak0dw45FzoOkE/ifxCaPRQequCyAyWY/r4c9f6TzMxDwLMYngu0FPdA9SeqT66pyM5P88PyM9NR7S00N/sPeBiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9VAxIDy+9TlgQIW0mOqIM6q45W1EZ+aMPOqW4WLPsPA=;
 b=Jtya4K/5Ub796Deobph/dU6YBNltt3YDXTx1ZWhrLPybZn6h6S4FFcfXwO0XOGbY63Iq7UcdvsMUWSwvlYNU89X+5m2PENSMyMo5NpSzvC2t5v+J7So+yelpEZXEFOV3gb25rKFyjuDJkV2RmAX2epyyj3QzqwEg6lx+/BgytDl56vwXYxmbkqb+P8iHemFhnn3SxMYtwFxDIWHY18ZJhlF4mgnhf83us0pPAxhbqz4hffCyqgfju43bM2UnQ/YqfVqDOiTkMRKmVLJlFcMALdItZBv1N58kcdozSvqZkbTnsik00DkZA3g5aB7QjezuPbFsnG0mGIBCsZq0q9s/aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9VAxIDy+9TlgQIW0mOqIM6q45W1EZ+aMPOqW4WLPsPA=;
 b=CfsiOwtzRa6XENdYtjc/KvnoRFU8zm7tmmk1p9QY3Y2vFguuGcgzd3NxHL72czequobrMVFNeb3KjIN/5Waf3Y/7qb4tmZYeOLPF+qYqOFjclGWuuOGlNHGxFVi/xasYntORUGh4B+Zy5N0yEZpC6rPW/MCvGGOl6Q1MpUYpK1o=
Received: from MN0P220CA0014.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::6)
 by CY5PR10MB6238.namprd10.prod.outlook.com (2603:10b6:930:42::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Tue, 17 Mar
 2026 21:19:05 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:52e:cafe::a7) by MN0P220CA0014.outlook.office365.com
 (2603:10b6:208:52e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 21:18:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 21:19:03 +0000
Received: from DFLE205.ent.ti.com (10.64.6.63) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:19:02 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 16:19:02 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 16:19:02 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.107])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HLJ2rI3371406;
	Tue, 17 Mar 2026 16:19:02 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>,
	<denis@denix.org>
Subject: [meta-arago][master][PATCH v2] chromium: Add a patch to fix build against GLIBC 2.43
Date: Tue, 17 Mar 2026 16:18:40 -0500
Message-ID: <20260317211840.384483-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CY5PR10MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: df03cbf1-7ec7-4d1a-b67c-08de846ad096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	9O56D8GbE5LGIV/kKA7yp93PIKbkZJI5pNmk2/1hqxOpVzcd2ymM4ciPn/zI71hmBg7ePsmDOmNHlegAYFNJyP2NB99Sw/G5QDuXeWwBIuuO5bdf1Jgr1kYCkmm5z/ptc+wGnNaCmYhJqh8p7PiqV/7fgNd2zOmspY5g+55P+hkD3B4MXw9S31u53cyE4SYSp6aUQcyioLBkzGJyOMkWUEOymME0UJj8sEZ6htvuBkCtC6TV0waM/7KGfcdveGn3B9RgHyLnksDl2G/oRw2olqOhi/FAbDD6Q6XlsynXZ13eQ8KaGBMwJisvWSv4ebdLrj3o/4w8ogM3ecx+h2CX2gFItjxjOOihGz4kprv6Rv1NdizhPOoVKw1aTANcH1STlm4vZcbXM9SC6X5rknXFTNbzmNx5pzmdq3Rnlf5h+sCObBNH3IO4n0b+aQyL/vuz31nIbtPIIqEhO5GzMBeUUQbPbsv0PeQmWe0Qtqj/oksqxFNRsWOhJVLNhd+Ym/3gLvsnQj8+4W5Ksmkncv9voH+27q5eu0d/3E/f3B2Id4kFbSpvl8xR+2HgEfWTZGE4hRTfc/1bkXsbRWsiLrFBHqESD/AfQDoSKxI4SAbRa6trYxMULon6xjydCKwMoWQ4PBvogPuw3a5j4RJyvqPDnBqNz21bWbofj96lU3ia5XMZZXaCuBVJIVRSyzRHsVIkMtKVT02Bj12dpCJwtMY3o3XfqjmOw+F09RLXgm7lYrk=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	03v78//gpJS/cg8IZ28FImmUgVEtvjZmNi9468wlZyuM2XuKo4gE6DIp/BKv47wNuYI6tlrf1ZpdULZOVH2nYLUi/IFGePHZoU6pMMNSTrS2qPO/i+s0uNHeMw1gSZRx6y3duAinw0dV6Xhyn5R4dagdlYWIoZshWWjsjRRuY02JEzhGmHUWbp65fKBpeR5YGZ6Haq+kWUtSiggjjuki6jEYqAsy5D5ClPKEAbMBfAjZIOG1cab7OAAF9czgOXtjWbQP7XhuFCcQ4jC2kMvi9QFBswKlIccC78fv1QepMBWj7cK07cvHQvxudccD4LqH1CDBbeOZnHqiBl8mTxOlmcYSyJKGxPRpRfzfB6l1Rl1Q2Q8TrkLfM4aBrQp4YLT0wyQicvErHsUWcWkTGmEissikKHNy7wzVXgmztuAkbV2z4+sTPwS/QBLvnY/ie9cm
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 21:19:03.2892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df03cbf1-7ec7-4d1a-b67c-08de846ad096
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6238
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 21:19:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17388

From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>

An update to oe-core leads to build failures with Chromium v142. This fix
is currently pending in meta-browser but is needed to get Chromium to build
succesfully.

Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
v2:
- Update From and Signed off to include original author
- Update Upstream-Status to Submitted
 .../fix-SYS_SECCOMP-redefinition.patch           | 16 ++++++++++++++++
 .../chromium/chromium-ozone-wayland-arago.inc    |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SEC=
COMP-redefinition.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-re=
definition.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/=
recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECC=
OMP-redefinition.patch
new file mode 100644
index 00000000..52085fbf
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefinit=
ion.patch
@@ -0,0 +1,16 @@
+Taken from:
+https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc-2.43-=
SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine
+
+Upstream-Status: Submitted [https://github.com/OSSystems/meta-browser/pull=
/962/changes/4e450497be557fc4b5ff1397f78fa0f8381e281d]
+diff --git a/sandbox/linux/system_headers/linux_seccomp.h b/sandbox/linux/=
system_headers/linux_seccomp.h
+index 8690a96eb0..8988836508 100644
+--- a/sandbox/linux/system_headers/linux_seccomp.h	2026-03-13 17:54:03.000=
000000 +0100
++++ b/sandbox/linux/system_headers/linux_seccomp.h	2026-03-16 08:52:25.509=
439677 +0100
+@@ -6,6 +6,7 @@
+ #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
+
+ #include <stdint.h>
++#include <signal.h>
+ #include <sys/ioctl.h>
+
+ #include "build/build_config.h"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index 5b0f2703..3ec0610a 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -9,6 +9,7 @@ SRC_URI:append =3D " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-acces=
s-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming=
-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
+                  file://fix-SYS_SECCOMP-redefinition.patch \
                   "
=20
 # Override do_copy_clang_library to handle both target and host architectu=
res
--=20
2.34.1


