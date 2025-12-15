Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73332D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 09:09:13 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.59])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44328.1765789747607083200
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 01:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=VghVhzWz;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.59, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTNQZ094YBJTPyN2wzXIGwpyTGvVpEDuJFsK6MfaKbHr6gJIVmaEltPkWmI7NGRhyLg3xifRULwJkLygIoYvSrFpqLp6+i/UbNxroSRnVw6vCYtuhR10Y8Dyu4Xgcp2ntAjYbELq0P6K6V/b3hPlXj7YicfXZ+tjpHEp+z2AjoyqNiBA63dyEp5Ov1xjXjNTWy6nMc1xZC8Z1JA14IVcE5c+BxHKEZhnV9jhRuyNoW43QDCz5vMQ6OGJNFCu5nktQydzYcnqPFeUBpngbZg0ucXhy0WEsX9xvapX0uNjf7EcYmoHdT7xLX5dulwCAzyfnTFruUoOKN08wNekp9GGoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D72If/zrUnJZcSW8Mw2BdstZbM0s0ezgY0s3/YIZSo0=;
 b=xqZmHdKJBtygN7ZtPAIiSfS1LO6xDjmE2NO3X8/BboGqpWnQLEKsnhs2SC6Mg5YjQeM25tBf4hfKI15h8RaTF46YTwtwktdal5FW2uysa/fEhdSxyaTe6XvvCQqutlma3T4g926Cd2VEIWmLutYGE6ZVtJGbO52hRQMLRxWVqz7uhRc4objXKdvXGoaqyNnXGAC5Dem522xc7+U+UwWi5JRB2apqPcgeDVpGk9YozyEiGZalcrZPxUrOGslOqXDCMPuVkMs2yf9juYhTeOCsHUWRHTw/VUfG0YbTmJajPBWJ9Ax+fUFiD7x+c2f9RUW2VYCF+AcslJfjnkNpu3VICQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D72If/zrUnJZcSW8Mw2BdstZbM0s0ezgY0s3/YIZSo0=;
 b=VghVhzWzJlxFqtkgIh7HVzZXY9j/YfjZJ4Y8buYsQz70+O2ZZzM7zUxTvBvI/zeLX8cxiiaT7L+n6LczYD0UQO1RpHcjxleclMbZHRhA0250T6IHNSCUTLlhOxplHPQREG3oG/4fei0K7nBcbBoX+QZMubgRveU+41CLHs8WtBk=
