Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8D1CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 16:59:11 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.38])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3614.1779209949979026453
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 19 May 2026 09:59:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=AsC1x4ro;
 spf=pass (domain: ti.com, ip: 52.101.56.38, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H3pezDsxsqTyhV6XMAybHp7ryr9+/M43mDt/Yr6w8zBGYzuRGDNEGCy5R8h5OYVnJO1Oq8/G/AmP/wEfGaN/JotUx/BlXgyTVHW4p6KNDu1TohK0KMiRHt5+VbMyZIlk0tgDVFTNcgF8Hhotq2zezSzO7GPxIA+Q0lBwwPLW3oAYU0Cw9nuKbNmrFyyGmRg6rbnh0heK9dI/GxfOf2OMy3EMY8v0u+jDY2/MMjaGGSV6U8MvY2razpjy7iJXDp6ZjP+mcIMrb5cq7iNdK+k/xIEnl+7e+cQZzFt+WeupiuRE/+ISUKOIZDEern2dUPyr3Lcy+2rPQXhtWE1HK0xGaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oA72vtyFCcUvvfZHwPLuELNePahLxQ1Cm/bDjE6ZwP0=;
 b=KLdq6yiIE29LuyQq65jTg8eco1M0J+4wJGsZl37oRkvyiXzZDYegB4Wg51uzuaVtYWq9DutW7u5/ycZBMijJOXGsFkuelAyeAWeDBMjlDKhanUCqo6U61ZK21xAFOL2yiE4uGQizO9qu/Qv0SRI/us0SR+1Ji1V2Mgw2EBC90/kBlnXASZwNhlyGwBV9HzVVXBMyN687C4Lz7zDxaLoqydFjLs9rWXsxGlbGAjFlYY4MxsgEo7tJaj1eaZhOxABtowHI5P7nGypPrKTjcmQuZbjwTG6aV4NyafzrnW5IwBFCHVk2lQcWUEQLJpOr4mQPN4XDtIAIN96b0EgE5V1NdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oA72vtyFCcUvvfZHwPLuELNePahLxQ1Cm/bDjE6ZwP0=;
 b=AsC1x4ro3v66qcdY1BAdW18GSnaT9UQCGFOqqbuOIdJqZJb1hQwNNqLEDY8ZoPoWVRa/FsdX/vH2XXAXlVLZe3KUo3orwSRchWUyE8aasgqLDGxx7pYo8ICKiTsuQA8VFc/5L7/wF3ed/gtHRuPR3wlRV2hTyKOhNBfGc6ixTRA=
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by SA2PR10MB4585.namprd10.prod.outlook.com (2603:10b6:806:11c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.18; Tue, 19 May
 2026 16:59:06 +0000
Received: from SJ1PEPF00002321.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::ed) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 16:59:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ1PEPF00002321.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 16:59:05 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:59:05 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 19 May
 2026 11:59:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 19 May 2026 11:59:05 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64JGx5WT3900516;
	Tue, 19 May 2026 11:59:05 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH v2]  configs/arago-wrynose-*: Update Chromium branch to wrynose
