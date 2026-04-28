Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3E1EFF886D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 19:10:14 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.19])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.339.1777403406194684019
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 12:10:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LYTabs3d;
 spf=pass (domain: ti.com, ip: 40.93.198.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ih50fIa5JJ/EVd6QTt5bL43T7K4EEAIe3KRu67u3cYYDOO0UiYaqr7N0T7inhPtlFA4WbOGG59PZ/BFezo3zQEWVpWNTkXih1LoG5jlSoKZGR7f8KUOB1M3t9hotf94yzbsWgyqAVkbTCnE73pX1hBpPoYi/lW4OrlPPjvNq5mcd0IxQ9NOggLO3acZxfAVYQAS2WJl+SlrK6fvOk5xRRg36xrcWSLqaBxLUpFmS51IFq/lOdjXcEan/soKfzZZh3Nn7DLDjq7uY+ydrLs+CsiHutX/33mjNOYgBHyNCtEU5ACBezJVf67q/TcWRhgpnPzDPp0tu6wCH28FFUmN0Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptZCq3guYvqfMu1+9WWrNxKwdSkqmED8BJGjL8bjK9Y=;
 b=VqernpR30L6gUkpC1HRoJ7Y9knuZLMVVV9Qc+/0ow/1UaFevEq7zG1AVYyKwJ8R1/rYmwutUXXOwKORNrfoIpi0Zv3RgE/tHteBpXWh+UCsC6RGrvvrCrEk7PNKX9wjSHd0jnF5bPVuL0XMsX0JEZtsHBH7iBC/lRmVaZQuAAAO3mr38mP4j7YosQRJrEJcqomPLeCcN4Mosss17IhckK8k3U8z9Ub0opqPA+pH3nZSWct6bYBfvd9xV3d12GN4lEEQ7hXWe8w24kJAFDJSPKye/QiME1mBj3xUx8ikMfZoQzhKsK3Acd/BlA3Di6Arn4siSNLITSdbwg/XZLUXJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptZCq3guYvqfMu1+9WWrNxKwdSkqmED8BJGjL8bjK9Y=;
 b=LYTabs3d8PcucwPXeB9bnb+es171ppRTNQZz5afxXPlnBnJa+Ncqx5kBEEvElK9LE9P4y4OWk326K5E3nUNgMvE46aPT4x/r987r+nlA+CllctgwqWhG46TplH/3d6AB5rcsdJCZsXfuHV85uOIj1vOOW9Jae80ddTb+m84/Svg=
Received: from BL1P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::28)
 by SA1PR10MB6518.namprd10.prod.outlook.com (2603:10b6:806:2b4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 19:10:02 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:2c4:cafe::7) by BL1P223CA0023.outlook.office365.com
 (2603:10b6:208:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.28 via Frontend Transport; Tue,
 28 Apr 2026 19:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Tue, 28 Apr 2026 19:10:01 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 14:09:48 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Apr
 2026 14:09:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Apr 2026 14:09:48 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63SJ9mVC1553532;
	Tue, 28 Apr 2026 14:09:48 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wHnoa-00000000VBg-1wA3;
	Tue, 28 Apr 2026 14:09:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] arago-master-wip: Setup for moving meta-arago-test to meta-ti-test
