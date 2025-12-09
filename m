Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28341D3B981
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 17:05:04 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12824.1765299899839491473
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 09:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=sdcQjG6r;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.6, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzSJw0nhela9QxpjMcPPuA1OOdUzoeksbBFu/Ph1785T0ZBhr+B8eWSdfAGFKMQWD6cpLD7jkPIAhePg2ozJdkgr1Ht3t/trPOVhkUOftwJFGisThDCYDQvxWsRpot8TLx6N+2MU32KZ4yxiCCH0fZOc4vJLNnICZvJqTAGT/7ufgM9Yw6dumrTF0t2/V1QTE8osNhOkf7//ciqzXK7Al5DDRDDZd/z3MT9xv7DvH9NR309hzKTs/B4dVxpgogRBSMojspYHeH8PxE+blARa3d51K6NRQ7npvIALbQIHTiUTD1iCBiA8bfRcnE7D/XQvIapJXRXdYnVnQHKcIwW9cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CxMHjPoFE7jBPL1U2aJ1H79VUDB3jqSF4s+9VnHmPa0=;
 b=xRFVtE+sA570ZAc1Mec44m0NEbo07DV2txxGw1Ortr35iZhtpacCsuqATSEodQUBR/P8O6bdbwQD1LxuwhvQLmmavPZcqGvgJt+CvB464oFNoaJCp8QAYZRCGUvwf10brQ1mzcDBzBNCDoW50GmLk3FwIFSi23ePmojBliqZ31mlpDdDZC5JPFRgZh76gtzoGc5wdWfc5C2rxtuuzpPRq8GbV7Zog5K2wBNXNwHXVGblHE9yOknRf1D+jqe/hSEhQof3T/qlap/1PZsEOU0PsnSuuH7ERUgfc63rjdAJuHwpwcMmHXRwrdLdW6/hSbISckKpn5DKfICmUj7LYJ2usw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxMHjPoFE7jBPL1U2aJ1H79VUDB3jqSF4s+9VnHmPa0=;
 b=sdcQjG6r1r8XqWVmBZrbabdQkCpOizvFXPMhBDvPthCK3tHV7JxjttQh0IkV7hQjj+s6liyF7gwIho2TFBGl2Z41m8B+p9ox+vr4h4sXhYjVX2utlgP533jJV/Owc9yfnuVa7Tf+hp6xbJgrTHbHgtLpyQJ2Ac5ogsLzfR7GNWk=
Received: from BN9PR03CA0484.namprd03.prod.outlook.com (2603:10b6:408:130::9)
 by BY5PR10MB4305.namprd10.prod.outlook.com (2603:10b6:a03:20e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 17:04:54 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:130:cafe::a0) by BN9PR03CA0484.outlook.office365.com
 (2603:10b6:408:130::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 17:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Tue, 9 Dec 2025 17:04:51 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 11:04:46 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9H4kdT1540728;
	Tue, 9 Dec 2025 11:04:46 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT18o-0000000A4tz-39nt;
	Tue, 09 Dec 2025 11:04:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 3/4] coresdk-11.02.05-config: add config for CoreSDK 11.02.05 release
