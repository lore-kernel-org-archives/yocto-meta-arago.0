Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC320D3B981
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 17:05:13 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.1])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12949.1765299906720588254
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 09 Dec 2025 09:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=fhmgN1CV;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.1, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fPJAmjEBefkOOPea8LYe4aTnGPGAfITy0FJLqSIfgir0SmK1LAixArDcyjhdsZfM5GnitMYOq0v3BoO8UckoJXxQJpb65QP3+eBZHRbSJ2DAVrmqpn6XFrQmBMNLLMR5Rz+20T40j1GQ9Sdz80S53TUzpXarEFQ1LBPyZOlFnErKiZtobTYm85TD9a+ZP2fEodgT//3RMZS3vosj35ig8x+VfkQWMe+VX+Yan2J37eYrXaHJP3ahpzjfh3X34AxOoQgvbctz46wk9kJBR9FMFqEXrTxlGSMJJtFYhXUd3zgT43DEZw0RqXZvWlhPW9mdEmLaSSiIRK+31SHGoBVkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KseStUoE3HuouXPzIb9U7ZRZ6bQOCXEYv0GosUIxQs=;
 b=P/8QZDvmptJsZiJfpyoEdBE/9fBXM80U+wHojlAjsZ0h/vxXaYpFNYT8wsvucGDBYKmU8RuWu37ql2b2LcqbaiQJWCyfTQzqRQEDsSFIL3oAEIgEB7eXtQ/kzTB6Zrc5pJX5CN969CwCHOOdpJQufydF13qa7Uyln7oyfehkA677eW3/K0NxJtrj132zVDiYe5hK9toEhj3wFWLIxhWouX+5OOvU99KQaBW7uJVUwNxvAjkq9au8RtYi6mP+INQKN6FyX8RVE67j2glQCgJgLO1rQjur/tP54XXs9YdqOeVDd0P6mOKSJSeY9q+DEBGQPQuec0EzxaIt7tkR3i2p1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KseStUoE3HuouXPzIb9U7ZRZ6bQOCXEYv0GosUIxQs=;
 b=fhmgN1CVvcSYBj4eUvyI6n0ZbzcZpKp9Bx2NCFfFAvoJLcYbdX9VhNfh+NouHdpZUiYUJ70JJ8k4I8bsYQkgppJHMrosIKzPqgbugWmbwpaDhRqxV2EnL3pdA3GMFKCDVZAmUZdCcEz3tI8VzmNDlB7zUQ18heGHte5+Zpf9/a8=
Received: from SJ0PR03CA0054.namprd03.prod.outlook.com (2603:10b6:a03:33e::29)
 by DS0PR10MB8054.namprd10.prod.outlook.com (2603:10b6:8:1f1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Tue, 9 Dec
 2025 17:05:02 +0000
Received: from SJ1PEPF000023CC.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::9e) by SJ0PR03CA0054.outlook.office365.com
 (2603:10b6:a03:33e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Tue,
 9 Dec 2025 17:04:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF000023CC.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Tue, 9 Dec 2025 17:05:00 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 9 Dec
 2025 11:04:47 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 9 Dec 2025 11:04:47 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5B9H4kqm1540727;
	Tue, 9 Dec 2025 11:04:46 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vT18o-0000000A4tv-34mS;
	Tue, 09 Dec 2025 11:04:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 2/4] coresdk-11.01.16-config: add config for CoreSDK 11.01.16 release
