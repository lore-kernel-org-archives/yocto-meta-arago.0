Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC5D1090233
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 14:06:41 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11844.1773929197640472203
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 07:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=gOg2Zs0/;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.22, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXQFH6owi0cvSOBF2Whdkj1IGyMiD9E97A9BP+8cB2AJA8CjUVLWmbCOWwdPXdjmVq97NZRHygT+UdtuCSCiS258lJ9Ytjxoe4WQtzP0DvFxufIxeXmQpVhlKSKYD9x5L1+1JZBH1SUCKq5zu2ktKcsERQpwi0w4gfuOeSgV8g1mlY5DgntemJL35bXTAOEiACvxpnM+GwTDFB1PDe4T+uuARxWwjJHNiE52jrK2XiGzGyKpZ3ro3VX+o8JXwD0jvo365kl9FfXejfr6YpcvVwdTqVftGIleO+BsMNQvq61ZoKg1+5TXM++G5NwTpZlQj5475v85+biZeL+2FMVUrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eGO8bmnIJ7Q2gE4AAyrtHQquOHaFN4FcsE8DzPnU8rQ=;
 b=J2uyO0ML1QaBhv1J58M3gE5zy9LBHcCRTbZDiVQAcOQdchObZ5X1UVOpbC9ysD7mjA2maNjD550H09mFWFZEd7nQYWkYppwkRLyz64akAFwbmVBqqRl6xNgZyPFy1OmH2Pc9HYizv/KXBD7eCpPXhXCWGQ/d7WmKVZD9F58eHfPiKAOTJhHT3wsF1wJRLxXEuULcD1bw1HQ/lMmaIzU7w0ZpGMO1+EF/Tml7gmRj6aQuzNqJb07RMBcbtOogoDQDxwI6vJFJZjKFviweF1wkhsL4Kwq78Je4QjPoDC+0TPmcp5Y9i2byOwrhZ0xxqZgXKW3a0xtTBs9hwRzEQ6T+oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eGO8bmnIJ7Q2gE4AAyrtHQquOHaFN4FcsE8DzPnU8rQ=;
 b=gOg2Zs0/mJitZkohdExV2bSHlOURviL8uNe+Rrtiaw+AgvHC1ADqa/mabYGSdy72Ypj+vkhDXyheBjENo8ce3hBrmnjzRDZQayl3aZ5jCNbiq9NFjawyDAS0GV3ZdWQprW53Kkp3g6M8u/mjEqMW5ZQVyfRH7zDkDhyWT3J22uQ=
Received: from BLAPR03CA0010.namprd03.prod.outlook.com (2603:10b6:208:32b::15)
 by BLAPR10MB5154.namprd10.prod.outlook.com (2603:10b6:208:328::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Thu, 19 Mar
 2026 14:06:35 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::63) by BLAPR03CA0010.outlook.office365.com
 (2603:10b6:208:32b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Thu,
 19 Mar 2026 14:06:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 14:06:33 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 09:06:27 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 09:06:27 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JE6R192179350;
	Thu, 19 Mar 2026 09:06:27 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1w3E14-00000009gOA-48qi;
	Thu, 19 Mar 2026 09:06:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 3/3] Revert "TEMP: arago-master: lock into specific commit for oe-core"
Date: Thu, 19 Mar 2026 09:06:26 -0500
Message-ID: <20260319140626.2307869-4-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260319140626.2307869-1-reatmon@ti.com>
References: <20260319140626.2307869-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|BLAPR10MB5154:EE_
X-MS-Office365-Filtering-Correlation-Id: f542cd47-0028-4697-1f9b-08de85c0ba5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|13003099007|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	hay0rvFzN1xbMYQsVILXvy1G39JC9s1g0xZZ0Tmq/u24sBbs2oXhS++PROAzEszMcmXU0VwXyysg14O+k4YZwFDorMm8TgwJKuw7mB4VtD/qDjvmXpd2ZvGhO6ww8BShdQI06sLLjsbZUuv6l5gH9exomXM6jeB8dULJzxNXPKOTPvuBnHVKPN9wGEqE8oY6n0JdcLMOfb9Q8irc2ZHoOJ+s1gm/djeYrwCjXYKFlBiLmwQkdjdgT61gSp+mjJKBboZk0i64sxKjSytn1FFhOxX4R0slzb1o4Z3CN4L+yW3rsO5XqVN7136VyZAeoopJNGGAOi7zvuz+s6HFzlFXGeAUbPZh+5xrhTVTeyVyom/4x2edpKxOAJL6A7YVsj+AW+MZHf7rCLTiKO0EQSQvnSVgrZUCKcurRlGVSEKxpfWfAUhvHD+eMnqJkoqbgVQWx+hv8/6IR8nUdMJEJ6FmbPi6yPW4dOEFdFOB1OQbu/14Uu5PazdzX2UZ8Q9p2cjdOONSjWaC4kVv8TMb8wVFzLokvwBWMQcwqgpWfbFKODEWwAzyD4+KQP6xh0zG1HNWV3icHssvtItlmLME/xUF/r4oyOFnz4KXVdozEoo0jMAe0w9jphrztSkHC+WcRsu/tMzdeyq4POxYLFpAuEbWRvZa7Bq0EfQ1Wom6UjavnV5LFyC/9qSQ6b5ZOTFO2dhNELWNOogqYyH+sJSZUHP6UDXY4XRLPUCsTnXbPtIo1hc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(13003099007)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	7iowHaxLAl3TaFe4ZCsPGOq4iX5HmNQ2oahGoXJLjw4J6ylyWgsY9p/9V6Wjftpn1QXi3arwfWbWpdj3BXUEFIEUf5smbzx7oKEQULRWQhoO+1s+bFOIMaHGup3OI8lJl/dxO8rM3yh6nmycHsNVvj4iF7u0CJ3X3/cX5rAR9YcNaNHAfpBWl3cyCWsB8GzKnN1IHr5vnjh3Llav4pDO49exxoGo0zZE/5KiMAmG9knu380PhAuFTqudVEpMyoeJ607xr5waELTC4ilAdqw9IhMEUMCmOPgD2QdzMqxOy+WNwvK+6zoDYCvUZecC+6QE4lFl+2PS+xmrnUudXp949p+ZPEGngQ19MyI0H3+oPT9rqfWhRlfeCAyG6l/vCacc+FdTY82FyyuaEBGFQERabs+a5gm0yT/m9JMqaDaz5ww+vgJJdGBnIKBpd2xru+ik
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 14:06:33.8969
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f542cd47-0028-4697-1f9b-08de85c0ba5f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5154
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 19 Mar 2026 14:06:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17405

