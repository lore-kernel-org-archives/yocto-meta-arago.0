Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13CA4CD0418
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 22:19:44 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.15])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77126.1767651579329846494
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 Jan 2026 14:19:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=a0FB4pi3;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.15, mailfrom: afd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDEopJAyVvNxHK0hWpX4BwXOBXt/XV/vNDFQ4F0sLfjZGu9XCD2uB6o4nVvj0KJCbTXwqQ7RQgUOnZxly9JYM48YiFq3SRcrKYGBKeKrMauWwOtuzB7Q38kfqjMngBI7jf+tBRKgQDGoJvsb0KwsxgGN4JoA3aRyOB6ViNhVFhwOQZh0pCWkbGkJrsuWiFOnY6IA/mUp9wvoLoec0sDYuS2BizDT4WLjvlZmpiqH6DCge4H4hN4uTUdiknTJK5Vuaa9Za0OhVL3Uyl605NN+nE0mC/wN/zWW3G1vHHuO4e3zlZNR3zWpDf6fKsTKHsZbXAQ/wV9dzWnzS+QsBrjCpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W5l0tRtDIO+IYCH32g2xAOKmTAc1VX/XbfTW39XxpY=;
 b=uBi3wDwkAdpO07v7stNof0UYT0D9eILd+CblO3raU/wXi2imIUfqMM6qnX5wgUaDJpeikKWryUgaKlJ2Or+FjQgdHNlWcBnLqIJFN6LIqrGh+GB4nHvS53ZRhlTGvdiCVtYQt/Q/qQzeIKx+wJi4E4oXKyYhPzrOzhEDtsuOKCL65S1HUdDe+hBwhWpQoHkooZaf+NAVbhp8HCk9+CKOX66To7zAULunGfJ/K5qtzF1Qtv2YFWCy6TIJ0I7EnIH1dOzO2LmoPEfyA00yUoQ7DlXixAFI1BI42Ydu7o+GLfekA2gPelp1jqcS6DXknTLhxdL3IpFHRViU5wxBzDu1aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W5l0tRtDIO+IYCH32g2xAOKmTAc1VX/XbfTW39XxpY=;
 b=a0FB4pi3YQJJh5wNgv15YLlEoct8hAtC4zcvPIyF0aVzMGYwicHYcDGHpnVROMMp6Vj6ssgDlZdthi6k2vYvfyZOqQk4nPrq8pBR7JV3V3IxYoHHtZ/gzJzuHQefAdUDy6m4lODJSaFS+vrqnCWBDr5SEDID3lr0qtbeTdcBQwA=
Received: from CH3P220CA0004.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:1e8::28)
 by DS7PR10MB5135.namprd10.prod.outlook.com (2603:10b6:5:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 22:19:34 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:1e8:cafe::49) by CH3P220CA0004.outlook.office365.com
 (2603:10b6:610:1e8::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 22:19:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Mon, 5 Jan 2026 22:19:34 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:19:34 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 5 Jan
 2026 16:19:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 5 Jan 2026 16:19:33 -0600
Received: from fllvem-mr08.itg.ti.com ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 605MJXe21862278;
	Mon, 5 Jan 2026 16:19:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
	<meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master][PATCH 2/2] telnetd: Move telnet daemon scripts to meta-arago-test
