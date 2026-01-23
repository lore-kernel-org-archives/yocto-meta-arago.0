Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCDAD74EFB
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 16:12:30 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.59])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1678.1769184124595512629
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 23 Jan 2026 08:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=dhTeKSHS;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.59, mailfrom: p-gupta5@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yqLAsbhHGfNdwkO2ZZwB9mvxO9pbOGje5K+kyLsA9qzIQevb29mGYTUp2vWLONc++DXBX+fr9UhZfwBoUXRWiaNrZTTT/ztua5xSg+8qq6dZCIiF7GsPpsk5odsifyE2/l4IqMzCkLt/hYbNR0QnCW/FggohOgN3N3/SDHl5FffTzKLm2T6BqH7hgl9xU6somYhkXMQ3NNFE9OE7vErHWFpSrtdWLtW5Bu0a4e+ah6ReT1gAJRiZqYLjJYfH/Hk00w/dtSxMb40BEZejEdHtMtmdc27w5JJUMlX1u5JNjoPEFlFJstTjenS1HGsCwmXYIa3ecBN/M4YirDtUM9ZUlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fdIIMw03wZh0094tufAaEvcIqHB124uPX+dBYhkxAPU=;
 b=wZn/ulZ4pfTlvAjKkOT/BLeb1UL3+ghS8cMhzJf3pe7SXu7PnmW1wJ9vufrnwXH5wCp8J48i8Xdl+I3YFI9V8VS8bU8eJzVoAeaxVqisFCjKBtD0nbMaYvwXfCJS+03pQwe5mFWpe37ONjGdBOJYAUYx6cVnmf/8ZsJzuPxFoB7Fw963WOTgGJ3pB06o0J6GBJPnSkb6X/oBaLAjxVmM5O9hOyfYhsfxfk/F/YBUM16sGNcbQsdoOM2c5z7mfn3bKwtCzgl+Jc20G22yolrNkCOEH8dl6Mlk3070NRQKWOKjaifp/cqRIdrxEiEi6KWr1cIWVszcMAsHThI7xoXxsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fdIIMw03wZh0094tufAaEvcIqHB124uPX+dBYhkxAPU=;
 b=dhTeKSHSq2wHhfiWDB4xXgojFHuxPL14LCkO8MyIsv+FZeOf3jm6wZmGU+fPRZKRqheHlw4YK7J1sAE/oRbhWeruUT2Cc3WnfVlEa6MKzdKSS1lu9Yuj0qcEl2O3JPjZsgjdk4/lms/EUX8oHEQbTS0xlWO3elaOt1ufWv1K1DM=
