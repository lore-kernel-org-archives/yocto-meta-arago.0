Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F14F54AAC
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:02:37 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19141.1774357353708129777
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 06:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=d1wum71r;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.30, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u7dqkwZscdYmq8QFFOpR32Iabbh/Z23rG11x56AoIN0HjIHCbM4TdlL6/VLNOQ3N9iXdv+K36NXeafq2UHRkr/O20IPligm7FQj5Jhdoqe2NxfQEuvZniuZQgkADSlatPdUHfl8ZvYbSxUjvaTnbZutV7B7mW3BjJx9rXXNcEzACjLHa+QwA5E43duoHHg+QSMgS51+JvIW1o29JdOFZxZz7liQnPemdrr8iXmQ+6B9n1JBe67aN1UP99G+mNYrqdlvDqYwMdLwpHzgeE51s7vXSyIy6Lw+dBzFxS7y06eRQ46uLnAZnO2E77V1KTCZaow9rEnTMu4pkkdmx8CYRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOIQ6OM9b+P3Qyjx2wLbSMu18G1OpE8RuCYMGq0lSJQ=;
 b=FBvLW0DwZw3Avj2nn6paastzMNMG5Ejk+LalP4uu+3bxIwZrpWJ3cvzMJtqtP8kn/Q5wj8Iui3T/p/9HenLhDohFAUQT80jrKDWXR8CPZArIfdSMdjc/ohPEUjEeiEliX+sfPBjyaTl+/87EhwGKzsSPZ6Aq19aorz1BJ5KDRAjnkwfH+DmJuGgfq43BCxIKlYtuNMYgTW8DE804Zh39315mXzmnuFNLQbzLrt+v9G1Cpy9GcOS+csg0+jmu/02lsarFGhjXYYteFWi6RcgRnnHYn50Y3SYuneNpbydSdK5zNcAfsh/OLArdb0OWLMt8qssgGXBVqLSNz+8X46RM6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOIQ6OM9b+P3Qyjx2wLbSMu18G1OpE8RuCYMGq0lSJQ=;
 b=d1wum71rekBmazHfhXlr2psrXVIpwzoQArKmGbIASPL3XAuMNPMyf3lCC9Se//CXXVhlusLOEGb6nFomvkGGHawEloGDbbLl166H1CXB8S2/qpGkAjT1BJEN7mhFSKLIBFsiGEyagQ2oEg3eUBxuRWtj4icGStngR+B5RxBdvNw=
Received: from CH2PR03CA0029.namprd03.prod.outlook.com (2603:10b6:610:59::39)
 by DS0PR10MB7246.namprd10.prod.outlook.com (2603:10b6:8:fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 13:02:29 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:59:cafe::12) by CH2PR03CA0029.outlook.office365.com
 (2603:10b6:610:59::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend
 Transport; Tue, 24 Mar 2026 13:02:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 13:02:25 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:02:23 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:02:23 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 08:02:23 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OD2NYJ2189646;
	Tue, 24 Mar 2026 08:02:23 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] Revert "chromium: Add a patch to fix build against GLIBC 2.43"