Date: Mon, 5 Jan 2026 16:19:26 -0600
Message-ID: <20260105221926.2503358-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260105221926.2503358-1-afd@ti.com>
References: <20260105221926.2503358-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|DS7PR10MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: d652a5dc-9381-492c-7057-08de4ca88196
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fQNurDbEmiIQFbCEUlUdxy85I2eFxwCHr9PH5T9U/xlhDV1FFak4wiYjI6+w?=
 =?us-ascii?Q?u29p2krQgYq5KYADJp7gsK5kIN+ZcbYzOxabt51FQ9RIiJVEU3LGqyLf1aN4?=
 =?us-ascii?Q?IvhgRSvWiAOgB9IvPIdH5gVD6vKBlVw0dprxYaubtVEtJpEJcmuUviItRSR6?=
 =?us-ascii?Q?jgLSEBmcT/OvDLZcxysmZfiPTFjrG5QjO7wS9faHjBXitgfqQfJj/C6pW6D5?=
 =?us-ascii?Q?E0ECXr+z0xx3jBSgsrHUh0XcCGbe0tCAhaWCnop2g1WU3u35FspxNgoep3aL?=
 =?us-ascii?Q?r56ouRJptaxwRrsSMKpbFWkl5YFPl6nCcHIDWMINKMDrzFIs8lKQZl34K82n?=
 =?us-ascii?Q?lFm8LKjB6YPPWGtOha5C4r8lVaV70UO95rVR4Mx2az4T3NqyCoiPk3lU3HQo?=
 =?us-ascii?Q?rjrkiQAndZBjTlNETVVitF+3vwfnupu/yPvNHTRPX6PU9rvfDFpeCQVf6AL7?=
 =?us-ascii?Q?A68c/7/RQszhzMEs7sq5yu7e+BbGn6QCMQ/XRKScfgTvdzoFr458bfvRhYvs?=
 =?us-ascii?Q?YKxIyRmV9L0xgiN/WpFClF9rLTadqaDMN6/IphiuZoe4nDm0H0ZkIPNSNV6N?=
 =?us-ascii?Q?R6hyL0jQltHnUXuwRmt5Yme18dIUq6rg3JgF7Si1q2/XJjbyv0Ji+u7rS8EB?=
 =?us-ascii?Q?fIDTPXOanM+O+Z/UUuICt0kBiy5HfifvJJbgZpQfnxUBwIvno2TWb1tDlcmq?=
 =?us-ascii?Q?7oPBUJTwPo8s/90cvcxO8tKE/0t+6xC4xbvKBC4NXUljITCO52Shgdqp/y+w?=
 =?us-ascii?Q?yfMqd9s31C1gaEGvrwE/QZwDfsn7u8gwSCYG/Crv0emLvaz6//HFPTeMWV5t?=
 =?us-ascii?Q?/M0hed34dzyoBDMOtH4R7xhpk1IH6gcCE3HhdwaUkwxe7CxK1BKRP0WTxhz4?=
 =?us-ascii?Q?mNQRWAYuPoK+mSupbuaGnnQLpLNYxY04r5tHeJ+9AHKgoLaHD0+2v/uorz3O?=
 =?us-ascii?Q?Z/abPGjrfpuB1qYg7DcbKfHUFhQL6bjF2oXBbdm2lD+Ozn2sGUaDpktxBZiJ?=
 =?us-ascii?Q?PW9G9oykpUZjdWPZ6fnxw4WX2Jdrp7iCKYuT+s/bpelna7NLiLfDybiobg4/?=
 =?us-ascii?Q?ZW4oGAGfcOWcKNM+5yqoKK5em5eyVAx5ptFuKbp6F8Vx8YyINHg6TCxWUI4s?=
 =?us-ascii?Q?wKCPJozdzoO0xBuyGDC3xubrdfDuWS5rjqd6Y+HEX7TRYnwOXmV+6h9imjF2?=
 =?us-ascii?Q?nrfPiC/3kj13cxMh2eJ03KMskUTMs1SPFaE3Nt/SPUBa+dwQjmu4HpydEE8q?=
 =?us-ascii?Q?MBvpbhkj7xn15wYhSDsxHD3BgfIShYjFM7SC7vRziwky3VMy3iAIGyqX1WfR?=
 =?us-ascii?Q?ad3c0Wsy/Cwnc6IjIaD7S+KD1lexObVk5f5US/CJplKOKLRYBZov/ijcReqE?=
 =?us-ascii?Q?dwZBrbVNybovTe6CHJ01aEf7Av1uBlizFVHcivHgaquaCrounqDC9prs66tM?=
 =?us-ascii?Q?mizzrb0pFYZ42rGsWquMnPQBzkFVwEv3zSZv8ejk51FvocY/meQLWxak2K7b?=
 =?us-ascii?Q?khbh1jaK1Cx2OHiUEmjbqydCkmpF1sjAnFoBv+FHe7zKO67/nb8/hHBbuTkg?=
 =?us-ascii?Q?dbrjFEsDV2FMJrmz6eY=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 22:19:34.4754
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d652a5dc-9381-492c-7057-08de4ca88196
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5135
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 Jan 2026 22:19:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16922

