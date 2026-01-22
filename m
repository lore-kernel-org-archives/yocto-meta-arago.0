Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35199D3EE8E
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 16:43:51 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com (BN1PR04CU002.outbound.protection.outlook.com [52.101.56.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39151.1769093546947929673
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jan 2026 06:52:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=INL3BPzi;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.56.53, mailfrom: p-gupta5@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrVUZi3ONHZ2m4TrlY1GaT36n0+YExYC42Vc0IDTBIaf9E/SLw8wJjblrTwdhNhTlDEfLcthHl+0nm12RVdSxiBFegxYcln+XMBENu8b1uq6641qHnIiKgmxGg1A/b0Xj/t729S6yQqKfsqKC1k2qBOhj8WEDDwZzlhZK05A+zQXEoE6ps4Z/5yt9xtQ4ESsG4yXTswssv7nqXfcfhQCzSUqlROEF8/G2d7tXqpiJoU4CQbxTT4Y9r1e1QO0fC6kVPEvsZuz3RjrZJRnDrp5D1+pb5ffBeAQTdem+BRFmP/FL9622sMXYBbvkMRRN5PLFUyhxpz4nIKZTLYbqqQPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ud6P40U2hrHWRsDV6QbYC+GAqAp58RWy8SbFRZ3nNMw=;
 b=PMs47/3ubKkYWDXpFN0aHIeUOW88LjTB90offexRJL5A6t67JHc9LXpMrYxRFtmz/G1YM23NXconvR0GWm//mS665jlgljTWZ4AgRWLHRsMsd2TI5OCGU9DtIHDA121ZYjd6X7NGrIDWQUwfSSr76T5GZvqAJknzpLhOs1U4qZckXTWZT1qqe40I+85322nvexYb7mLaE66CaFwWkN7Ssy9+PDzFHlEvICkHzM1uuazR2q0lh/UIukRjfzqsDTstrqlRrDYra7obYSNNdYkjOcQnipB5jmOZ5Kp4wsgNehHEbgaGob/ziOJ7PK1QzzVaOrJTO00fweTdObXmitbbUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ud6P40U2hrHWRsDV6QbYC+GAqAp58RWy8SbFRZ3nNMw=;
 b=INL3BPzia6xVufQ5/QB0vKyqn1V4Juqg2/53XegI5xZaSi9Qx3lzdBOUm2ZdOY/VyzMTlFCw9OlQnadX6WCTdlUWX/E7SI0RtGMpxQKRZtthSSZtxhO6jLU7rP7nMP1iafp3loNLdXh5LbthKaUsa67rBdbQegNrYIRIxqBuLbg=
Received: from SA9P221CA0018.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:25::23)
 by CH4PR10MB8100.namprd10.prod.outlook.com (2603:10b6:610:23b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Thu, 22 Jan
 2026 14:52:23 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:25:cafe::79) by SA9P221CA0018.outlook.office365.com
 (2603:10b6:806:25::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Thu,
 22 Jan 2026 14:52:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 14:52:23 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:52:21 -0600
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 22 Jan
 2026 08:52:21 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 22 Jan 2026 08:52:21 -0600
Received: from puyush-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (puyush-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.235.239])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60MEqJFh718106;
	Thu, 22 Jan 2026 08:52:20 -0600
From: Puyush Gupta <p-gupta5@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-gateway: Add 11.2 release config
Date: Thu, 22 Jan 2026 20:22:19 +0530
Message-ID: <20260122145219.149872-1-p-gupta5@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|CH4PR10MB8100:EE_
X-MS-Office365-Filtering-Correlation-Id: caf02118-2b8a-4e6b-ca19-08de59c5d9f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jnSyfiKZMtPt65Nh0bNqrcafSnWKxC5CEYN+RLWcrh7F1Ue9mZrxxFY4kzJm?=
 =?us-ascii?Q?RaSfQYd8aGNiIBFyKZkwK1fmaD+j0FYNJ7vSfbLCLMu+W8TvE7EMfvpL/CpD?=
 =?us-ascii?Q?72JRPd5+Qu0rOcEGs3H/7O62ZbLeIf5WRjOsZmasa1qSGxRL5Zx8xq8xDnNQ?=
 =?us-ascii?Q?gwZN0ubfeIHvd2XJJmyhGaljqHLP/Ev21b2UIr7buNTXWtOHRavciEv94aYx?=
 =?us-ascii?Q?FrSa+c1RfEpXbVb5eB4+10gS74bIhXV51rJkIVy4VfSukjxmk6wTwssajyVI?=
 =?us-ascii?Q?Ha2O90Iph3A9gTA4GAqXbHKew2zzMlwXT1E1z85YcdKcgcwG6ea9bFRSz0zk?=
 =?us-ascii?Q?IU64BTqquE7n6rim4C5zKTna2oCi5EizRgSR6gC6vihkpXYoV9/jxvYwp/Sq?=
 =?us-ascii?Q?XaqAaiGRb5aAJtNWrnIEMOGDXVO48pdRa38pf6CTRxpcZ3A1AYmrxwTQHzQG?=
 =?us-ascii?Q?7tRRpbBLgFpA0hQW1HcbGQdrbiNq764tP8rNv9gcUcSTHml3WOvtg6wOPMWT?=
 =?us-ascii?Q?onVhWn1yLWIoe6aE2mJiSzIqfI8QOOxChzgM0sxnveIaPNKVH7zX2Tldy/9n?=
 =?us-ascii?Q?koAmUI+5BmfjPQejqAWd6D21QAbI0Xx7lOSkgeDx+sHVWQ0MNskHDjhXDSFa?=
 =?us-ascii?Q?9BmlCTWuW2NlfOU3AGO8jsRTkFrt3ev/udjNtysv4IQ9su7EenfvVJNi1oKp?=
 =?us-ascii?Q?gv5Xxor5jkGuYHxGcuwb7CMYNinWh9cxa8RMNHTnDS2OFi6g9PQlziJ/YVgP?=
 =?us-ascii?Q?RbvZAfohAef2q2ywXjkSLJlI07+U5wx6BwJxf5oudVJx9TOU1VCPcZg9IzPx?=
 =?us-ascii?Q?mIk3Ymx7TIfRFgXvQqgzrJtOSXilGLQJZCJ5QldJYttN/EvEUUENZEu1VqIO?=
 =?us-ascii?Q?ms/hBIkN8nK3UOHu5zCaYI+9duJP2kK2pxMKWAZfwXAvsd14/o+4p/TyomVb?=
 =?us-ascii?Q?sgd8sHPYEyfba9CARwA+8rUXRbRIclIKchgdDnehTzSmNY75ZPmBtaQqTPwr?=
 =?us-ascii?Q?FKbc4lruUkodoh7IEGuOAoKDrz+MHQfmE1y9ZBk7PzcHCG3X4mDp+WgE0ou1?=
 =?us-ascii?Q?rfQmLv124Hfv6e/yFsK1DAQHnnrLh7vmHpoQgVVjsWir5IwrwD2q+ABTFIIL?=
 =?us-ascii?Q?f+r9kZrIFrO2t79OJhvA6DSydXaHijiislqoyWh8JRboQL19uEK49sdjvTLT?=
 =?us-ascii?Q?8tn5p6zHUEMqtNz97fUZRhhLJgo45xk3CSR7PDExVo3vFDVUJf8yA2Dsqtbv?=
 =?us-ascii?Q?CwLLd7b1tazSwRqii+APuzLdrzOqYswxyxJIcpXU2QJcN457xAwLpFkDfzvd?=
 =?us-ascii?Q?wr3bAQQdq4Xubka4GdD75yt7vK9vciqIVC1Vi7ZG59ZgAKkCkUtwQ4setAxQ?=
 =?us-ascii?Q?9/JOK9snRmmDxxszL7R+IHHDf4zR4iIIiG1g/DOtGhB4gBa1N7KurWruhNnw?=
 =?us-ascii?Q?XmOrK9g7Nvdp0M6gNVDeHroBxtEf+Yn42Fdd2Z4dAi+6pbAT1TkAKYF5rPSo?=
 =?us-ascii?Q?XoomrU4LscnNxZ8f/eVcfSRKTA1BXZYfWS9q388k+po39BtEtnN8nE9NPB8H?=
 =?us-ascii?Q?9D8bq8wvhzfqJ3qb78BfC8m6ANWUqH+WlsDWHYoVz+Gb6blcclNPtQ9bEhya?=
 =?us-ascii?Q?4w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 14:52:23.2545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: caf02118-2b8a-4e6b-ca19-08de59c5d9f3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH4PR10MB8100
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jan 2026 16:43:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17010

Signed-off By: Puyush Gupta <p-gupta5@ti.com>
---
 ...ssor-sdk-gateway-11.02.00-config.conf.json | 158 ++++++++++++++++++
 .../processor-sdk-gateway-11.02.00-config.txt |  21 +++
 .../processor-sdk-gateway-11.02.00-config.yml |  88 ++++++++++
 .../processor-sdk-gateway-11.02.00-config.xml |  86 ++++++++++
 4 files changed, 353 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-gateway/processor-sdk-gatew=
ay-11.02.00-config.conf.json
 create mode 100644 configs/processor-sdk-gateway/processor-sdk-gateway-11.=
02.00-config.txt
 create mode 100644 kas/processor-sdk-gateway/processor-sdk-gateway-11.02.0=
0-config.yml
 create mode 100644 src/configs/processor-sdk-gateway/processor-sdk-gateway=
-11.02.00-config.xml

diff --git a/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.0=
2.00-config.conf.json b/bitbake-setup/processor-sdk-gateway/processor-sdk-g=
ateway-11.02.00-config.conf.json
new file mode 100644
index 0000000..71165d2
--- /dev/null
+++ b/bitbake-setup/processor-sdk-gateway/processor-sdk-gateway-11.02.00-co=
nfig.conf.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "",
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
+    },
+    "meta-tisdk": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-tisdk"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-ara=
go-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","m=
eta-openembedded/meta-networking","meta-openembedded/meta-python","meta-ope=
nembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-f=
ilesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/=
meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-=
arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/=
meta-ti-foundational","oe-layersetup" ],
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
diff --git a/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-c=
onfig.txt b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-co=
nfig.txt
new file mode 100644
index 0000000..92447af
--- /dev/null
+++ b/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.t=
xt
@@ -0,0 +1,21 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,1640df60b0f75=
722b9e5923a5bfba3767e7d97a8,layers=3Dmeta-arago-distro:meta-arago-extras:me=
ta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f=
635a31f5f9762813a8527dd31323549b7,layers=3Dmeta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,lay=
ers=3D
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c94=
5b9bd40ca82960e05,layers=3D
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scart=
hgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=3D
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap=
,e76bf51a92b41d4cb185fc164ae43a863910ccd1,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,ea8c0b1cf1ab8a0b327=
e3feb1144c1ccf05b8278,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,5c602337ea1a80fb72=
17eeda04e396cf90587dca,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,2b3d2b671=
a149cbeea2bdc9ba42192da2015c3b7,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,32=
482cad2f630892b733c1457b9e9d835b098174,layers=3Dmeta-ti-foundational
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-confi=
g.yml b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.yml
new file mode 100644
index 0000000..f08e815
--- /dev/null
+++ b/kas/processor-sdk-gateway/processor-sdk-gateway-11.02.00-config.yml
@@ -0,0 +1,88 @@
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
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "1640df60b0f75722b9e5923a5bfba3767e7d97a8"
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
+    commit: "e76bf51a92b41d4cb185fc164ae43a863910ccd1"
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
+    commit: "ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278"
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
+    commit: "5c602337ea1a80fb7217eeda04e396cf90587dca"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "2b3d2b671a149cbeea2bdc9ba42192da2015c3b7"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "32482cad2f630892b733c1457b9e9d835b098174"
+    layers:
+      meta-ti-foundational:
diff --git a/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.=
00-config.xml b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.=
02.00-config.xml
new file mode 100644
index 0000000..23378ef
--- /dev/null
+++ b/src/configs/processor-sdk-gateway/processor-sdk-gateway-11.02.00-conf=
ig.xml
@@ -0,0 +1,86 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description></description>
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
+        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'scarthgap' commit=3D'1640df60b0f75722b9e5923a5bfba3767e7d=
97a8'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-browser' url=3D'https://github.com/OSSystems/me=
ta-browser.git' branch=3D'master' commit=3D'27ca52f635a31f5f9762813a8527dd3=
1323549b7' disabled=3D'true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-selinux' url=3D'https://git.yoctoproject.org/me=
ta-selinux' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
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
rg/meta-openembedded' branch=3D'scarthgap' commit=3D'e76bf51a92b41d4cb185fc=
164ae43a863910ccd1'>
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
' branch=3D'scarthgap' commit=3D'ea8c0b1cf1ab8a0b327e3feb1144c1ccf05b8278'>
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
g' branch=3D'scarthgap' commit=3D'5c602337ea1a80fb7217eeda04e396cf90587dca'=
>
+            <layers/>
+        </repo>
+        <repo name=3D'meta-flutter' url=3D'https://github.com/meta-flutter=
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'scarthgap' commit=3D'2b3d2b671a149cbeea2bdc9ba42192da=
2015c3b7'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'32482cad2f630892b733c1457=
b9e9d835b098174'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
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


