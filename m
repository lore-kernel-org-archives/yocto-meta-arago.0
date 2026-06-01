Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11269CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 16:41:07 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3356.1780332064785980439
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 09:41:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Qxv+WSNQ;
 spf=pass (domain: ti.com, ip: 40.93.196.21, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ujrGx8bmemfNljVr0lA1uB8X34BCuZgxwQODKh37vTIVJqbsyHVk7YNJ6fEv1tmJWFgLMYtAs5rPRdrG8obNzyn+c7Kft0Nh/Qyv11u1TCeyrYrX6k6UNLi6GesNq98Ebv95W06wQsaEQ3J+cm3Q4QOFyWwb6NGtt1dy0J0xmTBLjLEbD9t2L+Rk5JVkBuTtKEuwFnx1CElzl4LeP74h8jKi7Av3IYbJOWmknpw4kg76QT/ppdvH9hbVhV12NO9wjRZ7CyRfIJxQUhtHajFrbfwIkFLqV+Ww3hHRK1wIU0JMAwaxMXeCbuPHOO9aQTWCiuQuEFYQ0LFnhKv3JProEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vNtVraKNViyCY3bjoBZpBYjeSAB39yGJYUP5GEwqxuM=;
 b=RLvSnH7U0GH3SOrQg3lmPbyOnoEVtCQWP3toVJm3GaQpuq7tIr5IRtLZey6rEKwlU+MjTUVqg57VY4CFoch6oYVG9I9CVn/8Tcpxbciv5eTTyA077xVxUUj/0N+VuF1RLff7npeKCCfa86fugwTOGL1xptrk2U42Hm9E4v/c7XaIddmkASkJkUS9IdERNc2KTihLQ8VoCgWMg1HjFyb5MOHd4lqAIq2UZP5zSr5Y1s0Mb3kYk0iUg/plMllP057hMNk2Gro3+haf9UbV92nmHaYH1vg7uf27JVf/1MHV3w1nxTGNdrDUffYVOPUIfYL6MHm6uzClfiOmTF+tMqxRGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vNtVraKNViyCY3bjoBZpBYjeSAB39yGJYUP5GEwqxuM=;
 b=Qxv+WSNQ9gR2TMZQa6olafCXaqsC9tcl9EKlm378SwaBqeHzvkFQhDDgKDVR3ZKcX/q9LBaj6/4fljjEgNqwxf1eeqmXVlrB2YE+fYUQhHdzQv/sBQKGB+/W68UUpX/5SDhseSD/J/2nYSd0pa08FnhFFEP6RfjsDMija8b0apA=
Received: from BN0PR03CA0022.namprd03.prod.outlook.com (2603:10b6:408:e6::27)
 by CY5PR10MB6046.namprd10.prod.outlook.com (2603:10b6:930:3d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 16:41:00 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:e6:cafe::8a) by BN0PR03CA0022.outlook.office365.com
 (2603:10b6:408:e6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Mon, 1
 Jun 2026 16:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 16:40:57 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 11:40:57 -0500
Received: from DFLE208.ent.ti.com (10.64.6.66) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 11:40:57 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 11:40:57 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 651Gevcd1449488;
	Mon, 1 Jun 2026 11:40:57 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wU5hB-00000009rap-05ln;
	Mon, 01 Jun 2026 11:40:57 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 1/2] poky-master: Update poky master builds
Date: Mon, 1 Jun 2026 11:40:55 -0500
Message-ID: <20260601164056.2350853-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|CY5PR10MB6046:EE_
X-MS-Office365-Filtering-Correlation-Id: 0370f399-dc6a-4f65-25e7-08debffc8e9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|6133799003|18002099003|3023799007|56012099006|20052099010|13003099007;
X-Microsoft-Antispam-Message-Info: 
	P8mo9qcoi9+6ibI/BI3Uxwye9r2vJpNNn0HEvNY+J6b+L35UxC4YcxhLGzREZAtvPRvrl1Pyz/fmoeaqfV5nK43fKULgS4tBXEeiJuTL/ZdYCHYjFBKA1FXeJazGZw44eAKcph8UbGgzZSAwOBqSEn562D3J7TLs5lFeBfZir6KYF/0/QsNMBRfS8vl49mBJLHy3N2cONl4Aw+n2Ls7j66aTXSkXPWVxxZ/kPYVeRBd9Y4FtW1nJKRrv/Q+EXlPU03DTgpjgLKZDpgqjY5ZEL1RhHD5iYQYKxVDYLiw6A3YPL6qCha7YjJ9aDj0zRqQrjI4Xvf35OG9nNR04Tjoy2+tCjJwgglgOIPrCkeyAw0tVZmm+vALn+bllVcg+nNGcX2aE6jloaUPDeI4EkChmshGZ1lXn5zuKL+pLp222o4UdhSbu+ueCozJHRO0V+KyGEgHCPWmjBBeNjt7/G746Je14Fmr4/l19XIC/Miq+3wr2ipde56+nzsdhtsOT0aUEjygKE07eXx7OEoAmKuzph6MaofNeMpGGkJ35ADlzS7DzS5hOTL1ZxSTSFANNlM39ve2PsLVu+z6hPxt2nlNwUG3DqNWz0DoMwivPlOBNN7MNr3Lm+RqcPn8yMpbbWcf8TbMekWQ6wRTa3UfsfKqE0OfAqZrZsEPVmBe3/Q7tfujL4JTzVQlfn+3HIaF1C05B
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(6133799003)(18002099003)(3023799007)(56012099006)(20052099010)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PzgYDqO8AnFe2+AmkpCoVfjdr4ku9awZbTmeuEhsnjnaK8iu1FZzjXbpkE/fCqrKRaAdc6+LzkW+aLynNEj5lrDRkmbtf4PceRTnLub9WCX7J35IBAtakUxlGA/nvALDQTFthj6tSB+hTjLYk+V8NEwJav/agvOvWyu+PMdw0SH8yQL41kfTzkqkh6b4b4oL8ZKMXkqBHq5FWfHnOxHZsZ7ZR2Q2+YUaCLgg0V92BG91J03cBVHPg+S+1FIkwRoqCPJBQihupu8R6CUAow9NrWEbuQ2shvr5gcSoEo5f5zYJ64v6lzkUFRBlRU+md0FgPGMKogIXP+gGAZ6pXSKVc24FdfGlH0ruSqxe2O/qpXajh6tSiLpdm1x6EDiiRxj2maJhrLf4cwoB4FYHZDvl/EVMW+JrT6KuiF916NhaJPASe8crflempA4JTxyN1Mkw
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 16:40:57.7419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0370f399-dc6a-4f65-25e7-08debffc8e9e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6046
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 01 Jun 2026 16:41:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17543

A few changes:

- Drop meta-clang since it was merged into oe-core
- Move meta-arago-test to meta-ti-test
- Drop meta-arago since this is a poky build

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/poky-master-config.conf.json     | 13 +------------
 bitbake-setup/poky-master-wip-config.conf.json | 13 +------------
 configs/poky-master-config.txt                 |  4 +---
 configs/poky-master-wip-config.txt             |  4 +---
 kas/poky-master-config.yml                     | 10 ++--------
 kas/poky-master-wip-config.yml                 | 10 ++--------
 src/configs/poky-master-config.xml             | 11 ++---------
 src/configs/poky-master-wip-config.xml         | 11 ++---------
 8 files changed, 12 insertions(+), 64 deletions(-)

diff --git a/bitbake-setup/poky-master-config.conf.json b/bitbake-setup/pok=
y-master-config.conf.json
index f01ca8e..4726117 100644
--- a/bitbake-setup/poky-master-config.conf.json
+++ b/bitbake-setup/poky-master-config.conf.json
@@ -67,17 +67,6 @@
         "rev": "master"
       },
       "path": "oe-core"
