Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B179FD29DEC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:25:00 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.55449.1768296293931888009
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Jan 2026 01:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=NqzRJouR;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.35, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTYEYfXehEksSYvToLWMnGrisXl05toGUAUWU8bmajxc57TQZ5hmlBRthMDjGinbNcgWkXnNxokRxoFm1/bHmDcd52dLVL3NwwJTE8/OPcbqnSFCIct4OuWdttSYej+KxA2pVqvw/jsZzaAgJZY30slEchNWKHpH9jMyH8Z0013gcoPZ+g62877M9zywW120CVX7XQYiTpaUtm4AaQJKZLKWUQttGw+L7QabLO2tIC6Nq4Z5Vd7ttHyG1Kso1/49u2iAKD0Ea9e2H1sm/q0NwC+Le0Eh1JR1HhiHa+Ak9FIKvpwWkN0waNHvdVgveA4l5Im1PQwbY0N57SEOS97CpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYQtQSUxEDoEJqcQRmw96NPdJSXg4tvLNR0BBKCm0ek=;
 b=j95HeBV6FcckNP+MfdYPESvBx7lQdSCG2x7qIt2wbC2sWgCoEMS79QdNE7C9Q5qv50z5JOS8/zBQSxu1bn+mFx4NWBLS4kpjeUI7upc5Ennou9mQcsxL+2yi0pt+OE/hQJPSwYEnWNvxVTEiQJJjyAYIWGSC7FUjLeI3rbMRSkupqnfGAi3eolOfIjS1z4mbMG9IjbZtSJnQ4CbIQE+KfiaZfuPv8MegscFL8pqhCHuG44AdkRJ2QIQ9a7LLZ/jJYD//j1OgK3r45MGkxpn3hkiXIkVoqTrqzLgZQQMDThvIFcOlFqWaHfWmVX1BdcBGhB+8e7t43cX/1ZtY3KUfVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xYQtQSUxEDoEJqcQRmw96NPdJSXg4tvLNR0BBKCm0ek=;
 b=NqzRJouR4kxxCaa5A/7DkLmZwQVNgQRhOU/Zx4dIXFiqYmN+jjDpPBfQJciUHcHD4j1xcgZlWPSRVd6b4ZkfMJAEelqDSX+LsUeZyt7ilgjqOPgktDOFcBNWbOzT7oy9vDvmmpCucESUtkEdDXv7Nj6G585vIlCpXxksmVJEgbA=
Received: from MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33)
 by MW6PR10MB7658.namprd10.prod.outlook.com (2603:10b6:303:244::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 09:24:49 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::ef) by MN2PR10CA0020.outlook.office365.com
 (2603:10b6:208:120::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.7 via Frontend Transport; Tue,
 13 Jan 2026 09:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Tue, 13 Jan 2026 09:24:47 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 03:24:46 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 13 Jan
 2026 03:24:46 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 13 Jan 2026 03:24:46 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60D9OivX1917503;
	Tue, 13 Jan 2026 03:24:45 -0600
Date: Tue, 13 Jan 2026 14:54:44 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <prudhvi@ti.com>, <j-sahu@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] processor-sdk: Add Sitara
 SDK 11.02.08.02 EVSE release configs
