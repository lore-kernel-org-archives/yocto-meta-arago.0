Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4393AFEDA19
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 19:38:23 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.84917.1773776296159431440
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 12:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LUrz1MGu;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.2, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUtTknVhSUiNIdSnBvCX/UoaToGl6DchvFOlU9Yxzgtw6Vb0Gnde+hLzCEi0FgsU3ysc3rrRDvfik57xj+poWCQqeOdvJ+utDim80UEdvk8o1ldckNtsx10LIFYVrziSGWw5gMpUi5o9O5rw/Nmzz7corgZAa6R9WJJHvCed9aVpLmjS7HB0gZbWFp+omzAIrtq+EPJHVkIN63YTIwpG5R1cbsD7Jc70HWnRZQRKacTHyDfHa1h698ZzjpZoQE8fth610hoQCz1vWeDcvfsOnL3I6Jfm4F76DbI0GGJBMo7sibpR8z6J9pcNhqiF7UJjxIZ4er5NVxpwF7ZR8eVgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gxh97717AvKHQ5OZWeAdKCDdiQT9PHaGWdea2n8AObo=;
 b=lA1054LWFYg2PpFGgB4pYOIiv+75yOC38Aqp3LWYx3i9hlkXSi+/T+/SihFkmM8H106UTzt9D7QSDEj4X2LzkfKRU6FNeTrr4gzsVLC18vwQXcvXsKzfHe7tYHdAOUAzRqf3+GaaUfbfHFAV6S4/GnNdosbLWpJISMu4SB5eVn5nf3XN6eHwL8W7cv6gzl8Cgq0IQ31g+IRHlDsX9yv1c2lY55fzNZX+lAxmC60zxuodtmtPNKUQVAXRxvE1N59VMG5OGAO3EHxYqX3hZZixUTu6f2oTSjc9Ln+xcZEeveyfO/Qds17QNIXiU22enGlAIaDQRrZ+THF2RDjZ/Km9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gxh97717AvKHQ5OZWeAdKCDdiQT9PHaGWdea2n8AObo=;
 b=LUrz1MGur8kpYfdLxzxpLEwGZffiAvTSqply280dYEA145o/XSg8kwJR1cVwNtnIkPm+YOxBQgdIagyGKrNC0rKILij1rAAPnuL1qzcKrN4IK6a7AJw/oxfZIos2/GYchzlmutonpO1KB0LtvNCv0ct6nW+MBIeRz8Jvy4knxLY=
Received: from BN9PR03CA0852.namprd03.prod.outlook.com (2603:10b6:408:13d::17)
 by LV2PR10MB997779.namprd10.prod.outlook.com (2603:10b6:408:378::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 19:38:14 +0000
Received: from BL6PEPF0001AB53.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::22) by BN9PR03CA0852.outlook.office365.com
 (2603:10b6:408:13d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 19:38:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB53.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 19:38:11 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:38:09 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 14:38:09 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 14:38:09 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HJc9VC3734637;
	Tue, 17 Mar 2026 14:38:09 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][master][PATCH] chromium: Add a patch to fix build against GLIBC 2.43
Date: Tue, 17 Mar 2026 14:38:08 -0500
Message-ID: <20260317193808.343457-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB53:EE_|LV2PR10MB997779:EE_
X-MS-Office365-Filtering-Correlation-Id: f144ef65-ed53-4ce0-80db-08de845cb95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	KBFFNGGJQnH3KrBWzldede+tKhAOCjc5ZJWrH76ket52SK3pAMSEiUjsblvQI4uUrCqUk83hq1ghSmVZLGfYhEtmt8ovBqOtorx0BxbNldEWbHMr3GF+PdKTlKnGT9HnsPU6UJRkxxd1QjmVoOLE8ONpMvLzRTqK8Hv3/fN3hqzniRoZtYeAsuulCIrEyYMzEHEtuRc12UiccmslIXepgPc5wkUdEXn/g/QgRozJV7ggPnP3Tm5VB46LqAGZLFNpgSu2u3gb2z2yrjP6lle7g0OipE8Du8SP37ukFZ30Gfd3clT6+U86ofcGa4TdeQA2+YemaDmJqsH4cjxPEOtqsx32JrwRSBbzp7DrRLAW4tq1P92dJZM7ntIKQCpkvXlnbZjTJYyNZBwXZ0z9VEO1tlxrmdjEEOz38kfi6mO1VeNsqB/WliLTr2HggkES4lVL3uqjgoduSvWoLFgddJxCu21sm76FnfHSJsiaUeIIQz8nr/8LQq1sLPuD4rchxqA2BfpArfAf9ZpQyruYf4twMvBt/F4VhyXy5GW2auV3V6AwdwQxLfTflG8/zTMGw0rpE6epXdbBY1dDLh13/n2/G1VtHY8aYv96h4tBxCWLg/2oDSFsfQKWjdnOOslzYWgraTBpovNUyXQPcfkAU6nVDmmjmSXugkYZViXJXe15wk6K7fk8OpQBg9sYcg3LcQ10CVQ9ed5F2BrI/0RA4edZgZXpYmXa6jwWkWh+kLegEaA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	RvckL1u/UbCVm6DQap9Sy/sjCza2E2f8za2kz8Gz407pNiyfKwwTztzuWMlSJaJQgEeK5WoV7aXZQA1ZsuwEvUI/qiTE61gtPGM+mxwwOwKisHV4kWvQXunf670rX760Qj4HN4wvXaAUYkhT0wntEVPZHepLjuivxKt4JEjhPJRR8hP1XTfYLQAIndFQM1XAgOaZImWfwZnBjsrmA8IXG67zexlGXBiaXVG7gO8XkYr0dWgs3PfgoCCO1PlmQk+10Shl1gqJmTJI+Lo7HxFreGVgC6xRrLxfD83ClQPz7JKk0GhZdei1eX5o49slZo+OtCFKYgEQksWOAscgrxVdmLHN+BqEK+ruILRxNPqaPDLS3pIdL/xQPtwZeDk7EXt5QrdtWKmnBDXMWKnFeNwlU4NtexdZRVVrmC3aB1Z8M1SstHZi2WglOqmBTAwsJ5yz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 19:38:11.3567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f144ef65-ed53-4ce0-80db-08de845cb95a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB53.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997779
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 19:38:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17372

An update to oe-core leads to build failures with Chromium v142. This fix
is currently pending in meta-browser but is needed to get Chromium to build
succesfully.

https://github.com/OSSystems/meta-browser/pull/962/changes/4e450497be557fc4=
b5ff1397f78fa0f8381e281d

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
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
index 00000000..594729b3
--- /dev/null
+++ b/meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-brows=
er/chromium/chromium-ozone-wayland-142.0.7444.175/fix-SYS_SECCOMP-redefinit=
ion.patch
@@ -0,0 +1,16 @@
+Taken from:
+https://aur.archlinux.org/cgit/aur.git/tree/0007-qt5-webengine-glibc-2.43-=
SYS_SECCOMP-as-enum@chromium.patch?h=3Dqt5-webengine
+
+Upstream-Status: Inappropriate [glibc 2.43 fix]
+diff --git a/sandbox/linux/system_headers/linux_seccomp.h b/sandbox/linux/=
system_headers/linux_seccomp.h
+index 8690a96eb0..8988836508 100644
+--- a/sandbox/linux/system_headers/linux_seccomp.h
++++ b/sandbox/linux/system_headers/linux_seccomp.h
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

