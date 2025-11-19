Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54464CF58F8
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 20:56:11 +0000 (UTC)
Received: from PH7PR06CU001.outbound.protection.outlook.com (PH7PR06CU001.outbound.protection.outlook.com [52.101.201.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17511.1763585752556193441
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 12:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=n+AGRbSv;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.201.9, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhCLVHT6wHQslHVBQDNiZyoxOxw8x7BvCdPlbjJu8Qknp56k1635i/Wck0ooc/Vl/xaYn9YfjcRv7IEh3ExjcAw5dgONOzDtAFjFE/RzqACvOGZyQYZTArExdVO2dGOgjrMTnomPNiqg6D7TLfEiIBQVc2Ym9bGpNW1KsgQxp8lamcP5bAO9Boob6fIMGZB7dBPGLgBnC/aMaKz8CDNyA86rNsMCEjr2E0ybN0ahfriHy8u63TpKs+BqdQAock6QEGBemSWft66V4BpyVuOGMltZqYZALvNFxV+6f3Dp5EGCksbxXdT+PHYrmb12/oBLcQI9E6+YDWgiOLBI+JpCdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DRrcA8lexq/0yHd6poa8tRi66lhond6tQeY2oJkHlE=;
 b=mgNu//B1Zo2hNZcmXbgYR7kgo8Vmdunj87Ds+MryCj0vbGnC4i1ObknNdMxdYUoeXjghP/zU1yl8+iqXL798SUE9jAXJnwIMk6bcTiz6Hw2O5kXigam+8nXQ2P437zGm2hxEb1BgS602LA9QfzIyHMlxuxcKZhwAxw5tCY3a8GCa+ysgZSFZhl9vHa7roxKf/WCNb2zlq/dE0aUAWcDidivONqEuJ5bi6hhPaXfgCzs+h6wA8nl/YoevCSGgkI7SU9zFGpV28GqqeC7MqTBIi7fntaTaptZ2lB7LRg1vQHGfo2ETIcBpuQ3aa4w6swHziKhzpy6QoSDfhrTe5vBfmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3DRrcA8lexq/0yHd6poa8tRi66lhond6tQeY2oJkHlE=;
 b=n+AGRbSvd2YmaZKvRjXEw2JP1nDCbqCEpeM36gnBndlDh//2MtFQGxJK5jpWdkPiPupE7a6HsRzFRcqoDHNUUWKdPAuPtTCHHKpzoC6jzcPhmdoSnSUpa2RqC5Zth/LGwBlEkKKnvJNrlH6DYSmUOwc2dV2NobdtwZOgd3lVLzs=
Received: from DS7P220CA0046.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::21) by
 SN7PR10MB6285.namprd10.prod.outlook.com (2603:10b6:806:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:55:49 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::4e) by DS7P220CA0046.outlook.office365.com
 (2603:10b6:8:224::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 20:55:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 20:55:47 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:55:43 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 19 Nov
 2025 14:55:43 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 19 Nov 2025 14:55:43 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5AJKthwx2512075;
	Wed, 19 Nov 2025 14:55:43 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vLpDL-00000000L0x-1HT8;
	Wed, 19 Nov 2025 14:55:43 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] check_yocto_rules: Add new PV-1 entries
Date: Wed, 19 Nov 2025 14:55:43 -0600
Message-ID: <20251119205543.80759-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SN7PR10MB6285:EE_
X-MS-Office365-Filtering-Correlation-Id: c7dc071d-1c62-4aa6-86a9-08de27ae0402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P8k6jVoQYUeEw+VCReNa5wcoOgYn6e6+kRpX1D/r4mruCCOPk1oNXpg0+5Oz?=
 =?us-ascii?Q?BVkxDi9lM6MexyOy+lScTWhaiX+Ed+a5MrY9Qd75GC7KiUDFYOVI7CXH5j3I?=
 =?us-ascii?Q?oRhZFDKSdjdF6w4lJat0Uealdw8xIurSFrcnv5OCmS6bVwz+pFhbNmgdbJP6?=
 =?us-ascii?Q?bK7EAuebpwNpj/G5Di8KedK3+hQzm2RTsbN598vA6t/XB78G5tdGJYyoU+w7?=
 =?us-ascii?Q?jk6EXEQ05G0kB6LnIOBwCM8ySDwAM8AoRrnj9v6FFDO9Bt3puAcOu6GvWBcI?=
 =?us-ascii?Q?1Q0NEwVlbwbayCg+rsi5Bt2p63rtm1jDx1aQT5vQaFhU9XgPT8Jf5THlloKP?=
 =?us-ascii?Q?/7okq0Efmpt1+m++fkhA9l/gSVawBko4RlvigiN9xHaEr9BmONX+PVJYQ12c?=
 =?us-ascii?Q?pYuR83XLCJExdY3lxp07K+TJ2yyXjmXyzhP5yN1MJ+xgv9Z2yLe4LLKM2ELK?=
 =?us-ascii?Q?+IknLXs4qyep80sWdyxwAzE5+qxKaYMpVC2oCvm/KRxfKifB7V7HW2B5aXXu?=
 =?us-ascii?Q?rpdI+QLQ6NgmmvbdDAU+b7Vm7O0pQyd7iEF5gqc7Yqo7GiFLfiCyppF91lre?=
 =?us-ascii?Q?eCOIm2qkXixQzQMCsfinTyMgfwZ0Uzzq2EHTMqdAzuTfaIZW1rSuOLnKtUrg?=
 =?us-ascii?Q?+2O3rnuFLdSPBuB4NF3FV+/3NahpCf3ngFSAqFnVKUm6SCzYrhRT1b3aaKAE?=
 =?us-ascii?Q?+kAo7HKSyAVybbyYpMjhp+cH9YJnogsc5h72Hpx6fRLDk7A3hjaSRGUGGscJ?=
 =?us-ascii?Q?v0P3rI2Hf9cli0+Pxx+tC0g9X62f4Mk7x/48rmDdSVWVcTrLLiriGt7J/+e6?=
 =?us-ascii?Q?eqzqql+wNT4PZMui0E9S5bpSX6foEy0L3FXIjCtdnUej4EYULll9DWWu5VX7?=
 =?us-ascii?Q?puB6O2ajjtZ+qYKrXyayBtXSrrk1+IYOBI4zEP194WS26jKjobH/2lCOuxqE?=
 =?us-ascii?Q?aKWtxFe2Aiax81VChJCxsskn9LxBO/E1mHWRjqd8odRLpCvV2JfydNdQe99S?=
 =?us-ascii?Q?Z57iHu8JCs/4dBXWF5eGdn8fBvRQyHj6qyfmJ2GcVhXs/FAdI124g2/y2rQa?=
 =?us-ascii?Q?g1KnK/6+Ncq30M/ZMYHExg8YAc3zHp/x5VhrLhO3gD0d4nuQDPsJic3rPMJz?=
 =?us-ascii?Q?ekRHCreBsvuLKzrEYSzSeZZRePNrNJbJPxMLOOTMX3+59slxo90BtML7KZCC?=
 =?us-ascii?Q?/gY82JJMTlXynGiSaj6u/0diTCFOloXecjLAGEwM+ySZJFURMkMa5ephxlhr?=
 =?us-ascii?Q?64Nf6m50W55N/zDT7JdK00pX/9adV/4LBkdxkWpLmZDcqDY0vJX2eQ1yTU1E?=
 =?us-ascii?Q?nMTJFOfAprvZbMboA3Fh3uin4J/S3cUQvNBUG5kfLeOqiV7+GmhWnbKWMwjn?=
 =?us-ascii?Q?d+nopveXLGAXgfDPbvK9RKBO/iEXH39+QkmdQrqLfrEKRA8VotZfJVzz9ykB?=
 =?us-ascii?Q?sbhmzW2oKol93Xq+l5I00+sfP0OdWv5Bex0qQ5Qp0d7yI9ttR+8FRBUDipWN?=
 =?us-ascii?Q?fPbrV5ndmHFKCwxL59QhTHkQ/6uwymHyqweLk19C6Ig2N/T0EvbAVkgnNJvy?=
 =?us-ascii?Q?kF14pCk8LcW/+hJAnvE=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 20:55:47.7524
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7dc071d-1c62-4aa6-86a9-08de27ae0402
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6285
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Nov 2025 20:56:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16805

We have added a new PV check to the check_repo script that checks to
make sure that PV is set either in the filename or via the PV variable
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index f8be0d01..64f1e8ca 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -26,5 +26,23 @@
     },
     "GUARD-2" : {
         "skip_vars" : [ "arago" , "ti-soc" ]
+    },
+    "PV-1" : {
+        "skip_files": [
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
+            "meta-arago-distro/recipes-graphics/emptty/emptty-conf.bb",
+            "meta-arago-distro/recipes-graphics/wayland/weston-init-arago.=
bb",
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


