Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE20C5B559
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 15:03:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.18899.1749049373743692681
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 08:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EGpRWZaK;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554F2qt63847495;
	Wed, 4 Jun 2025 10:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749049372;
	bh=17id19MISBU1upx1SXDjxF8Ei31ht3pgBZ3GBUcSJFg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EGpRWZaKT+/707SeOFeYwTvsRHzpawox63wJoEiil/dG+o/WpY1EGZnAJLB3PzaRy
	 wODot1qmFrHymdsrz5X20opQ7H3P6X53f5f4L4cWtqgGHjNRMFs0WFM5srb0GT/mYO
	 H8YI9LCpMjavK55upJZWGE0qLrFRSV0Q7HpPLC7U=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554F2qIx225850
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 10:02:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 10:02:50 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 10:02:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554F2ord2206975;
	Wed, 4 Jun 2025 10:02:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uMpdi-0001cZ-OE; Wed, 04 Jun 2025 10:02:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH 2/2] configs/arago-scarthgap-*: Add meta-lts-mixins scarthgap/rust
Date: Wed, 4 Jun 2025 10:02:50 -0500
Message-ID: <20250604150250.6187-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250604150250.6187-1-reatmon@ti.com>
References: <20250604150250.6187-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jun 2025 15:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16250

We are needing the latest version of rust for our Chromium builds, start
using the mixin layer to pull it in.  This was tested on the
scarthgap-wip branches and we are now rolling this out for all other
scarthgap branches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 bitbake-setup/arago-scarthgap-10x-config.json         | 11 +++++++++++
 bitbake-setup/arago-scarthgap-10x-next-config.json    | 11 +++++++++++
 bitbake-setup/arago-scarthgap-chromium-config.json    | 11 +++++++++++
 bitbake-setup/arago-scarthgap-config.json             | 11 +++++++++++
 bitbake-setup/arago-scarthgap-next-config.json        | 11 +++++++++++
 bitbake-setup/arago-scarthgap-selinux-config.json     | 11 +++++++++++
 .../arago-scarthgap-10x-config/bblayers.conf.sample   |  1 +
 .../bblayers.conf.sample                              |  1 +
 .../bblayers.conf.sample                              |  1 +
 .../arago-scarthgap-config/bblayers.conf.sample       |  1 +
 .../arago-scarthgap-next-config/bblayers.conf.sample  |  1 +
 .../bblayers.conf.sample                              |  1 +
 configs/arago-scarthgap-10x-config.txt                |  1 +
 configs/arago-scarthgap-10x-next-config.txt           |  1 +
 configs/arago-scarthgap-chromium-config.txt           |  1 +
 configs/arago-scarthgap-config.txt                    |  1 +
 configs/arago-scarthgap-next-config.txt               |  1 +
 configs/arago-scarthgap-selinux-config.txt            |  1 +
 kas/arago-scarthgap-10x-config.yml                    |  4 ++++
 kas/arago-scarthgap-10x-next-config.yml               |  4 ++++
 kas/arago-scarthgap-chromium-config.yml               |  4 ++++
 kas/arago-scarthgap-config.yml                        |  4 ++++
 kas/arago-scarthgap-next-config.yml                   |  4 ++++
 kas/arago-scarthgap-selinux-config.yml                |  4 ++++
 src/configs/arago-scarthgap-10x-config.xml            |  3 +++
 src/configs/arago-scarthgap-10x-next-config.xml       |  3 +++
 src/configs/arago-scarthgap-chromium-config.xml       |  3 +++
 src/configs/arago-scarthgap-config.xml                |  3 +++
 src/configs/arago-scarthgap-next-config.xml           |  3 +++
 src/configs/arago-scarthgap-selinux-config.xml        |  3 +++
 30 files changed, 120 insertions(+)

