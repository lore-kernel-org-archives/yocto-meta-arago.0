Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3E63CFA778
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 11:00:55 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8942.1763722847042072047
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Nov 2025 03:00:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=oWmfcZPN;
 spf=temperror, err=temporary DNS error (domain: ti.com, ip: 52.101.46.21, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w23HaB64gdwQ8nxn1B6UXvvj/40ufrvkv1jN2EhTS/gyiM8d228WLplnxpqwWjpPDSNisomWj5o2ysBhYjV9fB6Jytm4xhDKIIeAz1RSI2hv/n2+F9lGQ+qy2Zfz1/PPSKBe3jhVql16Cu3l84/0v+3p/3zdR4kwfN9LxREpvsTQzL8vFYW0JlnDWZo6rjJ4Lh0MQp9q30l+xH7L0N3FCLjqEpRsTERF8Ap5fqw9oE1V1+4HDfPsoPrYKP/m2I9m2OcKVGtvfJFA2LXbPOStxTJQJ1GwTB4cHEj2BxZYdoYaoxRQT20utv67L2cpcdXCs1NnJqfIxFMUooDOq1nxZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oYVF1W8POgeavQjGov3+RBEKmNEoQjPGc7AdCCVeVKU=;
 b=BfZmOPz+hOTJio4CSYkGKT6ooM458yoUQyIMer2ZhzXwBCi4pjHXlpju4/rCjWSdmmXcHlMs0qVUChOKyWHF3OFgAA/5rwIixSO1NbC44ml7ULtX89uDt/X0cxf0yDHkWmihT49iOmIDgtB9KZIbdySB3KkTg8P7RKkfFo+DGOYAFrlhR4fsjQxcUlATGtub3JMr+BwFQ4e2L+FppKx45H3ne/KI618dxdaiZebckcjUVskb2yzgMlXA32vTZn1JstTaht/sCk+j7RvjbGnNnRhiOQ5LI2xNum99YSxM++/2kYNwoJrffXWlbCzkuCsogkAM4PA0rBsBCoTAiZl54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oYVF1W8POgeavQjGov3+RBEKmNEoQjPGc7AdCCVeVKU=;
 b=oWmfcZPNMfmINhlQ2EWqbPUZvPSA/oIhgcxlilIbp8JKC3zX8LwK2XIzZFiPJVZEo9s0g/xtyBt49mQCqYjj33TvVJZlHqW7xg4KFVt9fcAh51//POZlNeS7txj6ddAC8r7j6YVgIpcTKjZ8Ht+T3hUyhpcRRMgEBB1EUytUaBQ=
Received: from BYAPR02CA0025.namprd02.prod.outlook.com (2603:10b6:a02:ee::38)
 by SJ5PPF1DE1C92F7.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::792) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 11:00:41 +0000