Date: Tue, 24 Mar 2026 08:02:21 -0500
Message-ID: <20260324130221.560212-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DS0PR10MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: adb6c6a2-9f9f-4206-bb78-08de89a59875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	u+wlzTzsqsLJTH8IHFX2w04B/n0kIGRIWA0m0nIHmrJUudIY6SMyB3yqS3Z9gb6xaqGHQAkf8f4KjJ/tZRGVvovE4VX5PPiG9lFZHN8zwZimZm4JE3y4NEJoNYi0cI2wDvazwcTR/RFpwhjzu0mzWoScKKlruUIgmRFV5LSh9AEB9Ls/bc62hjOPTljvrs1tG71M3Drrp2oPIrD73xqw1r4Pe7mloCD45qiMyFIUqCt+G9mcvyiv5YyXLGT2rurXgks8+YNH9O5Oj0yxl7lxn1WBr/sIqiKji+UqpIb6mrT/n3T587OkWn8yXDSJncJ0WAliRFPxIbiKKgFza75uTjO4zc/SbNJQQSWCMV7iXDxuOHXzYSmCdGQu+ie2Tne3gCGfhGi+0vYGqP0rz00jSRr98R2Y/+6kldoECDSZ9f3P+YABtumiGxaHLU8yx1IKAfL0TdXVMXXZIlOm7wUJOlAPjO+ngEL4mtVSV2wLfKBYEcL5tRovCyOEVvKGxtI5U6+uv5dLlidOfBmbY2SMbNRux8tIfd/r8QQLhHWizQbHODIDKIYGI4kDndmNjw+CMysrAmfc9l4JCbYPAc+cbkxvTiVcWpdBBxteDr203LtQF8gY+W/nCNeeOITMfOWLzQ7WhGkocA+eXOwZHDwfjJFceTRkzPz7POhiEplXEunAlfDdq9UafVp0z8BBbojKnL6F2NPKWQ16H25YqFeUPQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mkEPxZBSmhpV0VrajwspNCz3xCFHw9eviv0Jx0k2ikIPW10OMXIJTZ7pEeSvhRNk//A/ScWbcTwO6Hh+ubWAT038AAklLTWrZn9V1EvlC5GFS4Chyoi3RRIPhNIqsXGVH8EQJcZKStUCAipIpBqIDMU5nmF5Y0mNaoz7LmePKmfrBfyaZ45QApNyTTIsf21DQhIP8puH089NLWEDG/xanqFuJoS1AZZ+CzobxxD+zQs9DzF5M2Axr87ebYtwKRGcthNJSQbAgdAk5LZGLazsb/pfDCW1wk+zQoWFCZc1+pR2EcM2CE/dtyVv+BfleTQUP6gsGgCPVG29PK4T+mnWQsplofGgS7ElcNOJBHMSBYJxBQ1dSKX2Dyru4vMcMHN7OAjpyf8m11RoDk+9J2YNAKnauMLIM+ORlMw+UAqg+bAxIAFsjvf9Rnl+8XLLU00P
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:02:25.2695
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adb6c6a2-9f9f-4206-bb78-08de89a59875
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7246
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 13:02:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17425

This reverts commit 929edd49fb48cecba4277a458980a2d0aa96f39b.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

This patch requires oe-layersetup: `arago-master: Update meta-browser
commit SHA` to build successfully

 .../fix-SYS_SECCOMP-redefinition.patch           | 16 ----------------
 .../chromium/chromium-ozone-wayland-arago.inc    |  1 -
 2 files changed, 17 deletions(-)
 delete mode 100644 meta-arago-distro/dynamic-layers/chromium-browser-layer=
/recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SEC=
COMP-redefinition.patch

diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-re=
definition.patch b/meta-arago-distro/dynamic-layers/chromium-browser-layer/=
recipes-browser/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECC=
OMP-redefinition.patch
deleted file mode 100644
index 999e5fd8..00000000
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefinit=
ion.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Taken from:
-https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc-2.43-=
SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine
-
-Upstream-Status: Submitted [https://github.com/OSSystems/meta-browser/pull=
/962/changes/4e450497be557fc4b5ff1397f78fa0f8381e281d]
-diff --git a/sandbox/linux/system_headers/linux_seccomp.h b/sandbox/linux/=
system_headers/linux_seccomp.h
-index 8690a96eb0..8988836508 100644
---- a/sandbox/linux/system_headers/linux_seccomp.h	2026-03-13 17:54:03.000=
000000 +0100
-+++ b/sandbox/linux/system_headers/linux_seccomp.h	2026-03-16 08:52:25.509=
439677 +0100
-@@ -6,6 +6,7 @@
- #define SANDBOX_LINUX_SYSTEM_HEADERS_LINUX_SECCOMP_H_
-
- #include <stdint.h>
-+#include <signal.h>
- #include <sys/ioctl.h>
-
- #include "build/build_config.h"
diff --git a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipe=
s-browser/chromium/chromium-ozone-wayland-arago.inc b/meta-arago-distro/dyn=
amic-layers/chromium-browser-layer/recipes-browser/chromium/chromium-ozone-=
wayland-arago.inc
index 3ec0610a..5b0f2703 100644
--- a/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-arago.inc
@@ -9,7 +9,6 @@ SRC_URI:append =3D " \
                   file://0002-chromium-gpu-sandbox-Allow-GPU-sandbox-acces=
s-to-V4L.patch \
                   file://0003-chromium-gpu-v4l2-Fix-OUTPUT-queue-streaming=
-in-V4L2.patch \
                   file://0004-media-gpu-v4l2-Avoid-placing-incomplete-H264=
-access-.patch \
-                  file://fix-SYS_SECCOMP-redefinition.patch \
                   "
=20
 # Override do_copy_clang_library to handle both target and host architectu=
res

