Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631CD3EE97
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 16:43:51 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38978.1769093837112439842
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 06:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lgAbwaMQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.52.69, mailfrom: p-gupta5@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oKVOFldyTuccsuAV3DRtv1E642ELMgtc9vne3fV7zM8DnR6KL57bjN7IF7I6siazz3XTUcPukAMXjx1Sf8s+HKJ8MvHArUy/FsGwSNbTX+q4TmoKRckhWNq79FHBzLu83YDiLLpYyNlWNVlFlo0JvCQnN+nL9Lji1x/CnPK/MxhxDRdr8bD7ojFSLcV8P4VWF/bS0JaByvzym0BJMyWq85BDcwXrTDB65sEtbTxKG8bCHt8w1Jel4ERjLqOQTAU3kmDdkUXRPYJQjhZVM1JEW51j9a1fpow45WbNJ/BJ8mEbvWeGuQfhjGMs5wDPzMCUV8EkQnmAGQWhQNHY/IDeVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNtnHu+yTqWTPC5nezurD7Ao4OY90oNJvDe9C40a0n8=;
 b=qBp0eyiVFn5dT1DLZfzkclzBgFgORzqp7cnfpaDEbFTFJk49ISfL20ClMRF8YYWfjthwfsu+Ynp/11jitY+Kr/sFOdALyhew+LkzPqpEk4aSynbWkCH0V1kqrutu5t4nPY6q8nMa2zdcgsJzLAJMPxy0TbXlUkxU0iSYYq9ga7ERptjMoUPrq1OkyTpYQyq+dbNqCRZXa+l0wp0NRnnuaIiIM4W0g8YZfxQDsJC5EzfLGr0K2SbUtr4PoiqKkG6x9hWQKM8m77nHZ6c0F3EjxA6Rs9iaQEPqsHc1/DgVj7Pg2f6e26Nqenwus1JgpwQxdSF1GcWML+DcMf8WvqHSUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNtnHu+yTqWTPC5nezurD7Ao4OY90oNJvDe9C40a0n8=;
 b=lgAbwaMQFXg4kVNCBDiZTQpCbcNuosUv/TkGADLvt6JpusT7tAjIw46mThze14u4MjbhL5PRgmVLAVhnYf+jrlOADWy0fRKoZdX80S2VJcXjRJwxsRYpdtM7MVCetqY7l38EWFMenifZOYr2imI2buqH2Ldcfq2pSEneYTBy5nA=
