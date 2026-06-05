Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B498DCD6E7B
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 20:12:19 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3687.1780690330944733847
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 05 Jun 2026 13:12:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=MCJCRAOx;
 spf=pass (domain: ti.com, ip: 40.93.201.63, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NV/m3h0A2f4uIeaqMuosKHMsKFQ0osnkLbKpQtXsI2xS9ILmmAtSX7GOQ0Yc41o2Ol/7v+O/d/wuVFBaoQcJygrMfPO7gieJJL6DPC1eDzggUQuos1IQ++wxmNOIRMMzJenUmf2o/Bcu6/QVOb0MebR8v4tuvSONAMv7y+yVT2HD6+X5gfzylmFpHspyQBpk3OhDVaYQe9IVzYAd5yZRxyLoc7qi1V/GZNXCAvA1lVSplEyImdRa8F7tdZVZQdS4SCj2OZZOclTRdWBG77TOQYN+GoVmkrrq+SeDFdzHKZZNNYd11GLTUdrF0ioGJnexRYfvx9IRpDu1u3g7umOCrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=845auHmzIao7ZQcww7WhhEwKzerBHL/oEi5UuxLKUmI=;
 b=cKZehOzLW/6t9mQswVD28A9jK9oramROPJ0gVtTO9zPRnY53uoSy/PPM9K64VT5jo5Ynno47xsnKumH4Oxa9/A1uWGbIlE1Nhc6/f9QKyWwSz/KCyFN6SL601N19S8Iy7vBRSSU0RrD/nAKP9vsbZwOApJeRKpZwZWwJO39KhJBts7OHoESA2EoJjMC2gtroNIltn2Ig7RIq7nyB8IemAPtG60tW4X37QZTm0wocGcrzZgtc/Hp0PEGrDEMTB5vhTK45fAZ04NXo/mr0+6yIVwOY6Le8gvpzHdQBhKIWK3WS/nSzfpZvQCgg6cWq3ioaH01wOTwlv8spKmTvH2OeWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=845auHmzIao7ZQcww7WhhEwKzerBHL/oEi5UuxLKUmI=;
 b=MCJCRAOxJIWYcvbpjYapdE66sTnNVTZU9YAoZP+ZWDSgsZbzGy9lMfX9yF4L4+aDpMMAk8kDekMIuEhHCl6M/DSkWBWkbqyGoF+SMNFLmeOW0SwwvZKfq5f4rTm3iCdanZc6j82OOQ66HdXpgcaNMhKWYpxRb7O1cb11IEiwvM4=
Received: from MN0P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:531::12)
 by CYYPR10MB7649.namprd10.prod.outlook.com (2603:10b6:930:c7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Fri, 5 Jun 2026
 20:12:07 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:531:cafe::81) by MN0P222CA0008.outlook.office365.com
 (2603:10b6:208:531::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.9 via Frontend Transport; Fri, 5
 Jun 2026 20:12:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Fri, 5 Jun 2026 20:12:06 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 15:12:00 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 5 Jun
 2026 15:12:00 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 5 Jun 2026 15:12:00 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 655KC00E2597396;
	Fri, 5 Jun 2026 15:12:00 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wVatc-0000000GvCK-0JJI;
	Fri, 05 Jun 2026 15:12:00 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] poky-{wrynose,master}: Add meta-openembedded
Date: Fri, 5 Jun 2026 15:11:59 -0500
Message-ID: <20260605201200.4033109-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|CYYPR10MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f7edb3-3e59-4ac5-8953-08dec33eb7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|56012099006|3023799007|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	X5Go2xbLevOoJdvFy8yaPIPg1gIuEQ1sgq9UVkmlwIbCkrOTRbSZxBLppAPtyB0z0aSGQK72mIjLZgE+0Z/7UnMqDg6gc2z3cJhbFiV2MsgAd+n2If9g5crfgiGDMVU7r8CUBERae5I0NIirJ/+E1q4nhHvRx4VhTS3q1z/ZgZmdNKa7Qg+3ReMS4k5HbbUEQqAP97i4Tob7HqoXZ6llas6cSNAvgHebZ9l5viW2V9cSUBvXDMBbwDLgBOlaeJfcAp8JUMdj3CGxbHkdYy/8yLWOqQzda+ysb/Q1RChFl0tUibIQ7yPDhbMOcJU8tKgnSHrDuVHAW0667t0VK6THOjSmgF/2HyJZfU1BEa5a6U+3FiCfHXwIyAAF7cVhYpWXAfWEyBOB+AvPZQaAWGiWpzDYujAMyuQvrDncCaShoahfTeZTBbryqiIoVL5XkRbMuqWZsbaG10cCNokBfGWbyuTQsBQnGSS8P3pRKi9PANqx2mhq7cqglsfe4S79iUkNs1yIiqEz+a2sYYth8C2zQoebSrP3xbKODkgSSTkmbgIb1kIv0luM2pJTa8iYqhaBdOdYkaqkkMm+GkNIkcIxDKH+Jy0vaBrKRGMEqg29Wa49nRybE+3C2CdoA8qHMIOSnb3tqB/Rk9CpMXWtZAp03pE3y3Za40fir1U/qIr6+P8=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(3023799007)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ppMJ7/wtMDtn3GIcD39eOui1BOkV9J0ZIu9ERCMEzrGggQorI55ryMyQhNNiFtMBzK7m4L4GXdLtyYr7umqU04a+Y+06biJbS98lFQhDePJ+JpBYidq55bUsuC4HP4boCLCowjFDKMgrunOl4GgJCYm42WdzDA9vHIeHlPx8Lr3q2PYeowkjnPOkx/YmX9YU4dqhyTy1SUqa0zOoXRBp7exbhHp8BXlsMbK+e5LGFQpEmslIpuaBOluRX2jJl0ov3DJoW8LKOk2HoU4ZjkGt4tstUJ7Db+T3g0XbkxglddeBfMimAQH4lkg+25EqburIbhKe+EKUR99JeVtbMBEUE+inhxD5yfLhgHmUdak49D2pMtDWfwU65Frfdo8gPR0GrLVv9CM7zTEG3Z339II1ulwO0gS/fZk5OhKCM8u496fH+2rFaC+VsBKSPUtN76rX
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 20:12:06.8069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f7edb3-3e59-4ac5-8953-08dec33eb7a0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR10MB7649
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 05 Jun 2026 20:12:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17551

