Return-Path: <s-sinha@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9316FCAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 08:06:45 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.27443.1757923596334827157
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Sep 2025 01:06:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=L462eXUO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: s-sinha@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58F86ZGR1000852
	for <meta-arago@lists.yoctoproject.org>; Mon, 15 Sep 2025 03:06:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757923595;
	bh=H7ES0vigurp+ptP3r5iUystBiUOTGECKKfRwFykV8NI=;
	h=From:To:CC:Subject:Date;
	b=L462eXUOPiFDdaPDBfqHT5Cs5nd1gjry+Jy940NJC8ksIT+Cnf0Qk4jrXzczK3oo7
	 Y5LUXpSRQXweC/eyBHVSqVOOdkF02GdfyJJBfMHBZmZZtk7nKSZP/LVJCn3edqm7Mb
	 /dUuKsfFQrvxLVeQi2vaM/IXXY3O0jMifC5f3naU=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58F86Z7I589107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 15 Sep 2025 03:06:35 -0500
Received: from DFLE207.ent.ti.com (10.64.6.65) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 15
 Sep 2025 03:06:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 15 Sep 2025 03:06:35 -0500
Received: from localhost (robotics.dhcp.ti.com [172.24.235.192])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58F86XAf3699992;
	Mon, 15 Sep 2025 03:06:34 -0500
From: Shreyash Sinha <s-sinha@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Shreyash Sinha <s-sinha@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] configs: processor-sdk-analytics: Add 11.1 release config
Date: Mon, 15 Sep 2025 13:36:30 +0530
Message-ID: <20250915080630.2061061-1-s-sinha@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Sep 2025 08:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16581

Signed-off-by: Shreyash Sinha <s-sinha@ti.com>
---
 ...sor-sdk-analytics-11.01.00-config.txt.json | 158 ++++++++++++++++++
 ...ssor-sdk-analytics-11.01.00-config.txt.txt |  18 ++
 ...ssor-sdk-analytics-11.01.00-config.txt.yml |  87 ++++++++++
 ...ssor-sdk-analytics-11.01.00-config.txt.xml |  71 ++++++++
 4 files changed, 334 insertions(+)
 create mode 100644 bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.json
 create mode 100644 configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.txt
 create mode 100644 kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.yml
 create mode 100644 src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.xml

