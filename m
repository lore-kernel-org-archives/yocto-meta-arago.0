Return-Path: <j-sahu@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1FFF34C5E
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 14:47:21 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.274400.1776091632842870961
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 13 Apr 2026 07:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=F7Sm/2iY;
 spf=pass (domain: ti.com, ip: 52.101.61.66, mailfrom: j-sahu@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwQ/DXnniu2vjwEhOkLr2gVZCNT2PNMfjA9kVMg97RofLEbFGG46S1H+W8m6zltQ7CjOwKYgg6ILjc2Jd8Aq4GXQUloVUYphT0184z08KfLMKbYVEGLPghzI3ARJcwR3cSRTOaBeTkbB9xGThW+QgtfoVWCId9Xozj/jZwnvnI/R867zrz5GMWBRdSY7PC40FgyGPEXCpNWk4a2nAgFovLINvhOKO0brlc3yFIUrK+HD+ZLMhqPgzyhH00x6+U/8h0tPkhUqTkOH9uWGJ1td5jlySsotmewffy34idN9+bmg6WHLbM3W3yqdDpAtRDwUBcmEZtPEzGM35SDmRaC8dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mLSvbN2HjitDMzYFZc3tmbPeGhgI/N/IlAellA8JDZ4=;
 b=cXF3+OA99/1cdH21l1FCXWpj5c8dhn96a3EP3Y7NG1khhUC9A3WDa4DdDwcdM1IU4UWkVB6xjXYuWusxvKZXYn/NDjhBfu4irOahgcp58kN2FI/8oa13c58GT1eZqhFCH9QlqyM+SDqhLHPIdUOGESveaBnusJ7WW2Z/ln1m9rCvscbUGG1Fa1ryTDOfQlBPid0WTva+f2BurrybKyzmQxztkV577qm1qYb9Nle0aEcHpNhaKrro11NTauwse78EHZ4gMQLgeDGocgK0x/7QGoru0iyp9lWFzNJcszDQXl2QOZ3T2c4cOv8NBYkYePSSEZK51RasHGppMI6zSqZwew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mLSvbN2HjitDMzYFZc3tmbPeGhgI/N/IlAellA8JDZ4=;
 b=F7Sm/2iY/cWnk7qCJAKkTKvZrrno0riQXorvOq3uZWOaXh4iSHw/UXN8idH9Vzid9LU0Wj/h4b6L1tQhiDyrF1RYI+V4pP0Gefs11MibvL4mwrz6B5G3CeLt2mlSntukwNAe1iQgvOWkNz/UEkGBFsr8T6uvHBli0VkrDr27YZA=
Received: from BN0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:408:e6::34)
 by DS0PR10MB7203.namprd10.prod.outlook.com (2603:10b6:8:f5::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.47; Mon, 13 Apr 2026 14:47:08 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:408:e6:cafe::62) by BN0PR03CA0029.outlook.office365.com
 (2603:10b6:408:e6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.48 via Frontend Transport; Mon,
 13 Apr 2026 14:47:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Mon, 13 Apr 2026 14:47:07 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 09:47:07 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 13 Apr
 2026 09:47:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 13 Apr 2026 09:47:06 -0500
Received: from jeevan-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (jeevan-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.233.81])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63DEl4W01103570;
	Mon, 13 Apr 2026 09:47:05 -0500