Received: from DS7PR03CA0031.namprd03.prod.outlook.com (2603:10b6:5:3b5::6) by
 PH5PR10MB997710.namprd10.prod.outlook.com (2603:10b6:510:39d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 09:09:04 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:5:3b5:cafe::72) by DS7PR03CA0031.outlook.office365.com
 (2603:10b6:5:3b5::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 09:09:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 09:09:03 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 03:09:01 -0600
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 15 Dec
 2025 03:09:01 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Dec 2025 03:09:01 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BF98whp2116311;
	Mon, 15 Dec 2025 03:08:59 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add new configs for Sitara SDK 11.02 Release
Date: Mon, 15 Dec 2025 14:38:45 +0530
Message-ID: <20251215090846.2019482-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|PH5PR10MB997710:EE_
X-MS-Office365-Filtering-Correlation-Id: 08ce0000-ea0b-4be6-5700-08de3bb997ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gpY3fJKaBapZytfxpx5R0WgZtznaNjSzRGaLI6xcTPLBtCzFBHkDo9PAUo1w?=
 =?us-ascii?Q?RuQx+ULBYzcL0pQ0O7ybRdgLBcJ+q3j8Anxf+h8l1s3bv1dqm7CcSfehkrSX?=
 =?us-ascii?Q?b4CaQT2OUyZVsN+gNvho0AMuExunJXE0ylbSgzF+aYcpyRNOgRqhqg0VMec1?=
 =?us-ascii?Q?G6AXZSSM2f3jbtyqnECQG1zIbyDgUJdxtVeLheuwXwLCs3JycCnADXkhwIMW?=
 =?us-ascii?Q?HuadewKmF75K9HAKNruKPjKdpErPvPe9ECo9iXBsVoxHrbAQY8NpYE4KZ8JV?=
 =?us-ascii?Q?PqpLUaa3Z5t/uwCPmLhkmDeoFIIK0sxe53Dde2qHCrxUD+V4W55oUpYFxp7E?=
 =?us-ascii?Q?6i8cA+WrbrTgbsaf2xD4ZJLiBSbpABFg/nA9qKR4uOVdB6Sao9nDCMjn/yJW?=
 =?us-ascii?Q?JK/CLB1kKedwD86njEtywVALWAYZYbdg1D+ior/WGHDu6lZ6ugt+LdMnon3J?=
 =?us-ascii?Q?7PN0HQzK2mY1v4g4e8otXjzG1Id+fRgvdbRNOuKutYdEcujwa7T/9UaaKKxk?=
 =?us-ascii?Q?bqG6Ky4zlrDR3IX9xQY6We+48d2VHp403zmczmY/7TlYFQoP2S7dgMQmtrKf?=
 =?us-ascii?Q?gs9LKoZtc2irKWfjYSciTdlRyDwbL2xhwVoo3x/vP6y2iPdsLgHX9dvk+LBN?=
 =?us-ascii?Q?Gdaac3nMbwwsg2uGJ8+sWwaud1ij3/hgoUiNKwecMdrhNC0cCCK/ORziMULC?=
 =?us-ascii?Q?ql9MRs629H2sWiKBgOjhg8P0UfCWBEMoxh2/Kf+ksdHnyif7EKFh11rRvSVi?=
 =?us-ascii?Q?peFeq3hCR0p1IhRrKw79b/epRVkEBc8VON8RivGAHQntPsxWQT0dCeEOIf3Q?=
 =?us-ascii?Q?cSItLgqL9vJAVqcZrNiV1Kue7QLDHwZUldPnu7TmOyRzQ+mGiDEsJibk7mZx?=
 =?us-ascii?Q?fF0MzFJaaHFznTaE2X5sNW+Dh5h6DSFX/wdYfoUrfMX6XtaRtarT9bwYOinU?=
 =?us-ascii?Q?8mec8lmOohm/Ozr1SaRcfDESY+CqiqeDoY0bNoCKt7x21GKnzqy0fEzDp7B1?=
 =?us-ascii?Q?C5ek0Cbpa+EoGpjGViyWCR9BcV+K25bB0XHdmnxzJi8eRfkLW0njHbqkqF1Y?=
 =?us-ascii?Q?eEpquOprBvWqOoaH1qHUg1C6szkWomY5PG7HscgMABZZDyvl74gBqQevyKGN?=
 =?us-ascii?Q?uGgLt31pU9JKFZmmL/jNPU2p2aFGFJBRxmBf9mswxny78XsRdRVsoSlQfTPv?=
 =?us-ascii?Q?TN07YO0z/JrEg74Qut4Sme1IPvOxc9SrIWuDVKh+WciEFX5skbV8Da0F6rXh?=
 =?us-ascii?Q?F8GcvXbAYCMrdREY71eMYeoZx9/HhaR4gFg/Sy0+uyKQ2VtHhJ7J5SgCWD8e?=
 =?us-ascii?Q?OiaDSxbpXNlqFOQrO6zi9bTiDHbfiDpZK4SKYO/Z38sYs/LHQYjZOrTilEo/?=
 =?us-ascii?Q?3LLnK9mdtKScZIRH6S0yszITAFVm7ag/WN8a3kCwYgs9KoiQqMgzkfeFjQ/H?=
 =?us-ascii?Q?2DqhAWRGF/MsO4PwKoQXIJHZAHBSi/Aq1lZnJ2z7AfEzhfdFfsNJU/9oM6Ij?=
 =?us-ascii?Q?zMQ6cWhm76ntRbU=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 09:09:03.6006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08ce0000-ea0b-4be6-5700-08de3bb997ea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH5PR10MB997710
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Dec 2025 09:09:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16891

- Add processor-sdk-scarthgap-chromium-11.02.08.02-config
used for building AM62P, AM62x, AM62LP & Beagleplay.

- Add processor-sdk-scarthgap-11.02.08.02-config used for
building AM62-SIP.

- Add processor-sdk-scarthgap-nonqt-11.02.08.02-config used
for building AM64x and AM62D.

- Add processor-sdk-scarthpag-selinux-11.02.08.02-config
used for selinux for AM62P, AM62x, AM62LP & Beagleplay.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...sdk-scarthgap-11.02.08.02-config.conf.json | 158 ++++++++++++++++
 ...hgap-chromium-11.02.08.02-config.conf.json | 169 ++++++++++++++++++
 ...arthgap-nonqt-11.02.08.02-config.conf.json | 147 +++++++++++++++
 ...thgap-selinux-11.02.08.02-config.conf.json | 169 ++++++++++++++++++
 ...-scarthgap-selinux-11.02.08.02-config.conf |   4 +
 ...essor-sdk-scarthgap-11.02.08.02-config.txt |  19 ++
 ...-scarthgap-chromium-11.02.08.02-config.txt |  20 +++
 ...sdk-scarthgap-nonqt-11.02.08.02-config.txt |  17 ++
 ...k-scarthgap-selinux-11.02.08.02-config.txt |  21 +++
 ...essor-sdk-scarthgap-11.02.08.02-config.yml |  89 +++++++++
 ...-scarthgap-chromium-11.02.08.02-config.yml |  96 ++++++++++
 ...sdk-scarthgap-nonqt-11.02.08.02-config.yml |  84 +++++++++
 ...k-scarthgap-selinux-11.02.08.02-config.yml |  98 ++++++++++
 ...essor-sdk-scarthgap-11.02.08.02-config.xml |  79 ++++++++
 ...-scarthgap-chromium-11.02.08.02-config.xml |  84 +++++++++
 ...sdk-scarthgap-nonqt-11.02.08.02-config.xml |  70 ++++++++
 ...k-scarthgap-selinux-11.02.08.02-config.xml |  80 +++++++++
 17 files changed, 1404 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.=
02.08.02-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-chr=
omium-11.02.08.02-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-non=
qt-11.02.08.02-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-sel=
inux-11.02.08.02-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processo=
r-sdk-scarthgap-selinux-11.02.08.02-config.conf
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-11.02.08.=
02-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-chromium-=
11.02.08.02-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.=
02.08.02-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-selinux-1=
1.02.08.02-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-c=
onfig.yml
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-chromium-11.0=
2.08.02-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.0=
8.02-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02=
.08.02-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-11.02=
.08.02-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-chrom=
ium-11.02.08.02-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-nonqt=
-11.02.08.02-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-selin=
ux-11.02.08.02-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.02.08.0=
2-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11=
.02.08.02-config.conf.json
new file mode 100644
index 0000000..bd61b76
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.02.08.02-confi=
g.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK v11.02.08.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-=
ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-=
arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/=
meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe=
","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta=
-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","=
meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/me=
ta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-1=
1.02.08.02-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-sca=
rthgap-chromium-11.02.08.02-config.conf.json
new file mode 100644
index 0000000..bf80ed1
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08=
.02-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vchromium-11.02.08.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-browser": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/OSSystems/meta-browser.git"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "meta-browser"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-=
ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-=
arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtua=
lization","meta-openembedded/meta-networking","meta-openembedded/meta-pytho=
n","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openemb=
edded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixin=
s","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","me=
ta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta",=
"oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.0=
2.08.02-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scarth=
gap-nonqt-11.02.08.02-config.conf.json
new file mode 100644
index 0000000..b25d9cd
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02=
-config.conf.json
@@ -0,0 +1,147 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vnonqt-11.02.08.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-=
ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-=
arago/meta-arago-test","meta-virtualization","meta-openembedded/meta-networ=
king","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-ope=
nembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedd=
ed/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/met=
a-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-tool=
chain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11=
.02.08.02-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scar=
thgap-selinux-11.02.08.02-config.conf.json
new file mode 100644
index 0000000..be8e307
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.=
02-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vselinux-11.02.08.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git=
"
+          }
+        },
+        "rev": "master"
+      },
+      "path": "oe-layersetup"
+    },
+    "bitbake": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/bitbake"
+          }
+        },
+        "rev": "2.8"
+      },
+      "path": "bitbake"
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/TexasInstruments/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    },
+    "meta-arago": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arago"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arago"
+    },
+    "meta-selinux": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-selinux"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-selinux"
+    },
+    "meta-qt6": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://code.qt.io/yocto/meta-qt6.git"
+          }
+        },
+        "rev": "6.9"
+      },
+      "path": "meta-qt6"
+    },
+    "meta-virtualization": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-virtualization"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-virtualization"
+    },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-lts-mixins": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-lts-mixins"
+          }
+        },
+        "rev": "scarthgap/rust"
+      },
+      "path": "meta-lts-mixins"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-ti"
+    },
+    "meta-arm": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-arm"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-arm"
+    },
+    "meta-clang": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/kraj/meta-clang"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-clang"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "oe-core"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-=
ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-=
arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","met=
a-openembedded/meta-networking","meta-openembedded/meta-python","meta-opene=
mbedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-fil=
esystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/me=
ta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-ar=
m","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup=
" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2", "oe-=
layersetup/localconf/configs/processor-sdk/processor-sdk-scarthgap-selinux-=
11.02.08.02-config.conf" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","mac=
hine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57=
xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-=
evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","mac=
hine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx=
-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/=
beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beaglep=
lay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/=
j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","m=
achine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j7=
84s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle=
2" ]
+          },
+          "distro": {
+            "description": "Available distributions",
+            "options": [ "distro/arago" ]
+          }
+        }
+      }
+    ]
+  }
+}
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-s=
carthgap-selinux-11.02.08.02-config.conf b/conf/fragments/localconf/configs=
/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-config.conf
new file mode 100644
index 0000000..18a448f
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-scarthga=
p-selinux-11.02.08.02-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for processor-sdk/=
processor-sdk-scarthgap-selinux-11.02.08.02-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for processor-=
sdk/processor-sdk-scarthgap-selinux-11.02.08.02-config"
+
+DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-conf=
ig.txt b/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.t=
xt
new file mode 100644
index 0000000..d509c62
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.txt
@@ -0,0 +1,19 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.08.02,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,b=
6e338a8b1fc9f8907f2c9a167c972a1907ff2ea,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.02.0=
8.02-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11=
.02.08.02-config.txt
new file mode 100644
index 0000000..c86bb67
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02-co=
nfig.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.08.02,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f6=
35a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,b=
6e338a8b1fc9f8907f2c9a167c972a1907ff2ea,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.0=
2-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08=
.02-config.txt
new file mode 100644
index 0000000..0bc0fa3
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-confi=
g.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.08.02,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08=
.02-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.0=
2.08.02-config.txt
new file mode 100644
index 0000000..11d3458
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-con=
fig.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.08.02,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,1db6bf1b5=
73b9c908752602c1e2b6a30368da3b7,layers=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
+
+LOCALCONF:DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.yml
new file mode 100644
index 0000000..ae6a4e7
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.yml
@@ -0,0 +1,89 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "11.02.08.02"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "731488911f55ebfe746068512b426351192f82f2"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02=
-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.0=
2-config.yml
new file mode 100644
index 0000000..55cdbd7
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.02-config=
.yml
@@ -0,0 +1,96 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "11.02.08.02"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-browser:
+    url: "https://github.com/OSSystems/meta-browser.git"
+    branch: "master"
+    commit: "27ca52f635a31f5f9762813a8527dd31323549b7"
+    layers:
+      meta-chromium:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "731488911f55ebfe746068512b426351192f82f2"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-co=
nfig.yml b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-conf=
ig.yml
new file mode 100644
index 0000000..3dfff6d
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-config.ym=
l
@@ -0,0 +1,84 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "11.02.08.02"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "731488911f55ebfe746068512b426351192f82f2"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-=
config.yml b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-=
config.yml
new file mode 100644
index 0000000..08b4382
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02-config.=
yml
@@ -0,0 +1,98 @@
+---
+header:
+  version: 17
+  includes:
+    - ../templates/bblayers.conf.yml
+    - ../templates/local-arago64-v2.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "2.8"
+    commit: "8dcf084522b9c66a6639b5f117f554fde9b6b45a"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "11.02.08.02"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-selinux:
+    url: "https://git.yoctoproject.org/meta-selinux"
+    branch: "scarthgap"
+    commit: "1db6bf1b573b9c908752602c1e2b6a30368da3b7"
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "c7d71f4cece4d1fe3110c945b9bd40ca82960e05"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "17ac21e7d7f6f40a87618b22278b63bcfa14dbf2"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+    commit: "a8046d5ec53b1856169ac795aa87cb0d5db84c04"
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "scarthgap"
+    commit: "11.02.08"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "a81c19915b5b9e71ed394032e9a50fd06919e1cd"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "731488911f55ebfe746068512b426351192f82f2"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "1fbd9eddbdf0da062df0510cabff6f6ee33d5752"
+    layers:
+      meta:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-=
config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-=
config.xml
new file mode 100644
index 0000000..d4307aa
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.08.02-config.=
xml
@@ -0,0 +1,79 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK v11.02.08.02</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.02.08.02'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'b6e338a8b1fc9f8907f2c9a16=
7c972a1907ff2ea' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.=
02.08.02-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-chr=
omium-11.02.08.02-config.xml
new file mode 100644
index 0000000..edd40e0
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-chromium-11.02.08.0=
2-config.xml
@@ -0,0 +1,84 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vchromium-11.02.08.02</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.02.08.02'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'b6e338a8b1fc9f8907f2c9a16=
7c972a1907ff2ea' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.=
08.02-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-=
11.02.08.02-config.xml
new file mode 100644
index 0000000..d34d378
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-nonqt-11.02.08.02-c=
onfig.xml
@@ -0,0 +1,70 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vnonqt-11.02.08.02</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.02.08.02'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.0=
2.08.02-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-seli=
nux-11.02.08.02-config.xml
new file mode 100644
index 0000000..8a228c0
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-selinux-11.02.08.02=
-config.xml
@@ -0,0 +1,80 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vselinux-11.02.08.02</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v2.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'2.8' c=
ommit=3D'8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.02.08.02'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'1db6bf1b573b9c908752602c1e2b6a30=
368da3b7'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'6.9' commit=3D'c7d71f4cece4d1fe3110c945b9bd40ca82960e05'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'17ac21e7d7f6f40a87=
618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'89a01c3d9ad1f8fce6aeb4=
dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-lts-mixins' url=3D'https://git.yoctoproject.org=
/meta-lts-mixins' branch=3D'scarthgap/rust' commit=3D'a8046d5ec53b1856169ac=
795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'scarthgap' commit=3D'11.02.08'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'scarthgap' commit=3D'a81c19915b5b9e71ed394032e9a50fd06919e1cd=
'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'scarthgap' commit=3D'731488911f55ebfe746068512b426351192f82f2'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'1fbd9eddbdf0da062df0510cabff6f6e=
e33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+    </repos>
+
+    <local-conf>
+        <line>DISTRO_FEATURES:append =3D " acl xattr pam selinux"</line>
+    </local-conf>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
--=20
2.34.1