This reverts commit 84dcabbf5d7c2b3c60935884be0f0d2c20db974b.
---
 configs/arago-master-chromium-config.txt     | 2 +-
 configs/arago-master-config.txt              | 2 +-
 configs/arago-master-flutter-config.txt      | 2 +-
 configs/arago-master-next-config.txt         | 2 +-
 configs/arago-master-selinux-config.txt      | 2 +-
 configs/arago-master-wip-config.txt          | 2 +-
 kas/arago-master-chromium-config.yml         | 1 -
 kas/arago-master-config.yml                  | 1 -
 kas/arago-master-flutter-config.yml          | 1 -
 kas/arago-master-next-config.yml             | 1 -
 kas/arago-master-selinux-config.yml          | 1 -
 kas/arago-master-wip-config.yml              | 1 -
 src/configs/arago-master-chromium-config.xml | 2 +-
 src/configs/arago-master-config.xml          | 2 +-
 src/configs/arago-master-flutter-config.xml  | 2 +-
 src/configs/arago-master-next-config.xml     | 2 +-
 src/configs/arago-master-selinux-config.xml  | 2 +-
 src/configs/arago-master-wip-config.xml      | 2 +-
 18 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-maste=
r-chromium-config.txt
index d9bf7c9..e1fda52 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.=
txt
index 4b11575..53262bb 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master=
-flutter-config.txt
index da1ba5a..37be2a0 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -10,7 +10,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-ne=
xt-config.txt
index 4f94621..0644138 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -19,7 +19,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=3Dmet=
a-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master=
-selinux-config.txt
index c9b9aa7..cd0ca0e 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip=
-config.txt
index 941dfdd..1ad6f58 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -11,7 +11,7 @@ meta-virtualization,https://git.yoctoproject.org/meta-vir=
tualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems=
:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-oe-core,https://git.openembedded.org/openembedded-core,master,2dc4d2f8b5c7=
a6e87291385fb860436593767199,layers=3Dmeta
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromi=
um-config.yml
index f092547..b114247 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -74,7 +74,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index 36c5a8f..6b3be87 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -66,7 +66,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter=
-config.yml
index 3a04874..4607b49 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -74,7 +74,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-confi=
g.yml
index 8a4ffcc..34ca419 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -66,7 +66,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux=
-config.yml
index 7c59570..65a1925 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -71,7 +71,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/kas/arago-master-wip-config.yml b/kas/arago-master-wip-config.=
yml
index 341d729..c35df05 100644
--- a/kas/arago-master-wip-config.yml
+++ b/kas/arago-master-wip-config.yml
@@ -66,7 +66,6 @@ repos:
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
-    commit: "2dc4d2f8b5c7a6e87291385fb860436593767199"
     path: "sources/oe-core"
     layers:
       meta:
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/ara=
go-master-chromium-config.xml
index efd794d..c242124 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master=
-config.xml
index 251f5f0..28cd760 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arag=
o-master-flutter-config.xml
index abc8665..26e9335 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -55,7 +55,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-m=
aster-next-config.xml
index f49b885..8a7e009 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -61,7 +61,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arag=
o-master-selinux-config.xml
index ba4bf57..b09a45c 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
diff --git a/src/configs/arago-master-wip-config.xml b/src/configs/arago-ma=
ster-wip-config.xml
index e703e1c..497f431 100644
--- a/src/configs/arago-master-wip-config.xml
+++ b/src/configs/arago-master-wip-config.xml
@@ -60,7 +60,7 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'2dc4d2f8b5c7a6e87291385fb8604365937=
67199'>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
--=20
2.43.0