From: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add new configs for Sitara SDK 12.00.00 Release
Date: Mon, 13 Apr 2026 20:17:02 +0530
Message-ID: <20260413144702.20304-1-j-sahu@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DS0PR10MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: c37152ad-6477-4177-a2e0-08de996b894a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|20052099010|13003099007;
X-Microsoft-Antispam-Message-Info: 
	1Z8o+2Wu5MZg3eniPWYvsLCxJjO8bl/H/i5YyaKxKYLYFt5a9OzEfdBI5VQdtWJAotlClx7KST7OjQvBJMkcK/dFuT0If/aM69GgXamP85ChtVczvMa19zFur8xmxS/t4kj0AIkeiULqY/C9LXRLXf15OOTRQssYxQMrNmISSkYxfuZ/mJJGuwRhD2tN+bv6HDuVnWG7mApvvWS9q4RzLVwyXuG22NyVQ/TYoreGFzqBdqwFFmCzbS0EeVTrAil8SY+uKv5LI4CJo4SqurXhKpYsM81bEINhC/zqryKaF14QZQEuwy73hD/gUnVd4TTM1/p9umKh64ULs0deQESYQcXcdinuOtarXSHC4M9N0nA/Vfofg6d4GCLCL9oHlldYyOFinaYxlnapRCLXLbm1rxX0mf9FiMwvF/LEgfaXVY5t+NKh0Ql4Bvhq6cuH35dait4MyT7QgIC9YM7xbtbOTRfj0GUm2G00O024fuzV6uz4+TLJy21836ytvcOwklKD2NIC43Ou9MHf8Jel06SpJ3eloKEK83Ev9AnrD+6M14Qn23pXwaaBW3VRJWFY5cPJKtXJm7Mucc///Pvg8inGNnTqH/fIwkSL+BtJitQNHkWINBNZdKjXQq5WDtRlT8XizOMBF2yINRFqnE8SBNqd60XV6pbAU2aQrJxCCd5uXq27dX4hGKHsLhQ2RYg9Ar2s8Qa3bgQknhKKx4cfdKK0NA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(20052099010)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qSZXU0TnjVD4mwfW9RpFIEzsScy0l2GeU2QIel1mzUmIndzsC0dXq95wviFN7uX+YJp5aidw/06VtkCvEPo2PqQf9Riu+gHCDSvKTHL3VpN11iivRGBuYAXn564f1trwhKR/o/5uxWgqEI3C0sJzoYZhmAJy1jThJ3bzSiB2I4ExtC0z4zBaTxCPWpaEkH7ESYTlJztVMgJhyGxpQDLj8YCEc+KAeIKyx4ivIi26MUvzJtHXKIrDxkovbqvwUEWWQyH4IaPUg0ZeKSFTcgWZdEq9MCZSuAOEqvWBicwsMT0NFHbFE7WSmGVHzjte5UI3vDGXOpxqotYvHR6PekOXBlDw4uhjQkthB4ww2VvnxSo4i44+7jK3kTEExo4FKv/AGyJK/gtG1HZn+VGLySC21f0Hi3c6UU9Sg1davGdMojppALEUsL88HmgnJzuhKExq
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 14:47:07.5647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c37152ad-6477-4177-a2e0-08de996b894a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7203
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 13 Apr 2026 14:47:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17465

- Add processor-sdk-master-chromium-12.00.00.07.04-config
used for building AM62P, AM62x, AM62LP & Beagleplay.

- Add processor-sdk-master-12.00.00.07.04-config used for
building AM62-SIP.

- Add processor-sdk-master-nonui-12.00.00.07.04-config used
for building AM62L, AM64x and AM62D.

- Add processor-sdk-master-selinux-12.00.00.07.04-config
used for selinux for AM62P, AM62x, AM62LP, AM64x and AM62L.