We missed the fact that meta-ti-test requires a few layers from
meta-openembedded.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/poky-master-config.conf.json      | 13 ++++++++++++-
 bitbake-setup/poky-master-wip-config.conf.json  | 13 ++++++++++++-
 bitbake-setup/poky-wrynose-config.conf.json     | 13 ++++++++++++-
 bitbake-setup/poky-wrynose-wip-config.conf.json | 13 ++++++++++++-
 configs/poky-master-config.txt                  |  1 +
 configs/poky-master-wip-config.txt              |  1 +
 configs/poky-wrynose-config.txt                 |  1 +
 configs/poky-wrynose-wip-config.txt             |  1 +
 kas/poky-master-config.yml                      | 10 ++++++++++
 kas/poky-master-wip-config.yml                  | 10 ++++++++++
 kas/poky-wrynose-config.yml                     | 10 ++++++++++
 kas/poky-wrynose-wip-config.yml                 | 10 ++++++++++
 src/configs/poky-master-config.xml              |  8 ++++++++
 src/configs/poky-master-wip-config.xml          |  8 ++++++++
 src/configs/poky-wrynose-config.xml             |  8 ++++++++
 src/configs/poky-wrynose-wip-config.xml         |  8 ++++++++
 16 files changed, 124 insertions(+), 4 deletions(-)

diff --git a/bitbake-setup/poky-master-config.conf.json b/bitbake-setup/pok=
y-master-config.conf.json
index 4726117..854cd44 100644
--- a/bitbake-setup/poky-master-config.conf.json
+++ b/bitbake-setup/poky-master-config.conf.json
@@ -35,6 +35,17 @@
       },
       "path": "meta-yocto"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
@@ -74,7 +85,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-o=
penembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-=
test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp",=
"meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layers=
etup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/poky-master-wip-config.conf.json b/bitbake-setup=
/poky-master-wip-config.conf.json
index b949b3f..3b58e71 100644
--- a/bitbake-setup/poky-master-wip-config.conf.json
+++ b/bitbake-setup/poky-master-wip-config.conf.json
@@ -35,6 +35,17 @@
       },
       "path": "meta-yocto"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