Received: from BL1PR13CA0210.namprd13.prod.outlook.com (2603:10b6:208:2be::35)
 by CY5PR10MB6215.namprd10.prod.outlook.com (2603:10b6:930:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 22 Jan
 2026 14:42:42 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:2be:cafe::3b) by BL1PR13CA0210.outlook.office365.com
 (2603:10b6:208:2be::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via Frontend Transport; Thu,
 22 Jan 2026 14:42:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:42:41 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:42:40 -0600
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:42:40 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 08:42:40 -0600
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.235.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MEgcxO577679;
	Thu, 22 Jan 2026 08:42:39 -0600
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.2 release config
Date: Thu, 22 Jan 2026 20:12:38 +0530
Message-ID: <20260122144238.148914-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|CY5PR10MB6215:EE_
X-MS-Office365-Filtering-Correlation-Id: 49c58061-04e6-4bb6-0bce-08de59c47f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jYwKu53leKhjX0IfI3/oyQ3qnRzXRtmPS8fObLwTkdjDCHmOAjVLHhFBHYYH?=
 =?us-ascii?Q?CKMhWzAb4jMg+VyJx2uVlYQpcEzROdQKV0DtXODMVQlbSNZDVNexI8a+D0FV?=
 =?us-ascii?Q?yR+VK0k3WY5/fQIHEvHfLKQOTbz531TYu5xOVERRKep4+rDEmrrwffy2g5CY?=
 =?us-ascii?Q?LNpKDfFp8uHOEov0gFeoPLFokMHI+QqX+GGfUk27jinAFaeo2itpEyoXgF8a?=
 =?us-ascii?Q?U14u7QKxtq83L/W9W2ZGGtoykaDxpzR1ql9Z4xGMFLnO8230H1hyi4+v93ys?=
 =?us-ascii?Q?oPJSN73Upw1kkxwXROzfDF5CSTIfEW/JH+pKYwNS4DfkGRzMmjaSXx4uSCxM?=
 =?us-ascii?Q?r69/I8gWA3BrcGVFMORRUA8N83ZqN+RSbVSQdbT/kfZUESe9OwQSd6RO5Z7G?=
 =?us-ascii?Q?V5Wm/087kTa70TSAltNp+61H2DmXTwmZItogTbHoP2VWItlUv677FtF5VvHO?=
 =?us-ascii?Q?6ENzjoTL9W2rPmG56hUcqPxy+j6tNmHMEFayeAOZgqNWDPbIy8IBWX4GNE+K?=
 =?us-ascii?Q?/45JTeNNopBeuAetraasCPzq9hTI7zpKsFsHmN6W+VVLUo0g1Fx41g4jUTZZ?=
 =?us-ascii?Q?ArMoZfSRxhxgEKLLI3pDTin/FpgM/a8B3Rl60malVpeBJ0pbeOfODOcwmNom?=
 =?us-ascii?Q?8RxW/vZiSosfD1hyaLwNrdX6FOUO+7cWccOQfhVY2fTj0nWJxVz6zeMxvx2D?=
 =?us-ascii?Q?lS1u9+edJpMAuLPfMDzkN7gzMJK4Wr85Uz+8gnFQ6qhA/0FxJW7Uz9OSeVkK?=
 =?us-ascii?Q?fuhlXIrLj0laZLrDUqCh+TYKbMeaduWFp5LG/g7XK3ZXtwLo+I4lZ85bEhfS?=
 =?us-ascii?Q?JZwuxpp3KtzxMkpVlDAfDm42ls7wzEBzs7iCB0uONgYLNGfrNu5WCsxvwbqK?=
 =?us-ascii?Q?eSsAys8uCyJrAkcs5k9+M/Slgf1oga/aC8fJSOTvJHU/RwD9n2qzCMon3m88?=
 =?us-ascii?Q?M7SLQbFXRG1o5jp4ORJ5V4CHFqQna+87SGzPjWybD7cO1jQh92ea0hFOELf1?=
 =?us-ascii?Q?Nc/GYCyOq1vTNos/SdO1k350E1was0AFWHV2a38BQTDOuMDGjTuP57YSNGJG?=
 =?us-ascii?Q?ztzwIAIlmbZVpVq5s6V39M5oGaVdqPM2Yu7slXjed0paBj1ALWwHVJJfyXCh?=
 =?us-ascii?Q?LwXMvP9Qu4MKF7zizC0AtQ0BjcA6ym10SgIQmOjdnOVerSi5z2O+gWqa3jVs?=
 =?us-ascii?Q?AR6pVumjVETSnzBkxCeL1tTwSIUfXXxNhgSfbv4P3CRWv2+OaAoNhaSBYGPD?=
 =?us-ascii?Q?R+A3FjXa6A3xy6iVeY6I1MIcSQvEw1ZV+A+4Ik7n1m/KkqX49Eynp5RGOWbv?=
 =?us-ascii?Q?0M91cruPh8ti81b7eraslnk7nwFwDZoiUh1CW1WpBecS8ZkqhUkQYaExvSP2?=
 =?us-ascii?Q?y+8DP003l3K7mvBDXPFCvI5hXwRvfugMCv0kvD0n+UiIeIlpEW0O4o7WOSY3?=
 =?us-ascii?Q?bHmaKldOcutClcN1alBoxVoMP3h+PHJLdbnQPl76EEcx8CDH9aFm+Xo+VAlw?=
 =?us-ascii?Q?xm5ppjiJZ/fxeYo0HFdrMQAy7hd0KFrP1YF48WQMMtyRsSAHAGABzT+pVm3R?=
 =?us-ascii?Q?QyWhiPDKTgiwwqIW0F6wzX8qpBRCS8j8AEx2Shui03cpFXCQacnATMZoh+43?=
 =?us-ascii?Q?Hg=3D=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:42:41.3998
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49c58061-04e6-4bb6-0bce-08de59c47f2b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6215
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 16:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17011

Signed-off By: Puyush Gupta <p-gupta5@ti.com>
---
 .../processor-sdk-analytics-11.02.00-config.txt    | 14 +++++++-------
 .../processor-sdk-analytics-11.02.00-config.yml    | 14 +++++++-------
 .../processor-sdk-analytics-11.02.00-config.xml    | 14 +++++++-------
 3 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt
index 6d9e2e7..72b49a1 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
@@ -2,20 +2,20 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b9c8be5cceb1b=
67c6d14a871fe20e599542999f1,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b0f75=
722b9e5923a5bfba3767e7d97a8,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,802cd01e783aeec00af=
81d99cd242f20ede3adc9,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0b327=
e3feb1144c1ccf05b8278,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80fb72=
17eeda04e396cf90587dca,layers=3D
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
-oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
-meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,71=
e97d787810978a21dc536dfe59d0c821b554fd,layers=3Dmeta-ti-foundational
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,e814c2=
3648afeb0efd277ae6a9fce9aba0aee025,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671=
a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32=
482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,9754bc=
67d46fb43667ee720f46254d2c9f52183a,layers=3D
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
index 929d5df..ff1f5e5 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -18,7 +18,7 @@ repos:
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
-    commit: "b9c8be5cceb1b67c6d14a871fe20e599542999f1"
+    commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -37,7 +37,7 @@ repos:
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
-    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
     layers:
       meta-networking:
       meta-python:
@@ -54,7 +54,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
-    commit: "802cd01e783aeec00af81d99cd242f20ede3adc9"
+    commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -71,23 +71,23 @@ repos:
   meta-clang:
     url: "https://github.com/kraj/meta-clang"
     branch: "scarthgap"
-    commit: "731488911f55ebfe746068512b426351192f82f2"
+    commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
=20
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
-    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
     layers:
       meta:
=20
   meta-tisdk:
     url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
     branch: "scarthgap"
-    commit: "71e97d787810978a21dc536dfe59d0c821b554fd"
+    commit: "32482cad2f630892b733c1457b9e9d835b098174"
     layers:
       meta-ti-foundational:
=20
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
-    commit: "e814c23648afeb0efd277ae6a9fce9aba0aee025"
+    commit: "9754bc67d46fb43667ee720f46254d2c9f52183a"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
index 36e7a1b..726e604 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
@@ -10,7 +10,7 @@
     <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'b9c8be5cceb1b67c6d14a871fe20e5995429=
99f1'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'1640df60b0f75722b9e5923a5bfba3767e7d=
97a8'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -31,7 +31,7 @@
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'e76bf51a92b41d4cb185fc=
164ae43a863910ccd1'>
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
' branch=3D'scarthgap' commit=3D'802cd01e783aeec00af81d99cd242f20ede3adc9'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278'>
             <layers>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
@@ -57,7 +57,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'5c602337ea1a80fb7217eeda04e396cf90587dca'=
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
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'2b3d2b671a149cbeea2bdc9ba42192da=
2015c3b7'>
             <layers>
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'71e97d787810978a21dc536df=
e59d0c821b554fd'>
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'32482cad2f630892b733c1457=
b9e9d835b098174'>
             <layers>
                 <layer>meta-ti-foundational</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'e814c23648afeb0efd277ae6a9fce=
9aba0aee025'>
+        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'9754bc67d46fb43667ee720f46254=
d2c9f52183a'>
             <layers/>
         </repo>
     </repos>
--=20
2.34.1


