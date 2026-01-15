Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 322F4D3CCBD
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 07:53:11 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30840.1768463586831048049
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 23:53:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=upwGoRGD;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.201.41, mailfrom: y-hegde@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oSXfn9x/yabygZ9gUWuOyMW/xQoth/8GiGkPt5LxApH5hog5qAZKZeH6CLY5gUqGk3aSIFm6BeLRWRhOqOvtQGZ1mPY6oDk3+EihwAY/T8aEbIip3sQyXDyB2qM47ami+sNac6P5wGblN1Si3DKjKqnTffATQHmQOqNyK9dFZmAQwI5lepXDzVPJL+ZSgqHD97BDH1ErMU1hUUrXow5i8JF6pjSnZyV+dgn+3Iv7XfLuqvSw3PKkwXpFHU0t4TqgaAt4snEdZfkW1d6FpjWJPAgVftQBkkVEy5LWGQzvjchaDZnYo9scuMeL2Da3qu/XR4LR22W1JHWomR+W46+ZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3oEo72d2EWeMzhZr2TCMqs58pMnKC/uncknZermRBk=;
 b=hf/0oTte86x9KtMukVHdJnw21wBDXe9CJFPyGUhuWdKkqJRpBsmte4mPTCYqy51Rxnu7XYuBdhaJD8doimUYIiP34E+tCWzga1C4g+6aEchKbckJFMHW22P3fWWng9i58QP12G1YqCCkZ8O3NTf3knbWr0BTfqhd3lWoeTcMmRW1KvuZti1+gzI/1m2fHK+R+aUTyP38ty5sLcmZC5MiLT51uQVHT8CjeHABt2uctXgzPwx8C4NaAdDxhiL/XiXmL6Ol2QiFFCjBPNLys/76jYaLtS2ErY6wJOc2J0Xq2cAyotTIybLW/SttjQhYOy2Z+ZluJaigmTxR+NfYw0Yn0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3oEo72d2EWeMzhZr2TCMqs58pMnKC/uncknZermRBk=;
 b=upwGoRGDBItSlZwl2uaTZLrsdMLQnq7g9T7D9KoqkajAErLkJ9YgPw44Km0svxY1QCwcUZrapDywnGi2i9KjU4Kmg7aCoxz8LeyDDhIMrlh6X3Bei4SdXKa7PzO3lHN5VNthIwq+IBxvAy3ziHWuAnKOezOtGX+NDieXXrQjTbM=
Received: from BLAPR05CA0006.namprd05.prod.outlook.com (2603:10b6:208:36e::9)
 by DS0PR10MB6893.namprd10.prod.outlook.com (2603:10b6:8:135::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 07:53:03 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::e9) by BLAPR05CA0006.outlook.office365.com
 (2603:10b6:208:36e::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.2 via Frontend Transport; Thu,
 15 Jan 2026 07:53:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 07:53:01 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 01:52:55 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 15 Jan
 2026 01:52:55 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 15 Jan 2026 01:52:55 -0600
Received: from localhost (yogi-work-pc.dhcp.ti.com [10.24.72.146])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60F7qrIT1084128;
	Thu, 15 Jan 2026 01:52:54 -0600
Date: Thu, 15 Jan 2026 13:22:53 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <praneeth@ti.com>, <prudhvi@ti.com>, <j-sahu@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCHv2] processor-sdk: Add
 Sitara SDK 11.02.08.03 EVSE release configs
