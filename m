Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42B48CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:07:45 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.1])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2358.1779206862299576950
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 May 2026 09:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=SWDMX9I4;
 spf=pass (domain: ti.com, ip: 52.101.43.1, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akZO5VZh80D6boeLtKOCLALzPczMZomV5Vw8butNsiKLQwpMR7iPQ7PINnIweryGkGPIrFdnpAd0bOuHrkSws+H9jUPAeq98PuCtMQxlDcSedFRW8+l28gIHdFp7YpaaBAsdZZ2DZQhs9o7VHaagckZU1/qD5iB3vdM2kiZT7Mbk3OPxrG5Oj223ND8RV5DeKhi/l9W46JGWpcEK+y17cbFIdivffMA0ODxPUPiB3IUNpt7rl0zv14rqhfJ/JbLqeaFmY7Pg3CsuAZnYAVzLKOWlTDcFwP+aIu8Naw0O6IB7B+3MBBtxEFclUOqZ5PHIofBlJNsdaYrAn+W7U88uJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6d6E2MDh0ogC7C1n6loHg95NzvIjmjSU+o8PYQluj4=;
 b=kbgErE/Bw7Ha7U1WYl//fE5LWhYtpPsuBe5LYx+CQiVSA3wETkj/JWILRMtLhoHIIC6BDgjsS+prwgM7gGusRJiI/GEViQnvXcthwlOW+Ee1wV5/cCEHCwMu6YTcsK1vpj+3wntf/5VObL5tymem8wtjtj91uA7Wx3PkAIZWDM9Xee5o9loIzFZVcrZHycU6smTajsQp5OmsUE3YW2J5NsoSDHQ4jKhSxnSsjEWZfc98klNc12x1OHvW9Z12Jzls25jDfAN4NoVpz7Ba8/p+mAwlg0CGRhQpjY4jWRFtYc9QzXolioCbsmCgR4/TJUG2ZAuYtOXg+E7428kVWYtmOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6d6E2MDh0ogC7C1n6loHg95NzvIjmjSU+o8PYQluj4=;
 b=SWDMX9I4cCeDBYmSOlo3zBGqXa5bTSXqvQMstMUyxDtoU1VHDfYHextD7xWIb/eefumS54u3ktBfDM0pCOsnnQIVcUkqjwkQHhQIEmhOYSF2szEQTWOmbycSck9nF1tt7Cn07OEmVpk12vAiMsOve4oa00O5E7UMaG/lRImaY6U=
Received: from CH0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:b0::10)
 by LV3PR10MB7793.namprd10.prod.outlook.com (2603:10b6:408:1b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 16:07:37 +0000
Received: from CH1PEPF0000AD75.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::2c) by CH0PR03CA0005.outlook.office365.com
 (2603:10b6:610:b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 16:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD75.mail.protection.outlook.com (10.167.244.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:07:37 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:07:36 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:07:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 11:07:35 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JG7Zsm3824470;
	Tue, 19 May 2026 11:07:35 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-wrynose-*: Update Chromium branch to wrynose
Date: Tue, 19 May 2026 11:07:23 -0500
Message-ID: <20260519160723.2353181-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD75:EE_|LV3PR10MB7793:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a15e642-10c3-41e5-9986-08deb5c0bed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003|13003099007|3023799003;
X-Microsoft-Antispam-Message-Info: 
	ra25lAcItSNGvidPPd+3pmgipU25GJphIJSOcyO/JB0uKXwBjlcUk3sKMCBVel3E9OXhyQFIFsaxTobJA9/c09C6/JSC9mEBMOztgft5/rmc6qnxov6zmNWxDYflQBeBVRvhSFsJI3YD3oXjzjNhDIULS3Uo4VUbfTQ/QZHl8pXnMw0+NT9c16IHG9nchPwVUq3h48utLyRp7Fzqq06UGZmm8+6IWmGKKdG4qdyzK4IzBM/iYFzArNUxU8kUdLlZh5GdWY+UdB6jDB5RqS/1jC5CSYZ76fAgIK9z2+Ee+/+0wbHeXqLbEH7VYmYzUfsqTS4LxWbDQcZ5ijUGTKOWHbpsdQcEP9NbhO6z6sLHVg/Ip7GQjmp4QfyV8LNppzamQ04Nd7JS1GYRlNdq7MYD+lNxkXH5M/3Bif9/NMCSOYHaqIJ2g6zNpwk0Rsc8M30S3Qu6qv0VpdV2xvUEVhDMzNqf1DdwLaUCesNDqzxPrxdGBt67DjWXOMcDOLHGyGe4MIzJf8OVohkQTnre25fr5hkp+NwU+mFWNxrT/mbiNlB0zEYW8UciRslCZaXJVy6YecFtzAIjg8YhDMqzvq6WgA1bo4nTBLqC+ywHisNoUFHXNidlWGwoMBUOyfJcGNYXkxV2meWOhCVC2L+BUDMEo3vRkitc9vA6uvv4UtNjaa69o9kQjpl9Pi6ESB6pDQqf
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003)(13003099007)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	GOcdFx7OrDvpIYq9YTC6MXc+1yVdXmReJ3Aa62dlFemheCLyGvPyJG7C+X/MbOV69i83B0llt7cmxcbm2baWe50BBRk1gbhiS3O/XhiyWkl3N9iciVpLeYwmQpxhlltl9RaTowxR+zA4TzTR2WMPguRzcXe9NF6bfNhzHnVaPWHAJ8ldU/s8T7rO21BfFJtMIG5qINAxh5/YkGlR9ej16QHqgb4h2wSOysAZoBjZohLT5192cM7+MgqtpP3yZW6BUwniKf/mGISflGQibul+m8W7zQzsBMwHOIVbHVZ6hcI3ALWHkM/wLy3nPhgnaivWZCzXY+NBvI8WqPnM9TSFdCVVNQsio5GIAWtW1dUMRqwv3QUes79Zmd3/tmlV42GtmEvMlFZ4+VdKZCEEDrcjG405aqxAkrJKlPgh3mVDPmAbNbBhzCkgRiNMZoiMGQZF
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:07:37.2215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a15e642-10c3-41e5-9986-08deb5c0bed4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD75.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7793
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 May 2026 16:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17531

meta-browser has added a branch for wrynose, so replace master with wrynose
in the arago-wrynose-* config files.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
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
index dc98beb..3ac2ecc 100644
--- a/configs/arago-wrynose-chromium-config.txt
+++ b/configs/arago-wrynose-chromium-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d8=
f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-config.txt b/configs/arago-wrynose-confi=
g.txt
index 209d6c0..ad467c3 100644
--- a/configs/arago-wrynose-config.txt
+++ b/configs/arago-wrynose-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817=
d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-luks-config.txt b/configs/arago-wrynose-=
luks-config.txt
index 2d3c618..3975779 100644
--- a/configs/arago-wrynose-luks-config.txt
+++ b/configs/arago-wrynose-luks-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817=
d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-security,https://git.yoctoproject.org/meta-security,wrynose,HEAD,laye=
rs=3Dmeta-tpm
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
diff --git a/configs/arago-wrynose-next-config.txt b/configs/arago-wrynose-=
next-config.txt
index f9d4b7b..c82b29c 100644
--- a/configs/arago-wrynose-next-config.txt
+++ b/configs/arago-wrynose-next-config.txt
@@ -12,7 +12,7 @@ MOTD: NOTE:
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-next,HEAD,layer=
s=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817=
d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-selinux-config.txt b/configs/arago-wryno=
se-selinux-config.txt
index bebdf58..4f7983c 100644
--- a/configs/arago-wrynose-selinux-config.txt
+++ b/configs/arago-wrynose-selinux-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose,HEAD,layers=3Dm=
eta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817=
d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/configs/arago-wrynose-wip-config.txt b/configs/arago-wrynose-w=
ip-config.txt
index e2682d2..dd2f194 100644
--- a/configs/arago-wrynose-wip-config.txt
+++ b/configs/arago-wrynose-wip-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,wrynose-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e07817d=
8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,wrynose,e07817=
d8f8ada5340347c34f1ac6d5ee68eaa5ff,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,wrynose,HEAD,layer=
s=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.11,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,wryno=
se,HEAD,layers=3D
diff --git a/kas/arago-wrynose-chromium-config.yml b/kas/arago-wrynose-chro=
mium-config.yml
index b86cde1..5745c67 100644
--- a/kas/arago-wrynose-chromium-config.yml
+++ b/kas/arago-wrynose-chromium-config.yml
@@ -25,7 +25,7 @@ repos:
=20
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
-    branch: "master"
+    branch: "wrynose"
     commit: "e07817d8f8ada5340347c34f1ac6d5ee68eaa5ff"
     path: "sources/meta-browser"
     layers:
diff --git a/src/configs/arago-wrynose-chromium-config.xml b/src/configs/ar=
ago-wrynose-chromium-config.xml
index 4800d71..2913745 100644
--- a/src/configs/arago-wrynose-chromium-config.xml
+++ b/src/configs/arago-wrynose-chromium-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-config.xml b/src/configs/arago-wryno=
se-config.xml
index f0f6ca7..62f9ac2 100644
--- a/src/configs/arago-wrynose-config.xml
+++ b/src/configs/arago-wrynose-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-luks-config.xml b/src/configs/arago-=
wrynose-luks-config.xml
index d653be8..cb38190 100644
--- a/src/configs/arago-wrynose-luks-config.xml
+++ b/src/configs/arago-wrynose-luks-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-next-config.xml b/src/configs/arago-=
wrynose-next-config.xml
index f2a90e7..fe4783f 100644
--- a/src/configs/arago-wrynose-next-config.xml
+++ b/src/configs/arago-wrynose-next-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-selinux-config.xml b/src/configs/ara=
go-wrynose-selinux-config.xml
index b4bca98..044fe26 100644
--- a/src/configs/arago-wrynose-selinux-config.xml
+++ b/src/configs/arago-wrynose-selinux-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-wrynose-wip-config.xml b/src/configs/arago-w=
rynose-wip-config.xml
index a553ac4..bc4602a 100644
--- a/src/configs/arago-wrynose-wip-config.xml
+++ b/src/configs/arago-wrynose-wip-config.xml
@@ -22,7 +22,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e07817d8f8ada5340347c34f1ac6d5e=
e68eaa5ff' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'wrynose' commit=3D'e07817d8f8ada5340347c34f1ac6d5=
ee68eaa5ff' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
--=20
2.34.1