Date: Tue, 9 Dec 2025 11:04:45 -0600
Message-ID: <20251209170446.2402102-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209170446.2402102-1-reatmon@ti.com>
References: <20251209170446.2402102-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|BY5PR10MB4305:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ba36e6-efee-430f-898c-08de37451150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?00DvZMfM+SFCgJnubvM4UwUsEDmDlCBYGFJKaTK1143vVciA/wdtY4ktdXc/?=
 =?us-ascii?Q?yxGOTEAjx1SHBB5iMc7V4oES/iuVxLRBapDMJl7PpLBLN43xF5AkRJYJA+Jl?=
 =?us-ascii?Q?jSvX6ZtryJHbVRxgTg8N8A1kSHunmT5mKfTeQnyZIo5wHFBDWfM53oHQZl8R?=
 =?us-ascii?Q?DsuP5NCEkh8MlXC0c1xVpEGJ1JMQmCV/incl9loZcKKiDjjsVx66H3+dkN2m?=
 =?us-ascii?Q?Hbki6BOi9WFIIs79HwGRH9q6eFS4l9YFyzhUK0kdpwiMZOn84i7aeuWkSoI5?=
 =?us-ascii?Q?rSsSDaD/BixLj9gS9s75091WPe+KjksXAt7JQ4s768gsfIVsttGpgMdkeNPv?=
 =?us-ascii?Q?L99n09gNwRpEUIptety17va7lLvVzTzMGDpR+Rv//8l4bOtntbODAtpD1rjK?=
 =?us-ascii?Q?O/55thtzSFmhow6pDnC95TcAQKxnlKSVfOkhETqRsWhokeltV9Z3wG7yxTq+?=
 =?us-ascii?Q?ZruaTbSTkw8Yo70XLTqQvZl/3C0KU5txMyusMb0CzwM4nr7fH06J9mfuzTTq?=
 =?us-ascii?Q?x6oikwMqgUJ9QQPpMoN2qdP4+VOqEpOFobavY1mzte/MNjZA36zEwyeOpG3Y?=
 =?us-ascii?Q?UgK1+BuqZGFTgN35FlbwXUes70T2mlQxaA+WGkpeXppObScAgBTfNtWTDYqE?=
 =?us-ascii?Q?/ylIpe2Q9e6wxPDtKNGeEPLvG96aJa82zX2idTYXY5KAPexLYn7LWygAcBFj?=
 =?us-ascii?Q?wHRdddRaEMwjPKYMb3q7kIZF3lntyWCYOiQTFjzgE0XJDKJiKoZZ0qK2CUCZ?=
 =?us-ascii?Q?d80oCfc96K6gguJ9RCE8rm37IWqUAXpejSk/+KE4Pud9ejhmy0xHEYwskeBv?=
 =?us-ascii?Q?fsLq9DUO4qdH1/xUN9FRP6AfWhoRX4ZuP2XBx2X6uYkjR64b0HT1Po16U1H5?=
 =?us-ascii?Q?0yd90XxhtkMC6SSD0xkxN/vMMx838TenuKtft/Ez/phcWap+iAlOfPcplMdv?=
 =?us-ascii?Q?UBR1qZp91K0gsUbXNI9i1zZ9jYuaGFgR6eF4zps4o8+zDc8N38eEZ/rfYfYz?=
 =?us-ascii?Q?YJVQZWpp1wKEoOtJPsLf5pxTblncT1ng0ek04tKwDdZvBiDovOwAkUvvTInJ?=
 =?us-ascii?Q?gQk1f1a7P6qKXWRK0f/N+0sn9DjeyRyapi4S808wgInM7wYmZNItMiafawBL?=
 =?us-ascii?Q?aEQojVuA4IvAOXSZPXy/3v+b7wufpEY2ySYKH79qMTmI6u5ac8v1/DQQVzm4?=
 =?us-ascii?Q?ixftpxN3+0/rjoYhQq5mjHCkw5Td9fqOrWdWwVtwp0k2UhvwOkBS4TqMMvFF?=
 =?us-ascii?Q?O1jJZOAtC1syrYp4tLIdqCb/G5ZV/2HWaI0+ihS2NdSkL1FO9ZfCzTirsKSh?=
 =?us-ascii?Q?NkZ3Jgx/DlXK6iOSTrerdHrl9iAf0+8AiSnIioHHFYnRg458mmkjlDTlNlis?=
 =?us-ascii?Q?pZLpNtohkycOHSzeJp+qrsCt6/I7aFRcEWzZKbJmPx+BOSSFsMLZ4gXKo7VF?=
 =?us-ascii?Q?I9IpvEPRcibbGORKIb6MOF5B3GWW98VG4SKB8ciXU5oarqAPRSKyYW7FD6Ma?=
 =?us-ascii?Q?a/dMKIxZq0B8tLc=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:04:51.5299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ba36e6-efee-430f-898c-08de37451150
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4305
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 17:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16881

From: LCPD Automation Script <lcpdbld@list.ti.com>