Message-ID: <20260115075253.dll6xvakrnuoz2ou@yogi-work-pc.dhcp.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS0PR10MB6893:EE_
X-MS-Office365-Filtering-Correlation-Id: 8db7f806-008d-467e-ccb1-08de540b1b49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|34020700016|36860700013|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FhvRxgXvgtZN9tIIWjcwcbSRkueLpngr+DV/wS5BQnmXpU1CKQx9PsmhfL5D?=
 =?us-ascii?Q?XmkZqabAM7RGzF4j+y8F4iPEjJ15mvQOhpUGdaA+ikuX3LYZXv8wAC+itYQd?=
 =?us-ascii?Q?k6bFXALg4mm3pzrZyh5b3Y+2nqA2ZyGlSYSUoMBYZvR3R+Te02wsia6Nn3Ul?=
 =?us-ascii?Q?KM1my7PB6yKqLx7fHFYm6GO+KOvuZNPUh+NJbO0oUjQjIdeb/toPrRQBJTly?=
 =?us-ascii?Q?OzjUAok7HtWBmLYtQ2UnO2EFuyCjatQS7Q5eyq1wvSJqnQFFVYGpk4fv/AhU?=
 =?us-ascii?Q?EYaCvBN2RT7AIDCdILaXoOcxMLvwTmSSVnfTwBE8NbDxnXWJFl6lib3oWaux?=
 =?us-ascii?Q?Qk7o36NeeEvMbZ7A3Q8Bz8B5EoKRzeaH/yTRnPY/zfV1XrvFOiS2c9AKLyv7?=
 =?us-ascii?Q?vRqgao/JoUDmnPq3Xxykx8sn24qR9TSgyG+23gAwOSbt6Xa52RL6TtGSIjid?=
 =?us-ascii?Q?rldzYrSvYp2XHEtYo6vJR00iu3+lpQrD3y1PAnv41nDHgJj8LVzoyemSnQ9x?=
 =?us-ascii?Q?oGwnbKO2aCP5Qai7SljA9VZwK+cXRvBhJl95ZPqtXk9O0nToDiqEfKejdJ0M?=
 =?us-ascii?Q?U2bwRff4bpEkyS+SuCG8YshdUE8e0OueiL7+4TTmgN+DXjvxWYJFAR1ntrkt?=
 =?us-ascii?Q?74QFZM1EVvtHc0fKPJ4g0Xtp4e6otUnGv+MhXOKuhsM75BTVIrGITSOW5Vmf?=
 =?us-ascii?Q?wMYAaMoutvrn++vhHWtGLpm50SXZskvmv58djbRsD5hho4c0gQ9Z2eFjnw0V?=
 =?us-ascii?Q?j/Ur/hRPoSqDkks8RJaxaRR7JzTLxWUVHQlQvWVGH9IfH8y1h/dsir/QpnDy?=
 =?us-ascii?Q?vgc/g1iPOSlJiQWqgFLlsVDLzL0BGeHV/CHK69mYWbVEUjYtWWQAbB5DbxQM?=
 =?us-ascii?Q?cpSh/H1NuPytuxD0V28gyLfM/ClcMk4BgxgU0RYarCwH2+s9vQPg821yRAAr?=
 =?us-ascii?Q?64rVP6B2hZtHwi8TQ8lJtQChBJxDbiotbt0j0xPGTwf2OsuSlzmr8oDVmeLp?=
 =?us-ascii?Q?lY3Hg4LZplaAE491kxNGHK4I6brhFuJvfIC+AGqnWdQq8fjj+ZgsfiAeaJ+O?=
 =?us-ascii?Q?jzuHPp0L3GEXqQ31YDL1cd8f65VX1ov239+6y2Go1ZwusDPpOpOe3gUw86vS?=
 =?us-ascii?Q?8wDYKTH5WgWauGL89mU0BDyu4Sj2tp1o/JxxtAkTPyUpovSkvW4YmYbDBYAo?=
 =?us-ascii?Q?ByzeVGOEAoYtU9vfgy3WZiyvW8yfSBVF8SqAoZXSBMaYgZQuYOQAhiM1By8g?=
 =?us-ascii?Q?CYk3EqCMieIWPPcYRBX6UwFvBWjloDwgiTjO4Q3GPzxaIQdidpwUPzhKftLo?=
 =?us-ascii?Q?Q1dRSdcGVbhd0KWJVxA9V9uCkXW+PyqdNcVJEAC3KH3gDL6cmtOmtv+y3C6k?=
 =?us-ascii?Q?3CGT4RRFXJMMH3rp+6LXBjoKCRG31A9qqRqrjMvOeORZdtK9YAGWa5ZWuItv?=
 =?us-ascii?Q?3PyQJX9cWAWj8fG8q92hXaZQ/PIhQGwwa/EiUdu3kg4QBLoV1oDPnSTeDYAg?=
 =?us-ascii?Q?3W4IScfn2m0aTNeon30VMBHhz6/cVxNs9UzZ/ax4NqgkOMoaSZ5YOeBnyTKW?=
 =?us-ascii?Q?kxSlHCQltdwyHgDOolePkXn9KLTxhbcuXqVIxCOk86vqC809+s3CwN7tCh+r?=
 =?us-ascii?Q?5ktTwrGOoQPNFq8dlksQ2F1tEY4gqyzpdgkFVselZviktmjbiLLsBFxVR16C?=
 =?us-ascii?Q?D9dfag=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(34020700016)(36860700013)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 07:53:01.1165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8db7f806-008d-467e-ccb1-08de540b1b49
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6893
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Jan 2026 07:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16954

- Add processor-sdk-scarthgap-evse-11.02.08.03-config used for
  building EVSE (EV Charging) image for AM62L platform.

Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
---

Changes in v2: 
- Updated meta-tisdk with 11.02.08.03 tag.
- Changed the subject to match the tag. 

---
 ...carthgap-evse-11.02.08.03-config.conf.json | 169 ++++++++++++++++++
 ...-sdk-scarthgap-evse-11.02.08.03-config.txt |  23 +++
 ...-sdk-scarthgap-evse-11.02.08.03-config.yml |  94 ++++++++++
 ...-sdk-scarthgap-evse-11.02.08.03-config.xml |  93 ++++++++++
 4 files changed, 379 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.conf.json
 create mode 100644 configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.txt
 create mode 100644 kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml
 create mode 100644 src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.xml

diff --git a/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.conf.json b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.conf.json
new file mode 100644
index 0000000..8ae7ae8
--- /dev/null
+++ b/bitbake-setup/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.conf.json
@@ -0,0 +1,169 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK vevse-11.02.08.03",
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
diff --git a/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.txt b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.txt
new file mode 100644
index 0000000..89fd960
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.txt
@@ -0,0 +1,23 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,8dcf084522b9c66a6639b5f117f554fde9b6b45a
+meta-tisdk,https://github.com/TexasInstruments/meta-tisdk.git,scarthgap,11.02.08.03,layers=meta-ti-foundational:meta-ti-ml
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
diff --git a/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml
new file mode 100644
index 0000000..99360a9
--- /dev/null
+++ b/kas/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.yml
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
+    commit: "11.02.08.03"
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
diff --git a/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.xml b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.xml
new file mode 100644
index 0000000..d90406d
--- /dev/null
+++ b/src/configs/processor-sdk/processor-sdk-scarthgap-evse-11.02.08.03-config.xml
@@ -0,0 +1,93 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK vevse-11.02.08.03</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='8dcf084522b9c66a6639b5f117f554fde9b6b45a'/>
+
+    <repos>
+        <repo name='meta-tisdk' url='https://github.com/TexasInstruments/meta-tisdk.git' branch='scarthgap' commit='11.02.08.03'>
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