diff --git a/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.json b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.json
new file mode 100644
index 0000000..0a7835b
--- /dev/null
+++ b/bitbake-setup/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.json
@@ -0,0 +1,158 @@
+{
+  "version": "1.0",
+  "description": "TI Processor SDK Analytics v11.01.00-config.txt",
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
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","meta-tisdk/meta-ti-foundational","meta-edgeai","oe-layersetup" ],
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
diff --git a/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.txt b/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.txt
new file mode 100644
index 0000000..df52072
--- /dev/null
+++ b/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.txt
@@ -0,0 +1,18 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,https://git.openembedded.org/bitbake,2.8,86e7a58c0e9904c33b1b94dddc3d683c2da22d1a
+meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,b253a46d52348996c2abcd9d309c1a8da1e63ca1,layers=meta-arago-distro:meta-arago-extras:meta-arago-test
+meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,559e316dc5facf962ed06e3ac5dd2ecc20a4ae5b,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,151273b120117468e70733020b6db864d8180c0b,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,0353868b3f625ee43a671a211245cc14cddbda7d,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,8e0f8af90fefb03f08cd2228cde7a89902a6b37c,layers=meta-arm:meta-arm-toolchain
+meta-clang,https://github.com/kraj/meta-clang,scarthgap,aef850f7fa53121c74b244b7ae40d31fb9809ccf,layers=
+oe-core,https://git.openembedded.org/openembedded-core,scarthgap,c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf,layers=meta
+meta-tisdk,https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git,scarthgap,487eab23a220d225cf31ca9649630f5b83488068,layers=meta-ti-foundational
+meta-edgeai,https://git.ti.com/git/edgeai/meta-edgeai.git,scarthgap,42fb59bb661dd2a467e6df7f5ddf8ec21661083c,layers=
+
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+BITBAKE_INCLUSIVE_VARS=yes
diff --git a/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.yml b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.yml
new file mode 100644
index 0000000..b1e2dca
--- /dev/null
+++ b/kas/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.yml
@@ -0,0 +1,87 @@
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
+    commit: "86e7a58c0e9904c33b1b94dddc3d683c2da22d1a"
+    layers:
+      .: disabled
+
+  meta-arago:
+    url: "https://git.yoctoproject.org/meta-arago"
+    branch: "scarthgap"
+    commit: "b253a46d52348996c2abcd9d309c1a8da1e63ca1"
+    layers:
+      meta-arago-distro:
+      meta-arago-extras:
+      meta-arago-test:
+
+  meta-qt6:
+    url: "https://code.qt.io/yocto/meta-qt6.git"
+    branch: "6.9"
+    commit: "559e316dc5facf962ed06e3ac5dd2ecc20a4ae5b"
+
+  meta-virtualization:
+    url: "https://git.yoctoproject.org/meta-virtualization"
+    branch: "scarthgap"
+    commit: "151273b120117468e70733020b6db864d8180c0b"
+
+  meta-openembedded:
+    url: "https://git.openembedded.org/meta-openembedded"
+    branch: "scarthgap"
+    commit: "e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943"
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
+    branch: "scarthgap"
+    commit: "0353868b3f625ee43a671a211245cc14cddbda7d"
+    layers:
+      meta-ti-extras:
+      meta-ti-bsp:
+
+  meta-arm:
+    url: "https://git.yoctoproject.org/meta-arm"
+    branch: "scarthgap"
+    commit: "8e0f8af90fefb03f08cd2228cde7a89902a6b37c"
+    layers:
+      meta-arm:
+      meta-arm-toolchain:
+
+  meta-clang:
+    url: "https://github.com/kraj/meta-clang"
+    branch: "scarthgap"
+    commit: "aef850f7fa53121c74b244b7ae40d31fb9809ccf"
+
+  oe-core:
+    url: "https://git.openembedded.org/openembedded-core"
+    branch: "scarthgap"
+    commit: "c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf"
+    layers:
+      meta:
+
+  meta-tisdk:
+    url: "https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git"
+    branch: "scarthgap"
+    commit: "487eab23a220d225cf31ca9649630f5b83488068"
+    layers:
+      meta-ti-foundational:
+
+  meta-edgeai:
+    url: "https://git.ti.com/git/edgeai/meta-edgeai.git"
+    branch: "scarthgap"
+    commit: "42fb59bb661dd2a467e6df7f5ddf8ec21661083c"
diff --git a/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.xml b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.xml
new file mode 100644
index 0000000..aada53c
--- /dev/null
+++ b/src/configs/processor-sdk-analytics/processor-sdk-analytics-11.01.00-config.txt.xml
@@ -0,0 +1,71 @@
+<?xml version='1.0'?>
+<config>
+    <description>TI Processor SDK Analytics v11.01.00-config.txt</description>
+
+    <xi:include href='../../common/distro_arago.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../common/machines.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/bblayers.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+    <xi:include href='../../templates/local-arago64-v2.conf.xml' xmlns:xi='http://www.w3.org/2001/XInclude'/>
+
+    <bitbake url='https://git.openembedded.org/bitbake' branch='2.8' commit='86e7a58c0e9904c33b1b94dddc3d683c2da22d1a'/>
+
+    <repos>
+        <repo name='meta-arago' url='https://git.yoctoproject.org/meta-arago' branch='scarthgap' commit='b253a46d52348996c2abcd9d309c1a8da1e63ca1'>
+            <layers>
+                <layer>meta-arago-distro</layer>
+                <layer>meta-arago-extras</layer>
+                <layer>meta-arago-test</layer>
+            </layers>
+        </repo>
+        <repo name='meta-qt6' url='https://code.qt.io/yocto/meta-qt6.git' branch='6.9' commit='559e316dc5facf962ed06e3ac5dd2ecc20a4ae5b'>
+            <layers/>
+        </repo>
+        <repo name='meta-virtualization' url='https://git.yoctoproject.org/meta-virtualization' branch='scarthgap' commit='151273b120117468e70733020b6db864d8180c0b'>
+            <layers/>
+        </repo>
+        <repo name='meta-openembedded' url='https://git.openembedded.org/meta-openembedded' branch='scarthgap' commit='e8fd97d86af86cdcc5a6eb3f301cbaf6a2084943'>
+            <layers>
+                <layer>meta-networking</layer>
+                <layer>meta-python</layer>
+                <layer>meta-oe</layer>
+                <layer>meta-gnome</layer>
+                <layer>meta-filesystems</layer>
+                <layer>meta-multimedia</layer>
+            </layers>
+        </repo>
+        <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='0353868b3f625ee43a671a211245cc14cddbda7d'>
+            <layers>
+                <layer>meta-ti-extras</layer>
+                <layer>meta-ti-bsp</layer>
+            </layers>
+        </repo>
+        <repo name='meta-arm' url='https://git.yoctoproject.org/meta-arm' branch='scarthgap' commit='8e0f8af90fefb03f08cd2228cde7a89902a6b37c'>
+            <layers>
+                <layer>meta-arm</layer>
+                <layer>meta-arm-toolchain</layer>
+            </layers>
+        </repo>
+        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='scarthgap' commit='aef850f7fa53121c74b244b7ae40d31fb9809ccf'>
+            <layers/>
+        </repo>
+        <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='scarthgap' commit='c374e6cfcdd2c8ba17d82ffcfdeb97d21144e2bf'>
+            <layers>
+                <layer>meta</layer>
+            </layers>
+        </repo>
+        <repo name='meta-tisdk' url='https://git.ti.com/git/ti-sdk-linux/meta-tisdk.git' branch='scarthgap' commit='487eab23a220d225cf31ca9649630f5b83488068'>
+            <layers>
+                <layer>meta-ti-foundational</layer>
+            </layers>
+        </repo>
+        <repo name='meta-edgeai' url='https://git.ti.com/git/edgeai/meta-edgeai.git' branch='scarthgap' commit='42fb59bb661dd2a467e6df7f5ddf8ec21661083c'>
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


