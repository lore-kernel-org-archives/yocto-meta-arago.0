Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C718CD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 14:02:30 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com (MW6PR02CU001.outbound.protection.outlook.com [52.101.48.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37292.1779372144390480984
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 May 2026 07:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=YyN0IVOg;
 spf=pass (domain: ti.com, ip: 52.101.48.6, mailfrom: p-gupta5@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RORD8i2T6mmu6gsNBbKtOsLSUzN7Rt3gzTITl7S/wXLeqcT6zAWv/LQmDbP7uo5X2aFwODxyGVNi6VBeLukV8rz8pF0zbmsMeJLIEx3oxS8PWl07vi1Nklt/fzl84LNf+aLOpFJwreCH2dwzmwBd8/ie308vB456NsVrdHySZrLjNIYkB0oYYh/ZpwSAjuTcIgFRN/v1H7+8boX9tx8U94Lr60pjXlSl5ISPw6C+6b6LuAtuXOuawGiOp6DI5A1EVIATvniyDxC1yEqqyfExxTGOp5fR+Kt6Aa+vdKdN42JiJBo642NJOgALch9aSpfeirmSHeEEVi4b2jttxXtbdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3uvVeZVn5g90GC9dziNbuVX0PTbqujUYc+KcP1vv2c=;
 b=BeBnkgJbq/dNq5bAG9wa+u8F2qO4tUo74xcz9TzenCZVUaXts79wkep5dUkcEe0x5TxZzxLh4+rpy98genWEWBHQSahMHTCcBEY3AHOam0Ju3wUrHxaM8nDytolF4REsQf10yszg92m5tFe6twU6FuLpJeEREWMqHzUB/yBm+KSGlevzSIAONgAKwFvrA77HWiJdmR+ruQIrMP+qpweqC7IFZoXKOHytznot4Q/ngAmx1EEq3FhHeF112RJRrk+bpzNo0ZySCe/1d11VulalrWDVRnfO9O+2Fawddd8liICnrRT3kVFom1gh7Ze2WwKkE/5h6WJgzEAyhECUx3uKUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3uvVeZVn5g90GC9dziNbuVX0PTbqujUYc+KcP1vv2c=;
 b=YyN0IVOgum2RUPw3FFf/nVGTyHclCv1i909LfcaDwBEGXgrCztzFkwLYO6d7PPtXP6ypcrMQM/GALYeWfmgPEkEMF1sERs54nYtDeKdekxOPfSyIFPXXtGY1+fk8sLJC9UzAVPDAY1Hq13Jlnsy/204kDn3E7FSw0Z6kuNDVrsQ=
Received: from CY8PR11CA0018.namprd11.prod.outlook.com (2603:10b6:930:48::7)
 by IA1PR10MB7214.namprd10.prod.outlook.com (2603:10b6:208:3f3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 14:02:17 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:930:48:cafe::87) by CY8PR11CA0018.outlook.office365.com
 (2603:10b6:930:48::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 14:02:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 14:02:16 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 09:02:14 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 09:02:14 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 21 May 2026 09:02:14 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64LE2CfG3692507;
	Thu, 21 May 2026 09:02:12 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.2 release config for J722S
Date: Thu, 21 May 2026 19:32:11 +0530
Message-ID: <20260521140211.133981-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|IA1PR10MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: bad9afe4-be4a-493d-ee1a-08deb74190c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|13003099007|3023799007|56012099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	jjmODSTI7Ngo2J2OF50fFPnA52Pb1wMWQVofBY5ksZAX6gg1jXOUGU9im1/jWxzDUKV+J++zwLUG84UxmVoygkrIPRcupkUlo/aIOXwnEarbysgCdOPq67C14LrtR0mcx+5CZcZPpw6QVMTDE0yT7CECfWMzPS1pCTJH7odr1mqHZi1e2xlUQUPOA9CMAxjcpmbsomPRKErqQA6b9VHl4gRvNh/N3kY4q4cCLTvu4js1YKatMGrDEav5cKsq+Gv/cFIwUhdg1tWrGaYHSDyLYUniDFkIjZmMLrhRscc0MY552Uag9k/BFLitgEJcwXGldjH6+cI0pkuINklawC1CLIqSjLIOkKBp3W5pcCsXhyTuWXP33rzaB6bKA42zimsytNSnCY6FmJdIJ3RFRR0vRWKJtlQc6Fr3JLRI8XIWcDs19K6RQCsYBfxo3dWWdk5jF0a390XrwewJ62kyxCwB4Mb6QUyPdEDhUUfCXY9QbawEiqzef8Uadj1hHTp46A0xwDS+yZhY2AAvp5TTgsonEsIoFHpOeZnCEdnnDigx5LsB3z40aCsKEPWFqi60j/YTbe7bcHTO8p0OUWmVtuHcnB40nbypvv8Cuibz5Xq/JMFx3NeEnzfQsIl4U1nI5IQZtqCtxyWRRDzEgG9NYbygVPkR0ZfvLh3gdqBUOgDczdYMBrSfX4yyHAv7bud1mnL+
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(13003099007)(3023799007)(56012099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kEIJ2jB7lwiiBlRCWOdIRU/ILylv5AUgL9g3lygeQqGZ/9JNjVnwlxTveWaVy7+VUY6NEtDg7+6ZHV037hIKih5A3+0Mf6D0nk2kTrF7Rc4e/P4RbIeeSEMjoycCWWuKGkrc6RFLChmqN1RNhveYfY83ODGbEVYqCkoJA0lXB9+bORVZiIUPfXj24TWLZODyKFFhgAliwQkIX1Qsl2w/3Ul1TknGmqho5Yi5IwMOMvxYdGT54v0edec948eazuqUN7MCX8mPduT/P4+XnJCCWCMbgenVD3noebeHwxJfkpi0hUfjB7g2FYuCwgAYOPRxfZLXVc7qW9iYvVjQplu3no2lcxYuLwmoFRC6bNp9kMow3r5D824C27FoyMjWUA8bsm3mJ4m0IsTbRKPYQoxvIhz3ll/HAz3t22Gl3yEKJqkZpri/JBHrm6wTPwsS7jSJ
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 14:02:16.1660
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bad9afe4-be4a-493d-ee1a-08deb74190c2
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7214
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 May 2026 14:02:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17536

Signed-off By: Puyush Gupta p-gupta5@ti.com
---
 ...processor-sdk-analytics-11.02.00-config.txt | 18 +++++++++---------
 ...processor-sdk-analytics-11.02.00-config.yml | 18 +++++++++---------
 ...processor-sdk-analytics-11.02.00-config.xml | 18 +++++++++---------
 3 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt
index 10cbc2d..e439cb2 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
@@ -1,21 +1,21 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
-bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b0f75=
722b9e5923a5bfba3767e7d97a8,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
+bitbake,https://git.openembedded.org/bitbake,2.8,d3b4c352dd33fca90cd31649e=
da054b884478739
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,efba4adb406b9=
675641ee85ea3bce1c375ef5963,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,3dd635f613f7299d986a8ab6bc9f584370f8ed1d,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0b327=
e3feb1144c1ccf05b8278,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,a444d3137a527d4a405=
986a5ffa143ed7dfc0961,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80fb72=
17eeda04e396cf90587dca,layers=3D
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5bce7e26a38a58bb52=
242494e54ab2af40009574,layers=3D
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
-oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671=
a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta
-meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32=
482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,7d07e2=
5a15632494d6c30efb09d68de1c95f9394,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,52380df99=
8b3a8fe6a091f8547434a3231320a8e,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,75=
5bc6a5007feb1d1dcf6f2a155442f997e37e5a,layers=3Dmeta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,216d5b=
adbf187e8e8cfa298534e5e1d37d7d69a1,layers=3D
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
index d90ea43..feebda7 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -11,7 +11,7 @@ repos:
   bitbake:
     url: "https://git.openembedded.org/bitbake"
     branch: "2.8"
-    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    commit: "d3b4c352dd33fca90cd31649eda054b884478739"
     path: "sources/bitbake"
     layers:
       .: disabled
@@ -19,7 +19,7 @@ repos:
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
-    commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
+    commit: "efba4adb406b9675641ee85ea3bce1c375ef5963"
     path: "sources/meta-arago"
     layers:
       meta-arago-distro:
@@ -35,13 +35,13 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
-    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+    commit: "3dd635f613f7299d986a8ab6bc9f584370f8ed1d"
     path: "sources/meta-virtualization"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
-    commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
+    commit: "5124ac4a658899158f4a7a2ddf1d2ca931ec7d0e"
     path: "sources/meta-openembedded"
     layers:
       meta-networking:
@@ -60,7 +60,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
-    commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
+    commit: "a444d3137a527d4a405986a5ffa143ed7dfc0961"
     path: "sources/meta-ti"
     layers:
       meta-ti-extras:
@@ -79,13 +79,13 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
-    commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
+    commit: "5bce7e26a38a58bb52242494e54ab2af40009574"
     path: "sources/meta-clang"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
-    commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
+    commit: "52380df998b3a8fe6a091f8547434a3231320a8e"
     path: "sources/oe-core"
     layers:
       meta:
@@ -93,7 +93,7 @@ repos:
   meta-tisdk:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
-    commit: "32482cad2f630892b733c1457b9e9d835b098174"
+    commit: "755bc6a5007feb1d1dcf6f2a155442f997e37e5a"
     path: "sources/meta-tisdk"
     layers:
       meta-ti-foundational:
@@ -101,5 +101,5 @@ repos:
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
-    commit: "7d07e25a15632494d6c30efb09d68de1c95f9394"
+    commit: "216d5badbf187e8e8cfa298534e5e1d37d7d69a1"
     path: "sources/meta-edgeai"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
index a2295f0..9c71b5c 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
@@ -7,10 +7,10 @@
     <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'd3b4c352dd33fca90cd31649eda054b884478739'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'1640df60b0f75722b9e5923a5bfba3767e7d=
97a8'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'efba4adb406b9675641ee85ea3bce1c375ef=
5963'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -28,10 +28,10 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'3dd635f613f7299d98=
6a8ab6bc9f584370f8ed1d'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'e76bf51a92b41d4cb185fc=
164ae43a863910ccd1'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'5124ac4a658899158f4a7a=
2ddf1d2ca931ec7d0e'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -44,7 +44,7 @@
         <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
             <layers/>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'a444d3137a527d4a405986a5ffa143ed7dfc0961'>
             <layers>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
@@ -57,7 +57,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'5c602337ea1a80fb7217eeda04e396cf90587dca'=
>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'5bce7e26a38a58bb52242494e54ab2af40009574'=
>
             <layers/>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
@@ -66,17 +66,17 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'2b3d2b671a149cbeea2bdc9ba42192da=
2015c3b7'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'52380df998b3a8fe6a091f8547434a32=
31320a8e'>
             <layers>
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'32482cad2f630892b733c1457=
b9e9d835b098174'>
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'755bc6a5007feb1d1dcf6f2a1=
55442f997e37e5a'>
             <layers>
                 <layer>meta-ti-foundational</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'7d07e25a15632494d6c30efb09d68=
de1c95f9394'>
+        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'216d5badbf187e8e8cfa298534e5e=
1d37d7d69a1'>
             <layers/>
         </repo>
     </repos>
--=20
2.34.1


