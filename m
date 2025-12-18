Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECBAD68BE9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 07:42:22 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com (DM1PR04CU001.outbound.protection.outlook.com [52.101.61.5])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36552.1766043738950254992
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 17 Dec 2025 23:42:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=DFnYdvx9;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.61.5, mailfrom: s-sinha@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kaGGagW8Rf2a/WM0U8RbclZ79tm6lmeE+37wsnVsuMW0Qdky2hIqnHk7fOg1xArqhVy/8zoNMAYnI72JUX5Mu9eJU3rV6wGogUuyIb9L/bKb7XSvCuM6H8CEVbeD/24+NWnlFUnVCPGqdQ/DdgIYTvJkfQMQVpX11Vis8gQVhAtYXSwjWpwXdoSjWc8MQAvA/upYzQcYud/MKPD+0Be++jpNVnlFbPhSh+RNf9dz4Fe3JgBVoluDu7yyff17rkYRYD4E7dJmM5aQa1LStl31J4OsETMnf3FewkaU4J6uyc1CO9OUgO0bVYx1FqiA+2acHBwh+yLLebT65KTcJxkvag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QY5x6CUu88f5e84nkglQLPGovp1H2ru9askFXDuGS7k=;
 b=N6zO+zjy7+1P6m3T1UGjWMIcU3GzjFTpCuHy/D99BHigVJsk6QNTMBLs8Z2/WONDLIvfCskCxMVKLAfPSu4A7bAzXiQl0vyJRe98Z/YFOVvIOJLA68fMA6oaBDva5QMaoGatdxGuubBqcpLERY8ZEoRp4iysjhlGgu5ja1+SaUIOP+NeCYIVDGvTyYoZJq+HtPTC+XOx0jrsf965gK3STxI6y9r5TsrgcEGkYG3Apx6+X7MF5a4iTxcAEGencf2l1P1uk1T2zlU5ltsdc+cdpzt8Zh9K9H4dq9Nmm5v+BHjB9a6s/3vq8HZ7ruh04eDJ+4R7COvlIFsiw73BFKh4/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QY5x6CUu88f5e84nkglQLPGovp1H2ru9askFXDuGS7k=;
 b=DFnYdvx9vqE5EEtM9VzUEcgia/PvZI4ZiL7+X0jFhAsaYOv8DxSgi7v+a0FsFQMnP7LOZzavvj23KqFA7P/uRYolvp4MMpPC/FCmaUgZaWYJkxLhPHbc/YqhkmqBF9rTBs0tW5V9R189qWrGwxMmX9SWuPKFJg7Zc421fHR9wAQ=