Date: Tue, 19 May 2026 11:59:03 -0500
Message-ID: <20260519165903.2355318-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002321:EE_|SA2PR10MB4585:EE_
X-MS-Office365-Filtering-Correlation-Id: d83bea78-cb65-4bc9-f37c-08deb5c7efe7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|3023799003|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	JaefHyO7VY8TL0AXTkngERxjR9NZSwWZzMwx16IarjnbKVOe2QC/xGOWHsgiBUFcGQnAlpI7vVEPir6NQCLSgQ52ZVpHB0fi0f0vcQ3xZbybNcT2qZ29ViB1GusLVeEHjUwvFURH3pPMmjWgd+6kGzJY0mmULZXkkREZk8moPIKuHTobXhdZiGOK55a6uwybfoSV38zlN+I2uGqk126KXHtDKopRPmy0i9MY/s14+VLs0JpydOEomnpkPA0k1zEO6X0mz+K/sASny81dE5jk3B7jCs5kDWTIgdZZlCEBx74TZO/5ELPKT+3K6FeFS+cRmaNhfe0+4N8SC1wjTc7rhTtDX5KyzbVnZKDAVYoqhni7iaWO1cxyYzMUpdrdWY5JyOaKgJQx+l9mg05j98Bcv9KrbCqfuohiRnvseTRN4sq+lg2GRivolJUq5YlTe/7Zzwc8HFM796hOjD8W4YHVrOd2PYOV874UZHNpCryV/tRgqEEzbRH+e6sXQ8ej/JdryTePORZ31LKD6caeHPWsVMVH5bqXNH2oL14FCH67o/O/1JITkXvOLgqZqxpcuPdUB8j39f2MR+UNX9jS6xhCOQ3fGGEdP0D1HhoWPaXg/snqTHgOVOr+eAMzIvZytG29ccdJTBsQN+cHv5gi4+79qk2IY+AVH/X55E+a7NTjrigoD1FCGOiN0OTVjScz/r5y
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(3023799003)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b2gq8/wETH3Ey48JkyIDZhhb5Vz2aNRUGwMYHE+UGmFAf/3ekWELY5+EMtqXRCMBGAgeNL4nXTCeIw9k+sZuJ6yI7cWkRVIdt5njvJ2UmfLcumFA6SKcBKnxzQ9l9xO6VAAJ18Nt9n6BHrua+pArccGMbp1mt2K4tQRlynDYrG+TTVI0Lb16l3LKouOoqRDmF8fGOtcpU/knFKTZ7GmhXca3tFOGd4c0jDFhniMflGMd5Fy1+d60q/O5sl8e5jXOqs64f3tlGiPo1SnPmsLiiE4pzHINkWhBnIK4ox0L/HhwCOec1j5Tk/1+glWi4Ov6HawIzlLP0hAmzoMxwDrzMNlEKFvpfYrDJ6BBZeSBtuhP2IJfRxGu9G9b3rsjUPzbGGrNc9SIuj0Udt6qzH1LEzpMeeyuH7/r5HWS/FRiTeMSLUnjrLsxuG+imoxu7Wxh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 16:59:05.9878
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d83bea78-cb65-4bc9-f37c-08deb5c7efe7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002321.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4585
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 19 May 2026 16:59:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17533

meta-browser has added a branch for wrynose, so replace master
with wrynose in the arago-wrynose-* config files.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

v2:
Update branch for bitbake-setup/arago-wrynose-chromium-config.conf.json

 bitbake-setup/arago-wrynose-chromium-config.conf.json | 2 +-
 configs/arago-wrynose-chromium-config.txt             | 2 +-
 configs/arago-wrynose-config.txt                      | 2 +-
 configs/arago-wrynose-luks-config.txt                 | 2 +-
 configs/arago-wrynose-next-config.txt                 | 2 +-
 configs/arago-wrynose-selinux-config.txt              | 2 +-
 configs/arago-wrynose-wip-config.txt                  | 2 +-
 kas/arago-wrynose-chromium-config.yml                 | 2 +-
 src/configs/arago-wrynose-chromium-config.xml         | 2 +-
 src/configs/arago-wrynose-config.xml                  | 2 +-
 src/configs/arago-wrynose-luks-config.xml             | 2 +-
 src/configs/arago-wrynose-next-config.xml             | 2 +-
 src/configs/arago-wrynose-selinux-config.xml          | 2 +-
 src/configs/arago-wrynose-wip-config.xml              | 2 +-
 14 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/bitbake-setup/arago-wrynose-chromium-config.conf.json b/bitbak=
e-setup/arago-wrynose-chromium-config.conf.json
index db4804e..af4ae6d 100644
--- a/bitbake-setup/arago-wrynose-chromium-config.conf.json
+++ b/bitbake-setup/arago-wrynose-chromium-config.conf.json
@@ -42,7 +42,7 @@
             "uri": "https://github.com/OSSystems/meta-browser.git"
           }
         },
-        "rev": "master"
+        "rev": "wrynose"
       },
       "path": "meta-browser"
     },
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