Received: from SJ1PEPF00002324.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::e6) by BYAPR02CA0025.outlook.office365.com
 (2603:10b6:a02:ee::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 11:00:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002324.mail.protection.outlook.com (10.167.242.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 11:00:39 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 05:00:33 -0600
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 05:00:33 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 05:00:33 -0600
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALB0VMD1164962;
	Fri, 21 Nov 2025 05:00:32 -0600
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add Sitara SDK 11.02.05.02 legacy release configs
Date: Fri, 21 Nov 2025 16:30:17 +0530
Message-ID: <20251121110017.783107-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002324:EE_|SJ5PPF1DE1C92F7:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b53c53b-7703-4d65-acd5-08de28ed3541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6UxPiDTw4BCQrZwWPd5XTnabrbsRESkssCI3gEOxf3Wq5WEVSBMlfn2w1TLt?=
 =?us-ascii?Q?2XSxiNSy1yhapghBieCIestF7wSDnPkvt78w8ojOjMaB2fTuksj0kJAf7ObS?=
 =?us-ascii?Q?K0zyEEuIUa2XMR/VlAiWPqa84i0U76YcaRAINZvb1reyuy2ZZikDCQKquVyl?=
 =?us-ascii?Q?bwJ2vOlF1xOBrvu8e8ofc9VervpQisn/kQg2uNkJM9VSps7AuV2fFzgY3VB1?=
 =?us-ascii?Q?LlrbIE0DWrRLFB74FRhZwOlKNTPL+8Lxcjv/CTp3AbIdJdKZqN7RmHCEOHAr?=
 =?us-ascii?Q?ql2tz0FmyT3JKQAPrRXB0AP417IwOCeFIGprimgBzlhYktlyduhf/Aa8h0Yd?=
 =?us-ascii?Q?yJV7ZtP4FbUMfugCN9y/oUxKwe+5NLgkHusrB9MB4WiD/Sr0YlRYe7Vs+Saa?=
 =?us-ascii?Q?vXxtzWjvXnfj9D8gY+zaNXU3cJbMreSGl7zEpz1lKBsOlZ173NToSVT1iu7M?=
 =?us-ascii?Q?U2szNg71M2h6ufTcFOqGqpNjclgTv0uMo7jgW6G+JYOd0c/Pm3aTioJ9q4EJ?=
 =?us-ascii?Q?cOHqLilGmzHNmt8w1uEbNyGWQhVRcThurmuDEix3yybVeRbCVqcL+U1negO6?=
 =?us-ascii?Q?cke70u1oRpy0gGVHJeuzLwg1WxLlZvZNfPzvkpQjz5hx4xgW+zHAyUlPFGdg?=
 =?us-ascii?Q?t730v9FM+SbNp3fTmnzlGVU4F/9iZe3qGgG4fA6xFe2gxI/yO1KKWtfZ1/cE?=
 =?us-ascii?Q?9KuXGYT0Dm9AF8+YJTvGedmqu9ptU+8nvx12JZ0Xyv5t+KKSzt+Cjp60Zs5z?=
 =?us-ascii?Q?8QqG4dkJMHmju5/lxXuL0gvqcjKRQwWOHGrumHBqEVV89Xltg7crHSkq0AgH?=
 =?us-ascii?Q?mtUoyREBNtrU/8MB6Xjr0Go5NVog6zd7V/ha8Gx+wiTjPgbpZmBhfQKW82MX?=
 =?us-ascii?Q?9OpMAK3CXvDes9vyi2BRbCfv9iMDe2ebRIBDP9vHzy0JplyklWjeaxMsYtGt?=
 =?us-ascii?Q?fFHOG8PDQlxckeqHRcTGvlcjmUOUlBJfkN7XTW8VP7fq7cnvf3X6bstmLhu9?=
 =?us-ascii?Q?KjiyiZPzIkcS6qwvSOa6aY2bI1mNTaQxXh0XT78Naf6YAI3dJjBa4eyAjEHt?=
 =?us-ascii?Q?ZrbrGNs2LF8cdG0x4833qFgnTY1W3hXPECvNLSSwxa91dUAx71UJbTRTfrUO?=
 =?us-ascii?Q?sR+whLlDengTQKo6Fd8/lwRpF5dYuNrgk9AZGEQgTzgOcFf3Sc7TBPyYoGuS?=
 =?us-ascii?Q?GmWAGqPaHGeivXxgIgCGivXlBoswHfRCwonFb8/XOiAgu0wKVGyNn/nTjpxC?=
 =?us-ascii?Q?9iupxWSNI/1yoUEtTfsXdVkkHZazzGB97o6PMnnu6Hkw3x6RGiTgUbO4o6bM?=
 =?us-ascii?Q?KAWAyJVUhUb4pViT6b6FUIs2BGFwo4BYLMGsN9V2hMVCxGWubMJd0NkIY3/G?=
 =?us-ascii?Q?t2lmQ70TQwBWFowfYe0OxL7JqJuE0dOiE9yQV/r/Y8NRwNIiDj2M+sBdDMq2?=
 =?us-ascii?Q?LCjZ0tXpQFCxaqGSBmq6uDgD2mpCkDjk20w6eDpBE4uSMxglKtFalJ3pY10H?=
 =?us-ascii?Q?8LVtHfSldLV6BY8g/m9u+XgRGeh85FbVXxVT?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 11:00:39.8024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b53c53b-7703-4d65-acd5-08de28ed3541
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002324.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1DE1C92F7
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Nov 2025 11:00:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16819

- Add processor-sdk-scarthgap-11.02.05.02-config used for
building AM335x, AM437x and AM65x legacy platforms.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...sdk-scarthgap-11.02.05.02-config.conf.json | 158 ++++++++++++++++++
 ...essor-sdk-scarthgap-11.02.05.02-config.txt |  18 ++
 ...essor-sdk-scarthgap-11.02.05.02-config.yml |  89 ++++++++++
 ...essor-sdk-scarthgap-11.02.05.02-config.xml |  73 ++++++++
 4 files changed, 338 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.=
02.05.02-config.conf.json
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-11.02.05.=
02-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-c=
onfig.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-11.02=
.05.02-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.02.05.0=
2-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11=
.02.05.02-config.conf.json
new file mode 100644
index 0000000..cd44122
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-11.02.05.02-confi=
g.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK v11.02.05.02",
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
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-conf=
ig.txt b/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.t=
xt
new file mode 100644
index 0000000..31e590a
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11=
.02.05.02,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.05,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,af1db2042caf8021d767dce1b26c08b59b96f3d1,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,f1f248262d662315159ee96c604f97415d1dbe6a,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.05,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,06d498131=
3ce67a8d53b1c14be9845b4b5a9f4cf,layers=3Dmeta
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.y=
ml b/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
new file mode 100644
index 0000000..b12cd5e
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.yml
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
+    commit: "11.02.05.02"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "11.02.05"
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
+    commit: "af1db2042caf8021d767dce1b26c08b59b96f3d1"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "f1f248262d662315159ee96c604f97415d1dbe6a"
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
+    commit: "11.02.05"
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
+    commit: "06d4981313ce67a8d53b1c14be9845b4b5a9f4cf"
+    layers:
+      meta:
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-=
config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-=
config.xml
new file mode 100644
index 0000000..ad5b4dd
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-11.02.05.02-config.=
xml
@@ -0,0 +1,73 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK v11.02.05.02</description>
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
ts/meta-tisdk.git' branch=3D'scarthgap' commit=3D'11.02.05.02'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'11.02.05'>
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
.org/meta-virtualization' branch=3D'scarthgap' commit=3D'af1db2042caf8021d7=
67dce1b26c08b59b96f3d1'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'f1f248262d662315159ee9=
6c604f97415d1dbe6a'>
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
' branch=3D'scarthgap' commit=3D'11.02.05'>
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
edded-core' branch=3D'scarthgap' commit=3D'06d4981313ce67a8d53b1c14be9845b4=
b5a9f4cf'>
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
--=20
2.34.1


