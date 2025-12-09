Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2696ED3B989
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 17:05:04 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12941.1765299898802461945
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 09:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=lp2fEsnd;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.60, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvYGYoJ9X1wXrTuxKkn/MEy9VsXCX/00V9Fe3kcdcCE6iXyGKO/6AxL/D1tuYeh2ZoY5h30QtxdMK1LAN+ChKA8Tpa+uhLPYzX4D72GtIC+WzE55rO5Fr70NGr1M34vx91QpSylvNfNPS6hXgkR5TnML5WGCO5DYgutVSzaaY0qe5jsTgfkvhX0Wvb8zRMyDFad7ZhBvjOqLRQZiCcfN/NO+bPWmxF2M8t/px/sJDU12HNXrlOjJmj9v8EaeP4cL60RX2uky41jDTylLqrhpTr85C6H2fnfJkptalTm46F/98sTlvuB/KxVtS25qytSwRUW9mt4BfEN7F6hzEyKZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WuMkihQF+b7Jo6wlZO20TzxlxA3D1y2v6HuqnlHliYk=;
 b=Z2G0B1ksLfTWHpiTHswgyIK40O+qzAlbvyBswc4CBKhg2RomvQABomSOLA100gK43//OPAA1IAo1LVogUwgLasYe1hnDS8GFxYnTXGzpiM8SgFHIlPtHLuWqkmVlUOs0UGNlDaNbcZuPJbtObeTLpJA+ynJwcD7O/9nMpI43sYFhlpX83r/MPqF13Xseawu6F4nHGS6Zea8xSwbwJs2C57H56IaUBbqDDGbDZbmKQ3otjF0VcwWQ56wTvgdd99mHvbHe5uIYOWegMMjICgFSwu44rJ03UJVW4Hl1s2hZo1IUEV9q7anJWTuIhK3c6pzqBgUA7Az2q1MMh1VBK2PIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WuMkihQF+b7Jo6wlZO20TzxlxA3D1y2v6HuqnlHliYk=;
 b=lp2fEsndhogTlNnlPzme+VWxZXqhmodk3c79qY/PscC7h7sos90SXP26GIJW7ti3hLHsPkqROWfMq0ff0MbLfVSdBqiNlwBEpXk50vRzPpHGbrcgroCs7HZwOiT+kMZbZcGTddbEhIIbGI+XM1YPEDnO+zZ7S1ANB6Dkx3b7eMo=
Received: from SJ0PR13CA0080.namprd13.prod.outlook.com (2603:10b6:a03:2c4::25)
 by CY8PR10MB6780.namprd10.prod.outlook.com (2603:10b6:930:9b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 17:04:55 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::3f) by SJ0PR13CA0080.outlook.office365.com
 (2603:10b6:a03:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.6 via Frontend Transport; Tue, 9
 Dec 2025 17:04:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 17:04:53 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 11:04:46 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9H4k0N1519064;
	Tue, 9 Dec 2025 11:04:46 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT18o-0000000A4ts-2zCU;
	Tue, 09 Dec 2025 11:04:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/4] coresdk-11.01.07-config: add config for CoreSDK 11.01.07 release