Received: from SJ0PR13CA0080.namprd13.prod.outlook.com (2603:10b6:a03:2c4::25)
 by SA2PR10MB4810.namprd10.prod.outlook.com (2603:10b6:806:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 07:42:16 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::fc) by SJ0PR13CA0080.outlook.office365.com
 (2603:10b6:a03:2c4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 07:42:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 07:42:14 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 01:42:07 -0600
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 18 Dec
 2025 01:42:07 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Dec 2025 01:42:07 -0600
Received: from localhost (robotics.dhcp.ti.com [172.24.235.192])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5BI7g6xI2931772;
	Thu, 18 Dec 2025 01:42:06 -0600
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.2 release config
Date: Thu, 18 Dec 2025 13:12:03 +0530
Message-ID: <20251218074203.585640-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA2PR10MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: adfc9312-a4fc-4f58-9644-08de3e08f630
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dBl+OkeUhM7KHOUYhH9ESVN4X6rzl/fxPfjm4ftiZ/OH9Zrd1upcrCw2HjD+?=
 =?us-ascii?Q?EXHjAthaHPF1mBVLk1UNqJBAk7VOdW8AifqSzJlRZBjJ1XLaJIsQvHPLXNbD?=
 =?us-ascii?Q?uQ2uLKavnZBgMCetz6D9yZSVr/X+L1ZjrB4hMXWCaK4zdlfS7rMwj7fADDkU?=
 =?us-ascii?Q?XcP8izP9X1dJ9hoL+jcvgaC9tgkmYGTwdKmqKHFvVfnozeq97OipoMicwhw5?=
 =?us-ascii?Q?yDV6TVihQatpbXhc/7r8jDSzSsM9fMAAIiXL6jey/TLNP4ZDHT2a3Lj4Va4B?=
 =?us-ascii?Q?eSgX/qQQcYAsxRo4KIG6vwKp45ypZcS8JZg0zM0gHqkrx6zMQUYLfIBIfSYr?=
 =?us-ascii?Q?4ZQzOGjTRukZVe4PdgZl/sVOdbcVgODcmvCdt/HD1MNqaN80M0lLDYEj88v+?=
 =?us-ascii?Q?F+8h2iPdzYgTtHdozKG2+NWhfI+42oh20Zfm6VZp1tBHYracerYez2NXWO9I?=
 =?us-ascii?Q?j0+D163DXAl6fNmApZDG45R2PAZk65+deFpcRVVAeeLK/j7387q5hP9ubF/2?=
 =?us-ascii?Q?Pgan3GdoV9F4zOWZ8IBMlIZ88EtIrKa3tuyytEQrUF5c9INnwmtPwsJP/V+P?=
 =?us-ascii?Q?CrIBADIN23jqfFC8q94BUcSsTAvTb++NWNzLE7m+CXN3SUD47DuvCO+ojRSg?=
 =?us-ascii?Q?dQDPR3yLtN+MUJ7DTm2eDex92Ws97WcLVNsSjc9nzMNfz2QYgKJMeEbk9CXn?=
 =?us-ascii?Q?sQG9i2wmErl5e1cSngPB8/1k/qxfbehYKKR3EdGeFSA2VnJFg+fHIRVEQtLR?=
 =?us-ascii?Q?YRObgfEDvYePOF5A06VTsA7hONn8UJrRApTuEFu+sOO+hWPbAd0gdwMDyWpc?=
 =?us-ascii?Q?pe30Ae0Ih1H5Pp3mTPk1rvoBTbN71NSRaLQmNrAX2k/R8O5cES8A11SeT39C?=
 =?us-ascii?Q?wwH8ecjAN/xLT8J004rrWUrZhgZsUCQmQr/wX2bQ2lQY6M3O+KnohMORS4+E?=
 =?us-ascii?Q?IIBvceTuBizCZYXXHICsRg1LTD70RsJddHOYsCQd1RKWMlwyXjO2x0MXatdM?=
 =?us-ascii?Q?wTETUToDoc+ZOMz6warqEs7vNWFmxPMhYmY+fjn+RCXOKM5L5SKsKF2tgFlm?=
 =?us-ascii?Q?83NS5Y5T96C7QosdZPHoYAK0j6wotWn3S1zoVDvx3DJUUgpl/Nkq0PVMx0kb?=
 =?us-ascii?Q?r2SxRBmGkbtrv0EBTYV6J1DCsBgGP6nue858jCKBgzIoCSPeaQIemEH+nHsj?=
 =?us-ascii?Q?pMvQ63f9Pwk9EkhGaIr4jQF8uR2kEP9VlSiM68z354oMFktFvenrRkGqSpqH?=
 =?us-ascii?Q?NLJS/wH1R/smPUlNs/yCPy0BFHpZIJ/TicvKIpJRNqyjWSyIGRmhjmIvIKWO?=
 =?us-ascii?Q?20ptF1l65NtvhWf3IrMn44EzgYAQ/LGoM9XodvkiBikSul2a0CwnlpbTQscY?=
 =?us-ascii?Q?C/da8HTPrzIFUoFg9sD+OTZRXJ/OluCI6QkyQNObGiW8vijdwoeb+QrwRLa0?=
 =?us-ascii?Q?IgoDTUKv/oRMy+0XBS+PViTnIoG9VdRsbJ5179exGqIxMjyQo1k8DyonXDOp?=
 =?us-ascii?Q?hB4VG1eMQy7cFYI=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 07:42:14.2897
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: adfc9312-a4fc-4f58-9644-08de3e08f630
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4810
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 Dec 2025 07:42:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16892

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
index 0000000..7b8f16a
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
+            "uri": "ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/me=
ta-edgeai.git"
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
index 0000000..c333ba0
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
+meta-edgeai,ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgea=
i.git,scarthgap,e814c23648afeb0efd277ae6a9fce9aba0aee025,layers=3D
+
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=3Dyes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-c=
onfig.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.02.00-co=
nfig.yml
new file mode 100644
index 0000000..1bc640c
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
+    url: "ssh://git@bitbucket.itg.ti.com/processor-sdk-vision/meta-edgeai.=
git"
+    branch: "scarthgap"
+    commit: "e814c23648afeb0efd277ae6a9fce9aba0aee025"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11=
.02.00-config.xml b/src/configs/processor-sdk-analytics/processor-sdk-analy=
tics-11.02.00-config.xml
new file mode 100644
index 0000000..2ae7bd0
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
+        <repo name=3D'meta-edgeai' url=3D'ssh://git@bitbucket.itg.ti.com/p=
rocessor-sdk-vision/meta-edgeai.git' branch=3D'scarthgap' commit=3D'e814c23=
648afeb0efd277ae6a9fce9aba0aee025'>
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