Received: from DM6PR07CA0132.namprd07.prod.outlook.com (2603:10b6:5:330::25)
 by DS7PR10MB5974.namprd10.prod.outlook.com (2603:10b6:8:9e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.12; Fri, 23 Jan
 2026 16:01:58 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::ca) by DM6PR07CA0132.outlook.office365.com
 (2603:10b6:5:330::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 16:01:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 16:01:57 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:01:56 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 23 Jan
 2026 10:01:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 23 Jan 2026 10:01:55 -0600
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.235.239])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60NG1rGL2436918;
	Fri, 23 Jan 2026 10:01:54 -0600
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-kapoor@ti.com>, <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] update configs: processor-sdk-analytics: Add 11.2 release config
Date: Fri, 23 Jan 2026 21:31:53 +0530
Message-ID: <20260123160153.607604-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS7PR10MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: ba439303-9442-42be-b707-08de5a98bc30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lJvIib2h53OffFF42pQS94czygwedPGyHg7BJ+/h7iPDdZMOLQT/Dz0WRD9s?=
 =?us-ascii?Q?MQcO1yOj6p2wcGC+J34Q1SkpILpyegbDjuEJxs4+cLJBrJvTwL9bCbEsQg+I?=
 =?us-ascii?Q?gv6cQkUs9et1UmIuzRAjcFmust5kgn6v5Anw4cZuwJZoRneHD6awFbc55GeR?=
 =?us-ascii?Q?+isXX4ANH7hAxiB1rgghbo6/82cFSsZeyx8rI6jUe8muLjTdWeXvm7tuwEMt?=
 =?us-ascii?Q?UTzdSDM90x5QsXSCTDkxqcqVStKDrKjvMr9QWgkgy/z6dF08TLn5qIkV0n4S?=
 =?us-ascii?Q?Ib6jRGFmkuY//ihNFzyBTVTISeiYPOK+oI4QvSUVS4QDv6jUwWWCL2LF3fgh?=
 =?us-ascii?Q?uLsOkXpEOnTHDREyMRUeJnrxBruGkl+BRHBKF/l5Q7Tp4pSHRnSTCSzyw3Vh?=
 =?us-ascii?Q?cLuFBiyGiI/ICdpIWPKeTbB6qg7t87cB7EpT+2Uk1UhAPwwbpO7lk+ycTIDt?=
 =?us-ascii?Q?unx/w6RpYehqw1Nr6ZhYpLbctdOtaL8uPAPPJ+6b5HEAwy1vmTCgBoocAd+n?=
 =?us-ascii?Q?A3l+8Mb/EiFiJfOSd+5qkFWHZp+VUn5YLNm85cgGJl9fW8CkumB1zKtS2G5i?=
 =?us-ascii?Q?dWhpmRXy3OXnjioRAsEP02+gOFl9sl32kFLNQWXQ0Yq4vjk8m0jBJntQMhZW?=
 =?us-ascii?Q?HulTI6iAYtTHc/eeZotB48WFQJNjPh2yAMJuy9reYljvot8PTuxVn/jMnO0t?=
 =?us-ascii?Q?ip5i+7U2RA7otX8AwJ5EU3O91FA+1vrnPUayn2ni9n3WbzhcThSStn663cmb?=
 =?us-ascii?Q?5REuvu9H2Wl1OJ7k5AmFem3YvbpvUZFq3rLIXoV//aSrjU8iN91KjgcpsFaA?=
 =?us-ascii?Q?xLKWK+VDNNqwOtsuCWc8b3mDq9a+u2nrSW9SNOvzOPKk54MQkeqtl85t2Xny?=
 =?us-ascii?Q?DFPRW2u7w51K1zT7kqBmKK7cuM85mZxd6Ll+e+n+xaU4prTY8Yp6L8QDz4MN?=
 =?us-ascii?Q?33Y/J9a5Uxy09R922Ik+1cWl2UNNNxF1V/vnUJrt5DFQxQCat4ziKv/9svDi?=
 =?us-ascii?Q?3KsRhh1sph2/Chrr3mdDNXwU7fBFAFec7YDWc2qCyqH6mbuV1nQnuDARKMhQ?=
 =?us-ascii?Q?jKJfbg/XSwIHwwlY+uAofsDK/d+l+blVK5TbaXmBDtBL5RvMjgTobeHqreZ4?=
 =?us-ascii?Q?kn5IVCg2LUhZ43PIQ2QSChraHTc+Rkz6LHzH/vFI/FQpdLDmv4HSXUFfeumT?=
 =?us-ascii?Q?GoMnqjfd13kdThvd3Bqad5XXgCYEbLAGNYqmMp+qq8wgbQED4bwv4SWMC6pb?=
 =?us-ascii?Q?4F41af72ovfVkpAqxZfl+p9deUcHvSzQkyTyhoo7bQ8degJiOZrKckAEkyuC?=
 =?us-ascii?Q?zNDzN2GAKN8Er8CEyFvV7AuSdcgmN78MEwNklpaG8ZfeOEC5oXRzd2CmEggL?=
 =?us-ascii?Q?VZxOaxJ20YdyeidgQDUIVQN9vhdaz3R4S6Tx3m+bS9LRox6uhOYw4Lcw5F4f?=
 =?us-ascii?Q?PZLGTeATMKBwkpqL6922mJCePHZaPskXcM/ZtXaJZYr0axucoZhR5V4nN01H?=
 =?us-ascii?Q?/YfBLkB1iFnx6O8GCvJZtfiKDg3Yt/MvI7HmcNJySyHXDfQJ7AxhkwSmlO/m?=
 =?us-ascii?Q?VxuQoAeqJ15AAqjsnOeG5jDXPd1R1/KQQuEPTv3KwO2kP+H6NwCou/gv1NNn?=
 =?us-ascii?Q?/mg/W1n5/l4cIRlRxuFdfmGOxy5iCi7aOjN2IQOdmCYj2haJuOe/vsGFOBl3?=
 =?us-ascii?Q?X6dTqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 16:01:57.1053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba439303-9442-42be-b707-08de5a98bc30
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5974
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jan 2026 16:12:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17030

Signed-off By: Puyush Gupta p-gupta5@ti.com
---
 .../processor-sdk-analytics-11.02.00-config.txt                 | 2 +-
 .../processor-sdk-analytics-11.02.00-config.yml                 | 2 +-
 .../processor-sdk-analytics-11.02.00-config.xml                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt
index 72b49a1..10cbc2d 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
@@ -15,7 +15,7 @@ meta-clang,https://github.com/kraj/meta-clang,scarthgap,5=
c602337ea1a80fb7217eeda
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671=
a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta
 meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32=
482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,9754bc=
67d46fb43667ee720f46254d2c9f52183a,layers=3D
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,7d07e2=
5a15632494d6c30efb09d68de1c95f9394,layers=3D
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
index ff1f5e5..1677de8 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -90,4 +90,4 @@ repos:
   meta-edgeai:
     url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
     branch: "scarthgap"
-    commit: "9754bc67d46fb43667ee720f46254d2c9f52183a"
+    commit: "7d07e25a15632494d6c30efb09d68de1c95f9394"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
index 726e604..a2295f0 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
@@ -76,7 +76,7 @@
                 <layer>meta-ti-foundational</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'9754bc67d46fb43667ee720f46254=
d2c9f52183a'>
+        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'7d07e25a15632494d6c30efb09d68=
de1c95f9394'>
             <layers/>
         </repo>
     </repos>
--=20
2.34.1