diff --git a/bitbake-setup/arago-scarthgap-10x-config.json b/bitbake-setup/arago-scarthgap-10x-config.json
index c5388a9..fc9279b 100644
--- a/bitbake-setup/arago-scarthgap-10x-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-config.json
@@ -68,6 +68,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/bitbake-setup/arago-scarthgap-10x-next-config.json b/bitbake-setup/arago-scarthgap-10x-next-config.json
index de5a5c3..f4fe3d8 100644
--- a/bitbake-setup/arago-scarthgap-10x-next-config.json
+++ b/bitbake-setup/arago-scarthgap-10x-next-config.json
@@ -68,6 +68,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/bitbake-setup/arago-scarthgap-chromium-config.json b/bitbake-setup/arago-scarthgap-chromium-config.json
index a0fb0d3..9ba4585 100644
--- a/bitbake-setup/arago-scarthgap-chromium-config.json
+++ b/bitbake-setup/arago-scarthgap-chromium-config.json
@@ -79,6 +79,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/bitbake-setup/arago-scarthgap-config.json b/bitbake-setup/arago-scarthgap-config.json
index 18af746..9e8067b 100644
--- a/bitbake-setup/arago-scarthgap-config.json
+++ b/bitbake-setup/arago-scarthgap-config.json
@@ -68,6 +68,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/bitbake-setup/arago-scarthgap-next-config.json b/bitbake-setup/arago-scarthgap-next-config.json
index f6d48e6..fbee1d2 100644
--- a/bitbake-setup/arago-scarthgap-next-config.json
+++ b/bitbake-setup/arago-scarthgap-next-config.json
@@ -68,6 +68,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/bitbake-setup/arago-scarthgap-selinux-config.json b/bitbake-setup/arago-scarthgap-selinux-config.json
index 918aa42..ac5b4c4 100644
--- a/bitbake-setup/arago-scarthgap-selinux-config.json
+++ b/bitbake-setup/arago-scarthgap-selinux-config.json
@@ -79,6 +79,17 @@
       },
       "path": "meta-openembedded"
     },
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
     "meta-ti": {
       "git-remote": {
         "remotes": {
diff --git a/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
index 4f26d30..641ea97 100644
--- a/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-10x-config/bblayers.conf.sample
@@ -20,6 +20,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
index 4f26d30..641ea97 100644
--- a/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-10x-next-config/bblayers.conf.sample
@@ -20,6 +20,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
index 80b4c62..0c16c84 100644
--- a/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-chromium-config/bblayers.conf.sample
@@ -21,6 +21,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/conf/templates/arago-scarthgap-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
index 4f26d30..641ea97 100644
--- a/conf/templates/arago-scarthgap-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-config/bblayers.conf.sample
@@ -20,6 +20,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
index 4f26d30..641ea97 100644
--- a/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-next-config/bblayers.conf.sample
@@ -20,6 +20,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
index 12aeae1..e3101b4 100644
--- a/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
+++ b/conf/templates/arago-scarthgap-selinux-config/bblayers.conf.sample
@@ -21,6 +21,7 @@ BBLAYERS ?= " \
     ##OEROOT##/../meta-openembedded/meta-gnome
     ##OEROOT##/../meta-openembedded/meta-filesystems
     ##OEROOT##/../meta-openembedded/meta-multimedia
+    ##OEROOT##/../meta-lts-mixins
     ##OEROOT##/../meta-ti/meta-ti-extras
     ##OEROOT##/../meta-ti/meta-beagle
     ##OEROOT##/../meta-ti/meta-ti-bsp
diff --git a/configs/arago-scarthgap-10x-config.txt b/configs/arago-scarthgap-10x-config.txt
index c557ac2..7e52f8a 100644
--- a/configs/arago-scarthgap-10x-config.txt
+++ b/configs/arago-scarthgap-10x-config.txt
@@ -8,6 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-10x-next-config.txt b/configs/arago-scarthgap-10x-next-config.txt
index c085e95..22432ec 100644
--- a/configs/arago-scarthgap-10x-next-config.txt
+++ b/configs/arago-scarthgap-10x-next-config.txt
@@ -16,6 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-chromium-config.txt b/configs/arago-scarthgap-chromium-config.txt
index 1d4cbd0..ae873e8 100644
--- a/configs/arago-scarthgap-chromium-config.txt
+++ b/configs/arago-scarthgap-chromium-config.txt
@@ -8,6 +8,7 @@ meta-browser,https://github.com/OSSystems/meta-browser.git,master,68e8cbf51ac46c
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 32fc5f4..1474e02 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -8,6 +8,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 9b33933..46476f8 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -16,6 +16,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-selinux-config.txt b/configs/arago-scarthgap-selinux-config.txt
index 681be86..198df7c 100644
--- a/configs/arago-scarthgap-selinux-config.txt
+++ b/configs/arago-scarthgap-selinux-config.txt
@@ -8,6 +8,7 @@ meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,HEAD,layers=
 meta-qt6,https://code.qt.io/yocto/meta-qt6.git,6.9,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
+meta-lts-mixins,https://git.yoctoproject.org/meta-lts-mixins,scarthgap/rust,HEAD,layers=
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-beagle:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,scarthgap,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,scarthgap,HEAD,layers=
diff --git a/kas/arago-scarthgap-10x-config.yml b/kas/arago-scarthgap-10x-config.yml
index 6e87ac4..8ddd524 100644
--- a/kas/arago-scarthgap-10x-config.yml
+++ b/kas/arago-scarthgap-10x-config.yml
@@ -34,6 +34,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
diff --git a/kas/arago-scarthgap-10x-next-config.yml b/kas/arago-scarthgap-10x-next-config.yml
index 4b08ed2..0972ecf 100644
--- a/kas/arago-scarthgap-10x-next-config.yml
+++ b/kas/arago-scarthgap-10x-next-config.yml
@@ -34,6 +34,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-next"
diff --git a/kas/arago-scarthgap-chromium-config.yml b/kas/arago-scarthgap-chromium-config.yml
index 1cad9d5..a929eda 100644
--- a/kas/arago-scarthgap-chromium-config.yml
+++ b/kas/arago-scarthgap-chromium-config.yml
@@ -41,6 +41,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
diff --git a/kas/arago-scarthgap-config.yml b/kas/arago-scarthgap-config.yml
index 9d79113..ed1ae10 100644
--- a/kas/arago-scarthgap-config.yml
+++ b/kas/arago-scarthgap-config.yml
@@ -34,6 +34,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
diff --git a/kas/arago-scarthgap-next-config.yml b/kas/arago-scarthgap-next-config.yml
index 974d9ab..05828c1 100644
--- a/kas/arago-scarthgap-next-config.yml
+++ b/kas/arago-scarthgap-next-config.yml
@@ -34,6 +34,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap-next"
diff --git a/kas/arago-scarthgap-selinux-config.yml b/kas/arago-scarthgap-selinux-config.yml
index 717a55b..ec61271 100644
--- a/kas/arago-scarthgap-selinux-config.yml
+++ b/kas/arago-scarthgap-selinux-config.yml
@@ -38,6 +38,10 @@ repos:
       meta-filesystems:
       meta-multimedia:
 
+  meta-lts-mixins:
+    url: "https://git.yoctoproject.org/meta-lts-mixins"
+    branch: "scarthgap/rust"
+
   meta-ti:
     url: "https://git.yoctoproject.org/meta-ti"
     branch: "scarthgap"
diff --git a/src/configs/arago-scarthgap-10x-config.xml b/src/configs/arago-scarthgap-10x-config.xml
index 03c8cd2..ead78e2 100644
--- a/src/configs/arago-scarthgap-10x-config.xml
+++ b/src/configs/arago-scarthgap-10x-config.xml
@@ -40,6 +40,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
diff --git a/src/configs/arago-scarthgap-10x-next-config.xml b/src/configs/arago-scarthgap-10x-next-config.xml
index 2ed7497..1d55f7e 100644
--- a/src/configs/arago-scarthgap-10x-next-config.xml
+++ b/src/configs/arago-scarthgap-10x-next-config.xml
@@ -41,6 +41,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
diff --git a/src/configs/arago-scarthgap-chromium-config.xml b/src/configs/arago-scarthgap-chromium-config.xml
index f81380c..ba7c95e 100644
--- a/src/configs/arago-scarthgap-chromium-config.xml
+++ b/src/configs/arago-scarthgap-chromium-config.xml
@@ -40,6 +40,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
diff --git a/src/configs/arago-scarthgap-config.xml b/src/configs/arago-scarthgap-config.xml
index a1381e1..ee9425f 100644
--- a/src/configs/arago-scarthgap-config.xml
+++ b/src/configs/arago-scarthgap-config.xml
@@ -40,6 +40,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
diff --git a/src/configs/arago-scarthgap-next-config.xml b/src/configs/arago-scarthgap-next-config.xml
index 803e397..f080066 100644
--- a/src/configs/arago-scarthgap-next-config.xml
+++ b/src/configs/arago-scarthgap-next-config.xml
@@ -41,6 +41,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap-next' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
diff --git a/src/configs/arago-scarthgap-selinux-config.xml b/src/configs/arago-scarthgap-selinux-config.xml
index 42fde7c..990cb2a 100644
--- a/src/configs/arago-scarthgap-selinux-config.xml
+++ b/src/configs/arago-scarthgap-selinux-config.xml
@@ -40,6 +40,9 @@
                 <layer>meta-multimedia</layer>
             </layers>
         </repo>
+        <repo name='meta-lts-mixins' url='https://git.yoctoproject.org/meta-lts-mixins' branch='scarthgap/rust' commit='HEAD'>
+            <layers/>
+        </repo>
         <repo name='meta-ti' url='https://git.yoctoproject.org/meta-ti' branch='scarthgap' commit='HEAD'>
             <layers>
                 <layer>meta-ti-extras</layer>
-- 
2.17.1


