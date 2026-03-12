Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9948E106ACD1
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 16:45:03 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.32])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.297.1773333896410270081
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Mar 2026 09:44:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=md1SCk50;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.32, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLjTISCpMdIjiSzPfa1hblTtP6eL9+ULc2gagTA7tLG+T5+GlRndjFBZjtuCyuUjVrDMrI90cBt7shXnJyZJBN1xW2p3WsPtJlmDCeRRAz08qWTBhfOLYL7Eqf7Ue+GhJRgcLAm3NPZSQu6md2C8V1GXgH8jRxn4LwwIvI9fAj5VXVYZwRxVUMyxHqn9NggjvV2b/F4Nwfa7Fj7D546r3U1ejlEW5e9WJDZoJxu8QWIgTZzKPhKvCXL1oDmKqe1CU0hKvfkAhcpm9eEloKOLxtfueV211twdzwvYw3GDb3U357ekXytp607Dp0RdvB4zD9NHebpey1OzY+XUmCYUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wwgUKxH284759ygagEipDDakdSNhyBj49nZfV5ukzJI=;
 b=esSxetXWkotTKfE4gCjtBqYncKPy8rkPBngacaFH2xI4MESwGbN7FZFIiIcR/kuHw2+IGXuYXavkXz9b9b1JeyoJCEz+rI8pYkmg5bto7bPTRg0VvjnN5YLjwXJ4D7SgjpInlc5c9/wyXH8YIel9DrBxgk4u9ySlppcoSq2deXgiWgGp7rPuqJzIdExjOt11oniszcrSJk7IERbbWekM3R05MAARfCqWEicZBdLg4oVkFOL2TykDF2agXikdwXd8VYiuHO6TN6qXQ9OrzAVN8LdiMIMvZR+BvPg7n6puuBvQo6a66plhrIHiSIvsYdkFyNP99lEFQRY5+IyJuNiu7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wwgUKxH284759ygagEipDDakdSNhyBj49nZfV5ukzJI=;
 b=md1SCk506LRqc7m1siC/ZbnvxNd9ytFd+UuDC58f2/Bqds0ASmXlmuooFDzAdatpYDwgWF6mJIvOuL83xVLpKSE4fu+gdSjKuRLET8enZGLVfLG4DZ7rwQ0BA2BOXZpSdAO5eUo6YYh7kVGi6xD6aX312IS/tEWmaU2EQ3Va7os=