@@ -74,7 +85,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-o=
penembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-=
test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp",=
"meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layers=
etup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/poky-wrynose-config.conf.json b/bitbake-setup/po=
ky-wrynose-config.conf.json
index 80c5557..9f6617c 100644
--- a/bitbake-setup/poky-wrynose-config.conf.json
+++ b/bitbake-setup/poky-wrynose-config.conf.json
@@ -35,6 +35,17 @@
       },
       "path": "meta-yocto"
     },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
     "meta-ti": {
       "git-remote": {
         "remotes": {
@@ -74,7 +85,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-o=
penembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-=
test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp",=
"meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layers=
etup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/poky-wrynose-wip-config.conf.json b/bitbake-setu=
p/poky-wrynose-wip-config.conf.json
index 6906490..2bac793 100644
--- a/bitbake-setup/poky-wrynose-wip-config.conf.json
+++ b/bitbake-setup/poky-wrynose-wip-config.conf.json
@@ -35,6 +35,17 @@
       },
       "path": "meta-yocto"
     },
+    "meta-openembedded": {
+      "git-remote": {
+        "remotes": {
+          "origin": {
+            "uri": "https://git.openembedded.org/meta-openembedded"
+          }
+        },
+        "rev": "wrynose"
+      },
+      "path": "meta-openembedded"
+    },
     "meta-ti": {
       "git-remote": {
         "remotes": {
@@ -74,7 +85,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-o=
penembedded/meta-oe","meta-openembedded/meta-filesystems","meta-ti/meta-ti-=
test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp",=
"meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layers=
etup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.tx=
t
index 45639a7..d92ea2c 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -3,6 +3,7 @@
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=3Dme=
ta-poky:meta-yocto-bsp
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-c=
onfig.txt
index 0a14f48..7f9ca86 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -3,6 +3,7 @@
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=3Dme=
ta-poky:meta-yocto-bsp
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HE=
AD,layers=3Dmeta-networking:meta-python:meta-oe:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
diff --git a/configs/poky-wrynose-config.txt b/configs/poky-wrynose-config.=
txt
index 50d7a79..ae03273 100644
--- a/configs/poky-wrynose-config.txt
+++ b/configs/poky-wrynose-config.txt
@@ -3,6 +3,7 @@
=20
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=3Dm=
eta-poky:meta-yocto-bsp
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose,HEAD,layers=3Dmeta-ti=
-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
diff --git a/configs/poky-wrynose-wip-config.txt b/configs/poky-wrynose-wip=
-config.txt
index c541fb2..eed3890 100644
--- a/configs/poky-wrynose-wip-config.txt
+++ b/configs/poky-wrynose-wip-config.txt
@@ -3,6 +3,7 @@
=20
 bitbake,https://git.openembedded.org/bitbake,2.18,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,wrynose,HEAD,layers=3Dm=
eta-poky:meta-yocto-bsp
+meta-openembedded,https://git.openembedded.org/meta-openembedded,wrynose,H=
EAD,layers=3Dmeta-networking:meta-python:meta-oe:meta-filesystems
 meta-ti,https://git.yoctoproject.org/meta-ti,wrynose-wip,HEAD,layers=3Dmet=
a-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,wrynose,HEAD,layers=3Dmeta-=
arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,wrynose,HEAD,layers=
=3Dmeta
diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
index 1b8035c..fea9644 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-master-config.yml
@@ -23,6 +23,16 @@ repos:
       meta-poky:
       meta-yocto-bsp:
=20
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-filesystems:
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master"
diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.ym=
l
index ede97d9..1df0998 100644
--- a/kas/poky-master-wip-config.yml
+++ b/kas/poky-master-wip-config.yml
@@ -23,6 +23,16 @@ repos:
       meta-poky:
       meta-yocto-bsp:
=20
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "master"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-filesystems:
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "master-wip"
diff --git a/kas/poky-wrynose-config.yml b/kas/poky-wrynose-config.yml
index 34577f3..575b468 100644
--- a/kas/poky-wrynose-config.yml
+++ b/kas/poky-wrynose-config.yml
@@ -23,6 +23,16 @@ repos:
       meta-poky:
       meta-yocto-bsp:
=20
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-filesystems:
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "wrynose"
diff --git a/kas/poky-wrynose-wip-config.yml b/kas/poky-wrynose-wip-config.=
yml
index e023e9f..a388a04 100644
--- a/kas/poky-wrynose-wip-config.yml
+++ b/kas/poky-wrynose-wip-config.yml
@@ -23,6 +23,16 @@ repos:
       meta-poky:
       meta-yocto-bsp:
=20
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "wrynose"
+    path: "sources/meta-openembedded"
+    layers:
+      meta-networking:
+      meta-python:
+      meta-oe:
+      meta-filesystems:
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "wrynose-wip"
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-c=
onfig.xml
index 8562f36..f5005d3 100644
--- a/src/configs/poky-master-config.xml
+++ b/src/configs/poky-master-config.xml
@@ -16,6 +16,14 @@
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-mast=
er-wip-config.xml
index 9e4d6c0..441d125 100644
--- a/src/configs/poky-master-wip-config.xml
+++ b/src/configs/poky-master-wip-config.xml
@@ -16,6 +16,14 @@
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'master' commit=3D'HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-wip' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
diff --git a/src/configs/poky-wrynose-config.xml b/src/configs/poky-wrynose=
-config.xml
index 3a0a19f..696e75e 100644
--- a/src/configs/poky-wrynose-config.xml
+++ b/src/configs/poky-wrynose-config.xml
@@ -16,6 +16,14 @@
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
diff --git a/src/configs/poky-wrynose-wip-config.xml b/src/configs/poky-wry=
nose-wip-config.xml
index 4e2d9f1..dc63d21 100644
--- a/src/configs/poky-wrynose-wip-config.xml
+++ b/src/configs/poky-wrynose-wip-config.xml
@@ -16,6 +16,14 @@
                 <layer>meta-yocto-bsp</layer>
             </layers>
         </repo>
+        <repo name=3D'meta-openembedded' url=3D'https://git.openembedded.o=
rg/meta-openembedded' branch=3D'wrynose' commit=3D'HEAD'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-filesystems</layer>
+            </layers>
+        </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'wrynose-wip' commit=3D'HEAD'>
             <layers>
                 <layer>meta-ti-test</layer>
--=20
2.43.0


