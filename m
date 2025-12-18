Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9E45D68BED
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 08:03:12 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36794.1766044982875627087
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 Dec 2025 00:03:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=NyKzOo2D;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.2, mailfrom: s-sinha@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZR8U+UhG63V1zLCvQtmfjGDwjh5BVoS6GH6KosPrsVvXxUZbl9C5N+4OFCYZ4qbeJP+2tZwpZBBx4tBJLIF/OCtF9h6LUpaJB8cDGuSPVhRbwn/7LHYEGbMYm2pkhivt2KcEwv8Kg75fivjtWJqQYJz6hwOOE8iZmbAVivt+tPJbMLTmnNbLLJAi2MQYPauXuOdr2cljyIkbV5ib6MlCJV3QDOIYgH7ezRBHkm025J+8gCvamOdJT8dXcHALT2GjqWSHGeDEVVReVY8ZEyzEbGq3idClPRwGCF7Wm7ScLSZtUhZUM2I/gDT2+6h38SFy1JNvdesJAHuCowCX3LHYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ManO36VOUMWPIhBgZCa0MStlcphhW9FcVuiZPn56DU=;
 b=d0d7swiqfiCU4jQheW1Lmk2Tku01fK/7Ybz+C6bE8ZXIWQv7e57jQgOnershxr/Oii0GFdvYvcPUsMVTME9PL7rMginwVJfhGLkkCoq8gDCqjQlzZ6q0t+T7hJmw1FDD0QNAqsK+x9dTmrK+2FY1mre3cEpvz1U7ohzSUXmYgAdSbJsCAPmncgUkTjjcqNHTwRuN2mqwXyyUoZAEZoRnyhrx1xfboNDk/W3JaRoeA4ijSfotnwtJhNmdYy5a4XP/F1ZWBUVpbElNFMn/eNT6bJRoS+wr95/07K6VFegF7goEhupypF4aLwlRfSMOspLfJi8ELyKum9fwHJvFgtMETg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ManO36VOUMWPIhBgZCa0MStlcphhW9FcVuiZPn56DU=;
 b=NyKzOo2DqmaGiqeSTaWWbBCqE09K7oNKCs2Stp3S9E+9MzGC9FyBkfxvG6QYOwIKu7laoGNGvs5GjGs7lGsFRPVrfl0VywApuzVOlZio/w1eGfuMSf4IAETB82XyhhZd+todM0zy2KDlExJHU3M5dDVBfOcxdTM1IwRXK11CTxE=
