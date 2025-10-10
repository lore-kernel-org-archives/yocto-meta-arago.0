Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D13CCA476
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 18:26:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1024.1760120790325146576
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Oct 2025 11:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HSPLNUAY;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59AIQSis302551;
	Fri, 10 Oct 2025 13:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760120788;
	bh=aiEDA1j7KxsY+vgCf+VVmfrN+8Cl7bmCWvkBrfgLtzg=;
	h=From:To:Subject:Date;
	b=HSPLNUAYIiOqerTSYo1td7Mg+klFYdkPV/26Vx4H9eHY2zgU1iE1tjPEpiCGJmRfU
	 NEPjf1TgmBSZ4lI50WDbPcVxZQDF9MT/id8oJ1yD/gDbv+V3aPpsNZoDbcYzySzA6b
	 TENhbXQ+HX1poVUMp+JLHgthTsKAgVM9jKsaOsFg=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59AIQSfB1243016
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 13:26:28 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Oct
 2025 13:26:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 13:26:28 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59AIQSvp2056633;
	Fri, 10 Oct 2025 13:26:28 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1v7Hox-000136-W5; Fri, 10 Oct 2025 13:26:28 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Remove meta-clang from arago-master-* builds
Date: Fri, 10 Oct 2025 13:26:27 -0500
Message-ID: <20251010182627.3993-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 10 Oct 2025 18:26:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16682

Initial tests on master-wip are working.  We need to remove it so that
we can roll out the changes.

With the addition of clang in oe-core, the need for the meta-clang layer
is dwindling.  Take this time to remove it for testing so we can verify
if we can remove it for all master configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../arago-master-chromium-config.conf.json          | 13 +------------
 bitbake-setup/arago-master-config.conf.json         | 13 +------------
 bitbake-setup/arago-master-flutter-config.conf.json | 13 +------------
 bitbake-setup/arago-master-next-config.conf.json    | 13 +------------
 bitbake-setup/arago-master-selinux-config.conf.json | 13 +------------
 configs/arago-master-chromium-config.txt            |  1 -
 configs/arago-master-config.txt                     |  1 -
 configs/arago-master-flutter-config.txt             |  1 -
 configs/arago-master-next-config.txt                |  1 -
 configs/arago-master-selinux-config.txt             |  1 -
 kas/arago-master-chromium-config.yml                |  4 ----
 kas/arago-master-config.yml                         |  4 ----
 kas/arago-master-flutter-config.yml                 |  4 ----
 kas/arago-master-next-config.yml                    |  4 ----
 kas/arago-master-selinux-config.yml                 |  4 ----
 src/configs/arago-master-chromium-config.xml        |  3 ---
 src/configs/arago-master-config.xml                 |  3 ---
 src/configs/arago-master-flutter-config.xml         |  3 ---
 src/configs/arago-master-next-config.xml            |  3 ---
 src/configs/arago-master-selinux-config.xml         |  3 ---
 20 files changed, 5 insertions(+), 100 deletions(-)

diff --git a/bitbake-setup/arago-master-chromium-config.conf.json b/bitbake-setup/arago-master-chromium-config.conf.json
index 32ef129..4a4af13 100644
--- a/bitbake-setup/arago-master-chromium-config.conf.json
+++ b/bitbake-setup/arago-master-chromium-config.conf.json
@@ -101,17 +101,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -129,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-browser/meta-chromium","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-config.conf.json b/bitbake-setup/arago-master-config.conf.json
index b0cc299..2b815ad 100644
--- a/bitbake-setup/arago-master-config.conf.json
+++ b/bitbake-setup/arago-master-config.conf.json
@@ -90,17 +90,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -118,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-flutter-config.conf.json b/bitbake-setup/arago-master-flutter-config.conf.json
index 54e1eba..95f4cf9 100644
--- a/bitbake-setup/arago-master-flutter-config.conf.json
+++ b/bitbake-setup/arago-master-flutter-config.conf.json
@@ -101,17 +101,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -129,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-flutter/.","meta-flutter/meta-flutter-apps","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-flutter/.","meta-flutter/meta-flutter-apps","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-next-config.conf.json b/bitbake-setup/arago-master-next-config.conf.json
index b008d00..f073334 100644
--- a/bitbake-setup/arago-master-next-config.conf.json
+++ b/bitbake-setup/arago-master-next-config.conf.json
@@ -90,17 +90,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -118,7 +107,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/arago-master-next-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/bitbake-setup/arago-master-selinux-config.conf.json b/bitbake-setup/arago-master-selinux-config.conf.json
index e2046ef..29e7a19 100644
--- a/bitbake-setup/arago-master-selinux-config.conf.json
+++ b/bitbake-setup/arago-master-selinux-config.conf.json
@@ -101,17 +101,6 @@
       },
       "path": "meta-arm"
     },
