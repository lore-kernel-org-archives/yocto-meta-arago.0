Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30651FF6E75
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:36:26 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86572.1773779784746248367
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 17 Mar 2026 13:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=kj38FqNZ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.26, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H15/GE8NlzUsl5iHmU/9g6yZYG3KreUuAnZcT6u8F/JBdRrRGwfCt3G9TSKE3uLN2xjzu153u6sWDD9MueEpFjzSf7uXtWJzc+06kL86gEFTiPIju0IPP8wBpIcX6CA5petAOVtiQLTXJhJzwIsuLnjeC96UPSwwj8ryKDwZb7ql9jL6WOMJ45W0CX+9mEUnkaH8lYwvka49b47eCMI/+dQ6wyV8TGgMOapjs3KTPaRFvZevL+m0tHiCmGc+MjGmlItzU95o9pjgV+6nTD788ZczfDHUgnS8dx4egzQL5MLeaoqs6k5kagAITjROBtYt/BGzDPr+Z6Rbhlyd+wrt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T63J3ylrkPYFLpT6MPzG4amHQMU9pZB/DTKv8qlCqPU=;
 b=ZDjF8z2OKG9koJoC1EWsqZCLXODCBCg/MAeKHy0zlE+ZiD4SDIRnzkNfuAsAoyoD6BeAtI2/SRlAEtldwitEpvhT52wsKLQzM+ewJvRGdR0DXtwuIpph7lM7nxBsgtn0x3YFK6Ietr0aHn53l7JdlAjddbmIlRsQtyrlBgxzO/3WVRWRiGTaDyUXkRkUdnupdB4w0QSgMidOhPplSlQxuzU/bWg5dXeuFybi0kISfzfLliD5b6wax3WjrRna6bpm+ockbZKcQX9fvd0fkZ+sTH3b+N5kC9osD5Isb0aPD7enBWT7i50uAUdtOooZ5QlIu8ftysTSvmV4F8jJUAjM3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T63J3ylrkPYFLpT6MPzG4amHQMU9pZB/DTKv8qlCqPU=;
 b=kj38FqNZHn/vPtX/GnTEw9IEcvoD4qi3UAMPTpMoDIF7aGUf67BWxdsFNEQPV7WRixNe7snO4KnzaABmiamfBZO5Ne305bCDRpHy7eUV0+HmS8eyAY4E5DG5IH5mC2/0ZcxEym1SNb/v/YPgD3elURLJAAxVO0DwGQJvPW0BKYY=
Received: from MN2PR05CA0001.namprd05.prod.outlook.com (2603:10b6:208:c0::14)
 by CY5PR10MB6071.namprd10.prod.outlook.com (2603:10b6:930:39::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Tue, 17 Mar
 2026 20:36:22 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:c0:cafe::a0) by MN2PR05CA0001.outlook.office365.com
 (2603:10b6:208:c0::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 20:36:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 20:36:19 +0000
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:36:19 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 17 Mar
 2026 15:36:19 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 17 Mar 2026 15:36:19 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.107])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62HKaJPU3321865;
	Tue, 17 Mar 2026 15:36:19 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>, <a-christidis@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs/arago-master-*: Lock chromium version to v142