Date: Tue, 9 Dec 2025 11:04:43 -0600
Message-ID: <20251209170446.2402102-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CY8PR10MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: 62abf9af-a564-407b-4e02-08de3745124b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fFwF3JKhzSKdLiHUQxhArtbSOomdu03k/WSYpNx9RpOiPpHAZo8Rlibi4P+q?=
 =?us-ascii?Q?baY26DCLO0nVxcmj7xggbm2RiMXU9FHL9BZpuFJnZNgyxMxZAzuHXmZ+bNfT?=
 =?us-ascii?Q?d9lIzlwZVRSESB+6uW/M2QFOxF8PkjkadtOpo1hmOz/FZzEhhi/zCqh9CeX4?=
 =?us-ascii?Q?2N2J4FoN2sOidKLFN18k1PbFAMI1YPHZzAs6EcIIXiIPtVvPhhOgwcj5sVoL?=
 =?us-ascii?Q?Gcwm9z4BzUD2FGUlSbH6q2WMNkHOvGy5yYVsiqtAhUAPCbiJZTW1U2YwgNRy?=
 =?us-ascii?Q?xzfZ1q9U0skrjXPfYJnxneAg3tsdPBQ788rtrz3T5XCl9kdLYzfJh9qM/XOF?=
 =?us-ascii?Q?6Qw43i+ICREyuDqdt+Gou30he3tS7yQ2SB4Mmu/JfZcAlqZZL+2pkUTmuajc?=
 =?us-ascii?Q?KJRuNOEslggJ+XuuWzfjmI/yO7oMpGVsAnAlVny7KlXAdpzu+tis0K+FpjyT?=
 =?us-ascii?Q?gETxhLuazg42UlfdUktDNtXjfPuuVn6nWVzZFNCLpoKAkPnpvFSnmfdblboX?=
 =?us-ascii?Q?ZKBO+rVFKGgOxc/pZR9BQSEZgoKPYQBJW3ktiNnnvG9cpisxZBsqB4EY7WA2?=
 =?us-ascii?Q?hnyDG/3DnwEBMi+0bzodd1ZZCL1flOR/1Z7UG8P4QuPuTFg95SA5Pwt/pHHw?=
 =?us-ascii?Q?5fLxpa8sXDliEv3db//Bu3ZMIiy7MhhGtMk7BGB1i68tj4m0/CqCaimnMOIt?=
 =?us-ascii?Q?LzfbbJukeHrH/srmGeOpH0kNvHbmgtNZpD89n9GIUZJonyxZGYUonH8h+a2D?=
 =?us-ascii?Q?bMzTPRCrGMLc7h1og/dogXBrISZcHlZj7sctSMNLGM8I+qqrmHOX5OSeYgj3?=
 =?us-ascii?Q?KnttfGWji68UuBaDBMXSrCMRM431sdQQFuV1cKGDbyKcOcNqnFgn7R7XmS1m?=
 =?us-ascii?Q?wPHR95o/Sj3VpOcL5Gp2RNEUYBz/trIvbEoX1kQ39hkQGqKa3E+PeOd1qGoL?=
 =?us-ascii?Q?20ZTlM3QdQnp2CMnK5YcojSKwuVH2diUorrjmTgB7wbnFqnMIMy+8TfH09eC?=
 =?us-ascii?Q?iIxPoFaOy7RlrTQDFfyh7rUqjjDD8fNjN0b6CvBbHUyBLbZdZpX+IhBT2H5e?=
 =?us-ascii?Q?uSqah0lEFiNMtn4+9GbJrrzq6csmQ3jaB043bgv6Fr1M+9DPkHUr2M9b/nAk?=
 =?us-ascii?Q?b6QbvTQyB8YsSMwK6+AqItCfeBwlT6RRN77v4cbHUrfKsacnWHNlkIykfx6L?=
 =?us-ascii?Q?I3WD5WQEc3Ji6YydpqbmmZpsW19CUZSUaVBtK+bioPfqrxGhcAh/Ln+7uBSg?=
 =?us-ascii?Q?Tg0IKWq31pQzaEfKLD5g2QofBrMYfJZt+SrDKvGJybmmeHrnOO1Suq4pbqHe?=
 =?us-ascii?Q?l93U3NowQOJH23IKoaTKDJC7Qa3aGdHM1uLPsqCwAd0pLfR4F4L9pjyUN3dd?=
 =?us-ascii?Q?A8/C3T4gMaXX/ck+RsSv74S9GODIfhpTR2r8atTbvmIGtaIBhpqe/atzgaL9?=
 =?us-ascii?Q?zWVpOMTcTP4ozLVQAYTvRUwb6TJRbk9sT+wOyyPm8vVeixDGFzC5u4hzNOZO?=
 =?us-ascii?Q?gH5+3CeeNKSi3ew=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:04:53.1745
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62abf9af-a564-407b-4e02-08de3745124b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6780
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 17:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16880

Add config for CoreSDK 11.01.07 release.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ....json =3D> coresdk-11.01.07-config.conf.json} |  2 +-
 .../coresdk-11.01.07-config.txt}               |  4 ++--
 .../coresdk-11.01.07-config.yml}               | 12 ------------
 .../coresdk-11.01.07-config.xml}               | 18 +++++++++---------
 4 files changed, 12 insertions(+), 24 deletions(-)
 copy bitbake-setup/coresdk/{coresdk-11.01.05-config.conf.json =3D> coresdk=
-11.01.07-config.conf.json} (99%)
 copy configs/{processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-=
config.txt =3D> coresdk/coresdk-11.01.07-config.txt} (87%)
 copy kas/{processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-conf=
ig.yml =3D> coresdk/coresdk-11.01.07-config.yml} (87%)
 copy src/configs/{processor-sdk-analytics/processor-sdk-analytics-11.01.07=
.05-config.xml =3D> coresdk/coresdk-11.01.07-config.xml} (89%)