Signed-off-by: Telukula Jeevan Kumar Sahu <j-sahu@ti.com>
---
 ...sdk-master-12.00.00.07.04-config.conf.json | 136 +++++++++++++++
 ...r-chromium-12.00.00.07.04-config.conf.json | 158 ++++++++++++++++++
 ...ster-nonui-12.00.00.07.04-config.conf.json | 125 ++++++++++++++
 ...er-selinux-12.00.00.07.04-config.conf.json | 158 ++++++++++++++++++
 ...-master-selinux-12.00.00.07.04-config.conf |   4 +
 ...essor-sdk-master-12.00.00.07.04-config.txt |  18 ++
 ...-master-chromium-12.00.00.07.04-config.txt |  20 +++
 ...sdk-master-nonui-12.00.00.07.04-config.txt |  16 ++
 ...k-master-selinux-12.00.00.07.04-config.txt |  21 +++
 ...essor-sdk-master-12.00.00.07.04-config.yml |  88 ++++++++++
 ...-master-chromium-12.00.00.07.04-config.yml | 102 +++++++++++
 ...sdk-master-nonui-12.00.00.07.04-config.yml |  82 +++++++++
 ...k-master-selinux-12.00.00.07.04-config.yml | 104 ++++++++++++
 ...essor-sdk-master-12.00.00.07.04-config.xml |  76 +++++++++
 ...-master-chromium-12.00.00.07.04-config.xml |  84 ++++++++++
 ...sdk-master-nonui-12.00.00.07.04-config.xml |  67 ++++++++
 ...k-master-selinux-12.00.00.07.04-config.xml |  80 +++++++++
 17 files changed, 1339 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-master-12.00.=
00.07.04-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-master-chromi=
um-12.00.00.07.04-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-master-nonui-=
12.00.00.07.04-config.conf.json
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-master-selinu=
x-12.00.00.07.04-config.conf.json
 create mode 100644 conf/fragments/localconf/configs/processor-sdk/processo=
r-sdk-master-selinux-12.00.00.07.04-config.conf
 create mode 100644 configs/processor-sdk/processor-sdk-master-12.00.00.07.=
04-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-master-chromium-12.=
00.00.07.04-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-master-nonui-12.00.=
00.07.04-config.txt
 create mode 100644 configs/processor-sdk/processor-sdk-master-selinux-12.0=
0.00.07.04-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-master-12.00.00.07.04-c=
onfig.yml
 create mode 100644 kas/processor-sdk/processor-sdk-master-chromium-12.00.0=
0.07.04-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-master-nonui-12.00.00.0=
7.04-config.yml
 create mode 100644 kas/processor-sdk/processor-sdk-master-selinux-12.00.00=
.07.04-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-master-12.00.00=
.07.04-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-master-chromium=
-12.00.00.07.04-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-master-nonui-12=
.00.00.07.04-config.xml
 create mode 100644 src/configs/processor-sdk/processor-sdk-master-selinux-=
