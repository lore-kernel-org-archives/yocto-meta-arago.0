Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B311CD343F
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 20:45:06 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7270.1779137101367738107
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 18 May 2026 13:45:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=v5MLNWsm;
 spf=pass (domain: ti.com, ip: 40.93.196.68, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qu827l1bImU6rACSzQpflokza6C++LOiLFm2NitJ/5HBE4o/FcQS0a7ezp/J14UwW1O+GB5viXbrgmg8NpnbPyotyScbU/yZy+9hZPOwva/F2lPhin1g9sGPj2Od5iOqaXl4kKr1SlP+TmaWIxOUhpztzIM5NTjgWG5n/DQYEJT2euOVHBRlw/JrKTtKcTs1dBo82uh930SsKPOJeWC5syg1I7oKFWVXzsr3h7Rmu3MkXNdsUoyVk+8Y2Ita09kaJZ3XQA3t86maqG9gIEmPw+zjf67ah0dEY+GJtiGe7GzO8Ph8w4rrgKELQRCr8qErKDNfrSrGzVAIuBfby1HSpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mQT5mSrp7KAORwHp/bgzD7M5EcZk6/qKj5CcctwCDHs=;
 b=Ss7vPsxRqccPt50/Ps0F/ZjP/suqkbPyiXk+xwaTaOWYXN/pjWrc1l0+IeKt9lOo7W5UvhSxlkctP0LdAf8q5Afxm5OlyyLkP6FPUeOAUE4PVvpnrcNgnOexe8miT8y8OuTcd7CD9W0YURDJucFnKcgcVtPXXXjdr1MWQmQd432x+H0vWvmMMsJK4VWE/5lGU3qqUAYBWVZEBbrestm+Pn0HqrOx3U1ai5MRy24pxeIPfTUytvtslw90aRvnmRR3bTSz4uWLNMC3jrcwapzrppp9PdFYliVXmHl6Ljru4yGkHqvI0Heoj5ZtZFsHkdt0YBh9eGU3IyovmoUvzFzKig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQT5mSrp7KAORwHp/bgzD7M5EcZk6/qKj5CcctwCDHs=;
 b=v5MLNWsmRCgXoeQvFz8BFHqPKt4XXRPGrVa1r5+yGf9DVzO8J0bprhkJ8qTxNG0TrsAahrvnsfjATAmCjhwqEhUPXUaT3hNWJpzA6OHJuaWmz+hHsSjau+oEad+72120666KujZ38IPr61vUvMCoilKg4UJDmd8RvFDj78uKnhk=
Received: from BL1PR13CA0208.namprd13.prod.outlook.com (2603:10b6:208:2be::33)
 by SJ0PR10MB4495.namprd10.prod.outlook.com (2603:10b6:a03:2d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 20:44:55 +0000
Received: from BN1PEPF00005FFE.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::92) by BL1PR13CA0208.outlook.office365.com
 (2603:10b6:208:2be::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.13 via Frontend Transport; Mon, 18
 May 2026 20:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00005FFE.mail.protection.outlook.com (10.167.243.230) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Mon, 18 May 2026 20:44:54 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 15:44:54 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 18 May
 2026 15:44:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 18 May 2026 15:44:54 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64IKisLH2603972;
	Mon, 18 May 2026 15:44:54 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-master-*: Upgrade Chromium to v148
Date: Mon, 18 May 2026 15:44:45 -0500
Message-ID: <20260518204445.1594059-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFE:EE_|SJ0PR10MB4495:EE_
X-MS-Office365-Filtering-Correlation-Id: 09018467-b4a0-4305-c5ee-08deb51e513b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|18002099003|56012099003|13003099007|3023799003;
X-Microsoft-Antispam-Message-Info: 
	v5bHoZg1JBmLc8ansBASiqDREqpetZ6hLA5nJYeGn/2FKRIYE15cDGxJCuXKrkZW4DyoTwIUSvVx7e1MnFk+QmH5X5odRKWtiMXVCyH2zcoS32qnIyzROt8RPMw4EkcWxR28Wg1lGdI4GeYgDvsEsc+l4p/SVMjmKoJTBDT41WJsif6/51MP0KYDQAXrEksmuxH92vnW5CUyd5IfX/UpQNITp1zvQTL2H86yQzXNAfOkFQZZ/f4VMsq3gMjhWNqc2v/1uvOExykGKA+3/El1EI5u2bB7Gd3Q5qRRI5ZhrIjsPJy36oJiXo2Nx402vn1w4/Ia+dzDlriORgptOSwrZsiKgPTDfQZMx/NqyA2fBDANcOcwFvNjVC4cKiOwawEFp798XRc5pNygEowVIsD9F7gPfkA3CW6oOQof5ldEp9BnZi/CPnON6TpySDCNXW+9JBx5T5t3gvumUH4oOHgos/5G2fEldcN13nUs+UDO82HSZQtcXuKSt/3sS7/qFaoM7kwyFUj2FPXJWvwwbOrdXdPtQsvYbCboJYvLDhO6Bi1CK9BU8yG/QMobuQ8cv3Ex85+IG1Lxu77O+geko2mS5/IzB66SWY3ZzZ4Z457n8CspoE/kSwPAa0t55lEzU7U9mQNmvLBMrUYlF3VGtVAKbYHLFr7OS6Zek6p0Dd0xgPXpr7jfcu8y/0X2arP8hUL2
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(18002099003)(56012099003)(13003099007)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Utr432pDmoTTWr4JaVaEupWF0uEAB1Sp/rJLKZidvPWAJxg1JmZGP8XDPAbvZvrC4NC5y4TC7FnHmlpTKqv4TeuoxWXv6okT/ll7icntshPxPrQR14tjVHsRR34LbJCmBzRUPvm0sTfRfDmbT0N9lFzPB+95Pc0wbLiELM/C5cQMXrkETouyR3DlvudsN1CwqEkvUl/DVzTixDCHUuoNBwXPWUorx5ARnH6YIzt84Zz9SADfVKN8MA4KP3/ZPMl1/zpNU7fVYp87vEkIJtRyGQFL1p+1Ebv3pM9/cVuikBY0dVf2A4QffU9+IdRH+3O0/L4Taz5eSZFJf2RZH46kXRRXHpHvtnwE6tQcjLjrTEvrwkM+EXRAPPCWbjAERnbJ6CvAwjDukqN0C+ydhEGCHkVagQUz130IsT50BSdNWAOic6JqVE1/7p8p0J9z/bHs
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 20:44:54.8449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09018467-b4a0-4305-c5ee-08deb51e513b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN1PEPF00005FFE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4495
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 18 May 2026 20:45:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17527

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


