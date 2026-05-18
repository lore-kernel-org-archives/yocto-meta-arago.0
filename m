Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D02CCD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:10:46 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.15])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7834.1779138642584770402
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 May 2026 14:10:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cspK8XLr;
 spf=pass (domain: ti.com, ip: 52.101.57.15, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DEzjciYom0xSCu6upSQQG4AM0T/4iIsaKPQE2XQWPXpeu5cRORRxKQ9Ubw25Tj+sXQXCpxbACtfgktS1ZwZnOywIMqpsvG/pfSG6g1wcMxnTuKrbogZtQGcK7aNmaWc1pV1/ko6DzxB1CmpVgi5Q8A6CKyL+cyGQPO676YCMXGu5g7by/yXyX1y85E9uRS2cRlrM2MwIE7uAB864OElmJUa4jQMFOwxnE9PcOJg7nlahMlxoRwFuOlFJYh1C9wquHOhZX8biNCEwd5ERiEAaFUYrYjUxaEJKqMDAbcAyMkDUmE7UFl4+CObuZSUiRyXrL50eW595/81gpmP32GujHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Rrnz/li6myaJjcqWhwVYNSuehHrDQhV+KvgXzaeRUo=;
 b=ybdAZcCC7xyAK6ZUQbHT/kHFdfbwyRjQy/7MVOiV82Ficx+8tTeUmUkWvskaoSg9at5vmyW1OGSc7bZ4ZP32F9k3D99CwBOg2jVZ1gjJYIG65GYuAG18SBejVpOLy3UK+FeA17axD6CTUH7J6W+PwAvgO0gTZwPwHGLNM9X0o+Bee5sCWm+RIqMNQOcoGarYcI1sGWuSuNINrbaEO6XSZd9gUJThqWlM0cLRpAfTzERHibwyjWL/3aLBqEtRDv9oDKZLXzuDeeavJggDZB9oHBsqHpG9xQpZjPm2bu2dQrpVtoANUqy8H5PGhrBDRFZA77B2LzguXyZ/on+QCiw3hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Rrnz/li6myaJjcqWhwVYNSuehHrDQhV+KvgXzaeRUo=;
 b=cspK8XLr3Uo0QyInsBGMdnxlh1njXSHCAdYAFOIL2ae/jFFxjb6KmebKt+Sb7e+qqsTzdchEKM3bAjKca8z+4rqPN07oFJ5MGd1Hd5OpaoCB2LaFruiIDg7dwEEq9+bhtpshgDQHl4Q7BCU6YYEiop/S9Z7HSJfKkEK2/L4WLls=
Received: from SJ0PR05CA0050.namprd05.prod.outlook.com (2603:10b6:a03:33f::25)
 by IA1PR10MB6074.namprd10.prod.outlook.com (2603:10b6:208:3ae::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 21:10:40 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::13) by SJ0PR05CA0050.outlook.office365.com
 (2603:10b6:a03:33f::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.19 via Frontend Transport; Mon, 18
 May 2026 21:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 21:10:39 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:10:27 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 16:10:27 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 16:10:27 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64ILARXS2646647;
	Mon, 18 May 2026 16:10:27 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-wrynose-*: Upgrade Chromium to v148
Date: Mon, 18 May 2026 16:10:22 -0500
Message-ID: <20260518211022.1595819-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|IA1PR10MB6074:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d5cd9f-b6a0-46cd-bd6e-08deb521e9c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|56012099003|18002099003|13003099007|3023799003;
X-Microsoft-Antispam-Message-Info: 
	GKx5NZc16fEVdMroqK4ndDiM/6TSxR7BbHeI/Db417FRxx1anZOEFdl4yxcZJ83kMsof8AkmV/ZrPmUZ6FFNBQdnFCPo928QL9SDAL+Cc5Zc9y1jRL1b42lxyeBo5tickC0BVNaMLlzhp7Gjyng8SFn3YaeLsrlvMpAf+j+1ZxB6t5eT0XAhmJazXWSOgbNZZBkFTKcFKYEDLiy0zN5WJ+edYhoJokY8FUErhVhRKvZP9dzHnkeiEKFxC1r0oxxREJ82scjwxF9ePsnLOmyWhZpGqMHeY4j3iF9GIRyWkI9juXLxt1J33DTEr2Xu+uI8Vsc0BW8/97DXjEhAe+1KX2IYIwZMXrPpjy7VRX5szn/d2sCZDR28AxTDmTqRv82vuNoXcM9qlUL8Yin5cey8LC4FwjWB5Hh5T1JPFB2cH9OR+Zff+sRW42x4JqS9OWhELrWDJs2Scsop3LrSfIO6fvNgaMdJ5vOG4SUKxe83fgDZzpMOR3rG4c/zK/QxMfEUrXQOXZIkNcF+NSojXdGxwRVYgg7Dfi38An6bEUSgmQzmdLSZDSUCsXCbSAAjssqBPx+ELqgTf+GXbywKIZtHmMHxMZLINr8vvXJ27l4jzr4vpTDAMiiez5kyIUueUxqZG5HiBgMcLoH1DBIQRY76vg+WsoqW6EVb8IuyVGBq5czg3noH4kiHHs/xXCbtIDKH
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(56012099003)(18002099003)(13003099007)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hSyOlO9SafEWV87PEK+IkkWscQIxZx+2zCUN+Oeng7P9OxBHxzUdJfptcCKAUS2Sdbq6LWftWqBpKPQOWhwR75QP2RiGC8kHn/wcC/aOuXFhGZV/WxJ17ynWuPtCCD0MOq3cxMyOuD3b/TjLysZYBNfsmVLtsKr0+XPlEj+pT+6EfKUduXT3EfIZVrSDIN8Uxw+BJlzMoG0ZZqdnBor06bNCKJbf4pxeV7f6g+NuElfs7zY4/910WVSS0CFdwEWkDHGvTCAtrBXu24oCAiGCwy4+AsH7W7s8I57gA2RI9nja1ZsDenDv7HfXBDyel+5Gq7pUhTYC3WXojyoA7uibvftp2HtTBFG1bfhgD7oln7BroWZfGOL2GXzyzMkGWv3KpuxEX9G3MtT62LXaBjzwHlMUdB8xlQ5t4KC4+SR/XaXHeK7Sr3eMJTnjH6t34PQA
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 21:10:39.2474
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d5cd9f-b6a0-46cd-bd6e-08deb521e9c3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6074
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 May 2026 21:10:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17529

Update SHAs in the wrynose configs for meta-browser to upgrade chromium to
the latest version used upstream.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

This patch relies on a meta-arago series to update the patches in the
dynamic-layer for chromium.

 configs/arago-wrynose-chromium-config.txt     | 2 +-
 configs/arago-wrynose-config.txt              | 2 +-
 configs/arago-wrynose-luks-config.txt         | 2 +-
 configs/arago-wrynose-next-config.txt         | 2 +-
 configs/arago-wrynose-selinux-config.txt      | 2 +-
 configs/arago-wrynose-wip-config.txt          | 2 +-
 kas/arago-wrynose-chromium-config.yml         | 2 +-
 src/configs/arago-wrynose-chromium-config.xml | 2 +-
 src/configs/arago-wrynose-config.xml          | 2 +-
 src/configs/arago-wrynose-luks-config.xml     | 2 +-
 src/configs/arago-wrynose-next-config.xml     | 2 +-
 src/configs/arago-wrynose-selinux-config.xml  | 2 +-
 src/configs/arago-wrynose-wip-config.xml      | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/configs/arago-wrynose-chromium-config.txt b/configs/arago-wryn=
ose-chromium-config.txt
index 6982789..dc98beb 100644
--- a/configs/arago-wrynose-chromium-config.txt
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8=
f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-confi=
g.txt
index 8e107e4..209d6c0 100644
--- a/configs/arago-wrynose-config.txt
+++ b/configs/arago-wrynose-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-=
luks-config.txt
index b455a1e..2d3c618 100644
--- a/configs/arago-wrynose-luks-config.txt
+++ b/configs/arago-wrynose-luks-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,laye=
rs=3Dmeta-tpm
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-=
next-config.txt
index a7af660..f9d4b7b 100644
--- a/configs/arago-wrynose-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -12,7 +12,7 @@ MOTD: NOTE:
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layer=
s=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wryno=
se-selinux-config.txt
index 26b76f4..bebdf58 100644
--- a/configs/arago-wrynose-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-w=
ip-config.txt
index 8b06c8d..e2682d2 100644
--- a/configs/arago-wrynose-wip-config.txt
+++ b/configs/arago-wrynose-wip-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/arago-wrynose-chro=
mium-config.yml
index 9bd5d2c..b86cde1 100644
--- a/kas/arago-wrynose-chromium-config.yml
+++ b/kas/arago-wrynose-chromium-config.yml
@@ -26,7 +26,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
-    commit: "e252b51fd261a4cb05be932f0143ac444693a1ea"
+    commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
     path: "sources/meta-browser"
     layers:
       meta-chromium:
diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/ar=
ago-wrynose-chromium-config.xml
index 0ce3f0f..4800d71 100644
--- a/src/configs/arago-wrynose-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wryno=
se-config.xml
index e47ffd0..f0f6ca7 100644
--- a/src/configs/arago-wrynose-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-=
wrynose-luks-config.xml
index cc078b5..d653be8 100644
--- a/src/configs/arago-wrynose-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-=
wrynose-next-config.xml
index 6e20699..f2a90e7 100644
--- a/src/configs/arago-wrynose-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/ara=
go-wrynose-selinux-config.xml
index d594aec..b4bca98 100644
--- a/src/configs/arago-wrynose-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-w=
rynose-wip-config.xml
index 36c4abd..a553ac4 100644
--- a/src/configs/arago-wrynose-wip-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
--=20
2.34.1