Date: Tue, 9 Dec 2025 11:04:44 -0600
Message-ID: <20251209170446.2402102-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209170446.2402102-1-reatmon@ti.com>
References: <20251209170446.2402102-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CC:EE_|DS0PR10MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb4a6c0-ab0e-4b2c-1f2c-08de374516e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bRS1NcUgINLU6qLhW8hzYYMUJFmSPPZo58ZmgPNWseeSQoPxwD4XtlOElUDf?=
 =?us-ascii?Q?OoiH1fvekgygeJNXLGei4xMQt46U1zE1Bon7u3EZSV2ErQEG03W1qWho/zjz?=
 =?us-ascii?Q?z4pOnzt1cDdc88xsAenQgsW4Eo3Vwv5bGbdIDAngCJ6I8bvVrsJDHO0/IvZm?=
 =?us-ascii?Q?UXL+ts14adfB8cE8PtnrOlzmLSqHZzKwSb5Q6tbOVWMoe+fFX514xxSD2fEA?=
 =?us-ascii?Q?hjYwzVAc6AHNSet5mbS7SE9xnsipqUtjnhUhdLX0bLX5MuyLvw8I64Mtc118?=
 =?us-ascii?Q?5uXdaosqebt16SE3cggTleJG8yIKEvXqC9upBvGAuOlZVrRH3mMxEDVfIpa8?=
 =?us-ascii?Q?rRVeduRDpwy1xq2osjOFLmCRJJ96uRPFEG7U0m1LE2fzMTjFDx5AK/FjzuNb?=
 =?us-ascii?Q?n26hGN8Lczp8YuKPJeEusW6kNtMzZPna6cRETaQv46fWj7Wr/yUWsLhxR455?=
 =?us-ascii?Q?sstjYIGT0WbTceQsiuAYzhcbSwrEdeiWUd4TixnudHeG5+O5scbWhWL2uJvZ?=
 =?us-ascii?Q?6Cbp+UHGYiDBmja0Xfw5EcMbM36IoLpcJXzlhvKbg5ecgTxc097qFUJnk4PL?=
 =?us-ascii?Q?nbyxIRQri71hZ3hfUCGXI6fBp/a08POv3Ep0bOhdf1gU+G0w1CV4I+ARa2FM?=
 =?us-ascii?Q?NjAVvCkm1QfD9fDoAkgsVIvEAQnDiEN/j738z27VRx0IOWrqNQTVQu7WJOty?=
 =?us-ascii?Q?Ssk4Y5o7uVNrE4trA7kv/yg3iAZ4mLA8VftpMlUlCry9voHkjFaFDgAwVGjo?=
 =?us-ascii?Q?uD0qgp0/Hbsv+0d1BKuH5+yHV36BDtRS4lCdbUNzynspTMh7j4e5tyh4kNy8?=
 =?us-ascii?Q?D7PmPZvw9k3tlFH9+LvHkq+jAbosdBhq4LW07+ynLf7ygC/3KzFsySBCQPDG?=
 =?us-ascii?Q?EaBiDF735vnZ+1JQ+ywxTyo0MlK7VjVuBAJzZIv9vbeLhisTSbN3lBAG7CCO?=
 =?us-ascii?Q?lAZijvtYNH8IJWOD78Rex/6aJsVbu3ApRF9TYE3HxHJ9z0zFOB84cwEec6Ey?=
 =?us-ascii?Q?uY4Km23YUrpPPC2qDjWd60bX1gOVE23uz6QdJWQfDZGp6xpdZHI/3qa3G8Ir?=
 =?us-ascii?Q?QzcFTyhLW/sDwf9TzYFVXhOEyUo1rg/gewJOHVoDNMskovQ4ORx4aomqjlAt?=
 =?us-ascii?Q?z8KplLEuH2IGjHTdFXu29BB5/B74vG9Sw6IcFtgHrQ3BkvZeL/C5N47tDLpc?=
 =?us-ascii?Q?9ZJMMMAnDi4IRrKnNuZvcppQuDhJh4KrXrfJQ83qTo6nl7wzsiiHWy7hp0SK?=
 =?us-ascii?Q?2g+mTVKE3B+nlpwl44VTMtTa5EbJ318KRPpbmzUhcHIL2+aKtV4tNmvz1/Ny?=
 =?us-ascii?Q?9Xo2b3ey1R59Ut2btqUxstFLo9DcOs2xMVy+DU7jP5NziG3XkUN/HKE20/pG?=
 =?us-ascii?Q?cRpI1Zf5qSByUYQib0B0zw1N16NcGl9Y2/mBcL+d0RiacOXvJQgCc5P1v/Df?=
 =?us-ascii?Q?zTXgYm3hT7t11xnVG7nOS8Pfbz2cyOwml9XiYdnomQmR2kKzeptv0IsJ17Su?=
 =?us-ascii?Q?hhwn9gmulrs/h9U=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 17:05:00.8476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb4a6c0-ab0e-4b2c-1f2c-08de374516e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB8054
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 09 Dec 2025 17:05:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16882

From: LCPD Automation Script <lcpdbld@list.ti.com>

Add config for CoreSDK 11.01.16 release.

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 ...onf.json =3D> coresdk-11.01.16-config.conf.json} |  2 +-
 .../coresdk-11.01.16-config.txt}                  |  5 +++--
 .../coresdk-11.01.16-config.yml}                  |  8 --------
 .../coresdk-11.01.16-config.xml}                  | 15 ++++++---------
 4 files changed, 10 insertions(+), 20 deletions(-)
 copy bitbake-setup/coresdk/{coresdk-11.01.08-config.conf.json =3D> coresdk=
-11.01.16-config.conf.json} (99%)
 copy configs/{processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.txt=
 =3D> coresdk/coresdk-11.01.16-config.txt} (86%)
 copy kas/{processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml =3D=
> coresdk/coresdk-11.01.16-config.yml} (91%)
 copy src/configs/{processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.=
13-config.xml =3D> coresdk/coresdk-11.01.16-config.xml} (88%)