Message-ID: <20260113092444.e4h3w7p2qjvl3qxu@yogi-work-pc.dhcp.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|MW6PR10MB7658:EE_
X-MS-Office365-Filtering-Correlation-Id: ef0b7fd9-0ccb-4fe9-2ac1-08de52859843
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|34020700016|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8qyrMAgBWFaflFr9kPVTO0e13P0iXRY9yWlyw96Q9wpgQGKJK3+q3cm0oQE4?=
 =?us-ascii?Q?vRcVDM4T6De2pEhfbi3vBtWr68HVKIBMl3ZBpBzaI97nYJCE5Zl3dIEzfqjd?=
 =?us-ascii?Q?M7ErM2bOKgx5OM6jB/wrVhh21CSZtIOjs86n6UqXAFaKS6/DZI0xw1W67oWB?=
 =?us-ascii?Q?0wJvAXL2GB6oSPLJ9nLe+ogt2GcubPh2wjSojZmtOYrGvmXTjyZyT20KPOP5?=
 =?us-ascii?Q?VI2cxclX+g0O/GO0xpNHECpGp5Z+GP+sA8gGsGpjASxW2LjRsJV5T88TKjT2?=
 =?us-ascii?Q?Z6jzTqz4dxYNNZ1zF+V//0jU4YhCSwzAUqdwKWGscnmsRVqAb/m1yv6axRkD?=
 =?us-ascii?Q?Igj9azUvMNafa1cRAj0IZtQ2v9lZUFMPCHWG6sNKs/rEFKoIOvOHL8km4Aq+?=
 =?us-ascii?Q?Hs7BW4JFTjz/ohSkWR53bbl5PRKZM+N+K4xD5AOe8o4Zecr+azcn2zgW8EEM?=
 =?us-ascii?Q?7hXemu+8oGNMInYy56rzASu5Yd/l2ssV/6ItnoRBdQKWvsX679CYjCkXObXB?=
 =?us-ascii?Q?+gwiiIJKtO7QLwlGPdtc6TcUn3wUJQCeeqb2jAjxe2VK0xQstsAbHiTS4hIk?=
 =?us-ascii?Q?OuYoi2bPTk0dkcTU4vESqYNbz/iiWIGz5WTCeLScnoeclT1HTglQTGCB3z6/?=
 =?us-ascii?Q?UGvPdrkHFPmH3Z38ErjZ6dqdTnd0ZT5TWbTWodFjAQsZT9iLEzZUwK9E42l9?=
 =?us-ascii?Q?vZ4r4615DY0kJGc4GGM3NEIQN9BGCtAzyNgFt0le/nAKWXWGMGsmGqwP/mK1?=
 =?us-ascii?Q?e5X7dXxV6GyFjUay1s4v/VrI9tXqoFtTYXBFF3iWA6wI+cWGvPifsepc8g2s?=
 =?us-ascii?Q?Q/JO1isM9uSgjIZe41ybWCuDsdJjIMYFToxdumrfakOqbtYFImeiFGt18/lU?=
 =?us-ascii?Q?qkC9NdOk6dKkIAZeHOefJu3vUFdWdtN10l5/KAul9/lxx6JHlpt05dwUJ2P8?=
 =?us-ascii?Q?DQR8aRZGLUy285plWlIP9Ok+5CKJGtG9MYVW6XvD5TBqXPnS9NaLqUGuOVbs?=
 =?us-ascii?Q?HEY2oA9GQNAm9mwRvkErxjerpbmb6poNC7QVMQVT+2wJ6rz9hjqnO4IYCUTQ?=
 =?us-ascii?Q?/Y04csIRxdYfWBru7+BAg3Vj0vhnRGDkQOfgKrHcmt0ClPjoCtpmt5zj7rQg?=
 =?us-ascii?Q?c6NSaPOQuB38C2UqZaZs8KJA298oJlOpE9wOvY3dj5km7sdzPYElQOAdeOGK?=
 =?us-ascii?Q?P1NXt8Bvtfbq6P13Q3OVbu6aijVuOzz/y/sEo6tFkkcXX5h08LmylCz+DAfI?=
 =?us-ascii?Q?tcBx0YPpk7rMHBAFSX0aLK9u/vYYxrH2a6JRpNEUZIsDRafhf6qH0AQGv7Nz?=
 =?us-ascii?Q?E7OFMVReFiBO5n6UVJDW3+gRu/G4jizz5IfDpZbPOynHjf64uJ6SB3qDbHUX?=
 =?us-ascii?Q?eziLtH7NoyR0cehZi837iOAwtBbbdCyTgPMCkRoDF+MPf+nV51HnnvIRyn9b?=
 =?us-ascii?Q?QkSzPEF5I1l17S3S+huL9pZfkbNU/6BA0X74Orw/YMS79ob3wFTaZEwVyjsi?=
 =?us-ascii?Q?NVRuQs1SN868T1CSh2fIiCUMyfd+p3Kh9YnRl48jueazBSy/L7T2yKVMvQfd?=
 =?us-ascii?Q?k2r/JH9TjWAB9ygnbDI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(34020700016)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:24:47.0644
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef0b7fd9-0ccb-4fe9-2ac1-08de52859843
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7658
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Jan 2026 09:25:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16951