-    "meta-clang": {
-      "git-remote": {
-        "remotes": {
-          "origin": {
-            "uri": "https://github.com/kraj/meta-clang"
-          }
-        },
-        "rev": "master"
-      },
-      "path": "meta-clang"
-    },
     "oe-core": {
       "git-remote": {
         "remotes": {
@@ -129,7 +118,7 @@
       {
         "name": "arago",
         "description": "TI Arago distro build",
-        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","meta-clang","oe-core/meta","oe-layersetup" ],
+        "bb-layers": [ "meta-arago/meta-arago-distro","meta-arago/meta-arago-extras","meta-arago/meta-arago-test","meta-selinux","meta-qt6","meta-virtualization","meta-openembedded/meta-networking","meta-openembedded/meta-python","meta-openembedded/meta-oe","meta-openembedded/meta-gnome","meta-openembedded/meta-filesystems","meta-openembedded/meta-multimedia","meta-ti/meta-ti-extras","meta-ti/meta-beagle","meta-ti/meta-ti-bsp","meta-arm/meta-arm","meta-arm/meta-arm-toolchain","oe-core/meta","oe-layersetup" ],
         "oe-fragments": [ "oe-layersetup/localconf/local-arago64-v3", "oe-layersetup/localconf/configs/arago-master-selinux-config.conf" ],
         "oe-fragments-one-of": {
           "machine": {
diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index 4c46f8c..66f1be8 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -11,7 +11,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 5364178..0207d38 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -11,7 +11,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-flutter-config.txt b/configs/arago-master-flutter-config.txt
index 0abfab1..37be2a0 100644
--- a/configs/arago-master-flutter-config.txt
+++ b/configs/arago-master-flutter-config.txt
@@ -10,7 +10,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index de67189..109c9b3 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -19,7 +19,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-selinux-config.txt b/configs/arago-master-selinux-config.txt
index 6d53193..2f0f9ad 100644
--- a/configs/arago-master-selinux-config.txt
+++ b/configs/arago-master-selinux-config.txt
@@ -11,7 +11,6 @@ meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/kas/arago-master-chromium-config.yml b/kas/arago-master-chromium-config.yml
index c5744fd..976f651 100644
--- a/kas/arago-master-chromium-config.yml
+++ b/kas/arago-master-chromium-config.yml
@@ -62,10 +62,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/kas/arago-master-config.yml b/kas/arago-master-config.yml
index e792358..f1dfeef 100644
--- a/kas/arago-master-config.yml
+++ b/kas/arago-master-config.yml
@@ -56,10 +56,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/kas/arago-master-flutter-config.yml b/kas/arago-master-flutter-config.yml
index 58ff2bc..0e53c9a 100644
--- a/kas/arago-master-flutter-config.yml
+++ b/kas/arago-master-flutter-config.yml
@@ -63,10 +63,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/kas/arago-master-next-config.yml b/kas/arago-master-next-config.yml
index f8fdeb3..cd76148 100644
--- a/kas/arago-master-next-config.yml
+++ b/kas/arago-master-next-config.yml
@@ -56,10 +56,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/kas/arago-master-selinux-config.yml b/kas/arago-master-selinux-config.yml
index 2eed1b7..b3cb9d4 100644
--- a/kas/arago-master-selinux-config.yml
+++ b/kas/arago-master-selinux-config.yml
@@ -60,10 +60,6 @@ repos:
       meta-arm:
       meta-arm-toolchain:
 
-  meta-clang:
-    url: "https://github.com/kraj/meta-clang"
-    branch: "master"
-
   oe-core:
     url: "https://git.openembedded.org/openembedded-core"
     branch: "master"
diff --git a/src/configs/arago-master-chromium-config.xml b/src/configs/arago-master-chromium-config.xml
index d59c579..8c30eda 100644
--- a/src/configs/arago-master-chromium-config.xml
+++ b/src/configs/arago-master-chromium-config.xml
@@ -60,9 +60,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-master-config.xml b/src/configs/arago-master-config.xml
index 1f3bb4e..d17789a 100644
--- a/src/configs/arago-master-config.xml
+++ b/src/configs/arago-master-config.xml
@@ -60,9 +60,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-master-flutter-config.xml b/src/configs/arago-master-flutter-config.xml
index 0bb8972..26e9335 100644
--- a/src/configs/arago-master-flutter-config.xml
+++ b/src/configs/arago-master-flutter-config.xml
@@ -55,9 +55,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-master-next-config.xml b/src/configs/arago-master-next-config.xml
index 2f3c78a..ccf716e 100644
--- a/src/configs/arago-master-next-config.xml
+++ b/src/configs/arago-master-next-config.xml
@@ -61,9 +61,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
diff --git a/src/configs/arago-master-selinux-config.xml b/src/configs/arago-master-selinux-config.xml
index e3018bd..7117b64 100644
--- a/src/configs/arago-master-selinux-config.xml
+++ b/src/configs/arago-master-selinux-config.xml
@@ -60,9 +60,6 @@
                 <layer>meta-arm-toolchain</layer>
             </layers>
         </repo>
-        <repo name='meta-clang' url='https://github.com/kraj/meta-clang' branch='master' commit='HEAD'>
-            <layers/>
-        </repo>
         <repo name='oe-core' url='https://git.openembedded.org/openembedded-core' branch='master' commit='HEAD'>
             <layers>
                 <layer>meta</layer>
-- 
2.17.1