These are only used (and only ever should be used) in testing images.
Move these out of the base distro images and only into images including
the ti-test packagegroup. Move the recipes themselves also over to
meta-arago-test.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 check_yocto_rules.json                                        | 4 ++--
 .../recipes-core/packagegroups/packagegroup-arago-base.bb     | 2 --
 .../initscript-telnetd/initscript-telnetd.bb                  | 0
 .../initscript-telnetd/initscript-telnetd/telnetd             | 0
 .../recipes-connectivity/systemd-telnetd/systemd-telnetd.bb   | 0
 .../systemd-telnetd/systemd-telnetd/telnetd.service           | 0
 meta-arago-test/recipes-core/packagegroups/ti-test.bb         | 2 ++
 7 files changed, 4 insertions(+), 4 deletions(-)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectivity/inits=
cript-telnetd/initscript-telnetd.bb (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectivity/inits=
cript-telnetd/initscript-telnetd/telnetd (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectivity/syste=
md-telnetd/systemd-telnetd.bb (100%)
 rename {meta-arago-distro =3D> meta-arago-test}/recipes-connectivity/syste=
md-telnetd/systemd-telnetd/telnetd.service (100%)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 7b3e20db..26275421 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -27,8 +27,6 @@
     "PV-1" :{
         "skip_files" : [
             "meta-arago-distro/recipes-connectivity/bt-enable/bt-enable.bb=
",
-            "meta-arago-distro/recipes-connectivity/initscript-telnetd/ini=
tscript-telnetd.bb",
-            "meta-arago-distro/recipes-connectivity/systemd-telnetd/system=
d-telnetd.bb",
             "meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-not=
ice.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k-server.bb",
             "meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisd=
k.bb",
@@ -38,6 +36,8 @@
             "meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb=
",
             "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-ducati_git.bb",
             "meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer=
1.0-plugins-vpe_git.bb"
+            "meta-arago-test/recipes-connectivity/initscript-telnetd/inits=
cript-telnetd.bb",
+            "meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-=
telnetd.bb",
         ]
     }
 }
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago=
-base.bb
index b80697e5..d36b4397 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.=
bb
@@ -16,8 +16,6 @@ ARAGO_BASE =3D "\
     mtd-utils \
     mtd-utils-ubifs \
     curl \
-    initscript-telnetd \
-    systemd-telnetd \
     ethtool \
     bash \
     opkg-bash-completion \
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/init=
script-telnetd.bb b/meta-arago-test/recipes-connectivity/initscript-telnetd=
/initscript-telnetd.bb
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/inits=
cript-telnetd.bb
rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd.bb
diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/init=
script-telnetd/telnetd b/meta-arago-test/recipes-connectivity/initscript-te=
lnetd/initscript-telnetd/telnetd
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/initscript-telnetd/inits=
cript-telnetd/telnetd
rename to meta-arago-test/recipes-connectivity/initscript-telnetd/initscrip=
t-telnetd/telnetd
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd=
-telnetd.bb b/meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-=
telnetd.bb
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-=
telnetd.bb
rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-teln=
etd.bb
diff --git a/meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd=
-telnetd/telnetd.service b/meta-arago-test/recipes-connectivity/systemd-tel=
netd/systemd-telnetd/telnetd.service
similarity index 100%
rename from meta-arago-distro/recipes-connectivity/systemd-telnetd/systemd-=
telnetd/telnetd.service
rename to meta-arago-test/recipes-connectivity/systemd-telnetd/systemd-teln=
etd/telnetd.service
diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/meta-a=
rago-test/recipes-core/packagegroups/ti-test.bb
index 22957218..ebac81c2 100644
--- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
@@ -22,6 +22,7 @@ TI_TEST_BASE =3D "\
     hwspinlocktest \
     hdparm \
     i2c-tools \
+    initscript-telnetd \
     iozone3 \
     iproute2-tc \
     iproute2-devlink \
@@ -57,6 +58,7 @@ TI_TEST_BASE =3D "\
     stress \
     stress-ng \
     strongswan \
+    systemd-telnetd \
     tcpdump \
     v4l-utils \
     xdp-tools-arago \
--=20
2.39.2