- Add processor-sdk-scarthgap-evse-11.02.08.02-config used for
building EVSE (EV Charging) image for AM62L platform.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---
 ...carthgap-evse-11.02.08.02-config.conf.json | 169 ++++++++++++++++++
 ...-sdk-scarthgap-evse-11.02.08.02-config.txt |  23 +++
 ...-sdk-scarthgap-evse-11.02.08.02-config.yml |  94 ++++++++++
 ...-sdk-scarthgap-evse-11.02.08.02-config.xml |  93 ++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.conf.json
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.conf.json
new file mode 100644
index 0000000..d614b37
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vevse-11.02.08.02",
+  "sources": {
+    "oe-layersetup": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/arago-project/oe-layersetup.git"
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
+    },
+    "meta-everest": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/EVerest/meta-everest"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-everest"
+    },
+    "meta-lumissil-greenphy": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://github.com/phytec/meta-lumissil-greenphy.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-lumissil-greenphy"
+    }
+  },
+  "bitbake-setup": {
+    "configurations": [
+      {
+        "name": "arago",
+        "description": "TI Arago distro build",
+        "bb-layers": [ "meta-tisdk/meta-ti-foundational","meta-tisdk/meta-ti-ml","meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-lts-mixins","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-everest","meta-lumissil-greenphy","oe-layersetup" ],
+        "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v2" ],
+        "oe-fragments-one-of": {
+          "machine": {
+            "description": "Available target machines",
+            "options": [ "machine/am335x-evm","machine/am335x-hs-evm","machine/am437x-evm","machine/am437x-hs-evm","machine/am57xx-evm","machine/am57xx-hs-evm","machine/am62xx-evm","machine/am62xx-lp-evm","machine/am62xxsip-evm","machine/am62axx-evm","machine/am62dxx-evm","machine/am62lxx-evm","machine/am62pxx-evm","machine/am64xx-evm","machine/am65xx-evm","machine/am65xx-hs-evm","machine/am68-sk","machine/am69-sk","machine/beagle-x15","machine/beaglebone","machine/beaglebone-ai64","machine/beagleplay","machine/beagleplay-ti","machine/beagley-ai","machine/j7-evm","machine/j7-hs-evm","machine/j721e-evm","machine/j721e-sk","machine/j7200-evm","machine/j7200-hs-evm","machine/j721s2-evm","machine/j721s2-hs-evm","machine/j742s2-evm","machine/j784s4-evm","machine/j784s4-hs-evm","machine/j722s-evm","machine/pocketbeagle2" ]
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
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.txt
new file mode 100644
index 0000000..869c29a
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.txt
@@ -0,0 +1,23 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f117f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,078b37b05e191a0e69ddbe74b402e0f1b29e6b30,layers=meta-ti-foundational:meta-ti-ml
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,11.02.08,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,27ca52f635a31f5f9762813a8527dd31323549b7,layers=meta-chromium
+#meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e,layers=
+#meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,c7d71f4cece4d1fe3110c945b9bd40ca82960e05,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,17ac21e7d7f6f40a87618b22278b63bcfa14dbf2,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,11.02.08,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71ed394032e9a50fd06919e1cd,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe746068512b426351192f82f2,layers=
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e,layers=.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddbdf0da062df0510cabff6f6ee33d5752,layers=meta
+meta-everest,https://github.com/EVerest/meta-everest,scarthgap,5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6,layers=
+meta-lumissil-greenphy,https://github.com/phytec/meta-lumissil-greenphy.git,scarthgap,3af7953a60337b95ef782e03f794ab797c38151e,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
new file mode 100644
index 0000000..2a9d943
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.yml
@@ -0,0 +1,94 @@
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
+    commit: "078b37b05e191a0e69ddbe74b402e0f1b29e6b30"
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
+
+  meta-everest:
+    url: "https://github.com/EVerest/meta-everest"
+    branch: "scarthgap"
+    commit: "5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6"
+
+  meta-lumissil-greenphy:
+    url: "https://github.com/phytec/meta-lumissil-greenphy.git"
+    branch: "scarthgap"
+    commit: "3af7953a60337b95ef782e03f794ab797c38151e"
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.xml
new file mode 100644
index 0000000..7ef7e25
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.02-config.xml
@@ -0,0 +1,93 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vevse-11.02.08.02</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='scarthgap' commit='078b37b05e191a0e69ddbe74b402e0f1b29e6b30'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+                <layer>meta-ti-ml</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='11.02.08'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-browser' url='https://github.com/OSSystems/meta-browser.git' branch='master' commit='27ca52f635a31f5f9762813a8527dd31323549b7' disabled='true'>
+            <layers>
+                <layer>meta-chromium</layer>
+            </layers>
+        </repo>
+        <repo name='meta-selinux' url='https://git.yoctoproject.org/meta-selinux' branch='scarthgap' commit='21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='c7d71f4cece4d1fe3110c945b9bd40ca82960e05' disabled='true'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='17ac21e7d7f6f40a87618b22278b63bcfa14dbf2'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='a8046d5ec53b1856169ac795aa87cb0d5db84c04'>
+            <layers/>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='11.02.08'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='a81c19915b5b9e71ed394032e9a50fd06919e1cd'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='731488911f55ebfe746068512b426351192f82f2'>
+            <layers/>
+        </repo>
+        <repo name='meta-flutter' url='https://github.com/meta-flutter/meta-flutter.git' branch='scarthgap' commit='21d19b89b47b9e9b3f1a347b29d95541cfb0dd3e' disabled='true'>
+            <layers>
+                <layer>.</layer>
+                <layer>meta-flutter-apps</layer>
+            </layers>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='1fbd9eddbdf0da062df0510cabff6f6ee33d5752'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-everest' url='https://github.com/EVerest/meta-everest' branch='scarthgap' commit='5e7d982af2cf3b5f155648cc0bfdf82e07cab9f6'>
+            <layers/>
+        </repo>
+        <repo name='meta-lumissil-greenphy' url='https://github.com/phytec/meta-lumissil-greenphy.git' branch='scarthgap' commit='3af7953a60337b95ef782e03f794ab797c38151e'>
+            <layers/>
+        </repo>
+    </repos>
+
+    <tools>
+        <tool type='oe-layersetup'>
+            <var name='BITBAKE_INCLUSIVE_VARS' value='yes'/>
+        </tool>
+    </tools>
+</config>
-- 
2.34.1


