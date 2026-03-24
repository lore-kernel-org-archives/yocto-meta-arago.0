Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795ADF54AAA
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 13:01:57 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.58])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19125.1774357312000908147
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 24 Mar 2026 06:01:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=BWGJ56f4;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.201.58, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u777Ii81Z2RA2dU4P36MxgtcUTMCs9EAHdD//nGbzIkM7kwZjRFtMygxmKYbrHwlUWiLPzrvam17Y+m6gs+IP1sO+1FMPYRTB/3xqCW0aLjbmmTqms2llskMILyjI9lsAI9yBxDDF3+R8RmL+JzWT04DIsV7YXnVfXDtZn45HgvgZGpi5y7Ztk4W4MYB+6jwkWVsYHGvTFIIp+ANjYwJeZ5pfqcg6CP4eugGP7by4bBItyPo68erhreJI9F40Gn7YZuP+nxC/gHadGM4anmlk23bQyv6noYi3mm4KVCBcUUKZ0gNoFQaP3JMku3jM2O1vLeV/wtfQ7vcxoNJfZ0feg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yke4wya1N0fEEndW/hRcg3nU2RxIPQ+O2jN9Ufwtbk=;
 b=vJLjTFOlKahvgxwnP7ZRftCEN1OlcxI/sObd692K+/DpRpmDwKExcAxGwYy0Bs0ynpty2pE/SH+ZqUUeyt+doqGMqao3DivCLhq8894VdbcNfkffguZsA3AMQdwK9vNGFaqY57DuZJ55FgPTop+B63SeSdFMPXr6CKbivYJIgQ3cRRJfdbtveJBgrX8HsFH1dk8H9w79PvlDivRke1smBkUWsU8v7fFV0qs1yAMrzQtGsuV4it3X+2htRhAFrpD9O9hVtGDkcdL2bbS+0IKB7I8wLCZEWSuI5nM4XmPwhQic8AYX8JKT2VB+K+GRMuo59ZXiVHlL8esdowb+tbPv3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yke4wya1N0fEEndW/hRcg3nU2RxIPQ+O2jN9Ufwtbk=;
 b=BWGJ56f4U7i7yjwGrntnXx9MWM6s+GnyacKjzGdIHomIXbUIOyUzG7OZsNdVYAY4xftsugno0M89Eit/ckIgOew28CZgJL+TyT5gK+RsqQtIkI+ycZvDJ4YQlwPqibV0ap6uffmIaqxOtrM++S/OoeeGwYityWWNsnpmCFKqJvc=
Received: from BL1PR13CA0197.namprd13.prod.outlook.com (2603:10b6:208:2be::22)
 by SA2PR10MB4651.namprd10.prod.outlook.com (2603:10b6:806:11e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 13:01:47 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::c5) by BL1PR13CA0197.outlook.office365.com
 (2603:10b6:208:2be::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.31 via Frontend Transport; Tue,
 24 Mar 2026 13:01:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Tue, 24 Mar 2026 13:01:46 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:01:45 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Mar
 2026 08:01:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Mar 2026 08:01:44 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.30])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62OD1iwu2659757;
	Tue, 24 Mar 2026 08:01:44 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] arago-master: Update meta-browser commit SHA
Date: Tue, 24 Mar 2026 08:01:18 -0500
Message-ID: <20260324130118.551882-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|SA2PR10MB4651:EE_
X-MS-Office365-Filtering-Correlation-Id: 147425c5-0845-411f-5cf9-08de89a5816c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|13003099007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	EBIOC43sojNrBqprRCutNcqQulsTwuvJcYSi/g3GV7XuwRxq1F6MWyXu2ohEuYGTrR8JA9n80uc6iGxoShQG7YV/2tWUcaxART2DDkHP9rylgTrAI/kP/OT/RfuTzIPc9I6KYhuGXYFBpPxQbTjXq4U7J0pdG3jebHhJqiVbd/36HlSuPndXXn1tAzh/iG1seMPzAXxpZM5or8hOWq8T+zaZc0VBNHlnlVm/+YFxpvyzQqQpxlLBGtHOJgkwsEwAuphoVwnHPneNBKuYv/sQqgnGtTlABUwWGf/IuOaOnqbSOVyZvCLZhBQwzQ/Rmg3z2x+wRD5CpUMnykpTAlyCM7ZM7/Y6h3TzPZgExA14MLvqUMTtWucgJCnSbnVBwYTD6yYYctrUFJBduI5iCoMurcFwEpHEE2Fyitc1LhyOmjSmOAw/enug1GAG2DGn8l0OBH8fjG9QTGnWnG81LcC7Ni8EgBs8nhz9A53oESnl9p0aq0JY7infPWI+UL4/s0j+T5EbYom3A4Rt2DwLmZJVDxDHrC7eq2Zal6qp/JMjK9RUSf9r3kotDDhdzjmoN8ggvJ751MauMUl5gMn8dtdKuz2+lM+684PgUZNMI5EDVgPQs83ha/jN+WcdlDJAR0CsmJgynB3kVycvzsCSqLK63edbAEYHPwK1D2IrcP6R0+YJEpxpU2AhkFBFmVHmtD0jLVY6KDqKVBRq0lm0Yyde0EA7fzwpY/2JFzYao4oKUiM=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(13003099007)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	2noMRdWffmku5ffu1tSmoCl6H4BxsXlL9JGtJnt2XfyuYcqCxW8uHemp8TbqMYNTugyHgmV1AVCg2PINyAE7JKie7SmdXj3+ePf2Qegwv2luPoyT5NyX1XxuV62ZIDOupL4UjjT9IL3z4KFHGbDOfdtSfkSsAm0lRePjsb905dQRzn58k1uPc3R3djcbFxWQKk9XGmo0huhMAffJL90vHk43GHxTsiaBj32Nq14gT/row/T9qpKPF71twGDk4/+HqhI87p6l0qzCbJfCy6Tae3wPcoFRhc3QkFkJIxCTdsopYJO1teJOPswvs46JboPNbLf2xZbiamwfLz6+mbjYQVy5UG6lUBGQii1FJG+000jNxDEuzofkBCXdOHqxObrU7/DAwMeWY7YGdUcD3qOb6qOS2HrTq/Jq7z4vVc4hNmUlwR+cumbm4zsXmQsLLQEz
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 13:01:46.5833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 147425c5-0845-411f-5cf9-08de89a5816c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4651
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 24 Mar 2026 13:01:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17424

Update meta-browser layer to commit e252b51f which fixes the layer.conf
incompatibility with wrynose and adds multiple fixes for v142

Patch Notes:
https://github.com/OSSystems/meta-browser/commit/e252b51fd261a4cb05be932f01=
43ac444693a1ea

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

This patch requires on meta-arago: `Revert: chromium: Add a patch to fix
build against GLIBC 2.43` to build successfully

 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 2 +-
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index e1fda52..1a2a0f1 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f=
261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 53262bb..132a505 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 0644138..1744c2f 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -12,7 +12,7 @@ MOTD: NOTE:
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index cd0ca0e..96c8dd5 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 1ad6f58..9f38a6d 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index b114247..3c83535 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -27,7 +27,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
-    commit: "5f14862f261623d48f412af0be94a6721ade3930"
+    commit: "e252b51fd261a4cb05be932f0143ac444693a1ea"
     path: "sources/meta-browser"
     layers:
       meta-chromium:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index c242124..ba8ff60 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 28cd760..c058317 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index 8a7e009..14b0e88 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -24,7 +24,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index b09a45c..0ac2929 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 497f431..6e401bd 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>