Date: Tue, 28 Apr 2026 14:09:48 -0500
Message-ID: <20260428190948.119877-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA1PR10MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4fd907-db95-4b75-bac2-08dea559bf59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	ze9ILRqAp8NMae+rDyum4sOZhHX8q3+qg9CHu7eyCvXRsxbmUCMdhPomsDYYKPF1zUsqUn4N4gP1wx7Y0DGez9DfxYxQtEaW+7bYKywZdbwqw6jUglaXdwUSAB7lhvWLiZQKvp+Wy9a0RBo6ocOiBa7rnxqZKd7M2KG2FGJPdVbzg5qR2i8P5NIzeAe2VMTTZ+5Y3WQkQRayYNSJxX27bq45VLJDi9lMM3HeWEWpr0uUtcP9g0uHgtU/0NrZdaw0B94FPac9l2U6OiP57ZX2jRAoYus6lh8z2u/9ikDOaeLEmhS5ApQJpkX4wG9ppoAL01/v3QKcgwDdUrUjt4tIdsdZqBX2hAP6Qik4qoZu1soViN9fQqKNZXzRpjdC9vhGLrzGZEQ2z7FXNV8JelxoVFkrUn5KAOHhkZkezBllTyM9+LhBLpX86Levb48YTPHVV4eUlXN1fZxGgLSVibfcARfKEPo7PZUjUD6mx0AFzx16dveQx/lB2M8AJHP+ILdOQZ88wPZH0lPoh/cJLM+v5SeQw4jvHM5bUxggTEOsEKxz5MKUvAmFeXZ7Bs2cl0m6Fe+cpgcAnfGzjPm9blnwnJHhh/oCchRJdYDdphMmX8uVLTFx8WkKJ670WcLBc8cP8+ZfXv8teQS5lNN51mptNsr5Rf57bQPSCJY1Kyv8xahIZfut75lEdHooDac/70cdEYcj/MUmNrjH3rnLj4kzyOT9drfhc/o7T4MJhCUg2qY=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Bwg3H0DlXT4aGKVoUZCBjFx8ZIM4Mp3LavlqN5yjaiSLpKQZ0LRBi3Nb8HMYh2KjFJoGZGwSB9o1VQR77EKpxn7eSqAoqZEmxEUQzT1jWQh/xvVXyO+q6cjaOWl0pESgDnslimYy0WuOaQGc6c23sd7jCfjuHEpqbj/60JhcFqEikigoVCKKg7+/G6k4MLl94+52J9kfRn9Ovhk25fsaOpsAntG60Uy2qC7Y3tNvBOkv0wqCZKYyc/hgo8XVPmOVM0Ysd53gDTs+qwXNIKDNwamOE6K0ClcykX9V5Okilsg3fPWKgfflaKmcV4LYcE3dssBll7ys7Xr2xcTW9oXk4EixuEHPfgnQNo2daX1pYXqH77T49qtmDUNgmKiHeQuS2zUssBdm+lQ3oYUZURLd0LoqUgzE5u4309r88OdEPMH5Pf6CFyA26+H+Ow0UWIdU
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 19:10:01.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4fd907-db95-4b75-bac2-08dea559bf59
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6518
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Apr 2026 19:10:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17504

We are moving meta-arago-test from the meta-arago repo to meta-ti-test
under the meta-ti repo.  This is an initial change to support testing
that the move is done correctly and everything builds correctly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-master-wip-config.conf.json | 2 +-
 configs/arago-master-wip-config.txt             | 4 ++--
 kas/arago-master-wip-config.yml                 | 2 +-
 src/configs/arago-master-wip-config.xml         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/bitbake-setup/arago-master-wip-config.conf.json b/bitbake-setu=
p/arago-master-wip-config.conf.json
index 7e225eb..ced9096 100644
--- a/bitbake-setup/arago-master-wip-config.conf.json
+++ b/bitbake-setup/arago-master-wip-config.conf.json
@@ -107,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","m=
eta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/met=
a-arm-toolchain","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-qt6","meta-virtualization","meta-openembedded/meta-network=
ing","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-open=
embedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedde=
d/meta-multimedia","meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti=
/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-=
toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 9f38a6d..b1a5d03 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -2,14 +2,14 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
-meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-distro:meta-arago-extras
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,HEAD=
,layers=3D.:meta-flutter-apps
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51=
fd261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,HEAD,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,HEAD,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
-meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index c35df05..94e4c95 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -22,7 +22,6 @@ repos:
     layers:
       meta-arago-distro:
       meta-arago-extras:
-      meta-arago-test:
=20
   meta-qt6:
     url: "https://code.qt.io/yocto/meta-qt6.git"
@@ -51,6 +50,7 @@ repos:
     branch: "master-wip"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
       meta-beagle:
       meta-ti-bsp:
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index 6e401bd..030ed14 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -14,7 +14,6 @@
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
             </layers>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
@@ -49,6 +48,7 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-wip' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
--=20
2.43.0