Received: from SJ0PR03CA0089.namprd03.prod.outlook.com (2603:10b6:a03:331::34)
 by IA3PR10MB8065.namprd10.prod.outlook.com (2603:10b6:208:50f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 08:02:59 +0000
Received: from CO1PEPF000066E9.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::1) by SJ0PR03CA0089.outlook.office365.com
 (2603:10b6:a03:331::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 08:02:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CO1PEPF000066E9.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 08:02:55 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 02:02:45 -0600
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 02:02:45 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 02:02:45 -0600
Received: from localhost (robotics.dhcp.ti.com [172.24.235.192])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BI80Jq12956280;
	Thu, 18 Dec 2025 02:00:19 -0600
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH v2] configs: processor-sdk-analytics: Add 11.2 release config
Date: Thu, 18 Dec 2025 13:30:17 +0530
Message-ID: <20251218080017.586628-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E9:EE_|IA3PR10MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b70d0a-a82e-41aa-c5b1-08de3e0bd9d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EfemkOd3qrjPRhpvKvVi3gpMpQtMe/8EqWv2FTzSuma38p8/ohHlwIJ6XQWE?=
 =?us-ascii?Q?0rKBdfnOXuU4exBwVHtyVNSo3ZBth0Tv/xZaF6V/QEpExwwFDr0//gdIYrKt?=
 =?us-ascii?Q?d08dm2W7Fxzk+egNhwUG0pMaoj77s/xEs79PAaN0L1ZYuwm0RjT1HCsyi0JZ?=
 =?us-ascii?Q?Czic4rGvui89boV7tkCkzly0DXp8hJ+pdlLJ53yorjC1Rxwb/xKNqMZigNBA?=
 =?us-ascii?Q?uGuT+wGX0J8Sc/AD84J9w/vJ5A8n/r6l/V+anVysAApf1Itj2YZgesVlTgq3?=
 =?us-ascii?Q?Cpzgu7zhE+ffNtCOSmhdgwhIDPu06tb3yCJ8PT8bz9q7G64Ecb0uSRhXcz0p?=
 =?us-ascii?Q?fvdcMTVkuclD31A49L95todS+QGZNIeiKg0QX6Rwd6kyeM3jVPW3Zr33nVah?=
 =?us-ascii?Q?UmH/00wnKz6kadFC5y/UdpDYofiGRSI4CBaTfcufcUWuaHdkI90JmyO0Ine9?=
 =?us-ascii?Q?AZUvJEta+JsG0TWuH1lwDKDO6hvAP/KtXbg2yOi84K9p5xFfLl8pU2SdwFJt?=
 =?us-ascii?Q?JZ2xDQO2K39tUkRiZ+sRN684/sRtkXKCyufGkcEK0nWaIzAwgZyp3hfZSKjU?=
 =?us-ascii?Q?J6e6GcdmA/FlUDem0WpRRWd05gVGZlsmRSqFaAk39ZFtoXJfS200lekL6dJB?=
 =?us-ascii?Q?+zlUkpG0IKgAo5aZnAkhbmzp1dYhhh22c230w7fnT80Rc5pQeCdInx24hiX+?=
 =?us-ascii?Q?ommpuCyjZ+18axnLs/gs4MYl/76KX2XhXNHus8/qfcL073cNQ4gOG3uN0jEB?=
 =?us-ascii?Q?aK9+VEiCkn55WFl97Bdwt7lyUdHhuswoqBP3p4xXY7LESS0MS6XEkv5d/dGm?=
 =?us-ascii?Q?okHzP8tl/UquG4MqhYnSelP1KS5Ughy1e18FEDfn85AG15Wm2Ojndw7mWYbC?=
 =?us-ascii?Q?Et8uiQtRijxNvxonMN5v0Uf/aQGTuvazXACBDBCCKowe55BvaYcMLw/TmGiL?=
 =?us-ascii?Q?zg8CeFFVZAb500l2mtCfGBMqJOam71+EVoKNIAaqSpIWtBRbvVH2dpqPfNnl?=
 =?us-ascii?Q?RtlAEIs2RX7dUeaScECPp994kqmFtGdqkIdL4j522y2845rE5HYL4kFpAxew?=
 =?us-ascii?Q?6MW2u+vNL4RH8NEOC1B7PdExVwuKuTRCzYW+Dx2G3uIvMoAb3ItNoPSQ33FU?=
 =?us-ascii?Q?QF8l3BLlgSmFLgJdoE/sf7c6ZOt22KWXyxXRLcBzsmEQsX/QwXue4bL5rGzl?=
 =?us-ascii?Q?mYuEfrUA2uB0CYiCJ1sSn8N0MuFEJ0StUKSTEha83QI+z/g94T30FbJXTlMU?=
 =?us-ascii?Q?OqjWscFY1wRI7g/I3PXZSyrJWpEdXpnoWQTg5oa6vLEuXJYK4Ot/qCPCz4PQ?=
 =?us-ascii?Q?G038SVtNAP/VyGDdrONc7TFIPCgO3LE3+Tm4AO50v76CRfxltw0VcvQ0UhyM?=
 =?us-ascii?Q?u8V6HCs+4mDbwy5QJA3RCeaXpOi7bqlRgBIfKiFtSdfigZZGDQEfdzlCPgSX?=
 =?us-ascii?Q?VdLMeQRyeqPa4nW1MmUUKFq3kfrKxc9regitx/2drIhMDK/ZNM0bq0fQKzER?=
 =?us-ascii?Q?Ydz62oBe/EDyKmw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 08:02:55.2545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b70d0a-a82e-41aa-c5b1-08de3e0bd9d1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000066E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8065
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Dec 2025 08:03:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16894

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 ...or-sdk-analytics-11.02.00-config.conf.json | 169 ++++++++++++++++++
 ...rocessor-sdk-analytics-11.02.00-config.txt |  22 +++
 ...rocessor-sdk-analytics-11.02.00-config.yml |  93 ++++++++++
 ...rocessor-sdk-analytics-11.02.00-config.xml |  89 +++++++++
 4 files changed, 373 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sdk-ana=