-    },
-    "meta-arago": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://git.yoctoproject.org/meta-arago"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-arago"
     }
   },
   "bitbake-setup": {
@@ -85,7 +74,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-ar=
m/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-a=
rago/meta-arago-test","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/poky-master-wip-config.conf.json b/bitbake-setup=
/poky-master-wip-config.conf.json
index 53a3df3..b949b3f 100644
--- a/bitbake-setup/poky-master-wip-config.conf.json
+++ b/bitbake-setup/poky-master-wip-config.conf.json
@@ -67,17 +67,6 @@
         "rev": "master"
       },
       "path": "oe-core"
-    },
-    "meta-arago": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://git.yoctoproject.org/meta-arago"
-          }
-        },
-        "rev": "master-wip"
-      },
-      "path": "meta-arago"
     }
   },
   "bitbake-setup": {
@@ -85,7 +74,7 @@
       {
         "name": "poky",
         "description": "Yocto Project Poky reference distro build",
-        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-ar=
m/meta-arm-toolchain","oe-core/meta","meta-arago/meta-arago-extras","meta-a=
rago/meta-arago-test","oe-layersetup" ],
+        "bb-layers": [ "meta-yocto/meta-poky","meta-yocto/meta-yocto-bsp",=
"meta-ti/meta-ti-test","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta=
-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core=
/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-poky-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.tx=
t
index 307d79d..45639a7 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -3,11 +3,9 @@
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=3Dme=
ta-poky:meta-yocto-bsp
-meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=3Dmeta-ti-=
test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-#meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=3D
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
-meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=3Dme=
ta-arago-extras:meta-arago-test
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-poky-v3.conf.sample
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-c=
onfig.txt
index 6602ce8..0a14f48 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -3,11 +3,9 @@
=20
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=3Dme=
ta-poky:meta-yocto-bsp
-meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-extras:meta-ti-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=3Dmeta=
-ti-test:meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=3Dmeta-a=
rm:meta-arm-toolchain
-#meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=3D
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=
=3Dmeta
-meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=
=3Dmeta-arago-extras:meta-arago-test
=20
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
 OECORELOCALCONF=3D./sample-files/local-poky-v3.conf.sample
diff --git a/kas/poky-master-config.yml b/kas/poky-master-config.yml
index 7d66844..1b8035c 100644
--- a/kas/poky-master-config.yml
+++ b/kas/poky-master-config.yml
@@ -28,7 +28,9 @@ repos:
     branch: "master"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
=20
   meta-arm:
@@ -45,11 +47,3 @@ repos:
     path: "sources/oe-core"
     layers:
       meta:
-
-  meta-arago:
-    url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master"
-    path: "sources/meta-arago"
-    layers:
-      meta-arago-extras:
-      meta-arago-test:
diff --git a/kas/poky-master-wip-config.yml b/kas/poky-master-wip-config.ym=
l
index 7a92b90..ede97d9 100644
--- a/kas/poky-master-wip-config.yml
+++ b/kas/poky-master-wip-config.yml
@@ -28,7 +28,9 @@ repos:
     branch: "master-wip"
     path: "sources/meta-ti"
     layers:
+      meta-ti-test:
       meta-ti-extras:
+      meta-beagle:
       meta-ti-bsp:
=20
   meta-arm:
@@ -45,11 +47,3 @@ repos:
     path: "sources/oe-core"
     layers:
       meta:
-
-  meta-arago:
-    url: "https://git.yoctoproject.org/meta-arago"
-    branch: "master-wip"
-    path: "sources/meta-arago"
-    layers:
-      meta-arago-extras:
-      meta-arago-test:
diff --git a/src/configs/poky-master-config.xml b/src/configs/poky-master-c=
onfig.xml
index f8fff75..8562f36 100644
--- a/src/configs/poky-master-config.xml
+++ b/src/configs/poky-master-config.xml
@@ -18,7 +18,9 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
@@ -28,20 +30,11 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
-            <layers/>
-        </repo>
         <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master' commit=3D'HEAD'>
-            <layers>
-                <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
-            </layers>
-        </repo>
     </repos>
=20
     <tools>
diff --git a/src/configs/poky-master-wip-config.xml b/src/configs/poky-mast=
er-wip-config.xml
index 82375a6..9e4d6c0 100644
--- a/src/configs/poky-master-wip-config.xml
+++ b/src/configs/poky-master-wip-config.xml
@@ -18,7 +18,9 @@
         </repo>
         <repo name=3D'meta-ti' url=3D'https://git.yoctoproject.org/meta-ti=
' branch=3D'master-wip' commit=3D'HEAD'>
             <layers>
+                <layer>meta-ti-test</layer>
                 <layer>meta-ti-extras</layer>
+                <layer>meta-beagle</layer>
                 <layer>meta-ti-bsp</layer>
             </layers>
         </repo>
@@ -28,20 +30,11 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-clang' url=3D'https://github.com/kraj/meta-clan=
g' branch=3D'master' commit=3D'HEAD' disabled=3D'true'>
-            <layers/>
-        </repo>
         <repo name=3D'oe-core' url=3D'https://git.openembedded.org/openemb=
edded-core' branch=3D'master' commit=3D'HEAD'>
             <layers>
                 <layer>meta</layer>
             </layers>
         </repo>
-        <repo name=3D'meta-arago' url=3D'https://git.yoctoproject.org/meta=
-arago' branch=3D'master-wip' commit=3D'HEAD'>
-            <layers>
-                <layer>meta-arago-extras</layer>
-                <layer>meta-arago-test</layer>
-            </layers>
-        </repo>
     </repos>
=20
     <tools>
--=20
2.43.0


