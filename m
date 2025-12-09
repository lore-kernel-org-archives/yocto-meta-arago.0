Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29689D3B98B
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 17:05:04 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.19])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12821.1765299896126378450
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 09:04:56 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=n/mllExj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.19, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OJnZaquwQMqnqH68PwL72urQoAsJTzWtNWnEBETdYoZaZoERRpxB5ito+LgXpwIOo4i1OvxQlUVplXWjmHmiBM5ERgzqwbP4oxpztyYB6iBkJtiQPSlItPX/ia162QSwzlZzZTB3OawP2c3i67o+XuTPEm1r8zSwD4WHgjtR1q4JL5E/OBIN0YW/SCnWeiIk2r7Sbnb/BDLm6SXj8v7/six9FKigqZVE6MkjEHufbjy+V/aF2YbMTVYUlHOxWssxQfpuPbHAoQ20YDbPHjlL2EH9PBZjW88OWeJ5JGuQlgc9Wmry9EeCP1b6k5qYEBt+isSkBz6n8UvSfjXshGdToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XRyKrEWoN06JhqFC7xVYa51Bw96WuWlgfFCMMd00OZ0=;
 b=o0rmHenaxCBFBk+OP5yFmN7WfCY5zQF/PWu99rrI2XsnNN8/uwimsqTrmVdvm6UnqG/BxkLdYChFVwcskwhfVxi/wydmsNNv6N+d34cIItWtMehGrOcnZbaGa2cc/p4g6M8StQgM56cw4ZxtOaj+rr0HIMdTClk2JjFgvegM5Jaa0M6rBrb9kCJ6zWBBR3k8bcZ1wPHjLgJGJBnDFyZU0w39x2vF2oZ5xwAVd87dqerJf5uYS+UlXJqfIHh3jZnr8T+Med4BeTvFSt1HSoezM4D44GpOPPEKZQfSzdQ/ShXEo5NXLPVLaWp1UjwynGffvBzy7FzKhZtbo33JWGkm0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XRyKrEWoN06JhqFC7xVYa51Bw96WuWlgfFCMMd00OZ0=;
 b=n/mllExjhcz82NRGuSGRKY/KuJyCkqXpilx5ezziRiNN9OPyGLGP1AEftyuS9O/ONV4MeGCMDKlNN1G0Sdx3NG88hiLx32CH0jEossi5atI+BKyZb0OOzaMbrIu8fbYQIIkKJdZ431MxLf87KGsD4BkNNt0ZknY9pV9J+dLbq4g=
