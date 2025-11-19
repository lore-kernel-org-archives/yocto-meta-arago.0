Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B97CF58F9
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:56:41 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17625.1763585786117640590
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:56:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nkJ7mWmc;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 40.107.209.39, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpLb7O22E3z+ZNVAdaDc+YklzdUxA65zeZerj/cVqbjnwqnPx87rTD/1Ix3BuDtmkASSdWyH6r6R2FGepeX6EIT26SANvstVJVm56FKitLe2USK4AGg53fpv+w9MxDFmZe+8WoZ9S1c3ErbYZ9pEyKbdvZPYa91q577ww90n1/lkByMzVf2WxjakpHaP6qHbKp2QU4KwYTTToy6A2uqXjYFQHgQjOGpeOTyRx+QtU1MmZIdHKg73IHdSGzYaMpnDqX6oPEsRwBqYvkpFj+sJwZA3P239v7g6nz51KhAElDmUazgrMsExGxstYW6yxgeMSXQa0lz2QudEYKZkMG8Ntw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QIA5BEWXeIhRMisB2g3RttSbwxAla/Hv03uGsQfvkc=;
 b=Ng24JzqwwbOtTTz9+lKzXfI2RAkDIAuqwIG5iNWUGdfqAXoqp9EHAXH2dcCkK7GLe4toC67nAgM9R5sscE36ZICY4LR/d60Rsinwc8NB3q/snDzBasOEGWMlbkgyCK/2PFiIuR+4S4wS0aHzk8QEhDjGyROej2rLicoEIaBvb4byNLAinGoIiNc1+KNvCFzrYCpWY0HrGNa6TAWagYXFwX/N8znTff+cV4C7V0/NkoX62mJz26z5lm6c8vWg5MmDO+OFWp6bULmP7yjFSlcewmmuQ1iQAg2JD3l//fDWAAIP8Wiyuigf2I6eHdr1cO/7lP27pDsxYKdubPXLniHzxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QIA5BEWXeIhRMisB2g3RttSbwxAla/Hv03uGsQfvkc=;
 b=nkJ7mWmcE4GRw+E21t6u7zHTRga4hW14F2/oR9q+sE/tU08fkSADMxIHwProASIIi4El6TkOU8BZ6g3+R7ptcDcaESfQkbw9zsVoQQgXmxulAjx735duB6fnTr0HdFSDi9LoZNKctTyoSf0WQUL0KsJtvEfJ/4DNxHtbbcZ207M=
