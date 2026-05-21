Return-Path: <p-gupta5@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB81CD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:17:58 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33340.1779358670163199388
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 May 2026 03:17:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Oug1YKyv;
 spf=pass (domain: ti.com, ip: 40.93.194.30, mailfrom: p-gupta5@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpPWCah/yzXTmTk0jz4i0m4AAWfoB6Ti6IkyiQH1hf+m66H+jpsonWXxhmJUfs++JsuEeK/vCScI5aCxk78fsCOvdQIKk49IUTZzyNLBqH1cDECM5QFPxSDTEsZn7H4SchhqT10vCf2zTZwyzCw/MVWkqSfUaiwFovhNdEdGoU6cbGC37X5dEa9vJPthb3JOABBStMLJHca1PjXPt4IEBK+BaF9XVrSIuD5AP9A4bkvgA0K/qokMJyJq9MU9UjzMaU3kAD9Ir6V727BlZ7Rxvi7dChyaOuEE5dng+30fH/kU5rn2ZF1EGnrNoIU55DvGcTuSLCCH33allaKSdp6r4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GvYA5JB76VjTEOVGAMoEOpS0GdT9enVAMSJZlvKto9U=;
 b=vkgeL1KgwzI9WMG2i0oQF3gBNLz63fMKMncUrAgRXxsV78/YD+iAmIq5o83q56gF3ykyFvvQmIg51QVFsFy5+L5WMveoha1x2MB/GYO+IgUWO/dC0UCb7KHuKwzAddarpCkNt8j4aeQTIYKpVsGYtktp2j0+ytyLc+dXLlwVoh6FChpLNq0TX3R16w/aFNbYbkgjytUfactW3FnuKq1hh5RN4AHJsLE2zU5YykW4v9K27BrN6JeFWhCdkYeTWLopBpThJ/+/+c77SqcuRK0LAXy65PsQF6LUBEKmQFF3vBzW3aIqcnfhiQYLFHPe88Gh+g5LjeGqT3/bPfa6D+dbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvYA5JB76VjTEOVGAMoEOpS0GdT9enVAMSJZlvKto9U=;
 b=Oug1YKyvd/QD/7NStPG2qVVEhTRYMBNksyKo+gGoDQmUo9Ugl3lvdEPppg+gtGyDGufPPtopPlCZKnNgIA/B0+9fWp10eHsFgWfVSOLmIoBsQksTb6DRsz39h/GNwrc/0UPNwr0IqYoQ/31oa3xWYx5to5aoFBTzg3UbFPvXamk=
Received: from CH2PR07CA0057.namprd07.prod.outlook.com (2603:10b6:610:5b::31)
 by DM6PR10MB4139.namprd10.prod.outlook.com (2603:10b6:5:21d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Thu, 21 May
 2026 10:17:46 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:5b:cafe::86) by CH2PR07CA0057.outlook.office365.com
 (2603:10b6:610:5b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.17 via Frontend Transport; Thu, 21
 May 2026 10:17:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Thu, 21 May 2026 10:17:46 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 05:17:45 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 21 May
 2026 05:17:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 21 May 2026 05:17:45 -0500
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [10.24.51.155])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 64LAHhKv3888747;
	Thu, 21 May 2026 05:17:44 -0500
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.2 release config for J722S
Date: Thu, 21 May 2026 15:47:43 +0530
Message-ID: <20260521101743.69711-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|DM6PR10MB4139:EE_
X-MS-Office365-Filtering-Correlation-Id: a1b688d7-3316-4ab6-bd63-08deb7223421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|3023799007|18002099003|13003099007|56012099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	690Ulu71qdRnk/BRTVg1sm4sg/YsrpcC6wOPrzZN4iVzMJ8QEYyeIwi7acknwNPmth5nZOxsi6joV0VLjki/Aj9WB3ALJ+NQQLC4LNwaAzSKvd3Ma/qub84ush1y9jtuFwNUXH1uLM/+d/tDfE8sHYhldU4sf4yw68S98XJBvqlmmzDihfhmAeDeIOqhMNGM3/KByxV6en0S0z5TxcewYVd874VVTGCTaoLlJ9+Jx6et09WFFm6PyMj/iEG0nbWEonOpBiTFDKKJa2oMIz102EokvbFbF2ecKziAXqW1hTbXaJigeM+va8UNq1+lFrOyFt9kWwXkcTTawz1erYPwlRI+MOknEWWT24/rSiWJgCt++MwzzlrlsqbeFXHoO7Qt0jCM1+dED+4ZPQJ/dfPnJdglQg4wDuvI3wT7yu3c7fk/hQ3bQfz32jFuaevNS8QZnJfm8V4CpIfc6dufcu/vVJTHlBxR9nmkko+dR/ujuQwmwuNnzGDPIp9gX7nQUhAUzKEckukDNxjY4nrMCvR4rg9EDPPF3cu6+QQ/UKbf8F2ayIRGptr2OyqrsGAmQNq0u/H3kz0qLAMtQXhzA6uBWE7o7VuDq6H8VtrrnKcX17dNy8DEJSQ+RYKrD+zmOQJzkRb+na+c4XYPiFbo3fUTz/Fems2D5dp5byYvWKsvQEoBZsA2PMkahIQV/7+z+9AZ
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(3023799007)(18002099003)(13003099007)(56012099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FXRgLG+VAB9rCN9v2mjSpJ63FKG88ZofyofP19qRwfzbCyRJTUUBtZXnhZQTtT5fIkDyHyDQsVAgqerH38qvialEkotOJCiGiyLs1ndf7TnoylWdQVmDjbKcd+ySqrVbqWpKRadsQmaKZSUdfukCFUrmhHdBovITM+uaK/uLQSb4mP1uEwPPdLt71mpPEzbNcgSQEc4hH7nT/ajNHNlBD3S7xwhZBFV3ZMBXeuoP/2loa4uGibZmDiBgrvYM04ABoNUzFVwFhB+X9GuXJXZilDy8KtrdM7jMU9XQL6Xns/nNyiDygn6UsU1M2P09Fr0L54mlIVv0qpCD6bADJSddEd4p+JzZF5xugotkQgAUhREJCslxGIJmKGeELiWR2kC+yL693yvzZyOCsgQwCXIMCRhBD4y+4/fOiZy5K1a2W+4uvNpKoeA21PPvfTLkyb0Z
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:17:46.3548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b688d7-3316-4ab6-bd63-08deb7223421
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4139
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 May 2026 10:17:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17534

Signed-off-by: Puyush Gupta <p-gupta5@ti.com>
---
 conf/fragments/localconf/local-arago64-v2.conf |  4 ++--
 ...processor-sdk-analytics-11.02.00-config.txt | 18 +++++++++---------
 ...processor-sdk-analytics-11.02.00-config.yml | 18 +++++++++---------
 ...processor-sdk-analytics-11.02.00-config.xml | 18 +++++++++---------
 src/templates/local-arago64-v2.conf.xml        |  2 --
 5 files changed, 29 insertions(+), 31 deletions(-)

diff --git a/conf/fragments/localconf/local-arago64-v2.conf b/conf/fragment=
s/localconf/local-arago64-v2.conf
index 1e102fc..10f88aa 100644
--- a/conf/fragments/localconf/local-arago64-v2.conf
+++ b/conf/fragments/localconf/local-arago64-v2.conf
@@ -1,5 +1,5 @@
-BB_CONF_FRAGMENT_SUMMARY =3D "TI oe-layersetup build defaults for Arago 64=
bit builds v2"
-BB_CONF_FRAGMENT_DESCRIPTION =3D "TI oe-layersetup build defaults for Arag=
o 64bit builds v2"
+BB_CONF_FRAGMENT_SUMMARY =3D ""
+BB_CONF_FRAGMENT_DESCRIPTION =3D ""
=20
 # CONF_VERSION is increased each time build/conf/ changes incompatibly
 CONF_VERSION =3D "2"
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
diff --git a/src/templates/local-arago64-v2.conf.xml b/src/templates/local-=
arago64-v2.conf.xml
index 797bd39..d9d2ae7 100644
--- a/src/templates/local-arago64-v2.conf.xml
+++ b/src/templates/local-arago64-v2.conf.xml
@@ -1,6 +1,4 @@
 <local-conf-template name=3D'local-arago64-v2.conf'>
-    <summary>TI oe-layersetup build defaults for Arago 64bit builds v2</su=
mmary>
-    <description>TI oe-layersetup build defaults for Arago 64bit builds v2=
</description>
     <line># CONF_VERSION is increased each time build/conf/ changes incomp=
atibly</line>
     <line>CONF_VERSION =3D "2"</line>
     <line></line>
--=20
2.34.1