Received: from BN0PR03CA0028.namprd03.prod.outlook.com (2603:10b6:408:e6::33)
 by DS0PR10MB7020.namprd10.prod.outlook.com (2603:10b6:8:14b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Tue, 9 Dec
 2025 17:04:50 +0000
Received: from BN3PEPF0000B370.namprd21.prod.outlook.com
 (2603:10b6:408:e6:cafe::38) by BN0PR03CA0028.outlook.office365.com
 (2603:10b6:408:e6::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 17:04:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B370.mail.protection.outlook.com (10.167.243.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.0 via Frontend Transport; Tue, 9 Dec 2025 17:04:50 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 11:04:46 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9H4k5Y1540731;
	Tue, 9 Dec 2025 11:04:46 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT18o-0000000A4u3-3Fkz;
	Tue, 09 Dec 2025 11:04:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 4/4] coresdk-11.02.08-config: add config for CoreSDK 11.02.08 release
Date: Tue, 9 Dec 2025 11:04:46 -0600
Message-ID: <20251209170446.2402102-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209170446.2402102-1-reatmon@ti.com>
References: <20251209170446.2402102-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B370:EE_|DS0PR10MB7020:EE_
X-MS-Office365-Filtering-Correlation-Id: ab94add1-e8c0-4244-79a5-08de37451095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9EUsP9s6iqE8AkToYCJUAUfic26TTbd7bZvf10XGhJOHFuiQAKVx4Riqz3NQ?=
 =?us-ascii?Q?nfcKejLXQMU9yleD9kQ1n5uHXvTNPCxTaVrzDmxZTe14vWXsgjCqoOgmbXBu?=
 =?us-ascii?Q?7f1kTlS55XoxagYavFYXRY2cv8HLQzZvPXNJePByAsArZ6ovCyx8v6vTb0Hm?=
 =?us-ascii?Q?vehd+AY/xlVUPOQSY6DE5rn/fJ7dxjUBuILmPKJ0pVXwrxId9JnQs8v82IG1?=
 =?us-ascii?Q?wxH9eELxr47EX49/VuTBez/WnJDw3wqpfINZsxdHKgZg4sjetkGWcUOPqP29?=
 =?us-ascii?Q?oz/iviRWDWD0GhfRkAM5ApbmPTUdUOHv/TXqC0TlHMkot2+JGY/0+Ua6E7sb?=
 =?us-ascii?Q?pFyyVbmizgs/Z5ZZ70PJ5AisuvGrEnDsbW88OIb03Eefp7+VlWgCvoOA01Nj?=
 =?us-ascii?Q?+Zt/5+tsqeCkJpPIRVcYEb4p50H3oGlI7gQJfk5Ac026SAbG/wDBnX7F0wws?=
 =?us-ascii?Q?wC6Mi89Q0ANTAboo6xrkXI8KiMD4aoCT6QtcV8H7gRvDIzQs1a8BE7Pr0wqc?=
 =?us-ascii?Q?bPLMOqZ43Y76wrNELSbnGB+ARHdoMgUbUijN5clww3/vWVLPFsjnN/5/bUK+?=
 =?us-ascii?Q?RS8DLb05kXaJTIBk/rdW+vjE/BxDUmynG4szD7nCOEJN4/HP61rEZqkqML0U?=
 =?us-ascii?Q?lIBR7GivXJ9fCCiLToP8Rj9ld2Rs4sj40Oyp90nbY1PqsVxr1ry4NIuIy7i9?=
 =?us-ascii?Q?mr+eeV87YQhbYF0vsZoBoQvYCPwfnFkICo9Yhzfrz5L7zXhAARCHZ8vfe1m/?=
 =?us-ascii?Q?y55nssSG6eadA9O5zTgCYIAPOvbl1tdhoKZjY49KC9yAnGYd3MEmqWN/uoH3?=
 =?us-ascii?Q?Qsjs0vrs43j7cq+SROw+QvbLY/GVOOwUTZmeIwyISwmDFKlZIQkyAbDen6+C?=
 =?us-ascii?Q?91JV5vIqq/qkalbT8mruIzmbB8ZjHJFHzEEBe62alde1UGRkXJrRUvhjrehZ?=
 =?us-ascii?Q?3NmJ6BgiKrkIwK0YG2yk3Ju4ZKTdiACXkVbC8NuqSPGhN08hjRxJ1SiJlT7D?=
 =?us-ascii?Q?WFD24CvESGpqVoEoxcRfJ3ZktIpz3MP7iavRfdvmIWfokMkusdb00m4JFn8n?=
 =?us-ascii?Q?omkK/MlPtmEfBKxz9ivVc48k5hY/QyVVJTRCEC9aRbkd60Tj8wj6eP8RWTQm?=
 =?us-ascii?Q?vv77AJmeJ9xG4icXOlgN8Lt4Il/bDtibaNAu0OU9yW9k/J3L4SR/Le2Ccdvd?=
 =?us-ascii?Q?ZPTwICLQiDpBBoDYm0H0tDFmuCUkiH6wgjVypZiXFGC4jvZ5Caj1hxJCTDaE?=
 =?us-ascii?Q?OWS5m8jXRrCMMMe+ChCPBr25IUuTbvw4nIPUO5LECm3SvFQoJMHAxaZAVvg+?=
 =?us-ascii?Q?v2AK/8D9cNaCBoQdnWdsSNva/uz5KWd1uZ6KHaU+vLWBfhVypZwG3YrNLkBD?=
 =?us-ascii?Q?pvMFubu6YNdWrpamyLQatHozE4GL5rAuiGwx1u9ih6dO5MDorR0RQ4X9J5sX?=
 =?us-ascii?Q?PzLo/fvfmOrgc6ewLZkTkiDCYLVsOOQi2JcboGS0OzVrB512mOfid2jD1QJ1?=
 =?us-ascii?Q?ljtyGr8OPtKHhNo=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:04:50.2611
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab94add1-e8c0-4244-79a5-08de37451095
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B370.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7020
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 17:05:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16879

From: LCPD Automation Script <lcpdbld@list.ti.com>

Add config for CoreSDK 11.02.08 release.

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 ...g.conf.json =3D> coresdk-11.02.08-config.conf.json} |  2 +-
 ....02.05-config.txt =3D> coresdk-11.02.08-config.txt} | 10 +++++-----
 ....02.05-config.yml =3D> coresdk-11.02.08-config.yml} | 10 +++++-----
 ....02.05-config.xml =3D> coresdk-11.02.08-config.xml} | 12 ++++++------
 4 files changed, 17 insertions(+), 17 deletions(-)
 copy bitbake-setup/coresdk/{coresdk-11.01.08-config.conf.json =3D> coresdk=
-11.02.08-config.conf.json} (99%)
 copy configs/coresdk/{coresdk-11.02.05-config.txt =3D> coresdk-11.02.08-co=
nfig.txt} (82%)
 copy kas/coresdk/{coresdk-11.02.05-config.yml =3D> coresdk-11.02.08-config=
.yml} (89%)
 copy src/configs/coresdk/{coresdk-11.02.05-config.xml =3D> coresdk-11.02.0=
8-config.xml} (88%)