diff --git a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json b/bitb=
ake-setup/coresdk/coresdk-11.01.16-config.conf.json
similarity index 99%
copy from bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
copy to bitbake-setup/coresdk/coresdk-11.01.16-config.conf.json
index 8658e2f..99eed4f 100644
--- a/bitbake-setup/coresdk/coresdk-11.01.08-config.conf.json
+++ b/bitbake-setup/coresdk/coresdk-11.01.16-config.conf.json
@@ -1,6 +1,6 @@
 {
   "version": "1.0",
-  "description": "TI CoreSDK v11.01.08",
+  "description": "TI CoreSDK v11.01.16",
   "sources": {
     "oe-layersetup": {
       "git-remote": {
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-conf=
ig.txt b/configs/coresdk/coresdk-11.01.16-config.txt
similarity index 86%
copy from configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.=
txt
copy to configs/coresdk/coresdk-11.01.16-config.txt
index 4d2fb3f..72cc5a5 100644
--- a/configs/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.txt
+++ b/configs/coresdk/coresdk-11.01.16-config.txt
@@ -2,8 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,https://git.openembedded.org/bitbake,2.8,1c9ec1ffde75809de34c10d3e=
c2b40d84d258cb4
-meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.01.16.13,layers=3Dmeta-ti-foundational:meta-ti-ml
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.01.16,laye=
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
,e621da947048842109db1b4fd3917a02e0501aa2,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
@@ -11,7 +12,7 @@ meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mix=
ins,scarthgap/rust,a804
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.01.16,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,0f1e7bf92c89759f0=
ab74cfa5be4ee47b092ad46,layers=3Dmeta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,057ee563305e9484b2=
9d02347aeafdadc5ea28ed,layers=3D
-#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,8=
28139cbee2285c5be983990eb00982b4870081e,layers=3D.:meta-flutter-apps
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
 oe-core,https://git.openembedded.org/openembedded-core,scarthgap,4cf131ebd=
157b79226533b5a5074691dd0e1a4ab,layers=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.y=
ml b/kas/coresdk/coresdk-11.01.16-config.yml
similarity index 91%
copy from kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
copy to kas/coresdk/coresdk-11.01.16-config.yml
index f475f4e..6ff68aa 100644
--- a/kas/processor-sdk/processor-sdk-scarthgap-11.01.16.13-config.yml
+++ b/kas/coresdk/coresdk-11.01.16-config.yml
@@ -15,14 +15,6 @@ repos:
     layers:
       .: disabled
=20
-  meta-tisdk:
-    url: "https://github.com/TexasInstruments/meta-tisdk.git"
-    branch: "scarthgap"
-    commit: "11.01.16.13"
-    layers:
-      meta-ti-foundational:
-      meta-ti-ml:
-
   meta-arago:
     url: "https://git.yoctoproject.org/meta-arago"
     branch: "scarthgap"
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.=
01.16.13-config.xml b/src/configs/coresdk/coresdk-11.01.16-config.xml
similarity index 88%
copy from src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.=
16.13-config.xml
copy to src/configs/coresdk/coresdk-11.01.16-config.xml
index 226bd38..427ad3d 100644
--- a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.01.16.1=
3-config.xml
+++ b/src/configs/coresdk/coresdk-11.01.16-config.xml
@@ -1,6 +1,6 @@
 <?xml version=3D'1.0'?>
 <config>
-    <description>TI Processor SDK vchromium-11.01.16.13</description>
+    <description>TI CoreSDK v11.01.16</description>
=20
     <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
     <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
@@ -10,12 +10,6 @@
     <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'1c9ec1ffde75809de34c10d3ec2b40d84d258cb4'/>
=20
     <repos>
-        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.01.16.13'>
-            <layers>
-                <layer>meta-ti-foundational</layer>
-                <layer>meta-ti-ml</layer>
-            </layers>
-        </repo>
         <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.01.16'>
             <layers>
                 <layer>meta-arago-distro</layer>
@@ -23,11 +17,14 @@
                 <layer>meta-arago-test</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7'>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7' disabled=3D'true'>
             <layers>
                 <layer>meta-chromium</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers/>
+        </repo>
         <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
             <layers/>
         </repo>
@@ -63,7 +60,7 @@
         <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'057ee563305e9484b29d02347aeafdadc5ea28ed'=
>
             <layers/>
         </repo>
-        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'828139cbee2285c5be983990e=
b00982b4870081e' disabled=3D'true'>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
             <layers>
                 <layer>.</layer>
                 <layer>meta-flutter-apps</layer>
--=20
2.43.0