12.00.00.07.04-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-master-12.00.00.07.0=
4-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-master-12.00=
.00.07.04-config.conf.json
new file mode 100644
index 0000000..856c0ce
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-12.00.00.07.04-confi=
g.conf.json
@@ -0,0 +1,136 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vmaster-12.00.00.07.04",
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "dev"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "master"
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
-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagl=
e","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain",=
"oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
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
diff --git a/bitbake-setup/processor-sdk/processor-sdk-master-chromium-12.0=
0.00.07.04-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-mas=
ter-chromium-12.00.00.07.04-config.conf.json
new file mode 100644
index 0000000..66c2e8d
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-chromium-12.00.00.07=
.04-config.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vmaster-chromium-12.00.00.07.04",
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "dev"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arm"
+    },
+    "meta-slint": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/jeevantelukula/meta-slint.git"
+          }
+        },
+        "rev": "12.00.00.07.04"
+      },
+      "path": "meta-slint"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "master"
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
edded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-t=
i-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","=
meta-arm/meta-arm-toolchain","meta-slint","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
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
diff --git a/bitbake-setup/processor-sdk/processor-sdk-master-nonui-12.00.0=
0.07.04-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-master=
-nonui-12.00.00.07.04-config.conf.json
new file mode 100644
index 0000000..352c418
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04=
-config.conf.json
@@ -0,0 +1,125 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vmaster-nonui-12.00.00.07.04",
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arm"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "master"
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
ed/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti=
/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/me=
ta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
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
diff --git a/bitbake-setup/processor-sdk/processor-sdk-master-selinux-12.00=
.00.07.04-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-mast=
er-selinux-12.00.00.07.04-config.conf.json
new file mode 100644
index 0000000..893f113
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-master-selinux-12.00.00.07.=
04-config.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vmaster-selinux-12.00.00.07.04",
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "master"
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
+        "rev": "dev"
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
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-openembedded"
+    },
+    "meta-ti": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.yoctoproject.org/meta-ti"
+          }
+        },
+        "rev": "master"
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
+        "rev": "master"
+      },
+      "path": "meta-arm"
+    },
+    "meta-slint": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/jeevantelukula/meta-slint.git"
+          }
+        },
+        "rev": "12.00.00.07.04"
+      },
+      "path": "meta-slint"
+    },
+    "oe-core": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/openembedded-core"
+          }
+        },
+        "rev": "master"
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
esystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","met=
a-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-=
arm-toolchain","meta-slint","oe-core/meta","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-=
layersetup/localconf/configs/processor-sdk/processor-sdk-master-selinux-12.=
00.00.07.04-config.conf" ],
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
diff --git a/conf/fragments/localconf/configs/processor-sdk/processor-sdk-m=
aster-selinux-12.00.00.07.04-config.conf b/conf/fragments/localconf/configs=
/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04-config.conf
new file mode 100644
index 0000000..3431b87
--- /dev/null
+++ b/conf/fragments/localconf/configs/processor-sdk/processor-sdk-master-s=
elinux-12.00.00.07.04-config.conf
@@ -0,0 +1,4 @@
+BB_CONF_FRAGMENT_SUMMARY =3D "Config specific overrides for processor-sdk/=
processor-sdk-master-selinux-12.00.00.07.04-config"
+BB_CONF_FRAGMENT_DESCRIPTION =3D "Config specific overrides for processor-=
sdk/processor-sdk-master-selinux-12.00.00.07.04-config"
+
+DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-conf=
ig.txt b/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-config.t=
xt
new file mode 100644
index 0000000..4df34e5
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-config.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,master,12.00=
.00.07.04,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,450e=
a5b3eb5b84c58e71e956c17a23ce1f2335fd,layers=3D.:meta-flutter-apps
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,f7961b2828fe5eba250d396=
8bf1d135a2d28dcf8,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,b5=
bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-python=
:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b1326=
cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d732=
71d08bf4193c2509a34ad12385b6,layers=3Dmeta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,main,01707=
51b487162f8e476fd32d441ddfcf24ca78a,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-master-chromium-12.00.00.0=
7.04-config.txt b/configs/processor-sdk/processor-sdk-master-chromium-12.00=
.00.07.04-config.txt
new file mode 100644
index 0000000..abedc20
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-chromium-12.00.00.07.04-co=
nfig.txt
@@ -0,0 +1,20 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,master,12.00=
.00.07.04,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,master,450e=
a5b3eb5b84c58e71e956c17a23ce1f2335fd,layers=3D.:meta-flutter-apps
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,e252b51f=
d261a4cb05be932f0143ac444693a1ea,layers=3Dmeta-chromium
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,f7961b2828fe5eba250d396=
8bf1d135a2d28dcf8,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,b5=
bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-python=
:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b1326=
cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
+meta-slint,https://github.com/jeevantelukula/meta-slint.git,12.00.00.07.04=
,06536c73e97246fe8607f96d49a28042dc777ab2,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d732=
71d08bf4193c2509a34ad12385b6,layers=3Dmeta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,main,01707=
51b487162f8e476fd32d441ddfcf24ca78a,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-master-nonui-12.00.00.07.0=
4-config.txt b/configs/processor-sdk/processor-sdk-master-nonui-12.00.00.07=
.04-config.txt
new file mode 100644
index 0000000..b34f9e1
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04-confi=
g.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,master,12.00=
.00.07.04,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,b5=
bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-python=
:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b1326=
cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d732=
71d08bf4193c2509a34ad12385b6,layers=3Dmeta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,main,01707=
51b487162f8e476fd32d441ddfcf24ca78a,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/configs/processor-sdk/processor-sdk-master-selinux-12.00.00.07=
.04-config.txt b/configs/processor-sdk/processor-sdk-master-selinux-12.00.0=
0.07.04-config.txt
new file mode 100644
index 0000000..abd167b
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04-con=
fig.txt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,master,05a0ca339a6fee75f7979c=
3ee95fc91b2bd9b92f
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,master,12.00=
.00.07.04,layers=3Dmeta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,master,12.00.00.07,laye=
rs=3Dmeta-arago-distro:meta-arago-extras:meta-arago-test
+meta-selinux,https://git.yoctoproject.org/meta-selinux,master,50803c3dd3d4=
2bfe060b96a094c01d9075e37f41,layers=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,dev,f7961b2828fe5eba250d396=
8bf1d135a2d28dcf8,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,maste=
r,b8968685998a052e5bed0f68a546be800c6849ed,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,b5=
bb24b356d8200e2f4b088bc052eb668502ce33,layers=3Dmeta-networking:meta-python=
:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,master,12.00.00.07,layers=3Dm=
eta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,37d31f41a8d5c47b1326=
cd0ae48b0032eb6d5e88,layers=3Dmeta-arm:meta-arm-toolchain
+meta-slint,https://github.com/jeevantelukula/meta-slint.git,12.00.00.07.04=
,06536c73e97246fe8607f96d49a28042dc777ab2,layers=3D
+oe-core,https://git.openembedded.org/openembedded-core,master,ec113301d732=
71d08bf4193c2509a34ad12385b6,layers=3Dmeta
+#meta-cyclonedx,https://github.com/iris-GmbH/meta-cyclonedx.git,main,01707=
51b487162f8e476fd32d441ddfcf24ca78a,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v3.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
+
+LOCALCONF:DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/kas/processor-sdk/processor-sdk-master-12.00.00.07.04-config.y=
ml b/kas/processor-sdk/processor-sdk-master-12.00.00.07.04-config.yml
new file mode 100644
index 0000000..93f275e
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-12.00.00.07.04-config.yml
@@ -0,0 +1,88 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "master"
+    commit: "12.00.00.07.04"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
+    commit: "f7961b2828fe5eba250d3968bf1d135a2d28dcf8"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-master-chromium-12.00.00.07.04=
-config.yml b/kas/processor-sdk/processor-sdk-master-chromium-12.00.00.07.0=
4-config.yml
new file mode 100644
index 0000000..a9939f7
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-chromium-12.00.00.07.04-config=
.yml
@@ -0,0 +1,102 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "master"
+    commit: "12.00.00.07.04"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-browser:
+    url: "https://github.com/OSSystems/meta-browser.git"
+    branch: "master"
+    commit: "e252b51fd261a4cb05be932f0143ac444693a1ea"
+    path: "sources/meta-browser"
+    layers:
+      meta-chromium:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
+    commit: "f7961b2828fe5eba250d3968bf1d135a2d28dcf8"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-slint:
+    url: "https://github.com/jeevantelukula/meta-slint.git"
+    branch: "12.00.00.07.04"
+    commit: "06536c73e97246fe8607f96d49a28042dc777ab2"
+    path: "sources/meta-slint"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04-co=
nfig.yml b/kas/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04-conf=
ig.yml
new file mode 100644
index 0000000..c2031f2
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04-config.ym=
l
@@ -0,0 +1,82 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "master"
+    commit: "12.00.00.07.04"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
+    path: "sources/oe-core"
+    layers:
+      meta:
diff --git a/kas/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04-=
config.yml b/kas/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04-=
config.yml
new file mode 100644
index 0000000..edcb030
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04-config.=
yml
@@ -0,0 +1,104 @@
+---
+header:
+  version: 17
+  includes:
+    - kas/templates/bblayers.conf.yml
+    - kas/templates/local-arago64-v3.conf.yml
+
+target: tisdk-default-image
+
+repos:
+  bitbake:
+    url: "https://git.openembedded.org/bitbake"
+    branch: "master"
+    commit: "05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f"
+    path: "sources/bitbake"
+    layers:
+      .: disabled
+
+  meta-tisdk:
+    url: "https://github.com/TexasInstruments/meta-tisdk.git"
+    branch: "master"
+    commit: "12.00.00.07.04"
+    path: "sources/meta-tisdk"
+    layers:
+      meta-ti-foundational:
+      meta-ti-ml:
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-arago"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-selinux:
+    url: "https://git.yoctoproject.org/meta-selinux"
+    branch: "master"
+    commit: "50803c3dd3d42bfe060b96a094c01d9075e37f41"
+    path: "sources/meta-selinux"
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "dev"
+    commit: "f7961b2828fe5eba250d3968bf1d135a2d28dcf8"
+    path: "sources/meta-qt6"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "master"
+    commit: "b8968685998a052e5bed0f68a546be800c6849ed"
+    path: "sources/meta-virtualization"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    commit: "b5bb24b356d8200e2f4b088bc052eb668502ce33"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-gnome:
+      meta-filesystems:
+      meta-multimedia:
+
+  meta-ti:
+    url: "https://git.yoctoproject.org/meta-ti"
+    branch: "master"
+    commit: "12.00.00.07"
+    path: "sources/meta-ti"
+    layers:
+      meta-ti-extras:
+      meta-beagle:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "master"
+    commit: "37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88"
+    path: "sources/meta-arm"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-slint:
+    url: "https://github.com/jeevantelukula/meta-slint.git"
+    branch: "12.00.00.07.04"
+    commit: "06536c73e97246fe8607f96d49a28042dc777ab2"
+    path: "sources/meta-slint"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "master"
+    commit: "ec113301d73271d08bf4193c2509a34ad12385b6"
+    path: "sources/oe-core"
+    layers:
+      meta:
+
+local_conf_header:
+  oe-layersetup-local-conf-config-specific: |
+    DISTRO_FEATURES:append =3D " acl xattr pam selinux"
diff --git a/src/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-=
config.xml b/src/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-=
config.xml
new file mode 100644
index 0000000..5d2d859
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-12.00.00.07.04-config.=
xml
@@ -0,0 +1,76 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vmaster-12.00.00.07.04</description>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'master' commit=3D'12.00.00.07.04'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'450ea5b3eb5b84c58e71e956c17a=
23ce1f2335fd' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'b8968685998a052e5bed0=
f68a546be800c6849ed'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'b5bb24b356d8200e2f4b088bc=
052eb668502ce33'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'ec113301d73271d08bf4193c2509a34ad12=
385b6'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-cyclonedx' url=3D'https://github.com/iris-GmbH/=
meta-cyclonedx.git' branch=3D'main' commit=3D'0170751b487162f8e476fd32d441d=
dfcf24ca78a' disabled=3D'true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-master-chromium-12.00.=
00.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-master-chromi=
um-12.00.00.07.04-config.xml
new file mode 100644
index 0000000..9b07396
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-chromium-12.00.00.07.0=
4-config.xml
@@ -0,0 +1,84 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vmaster-chromium-12.00.00.07.04</descrip=
tion>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'master' commit=3D'12.00.00.07.04'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'master' commit=3D'450ea5b3eb5b84c58e71e956c17a=
23ce1f2335fd' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'e252b51fd261a4cb05be932f0143ac4=
44693a1ea'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'b8968685998a052e5bed0=
f68a546be800c6849ed'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'b5bb24b356d8200e2f4b088bc=
052eb668502ce33'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-slint' url=3D'https://github.com/jeevantelukula=
/meta-slint.git' branch=3D'12.00.00.07.04' commit=3D'06536c73e97246fe8607f9=
6d49a28042dc777ab2'>
+            <layers/>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'ec113301d73271d08bf4193c2509a34ad12=
385b6'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-cyclonedx' url=3D'https://github.com/iris-GmbH/=
meta-cyclonedx.git' branch=3D'main' commit=3D'0170751b487162f8e476fd32d441d=
dfcf24ca78a' disabled=3D'true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-master-nonui-12.00.00.=
07.04-config.xml b/src/configs/processor-sdk/processor-sdk-master-nonui-12.=
00.00.07.04-config.xml
new file mode 100644
index 0000000..c879ca5
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-nonui-12.00.00.07.04-c=
onfig.xml
@@ -0,0 +1,67 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vmaster-nonui-12.00.00.07.04</descriptio=
n>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'master' commit=3D'12.00.00.07.04'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'b8968685998a052e5bed0=
f68a546be800c6849ed'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'b5bb24b356d8200e2f4b088bc=
052eb668502ce33'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'ec113301d73271d08bf4193c2509a34ad12=
385b6'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-cyclonedx' url=3D'https://github.com/iris-GmbH/=
meta-cyclonedx.git' branch=3D'main' commit=3D'0170751b487162f8e476fd32d441d=
dfcf24ca78a' disabled=3D'true'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type=3D'oe-layersetup'>
+            <var name=3D'BITBAKE_INCLUSIVE_VARS' value=3D'yes'/>
+        </tool>
+    </tools>
+</config>
diff --git a/src/configs/processor-sdk/processor-sdk-master-selinux-12.00.0=
0.07.04-config.xml b/src/configs/processor-sdk/processor-sdk-master-selinux=
-12.00.00.07.04-config.xml
new file mode 100644
index 0000000..410004e
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-master-selinux-12.00.00.07.04=
-config.xml
@@ -0,0 +1,80 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK vmaster-selinux-12.00.00.07.04</descript=
ion>
+
+    <xi:include href=3D'../../common/distro_arago.xml' xmlns:xi=3D'http://=
www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../common/machines.xml' xmlns:xi=3D'http://www.=
w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/bblayers.conf.xml' xmlns:xi=3D'htt=
p://www.w3.org/2001/XInclude'/>
+    <xi:include href=3D'../../templates/local-arago64-v3.conf.xml' xmlns:x=
i=3D'http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url=3D'https://git.openembedded.org/bitbake' branch=3D'master=
' commit=3D'05a0ca339a6fee75f7979c3ee95fc91b2bd9b92f'/>
+
+    <repos>
+        <repo name=3D'meta-tisdk' url=3D'https://github.com/TexasInstrumen=
ts/meta-tisdk.git' branch=3D'master' commit=3D'12.00.00.07.04'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'master' commit=3D'50803c3dd3d42bfe060b96a094c01d9075e=
37f41'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-qt6' url=3D'https://code.qt.io/yocto/meta-qt6.g=
it' branch=3D'dev' commit=3D'f7961b2828fe5eba250d3968bf1d135a2d28dcf8'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-virtualization' url=3D'https://git.yoctoproject=
.org/meta-virtualization' branch=3D'master' commit=3D'b8968685998a052e5bed0=
f68a546be800c6849ed'>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'b5bb24b356d8200e2f4b088bc=
052eb668502ce33'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'12.00.00.07'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-arm' url=3D'https://git.yoctoproject.org/meta-a=
rm' branch=3D'master' commit=3D'37d31f41a8d5c47b1326cd0ae48b0032eb6d5e88'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-slint' url=3D'https://github.com/jeevantelukula=
/meta-slint.git' branch=3D'12.00.00.07.04' commit=3D'06536c73e97246fe8607f9=
6d49a28042dc777ab2'>
+            <layers/>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'ec113301d73271d08bf4193c2509a34ad12=
385b6'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-cyclonedx' url=3D'https://github.com/iris-GmbH/=
meta-cyclonedx.git' branch=3D'main' commit=3D'0170751b487162f8e476fd32d441d=
dfcf24ca78a' disabled=3D'true'>
+            <layers/>
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