diff --git a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json b/bitb=
ake-setup/coresdk/coresdk-11.02.08-config.conf.json
similarity index 99%
copy from bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
copy to bitbake-setup/coresdk/coresdk-11.02.08-config.conf.json
index 8658e2f..c701109 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
+++ b/bitbake-setup/coresdk/coresdk-11.02.08-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "TI CoreSDK v11.01.08",
+  "description": "TI CoreSDK v11.02.08",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
diff --git a/configs/coresdk/coresdk-11.02.05-config.txt b/configs/coresdk/=
coresdk-11.02.08-config.txt
similarity index 82%
copy from configs/coresdk/coresdk-11.02.05-config.txt
copy to configs/coresdk/coresdk-11.02.08-config.txt
index 97f290e..526a7e6 100644
--- a/configs/coresdk/coresdk-11.02.05-config.txt
+++ b/configs/coresdk/coresdk-11.02.08-config.txt
@@ -2,18 +2,18 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
-meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.05,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
 #meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,f1f248262d662315159ee96c604f97415d1dbe6a,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
-meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.05,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
 #meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
-oe-core,https://git.openembedded.org/openembedded-core,scarthgap,06d498131=
3ce67a8d53b1c14be9845b4b5a9f4cf,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
diff --git a/kas/coresdk/coresdk-11.02.05-config.yml b/kas/coresdk/coresdk-=
11.02.08-config.yml
similarity index 89%
copy from kas/coresdk/coresdk-11.02.05-config.yml
copy to kas/coresdk/coresdk-11.02.08-config.yml
index 67db1c8..50034fa 100644
--- a/kas/coresdk/coresdk-11.02.05-config.yml
+++ b/kas/coresdk/coresdk-11.02.08-config.yml
@@ -18,7 +18,7 @@ repos:
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
-    commit: "11.02.05"
+    commit: "11.02.08"
     layers:
       meta-arago-distro:
       meta-arago-extras:
@@ -32,12 +32,12 @@ repos:
   meta-virtualization:
     url: "https://git.yoctoproject.org/meta-virtualization"
     branch: "scarthgap"
-    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
=20
   meta-openembedded:
     url: "https://git.openembedded.org/meta-openembedded"
     branch: "scarthgap"
-    commit: "f1f248262d662315159ee96c604f97415d1dbe6a"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
     layers:
       meta-networking:
       meta-python:
@@ -54,7 +54,7 @@ repos:
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
-    commit: "11.02.05"
+    commit: "11.02.08"
     layers:
       meta-ti-extras:
       meta-beagle:
@@ -76,6 +76,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "scarthgap"
-    commit: "06d4981313ce67a8d53b1c14be9845b4b5a9f4cf"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
     layers:
       meta:
diff --git a/src/configs/coresdk/coresdk-11.02.05-config.xml b/src/configs/=
coresdk/coresdk-11.02.08-config.xml
similarity index 88%
copy from src/configs/coresdk/coresdk-11.02.05-config.xml
copy to src/configs/coresdk/coresdk-11.02.08-config.xml
index 58e12ae..4dde388 100644
--- a/src/configs/coresdk/coresdk-11.02.05-config.xml
+++ b/src/configs/coresdk/coresdk-11.02.08-config.xml
@@ -1,6 +1,6 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>TI CoreSDK v11.02.05</description>
+    <description>TI CoreSDK v11.02.08</description>
=20
     <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
@@ -10,7 +10,7 @@
     <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
=20
     <repos>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.05'>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.08'>
             <layers>
                 <layer>meta-arago-distro</layer>
                 <layer>meta-arago-extras</layer>
@@ -28,10 +28,10 @@
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
             <layers/>
         </repo>
-        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'af1db2042caf8021d7=
67dce1b26c08b59b96f3d1'>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
             <layers/>
         </repo>
-        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'f1f248262d662315159ee9=
6c604f97415d1dbe6a'>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
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
' branch=3D'scarthgap' commit=3D'11.02.05'>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.08'>
             <layers>
                 <layer>meta-ti-extras</layer>
                 <layer>meta-beagle</layer>
@@ -66,7 +66,7 @@
                 <layer>meta-flutter-apps</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'06d4981313ce67a8d53b1c14be9845b4=
b5a9f4cf'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
             <layers>
                 <layer>meta</layer>
             </layers>
--=20
2.43.0