diff --git a/bitbake-setup/coresdk/coresdk-11.01.05-config.conf.json b/bitb=
ake-setup/coresdk/coresdk-11.01.07-config.conf.json
similarity index 99%
copy from bitbake-setup/coresdk/coresdk-11.01.05-config.conf.json
copy to bitbake-setup/coresdk/coresdk-11.01.07-config.conf.json
index e07227f..5fd29ca 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.05-config.conf.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.07-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "TI CoreSDK v11.01.05",
+  "description": "TI CoreSDK v11.01.07",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.=
07.05-config.txt b/configs/coresdk/coresdk-11.01.07-config.txt
similarity index 87%
copy from configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.=
05-config.txt
copy to configs/coresdk/coresdk-11.01.07-config.txt
index 26457d0..87c4c6d 100644
--- a/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-c=
onfig.txt
+++ b/configs/coresdk/coresdk-11.01.07-config.txt
@@ -2,8 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,2.8,86e7a58c0e9904c33b1b94ddd=
c3d683c2da22d1a
-meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.01.07.05,layers=3Dmeta-ti-foundational
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,2b4e60e319348ae2d53072b=
901645f30b4cc42bf,layers=3D
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,a5449c0c50aa07d02186f548fe6bb6c1ce8823dc,layers=3D
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
@@ -12,7 +13,6 @@ meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11=
.01.07,layers=3Dmeta-ti-e
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,8e0f8af90fefb03f0=
8cd2228cde7a89902a6b37c,layers=3Dmeta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,aef850f7fa53121c74=
b244b7ae40d31fb9809ccf,layers=3D
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,24c0ab180=
45920bb5c1e965c0ea6d176fd6de234,layers=3Dmeta
-meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,11.01.=
07.05,layers=3D
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.0=
5-config.yml b/kas/coresdk/coresdk-11.01.07-config.yml
similarity index 87%
copy from kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-c=
onfig.yml
copy to kas/coresdk/coresdk-11.01.07-config.yml
index 2993b0d..ef39bd6 100644
--- a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.07.05-confi=
g.yml
+++ b/kas/coresdk/coresdk-11.01.07-config.yml
@@ -15,13 +15,6 @@ repos:
     layers:
       .: disabled
=20
-  meta-tisdk:
-    url: "https://github.com/TexasInstruments/meta-tisdk.git"
-    branch: "scarthgap"
-    commit: "11.01.07.05"
-    layers:
-      meta-ti-foundational:
-
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
@@ -86,8 +79,3 @@ repos:
     commit: "24c0ab18045920bb5c1e965c0ea6d176fd6de234"
     layers:
       meta:
-
-  meta-edgeai:
-    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
-    branch: "scarthgap"
-    commit: "11.01.07.05"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.01.07.05-config.xml b/src/configs/coresdk/coresdk-11.01.07-config.xml
similarity index 89%
copy from src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01=
.07.05-config.xml
copy to src/configs/coresdk/coresdk-11.01.07-config.xml
index 904c44a..416ab01 100644
--- a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.07.=
05-config.xml
+++ b/src/configs/coresdk/coresdk-11.01.07-config.xml
@@ -1,6 +1,6 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>TI Processor SDK Analytics v11.01.07.05</description>
+    <description>TI CoreSDK v11.01.07</description>
=20
     <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
@@ -10,11 +10,6 @@
     <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'86e7a58c0e9904c33b1b94dddc3d683c2da22d1a'/>
=20
     <repos>
-        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.01.07.05'>
-            <layers>
-                <layer>meta-ti-foundational</layer>
-            </layers>
-        </repo>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.01.07'>
             <layers>
                 <layer>meta-arago-distro</layer>
@@ -22,6 +17,14 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7' disabled=3D'true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers/>
+        </repo>
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'2b4e60e319348ae2d53072b901645f30b4cc42bf'>
             <layers/>
         </repo>
@@ -62,9 +65,6 @@
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'11.01.07.05'>
-            <layers/>
-        </repo>
     </repos>
=20
     <tools>
--=20
2.43.0


