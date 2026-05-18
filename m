Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09303CD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 20:42:06 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7203.1779136916546808107
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 May 2026 13:41:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jE6t7/HL;
 spf=pass (domain: ti.com, ip: 40.107.201.24, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAV6Re6m2T8L7jgQ5nMK8kd7p8Mrn3S5ijd/xVsQhqTzu1/l1FFocOts0LzsHtE2yBgJSZ47nf7Y7Xy2xnXjbq1f4zaluK0N2vb5iwAY9y6HEVMjUWr2pQMD6w/pCFl7wjR1xU1DHLCIFepyg51ejdQ451TY8PDxXvSZDfDz8BT/zb6KtLYR2ZkrvelTm3ZdFsmaj0ooZRMQOfIvqvMwOG3UUSUC+TzXUgiJanFy8vROlVbTEmvh1F2w7Gv1Izh70tjR7CIHad4kr0BttnlsYkGlKVDNBHU3ymV2BQ6Xgy2MyqBrvmR86FrG8zE5DrKbTD/n9t85mRHom3VhasYHVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQT5mSrp7KAORwHp/bgzD7M5EcZk6/qKj5CcctwCDHs=;
 b=ZBZnGj4ktjU54OPRnuRVVG9rTH1vETc9w43JgtbjBBHtHb9e33NB+KTKxf9lE5BwyGz6Y0SFneSDmN2Yl3bP7gPP7SbcusBKOSGyXNCixQ7yqnOpfBjxjm87ZG+W6011ZWgsSdD4ZejpIkpZSeNG907eHZkyXNign4r+LYWLNxKA8jMv/wybv+40y7vBhr/qA+KWDj0ptocnrGn3JqrN+x+1cFyjtQ5uYGVKOCubQYbDSICael6qQyjE64IC6Xq+z4sFE2Ggg6Paso38sfVvhYyhlvB65IFRlC2BsVi3Z4k9sLsoW2JzOeYb3TzWxJBBGM/aDL4e41Et19MOdMOe1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQT5mSrp7KAORwHp/bgzD7M5EcZk6/qKj5CcctwCDHs=;
 b=jE6t7/HLUQk2iRSNwcS/rQyWgDMpFCUvNyZRoc70Iy/Ho+QG9BxXl1pg1jaqd3BmtWvq8RPnWFwP1bO1x9Q1HLofEJFRRJkmmYr8gKcBd7PHynxZrhsO1azbJaz6hvWdYBzusEOtDmXjG/l5IitQqnkmszK0Y8upi9160Wsh10s=
Received: from MW4P222CA0030.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::35)
 by CH3PR10MB6691.namprd10.prod.outlook.com (2603:10b6:610:142::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 20:41:50 +0000
Received: from MWH0EPF000C618B.namprd02.prod.outlook.com
 (2603:10b6:303:114:cafe::e4) by MW4P222CA0030.outlook.office365.com
 (2603:10b6:303:114::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.23 via Frontend Transport; Mon, 18
 May 2026 20:41:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000C618B.mail.protection.outlook.com (10.167.249.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 20:41:50 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 15:41:49 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 15:41:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 15:41:49 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64IKfnvG2065445;
	Mon, 18 May 2026 15:41:49 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-master-*: Upgrade Chromium to v148
Date: Mon, 18 May 2026 15:40:05 -0500
Message-ID: <20260518204005.1593605-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618B:EE_|CH3PR10MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: ac803a04-8905-4a50-9fcd-08deb51de314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	4hHd4S8tBjCr72nUT4ujhdgzwaAY+3WxTfVm088kIbLT0TY/5bzNqk1lPciUVjQVP4yzypIek2mVTwQkJWdS68uUb+6e5h9j9mpxZ1U4/jraEtwRzPajMsYmR4sLuB4pIgXiE2O+/pvMCG4kpmUnVK1NFX6iWARRayxTFYGYb6X90cAfri+YI6LXmviZ10LrGZhT2a6ONMFpSHNAVkzLI1wNejsUO3StbGQ6gk152e5edcBpT86fnCppdEK8lWrNelJK8kJfXUkORnKKDte0n0hjCbFvzwX8xIdMlWJndxRuzCyZwlc3sl8lyIGeCT3u91AL1hb94UALmKtGdcVg/HuRrzzhuqloyAAzb4h47Nl8voutFD9gOh0du9cASp2G+2qkLNIug1l8gF6VEABI2U5F/KKblSdYn8gfb96Q156X1rOuTvpoZ+jfXFgnmyrpfC6RnRVkvR6ajh6v2XVQBS9rWuLrKTNsSivAyQc6944rWC6HqERYcM8IxLdWNJz7nT4JlnTQR0qgjSJ++dOl6yPZ4g9a/H+VsXpZGFwrsNv/JW+kbLZTMA5gn+7iykbXkH0cXrxKvbYWWabnfszAHfQTG8kt8a5N5SnFjFKHk1b0tdeyPqGyWn77Z3EQ4ICH4udJCiil3s+jRuhIap8XYX9ertCm1cfnkXMkNmpsgY3ABYKieWiFeZHbqcTLA8UT
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4SGgiUKwwpCBd/7egFmfvjicRpKZmEfOzmwsaFrFuApmjrIr2UEitDqjZZvbD4kcmHUJxdK1qcRN4LMAoT21mbpF1RuLBrHl76bUrKnLAIWzS9zMW7inmnDOO0xbreqH8H/1CzeNZSyJUsgbP0UczA60R5MrG/7bYahfOkEjrHxfWdV+xO8utDFa62lYGDCyK52iOO74ONGtepb2dJo1AfYOrJO44LDBobxvfNPrBa4YDRtS14/7mgblHkdxgTPheh1IMtWKk76FLVgTYLyQjNfx8NB8MNmg9pyNQ+xpkr77/5zN98bnVCyZJz2dQa6JrtMqeRIqjfwgDtNcJNpeOdkXo7Tg5Y1qwmNpxvUeZBBjCCoeKBQO+LlPoZazAU5EJKQEZuS0yaqnFtRTM2ZPkIMNOOWKrLqfrR/1foU0jWidCJXv+Tl8dzln9BKARCK+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:41:50.0367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac803a04-8905-4a50-9fcd-08deb51de314
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C618B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB6691
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 May 2026 20:42:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17526

Update SHAs for meta-browser to upgrade chromium to the latest version used
upstream.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

This patch relies on a meta-arago series to update the patches in the
dynamic-layer for chromium.

 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-luks-config.txt         | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 2 +-
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-luks-config.xml     | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index f5caacc..db4e8f9 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8=
f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 5a15a7a..24ac22c 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-luks-config.txt b/configs/arago-master-lu=
ks-config.txt
index 3c6301a..a0215ed 100644
--- a/configs/arago-master-luks-config.txt
+++ b/configs/arago-master-luks-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-security,https://git.yoctoproject.org/meta-security,master,HEAD,layer=
s=3Dmeta-tpm
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index fccce04..15ced50 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -12,7 +12,7 @@ MOTD: NOTE:
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 9f41014..89a849f 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index b1a5d03..341067a 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 45aef4c..81d64e9 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -26,7 +26,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
-    commit: "e252b51fd261a4cb05be932f0143ac444693a1ea"
+    commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
     path: "sources/meta-browser"
     layers:
       meta-chromium:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index 9091595..2332343 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
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
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 3718323..3e5a647 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
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
diff --git a/src/configs/arago-master-luks-config.xml b/src/configs/arago-m=
aster-luks-config.xml
index 7e3b3ea..3afad67 100644
--- a/src/configs/arago-master-luks-config.xml
+++ b/src/configs/arago-master-luks-config.xml
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
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index 4098010..e94e067 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
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
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index c41e735..d7b4c42 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
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
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 030ed14..c66ab9d 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
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