Received: from BYAPR07CA0096.namprd07.prod.outlook.com (2603:10b6:a03:12b::37)
 by IA1PR10MB7310.namprd10.prod.outlook.com (2603:10b6:208:3ff::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 20:56:23 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:12b:cafe::ff) by BYAPR07CA0096.outlook.office365.com
 (2603:10b6:a03:12b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:56:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:56:22 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:56:18 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:56:18 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:56:18 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKuIYM2512745;
	Wed, 19 Nov 2025 14:56:18 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLpDu-00000000LK5-1j48;
	Wed, 19 Nov 2025 14:56:18 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 14:56:18 -0600
Message-ID: <20251119205618.81958-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|IA1PR10MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: a85c9ceb-f8b7-4e69-df0d-08de27ae18cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BiD+Gqw/PucM1N7/ue3OkJr2e2kmoPgiBN1nqOi4ZS7mEsPDwi3xDGFJy5lL?=
 =?us-ascii?Q?+DCaZTCcre7rUCbb+5PHTSA7thrQR8t4/HeNqtbt/PrwEP5z/Yt3JEPDlWlq?=
 =?us-ascii?Q?a5ZbMvERuYIbzo9CPVfTQKhgu0qi7spkW8bpjr/vRSYyUDfzCYZ8H+Vn/HFQ?=
 =?us-ascii?Q?2TlmKnrGyOlqSRrZDRKbznRHsykOlPlUyQtYBa2tNiMl+UcXnGBd0Rkrpc5I?=
 =?us-ascii?Q?/itmpU+UmetHb/VAfChTqQwBFODAvwCDLtB84hvx/+PTqtQ91fyy4UFZsgOG?=
 =?us-ascii?Q?0lp7c7UbIf8h+9nfqHm3v+QHTsYFQcggcHupbdr24RrwV/Q3vUaAgPjeJrnX?=
 =?us-ascii?Q?DJQyD+Os0dMZScj/a9j5Yu8S5Eg+V49QwilZ3eltNgLaqKAyWPEQibvBwGPe?=
 =?us-ascii?Q?OYKslGZhiLE0RiM8t34RTePtXQbrrAJNo98RKYOmNCpNe71MQRFKRlzx9zzo?=
 =?us-ascii?Q?1TKRUZVBLKedPGMeOPS9iFgJ999fifmlamuaJy1ppqABPc6HUzQwc5qxYPNE?=
 =?us-ascii?Q?pzJxxm/0oGrQedR0wr0S+B5tDOhoO6aP9BEtgLoxgBWIfjYol+xgqRgAXbet?=
 =?us-ascii?Q?O8orwpbnGVZpaGg31hyBERod1N02+Lvs+U5KFRHxKghxrJgbaz/1Y/0F+hFs?=
 =?us-ascii?Q?OgiiG9v56a6EFHILBjiRF3RhbZbzDjkNiZC3oVCjzdEiN74rdcszPC5y/wT/?=
 =?us-ascii?Q?9yRCrem2300tSX3+cmIo5aPZ2xw2NFDdaKNNU9A3xvzNNuNeTcUSYPkS/GSz?=
 =?us-ascii?Q?0OnGX/fL4npQ0s10Y0Y9jShLzKripwFQk8BXuFTbEmUOQUZ/17119qrPJMz5?=
 =?us-ascii?Q?NcIXrrL5ptQ8hM9zjZIO0omT8uF8Vcbq6zqd/45qqzs406AhGhVTnM5exe3W?=
 =?us-ascii?Q?fkg3VXm1z1zJubkSydB0TB0Q09YpgHJk2raTlyTInRS2qEZbjmvuCtaztoRy?=
 =?us-ascii?Q?MEhFOPfarl4adFYzE7NlaTzJ3D0WkluFBbDLiTISLsOuiHrIm4Yx4/AUnSYL?=
 =?us-ascii?Q?omonTXbB/iouU7t5H9465lsvXx1k0MI9uY+l6PE7aF7T7F7v7eamcNLTyZ/T?=
 =?us-ascii?Q?OAd7CfQ4QynvKkKDFRJ8Tguu036D1rra6rtaEcPy8p518VTRHJQJvH0UdnsH?=
 =?us-ascii?Q?8QTHDt5YST/59+hRGYh7mlIRA3mJ9tjC0420Fc7J1LxE7v6jN/eVM9NkbYdt?=
 =?us-ascii?Q?mbDonib0yUuigLJPnTfyykslaDDAmkwMO49Yf4yosWBBR0cPdnElSZ8oCPH9?=
 =?us-ascii?Q?kwazY+9m7w055UsjBrf+f3noOSzRk4QKlStsNuaDr4pDDEK+tuqk6aXK3Ks/?=
 =?us-ascii?Q?83/fp1OGSYFJg2I6vZcbubB8jWyflatJ1RFPaCkGgUTy+AnXXRV/s6NzE/Uk?=
 =?us-ascii?Q?A05jUss9+dHAxhbWhBakfjzr/R48BeiVpJ2g/3FXoNRKvVPAFExPMaFDVbhp?=
 =?us-ascii?Q?fqQOLrLfvvzrF14RGFOuBvywdXvQCUrlnyTXW+Ow7/Ys1BKG4rj/IJKYVsX0?=
 =?us-ascii?Q?76+2FA1Mznj5MyIK+hrQ/EFS/OKOQdu34dEeQAhS8oX6hsfcrsM12hLzLJsv?=
 =?us-ascii?Q?Vq57CeIE+p6PLe4NG2I=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:56:22.6248
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a85c9ceb-f8b7-4e69-df0d-08de27ae18cf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB7310
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16806

We have added a new PV check to the check_repo script that checks to
make sure that PV is set either in the filename or via the PV variable
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 9cf776df..7b3e20db 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -23,5 +23,21 @@
     },
     "GUARD-2" : {
         "skip_vars" : [ "arago" , "ti-soc" ]
+    },
+    "PV-1" :{
+        "skip_files" : [
+            "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb=
",
+            "meta-arago-distro/recipes-connectivity/initscript-telnetd/ini=
tscript-telnetd.bb",
+            "meta-arago-distro/recipes-connectivity/systemd-telnetd/system=
d-telnetd.bb",
+            "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-not=
ice.bb",
+            "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k-server.bb",
+            "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k.bb",
+            "meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb",
+            "meta-arago-extras/recipes-core/oprofile-example/oprofile-exam=
ple_git.bb",
+            "meta-arago-extras/recipes-devtools/opkg/opkg-bash-completion.=
bb",
+            "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb=
",
+            "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-ducati_git.bb",
+            "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-vpe_git.bb"
+        ]
     }
 }
--=20
2.43.0