Received: from BL1PR13CA0325.namprd13.prod.outlook.com (2603:10b6:208:2c1::30)
 by IA1PR10MB8212.namprd10.prod.outlook.com (2603:10b6:208:463::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Thu, 12 Mar
 2026 16:44:53 +0000
Received: from BN2PEPF000044AC.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::9b) by BL1PR13CA0325.outlook.office365.com
 (2603:10b6:208:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.24 via Frontend Transport; Thu,
 12 Mar 2026 16:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN2PEPF000044AC.mail.protection.outlook.com (10.167.243.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 12 Mar 2026 16:44:52 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 11:44:51 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 12 Mar
 2026 11:44:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 12 Mar 2026 11:44:50 -0500
Received: from uda0867391-2.dhcp.ti.com (uda0867391-2.dhcp.ti.com [128.247.81.58] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62CGioXi3169811;
	Thu, 12 Mar 2026 11:44:50 -0500
From: Thorsten Lannynd <t-lannynd@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <b-brnich@ti.com>
Subject: [meta-arago][master][PATCH] meta-arago-distro: ffmpeg: Enable OpenSSL support for HTTPS protocol
Date: Thu, 12 Mar 2026 11:44:11 -0500
Message-ID: <20260312164411.324150-1-t-lannynd@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044AC:EE_|IA1PR10MB8212:EE_
X-MS-Office365-Filtering-Correlation-Id: d5089dea-e1d6-4ef0-ff55-08de8056aefb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	yEdF1Y71n3egRyVHtAMt2fpeXhpU6BKSHdSzPM/r8NtY31tIrgUj+us37EgbTD3ZZqLt3W8/5yZMIuxwF2CJmDDahJJrGuW91gl11ncZwDOOs2dDSmAuiGgw4iioA7ke6rXM1aZJ1bwE/rP+pd+1RcTnnVyr5wfXCMHRTJ2pjG+wP8Ozk6XGacqo40ikBRAcD6ZmIEfBONNGzZWfH1DINKuKH/O2IvzWcIE5XqdOsMx1wcv0cZWaGDhzgus3/jkuLhTYNn5Fu3+K+gPtqSQYm94t4SDf4d8fQZRqbZ4AdWQbT3Cam6hg1ACv1SWSGoI8lZal+nsK1Sdq6fsXHe72I+EfoUT5/3IvClEInSmAP+G5U831BmkNVIIj0iug5+465jU6SSaKQ/50hK3U6Yd35CHcZO1wpcSR2zv3HlwUm/jhkm6skihPRRRk8elUKRC4g5QHTeOTwfMVMmJyNK1xvHCXLaGCYA0Br2PNZZoe+sZVxd4Q+M0kpyOovrKjm8SKai18NS32A3PFJdxu8/ME1JtHGar5sJ9JhmicY12Xihylo18hilz/BBQieVSd2TUi7yndi8OOvWbVC965TFOUmgfV19NjGloITwJ0BdrpcEecViUMNr+4dYwR7pqH1qw+QnIfS5VS//aNp7TWuInyJHdPQrJh4rXxDy7+sorUMOKNFf4Z9bnizgjmhIZQ7ki7lk9hpyj+8wH9r/IUPirZs/imREVI0jWpThGhD28rp+rAQFOoWUMA+smOc6ui7Gr+ndYTJApdW89PzAZW4FAAhg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dZMr2cCdAOvqA3nm8RF7ToLvOx89hlyU+QAKm1mfAZ/2sKnDOZeHglK0b6CxjPADRUU7N4687vQYla7OsZJohg/znwbbLq3M+PhnEsjZdKydbGP+Xkaq1gYXySUtM+fubho+XV1Yj0CcgmbFEJZxkA5fmLgphffGZhRfDbpsjBr+LfdOEN9yCwTOBNdBJIpQdE/MCGihX+oXS3Dyu0XYAQYNcRKQXpDIfNtohaoxODgVUoHckTEi8k3NaV0nx5OYdKIt47pJEsWlUXp9q829kispzl9AzVIwNYRjGiqGRTIBX+wk/kMcR3tAYDi2J9nVcRJYggxAO4EofA/O8FRrDh9NeQocQa3KKXRiT27LVYX6veZkpUD9hUrRpSKKXMKZzJ50eiUo9Rf2tCP+yWr5KhuVTy07C84GkPOp0IPUlDYWmzvzKwDBIKJJ0K9pfqsX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 16:44:52.3270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5089dea-e1d6-4ef0-ff55-08de8056aefb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF000044AC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB8212
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Mar 2026 16:45:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17325

Add bbappend to enable OpenSSL in FFmpeg PACKAGECONFIG, allowing FFmpeg to
handle HTTPS URLs directly without requiring external tools for secure
video streaming.

Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
---

 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc        | 4 ++++
 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend | 4 ++++
 2 files changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
 create mode 100644 meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bb=
append

diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc b/meta-=
arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
new file mode 100644
index 00000000..5741ed6f
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg.inc
@@ -0,0 +1,4 @@
+PR:append =3D ".arago0"
+
+# Add OpenSSL support for HTTPS protocol
+PACKAGECONFIG:append =3D " openssl"
\ No newline at end of file
diff --git a/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend =
b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
new file mode 100644
index 00000000..d1c6e9b3
--- /dev/null
+++ b/meta-arago-distro/recipes-multimedia/ffmpeg/ffmpeg_%.bbappend
@@ -0,0 +1,4 @@
+FFMPEG_ARAGO =3D ""
+FFMPEG_ARAGO:arago =3D "ffmpeg.inc"
+
+require ${FFMPEG_ARAGO}