lytics-11.02.00-config.conf.json
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics=
-11.02.00-config.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml

diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-=
11.02.00-config.conf.json b/bitbake-setup/processor-sdk-analytics/processor=
-sdk-analytics-11.02.00-config.conf.json
new file mode 100644
index 0000000..72a43fb
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.02.0=
0-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v11.02.00",
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
+    },
+    "meta-edgeai": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.ti.com/git/edgeai/meta-edgeai.git"
+          }
+        },
+        "rev": "scarthgap"
+      },
+      "path": "meta-edgeai"
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
meta-ti-foundational","meta-edgeai","oe-layersetup" ],
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
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.=
00-config.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.=
02.00-config.txt
new file mode 100644
index 0000000..6d9e2e7
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-conf=
ig.txt
@@ -0,0 +1,22 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f11=
7f554fde9b6b45a
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b9c8be5cceb1b=
67c6d14a871fe20e599542999f1,layers=3Dmeta-arago-distro:meta-arago-extras:me=
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
,89a01c3d9ad1f8fce6aeb4dd0e694cfa28d42099,layers=3Dmeta-networking:meta-pyt=
hon:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rus=
t,a8046d5ec53b1856169ac795aa87cb0d5db84c04,layers=3D
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,802cd01e783aeec00af=
81d99cd242f20ede3adc9,layers=3Dmeta-ti-extras:meta-beagle:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,a81c19915b5b9e71e=
d394032e9a50fd06919e1cd,layers=3Dmeta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,731488911f55ebfe74=
6068512b426351192f82f2,layers=3D
+#meta-flutter,https://github.com/meta-flutter/meta-flutter.git,scarthgap,H=
EAD,layers=3D.:meta-flutter-apps
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,1fbd9eddb=
df0da062df0510cabff6f6ee33d5752,layers=3Dmeta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,71=
e97d787810978a21dc536dfe59d0c821b554fd,layers=3Dmeta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,e814c2=
3648afeb0efd277ae6a9fce9aba0aee025,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
new file mode 100644
index 0000000..929d5df
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-config.y=
ml
@@ -0,0 +1,93 @@
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
+    commit: "b9c8be5cceb1b67c6d14a871fe20e599542999f1"
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
+    commit: "802cd01e783aeec00af81d99cd242f20ede3adc9"
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
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "71e97d787810978a21dc536dfe59d0c821b554fd"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "e814c23648afeb0efd277ae6a9fce9aba0aee025"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
new file mode 100644
index 0000000..36e7a1b
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.02.00-=
config.xml
@@ -0,0 +1,89 @@
+<?xml version=3D'1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.02.00</description>
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
-arago' branch=3D'scarthgap' commit=3D'b9c8be5cceb1b67c6d14a871fe20e5995429=
99f1'>
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
' branch=3D'scarthgap' commit=3D'802cd01e783aeec00af81d99cd242f20ede3adc9'>
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
/meta-flutter.git' branch=3D'scarthgap' commit=3D'HEAD' disabled=3D'true'>
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
+        <repo name=3D'meta-tisdk' url=3D'https://git.ti.com/git/ti-sdk-lin=
ux/meta-tisdk.git' branch=3D'scarthgap' commit=3D'71e97d787810978a21dc536df=
e59d0c821b554fd'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name=3D'meta-edgeai' url=3D'https://git.ti.com/git/edgeai/me=
ta-edgeai.git' branch=3D'scarthgap' commit=3D'e814c23648afeb0efd277ae6a9fce=
9aba0aee025'>
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
--=20
2.34.1