Date: Tue, 17 Mar 2026 15:36:07 -0500
Message-ID: <20260317203607.333812-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|CY5PR10MB6071:EE_
X-MS-Office365-Filtering-Correlation-Id: 509d79dd-8838-4971-97b0-08de8464d8a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|56012099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	BZLTh6ZlEtSGATQ4F7adQjzzWHN16oMwaM5XT9sxWg+ny4M1NLRbNpTmFAuDbWs0baqgiBh20QwNH/JAV4qz9YJGuMf7rw0RMujIJOYk+X8Jd65iE0Mhp/LdR8229LWejE27OllSIKiHp+/gTC3yV91zkxl/3HnRF38POj424INQu7xXgnieEJGdLdRvFAriyJhBgs+cJlGbBZJS3Lf8J81CXZtdBDJBd7ScqYBpg8LmBNBPsyc/sojHmGjhx6bBeb8zyxqGSHnEsXfCDu8hTl9oraZovbFdqmI8ypDddCnmOHxRM7z2fUjr1/YFReoiVvO+Hhgw2Uw+545NTsbxyugcnrEjE8+2XyURcZlI5prbvYyvpRiHpmFtA+bYg7wdgK13nq1UJGE8SDcStEgP5tZzm9XX6xsr2HFHjFW/p+bOlTM+FmwPpveElsXTvDU89ih+UIkEnzf6jVo6ih94egFhk0rSA9cg/mNV29W9SKV+do7MGRluOBHsNpK2IzT0CDSV91I1rsmQcrehLN5+1+DM+gl9TpbUjovbxejSQGe62OQXGDtWW7yICUqjU7lnuw2BqLyrQAYefv53RML5ihFSJ6QcTX5Icf6TKNvtmXA6uSBotZL8wKFl2ebsuw8dMVIQ8SotK/6XP9VNVtdAakrVtuvCzMsybc0RgMa2qjiGCljuQsXSZwjBDfcn34jNkBqvac3HQmps2bSjLTDc7XJsI4nhUKN6dy5iFXn+VU4=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(56012099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	y3ny7mH1GqR4v32Ho9wOzQdFuwz4rLLY2U91Tq9B+XruoXc9rTLSHYYpMrhWdMYhqmKOUnEUVbvu4VQxsvxu1nk1Loh4EUBKyTRVwdvkY0WaOuhzZUGnlESChvJypVZ9GaAfsIGq/MkFOMrHvWSKVebQoMc4P1aMdQQluQCxrydqgqlnL9OUEecZsSGCjwNM9oeQkFo3ZOpkqcvbqUfFndRH+bCtDNdWjSknOfeVDqFCVwckEjLUjGCy6XP74QGjZP+3nrBVP65pRs1tyVxaUrcbwGEJFoSDdwX6R0JIU3AbBpeYMT3zUzGnG/Gby/SHtRFWto9+qINEmEX1PRTWsDDJ/k9R4omNMEcc8OrfEsj096+sxicIm+GoZrjcGMmTRh2N1YQJw1sOMb75vOyBP6lG5fkJtFvzdeEuNDATj1vDSuFN9/P7R8StdLrVkhbX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 20:36:19.8400
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 509d79dd-8838-4971-97b0-08de8464d8a5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6071
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 17 Mar 2026 20:36:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17383

Lock all master configs to use a specific commit of meta-browser. This is
needed to avoid build breakages due to meta-browser moving to a newer
Chromium version that is not yet supported.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---
 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 1 +
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 11 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index 66f1be8..e1fda52 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,lay=
ers=3Dmeta-chromium
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862f=
261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 0207d38..53262bb 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,la=
yers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index a9f535f..0644138 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -12,7 +12,7 @@ MOTD: NOTE:
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,la=
yers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index 2f0f9ad..cd0ca0e 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,la=
yers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 84bc59f..1ad6f58 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,la=
yers=3Dmeta-chromium
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f14862=
f261623d48f412af0be94a6721ade3930,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index 740c6c7..b114247 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -27,6 +27,7 @@ repos:
   meta-browser:
     url: "https://github.com/OSSystems/meta-browser.git"
     branch: "master"
+    commit: "5f14862f261623d48f412af0be94a6721ade3930"
     path: "sources/meta-browser"
     layers:
       meta-chromium:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index 8c30eda..c242124 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'HEAD'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index d17789a..28cd760 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index dde55ec..8a7e009 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -24,7 +24,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index 7117b64..b09a45c 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 3a621f3..497f431 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -23,7 +23,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'5f14862f261623d48f412af0be94a67=
21ade3930' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
--=20
2.34.1