Add config for CoreSDK 11.02.05 release.

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 ...nf.json =3D> coresdk-11.02.05-config.conf.json} |  2 +-
 .../coresdk-11.02.05-config.txt}                 |  4 +++-
 .../coresdk-11.02.05-config.yml}                 |  8 --------
 ...16-config.xml =3D> coresdk-11.02.05-config.xml} | 16 ++++++++--------
 4 files changed, 12 insertions(+), 18 deletions(-)
 copy bitbake-setup/coresdk/{coresdk-11.01.08-config.conf.json =3D> coresdk=
-11.02.05-config.conf.json} (99%)
 copy configs/{processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.txt=
 =3D> coresdk/coresdk-11.02.05-config.txt} (82%)
 copy kas/{processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml =3D=
> coresdk/coresdk-11.02.05-config.yml} (91%)
 copy src/configs/coresdk/{coresdk-11.01.16-config.xml =3D> coresdk-11.02.0=
5-config.xml} (85%)

diff --git a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json b/bitb=
ake-setup/coresdk/coresdk-11.02.05-config.conf.json
similarity index 99%
copy from bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
copy to bitbake-setup/coresdk/coresdk-11.02.05-config.conf.json
index 8658e2f..c9f684f 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
+++ b/bitbake-setup/coresdk/coresdk-11.02.05-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "TI CoreSDK v11.01.08",
+  "description": "TI CoreSDK v11.02.05",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-conf=
ig.txt b/configs/coresdk/coresdk-11.02.05-config.txt
similarity index 82%
copy from configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.=
txt
copy to configs/coresdk/coresdk-11.02.05-config.txt
index 31e590a..97f290e 100644
--- a/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.txt
+++ b/configs/coresdk/coresdk-11.02.05-config.txt
@@ -2,8 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
-meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.05.02,layers=3Dmeta-ti-foundational:meta-ti-ml
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.05,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,f1f248262d662315159ee96c604f97415d1dbe6a,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
@@ -11,6 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mix=
ins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.05,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,06d498131=
3ce67a8d53b1c14be9845b4b5a9f4cf,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.y=
ml b/kas/coresdk/coresdk-11.02.05-config.yml
similarity index 91%
copy from kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
copy to kas/coresdk/coresdk-11.02.05-config.yml
index b12cd5e..67db1c8 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
+++ b/kas/coresdk/coresdk-11.02.05-config.yml
@@ -15,14 +15,6 @@ repos:
     layers:
       .: disabled
=20
-  meta-tisdk:
-    url: "https://github.com/TexasInstruments/meta-tisdk.git"
-    branch: "scarthgap"
-    commit: "11.02.05.02"
-    layers:
-      meta-ti-foundational:
-      meta-ti-ml:
-
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
diff --git a/src/configs/coresdk/coresdk-11.01.16-config.xml b/src/configs/=
coresdk/coresdk-11.02.05-config.xml
similarity index 85%
copy from src/configs/coresdk/coresdk-11.01.16-config.xml
copy to src/configs/coresdk/coresdk-11.02.05-config.xml
index 427ad3d..58e12ae 100644
--- a/src/configs/coresdk/coresdk-11.01.16-config.xml
+++ b/src/configs/coresdk/coresdk-11.02.05-config.xml
@@ -1,16 +1,16 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>TI CoreSDK v11.01.16</description>
+    <description>TI CoreSDK v11.02.05</description>
=20
     <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
     <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
=20
-    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.01.16'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.05'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -31,7 +31,7 @@
         <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'af1db2042caf8021d7=
67dce1b26c08b59b96f3d1'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'e621da947048842109db1b=
4fd3917a02e0501aa2'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'f1f248262d662315159ee9=
6c604f97415d1dbe6a'>
             <layers>
                 <layer>meta-networking</layer>
                 <layer>meta-python</layer>
@@ -44,20 +44,20 @@
         <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
             <layers/>
         </repo>
-        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.01.16'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.05'>
             <layers>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'0f1e7bf92c89759f0ab74cfa5be4ee47b092ad46=
'>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
             <layers>
                 <layer>meta-arm</layer>
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'=
>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
             <layers/>
         </repo>
         <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
@@ -66,7 +66,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'4cf131ebd157b79226533b5a5074691d=
d0e1a4ab'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'06d4981313ce67a8d53b1c14be9845b4=
b5a9f4cf'>
             <layers>
                 <layer>meta</layer>
             </layers>
--=20
2.43.0


