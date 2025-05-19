Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318E4C54E92
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.427.1747674072810606028
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xTVqy8Kw;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1AsD517790;
	Mon, 19 May 2025 12:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674070;
	bh=q3jOPzBTMLsV3+EiqfrOYoHuEnSKw0wVLpGwfFb/Xso=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xTVqy8KwutdsOc7/pynVmDY+85pHGlS9bVydmUmW4lQbvviL6Jo9ZQ4VJKeKIZ9y+
	 W++Muo0GyzwMZoVgsHnxTt/rXoBnLZxjUmKHyiLDDwjN7ErLJj2a5xe5j1jorTrC/+
	 bjmsgqvkv5+EPoNgTuMbDL8GVxp0k3VvtvWySHhM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1A2Z888482
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:10 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:10 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1Am3100787;
	Mon, 19 May 2025 12:01:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rS-0005rs-ER; Mon, 19 May 2025 12:01:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 1/8] CLEANUP: Add missing SUMMARY
Date: Mon, 19 May 2025 12:01:03 -0500
Message-ID: <20250519170110.22506-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16221

Every recipe should have a SUMMARY and that can only be 72 characters at
most.  Some of these recipes had DESCRIPTIONS and not SUMMARY, some were
missing the SUMMARY, and some had slightly too long values for the SUMMARY.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../initscript-telnetd/initscript-telnetd.bb                 | 2 +-
 .../recipes-core/arago-gpl-notice/arago-gpl-notice.bb        | 2 +-
 .../recipes-core/meta/meta-toolchain-arago-tisdk.bb          | 2 ++
 meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb  | 2 ++
 .../recipes-core/packagegroups/build-essential.bb            | 2 +-
 .../packagegroup-arago-base-tisdk-server-extra.bb            | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-console.bb | 2 +-
 .../packagegroups/packagegroup-arago-gst-sdk-target.bb       | 2 +-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb     | 2 +-
 .../packagegroups/packagegroup-arago-initramfs.bb            | 1 +
 .../packagegroup-arago-tisdk-addons-sdk-target.bb            | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-addons.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb | 2 +-
 .../packagegroup-arago-tisdk-connectivity-sdk-target.bb      | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb   | 2 +-
 .../packagegroup-arago-tisdk-crypto-sdk-target.bb            | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-crypto.bb         | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb | 2 +-
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb            | 2 +-
 .../packagegroup-arago-tisdk-multimedia-sdk-target.bb        | 2 +-
 .../packagegroup-arago-toolchain-tisdk-target.bb             | 2 +-
 meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb     | 2 +-
 .../recipes-connectivity/hostap/hostap-daemon-wl18xx.bb      | 5 +++--
 meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb    | 1 +
 .../recipes-core/oprofile-example/oprofile-example_git.bb    | 2 +-
 .../packagegroup-arago-standalone-sdk-target.bb              | 2 +-
 .../recipes-devtools/cmake/extra-cmake-modules.bb            | 2 +-
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb               | 2 +-
 .../recipes-graphics/tslib/ts-calibrate-init_1.0.bb          | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb        | 2 +-
 .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb           | 2 +-
 meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb       | 1 +
 meta-arago-test/recipes-benchmark/stream/stream_5.10.bb      | 2 +-
 .../recipes-bsp/switch-config/switch-config_git.bb           | 2 +-
 .../recipes-connectivity/openntpd/openntpd_6.8p1.bb          | 4 ++--
 .../recipes-devtools/cpuloadgen/cpuloadgen_git.bb            | 2 +-
 .../recipes-devtools/input-utils/input-utils_1.0.bb          | 2 +-
 37 files changed, 42 insertions(+), 34 deletions(-)

diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
index d804d14e..d0f7bb9c 100644
--- a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
+++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Initscripts for telnetd"
+SUMMARY = "Initscripts for telnetd"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://telnetd;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
 PR  = "r1"
diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
index 6cb428a5..c31ce1fc 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Script to warn users of GPLv3 content on the target file system at boot time"
+SUMMARY = "Script to warn of GPLv3 content on the target file system at boot time"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://print-gplv3-packages.sh;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
 
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 0ab541d3..9bfd2343 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -1,3 +1,5 @@
+SUMMARY = "Standalone toolchain/devkit for TI-SDK products"
+
 TOOLCHAIN_SUFFIX ?= "-tisdk"
 LICENSE = "MIT"
 
diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
index f815bd0b..3aae25b4 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago.bb
@@ -1,3 +1,5 @@
+SUMMARY = "Standalone toolchain/devkit for generic Arago Project use"
+
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-sdk-host"
 TOOLCHAIN_HOST_TASK:append = " nativesdk-sdk-provides-dummy nativesdk-buildtools-perl-dummy"
 TOOLCHAIN_HOST_TASK:append = " packagegroup-cross-canadian-${MACHINE}"
diff --git a/meta-arago-distro/recipes-core/packagegroups/build-essential.bb b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
index 5b9930b8..8ffd8e49 100644
--- a/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/build-essential.bb
@@ -1,4 +1,4 @@
-# This is just an alias between debian and OE names
+SUMMARY = "This is just an alias between debian and OE names"
 
 LICENSE = "MIT"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index f203ff20..0f35d753 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
+SUMMARY = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 PR = "r17"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 3e0d373d..f6ec0a05 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Extended task to get more basic and console apps"
+SUMMARY = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
 PR = "r14"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index ce2ac46a..5555d360 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to build and install header and libs in sdk"
+SUMMARY = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
 PR = "r15"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index d987ba80..685b8c55 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
+SUMMARY = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
 PR = "r18"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
index 380cc0e3..5d2ff390 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Minimal initramfs for boot requirements"
 
 require recipes-core/packagegroups/packagegroup-core-boot.bb
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index 8690a874..9f5e189e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
+SUMMARY = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
 PR = "r44"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 0d39907a..f02f013b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install additional utilities/demos for SDKs"
+SUMMARY = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
 PR = "r80"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
index c20bed7a..9562310f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk-sdk-host.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install additional scripts and applications into the SDK"
+SUMMARY = "Task to install additional scripts and applications into the SDK"
 LICENSE = "MIT"
 PR = "r30"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
index 7f5e9c2e..edc30b15 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install wireless headers and libraries into the SDK"
+SUMMARY = "Task to install wireless headers and libraries into the SDK"
 LICENSE = "MIT"
 PR = "r9"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 7cf2b53b..648f32c4 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install wireless packages into the target FS"
+SUMMARY = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
 PR = "r42"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
index 74cbe90f..eccedc4b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install crypto dev packages in SDK"
+SUMMARY = "Task to install crypto dev packages in SDK"
 LICENSE = "MIT"
 PR = "r8"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
index 249ee9a3..a8c4e7f0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install crypto packages into target FS"
+SUMMARY = "Task to install crypto packages into target FS"
 LICENSE = "MIT"
 PR = "r13"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index f9fca526..afa18d75 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to install Gtk dev packages in SDK"
+SUMMARY = "Task to install Gtk dev packages in SDK"
 LICENSE = "MIT"
 PR = "r2"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index e0a90a31..2900a8eb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to add Gtk embedded related packages"
+SUMMARY = "Task to add Gtk embedded related packages"
 LICENSE = "MIT"
 PR = "r2"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
index 95939c09..9daaa06d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to build and install header and libs into sdk"
+SUMMARY = "Task to build and install header and libs into sdk"
 LICENSE = "MIT"
 PR = "r12"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
index 5b1b4964..d3a90595 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-toolchain-tisdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Task to build and install header and libs into the sdk"
+SUMMARY = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
 PR = "r14"
 
diff --git a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
index 76c83e7d..1fb83acd 100644
--- a/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
+++ b/meta-arago-distro/recipes-tisdk/tisdk-uenv/tisdk-uenv.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Package that will install a uEnv.txt file into the SDK prebuilt-binaries directory"
+SUMMARY = "Install a uEnv.txt file into the SDK prebuilt-binaries directory"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
index 50a00785..bf4cbc50 100644
--- a/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
+++ b/meta-arago-extras/recipes-connectivity/hostap/hostap-daemon-wl18xx.bb
@@ -1,5 +1,6 @@
-# This is a TI specific version of the hostap-daemon recipe for use with the
-# wl18xx wlan and bluetooth module.
+SUMMARY = "TI specfic version of the hostap-daemon recipe."
+DESCRIPTION = "This is a TI specific version of the hostap-daemon recipe \
+for use with the wl18xx wlan and bluetooth module."
 
 require hostap.inc
 
diff --git a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
index fff33f62..820f91cb 100644
--- a/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
+++ b/meta-arago-extras/recipes-connectivity/vtun/vtun_3.0.3.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Virtual Tunnels over TCP/IP networks"
 DESCRIPTION = "Virtual Tunnels over TCP/IP networks with traffic shaping, compression and encryption."
 HOMEPAGE = "http://vtun.sourceforge.net/"
 SECTION = "console/network"
diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index 0216e5db..a75f3b96 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "OProfile Example"
+SUMMARY = "OProfile Example"
 HOMEPAGE = "https://gitorious.org/oprofile-example"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://signal_parent.c;beginline=1;endline=37;md5=3c72149bb458105db5d2e6fbcb2da66e"
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index 78ffe567..88c022ee 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Target packages for the standalone SDK"
+SUMMARY = "Target packages for the standalone SDK"
 PR = "r13"
 LICENSE = "MIT"
 
diff --git a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
index d5e8872c..c09f0d05 100644
--- a/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
+++ b/meta-arago-extras/recipes-devtools/cmake/extra-cmake-modules.bb
@@ -1,4 +1,4 @@
-UMMARY = "Extra modules and scripts for CMake"
+SUMMARY = "Extra modules and scripts for CMake"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING-CMAKE-SCRIPTS;md5=54c7042be62e169199200bc6477f04d1"
 
diff --git a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
index 4ed3a0d5..1db031a8 100644
--- a/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
+++ b/meta-arago-extras/recipes-graphics/ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Test application for GC320 2D API"
+SUMMARY = "Test application for GC320 2D API"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://dra7x-sdk-ti-gc320-tests_manifest.html;md5=22a001855467f373c47f45de5330e3c9"
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index db48d746..953bba0e 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -1,6 +1,6 @@
 # This recipe installs an init script that can be used to invoke ts_calibrate
 # on systems that need this done during the boot sequence.
-DESCRIPTION = "TS calibration init script"
+SUMMARY = "TS calibration init script"
 RDEPENDS:${PN} += "tslib"
 
 LICENSE = "GPL-2.0-only"
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
index de8338f3..b4162a0f 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-ducati_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GStreamer elements to use the multimedia accelerators available on some TI parts"
+SUMMARY = "GStreamer plugins for multimedia accelerators available on some TI parts"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 
diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
index 6d1f720d..36864b7d 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GStreamer elements to use the Video Processing Engine (VPE) found on some TI devices"
+SUMMARY = "GStreamer plugins for Video Processing Engine (VPE) on some TI parts"
 
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
index f863348c..5642dbd2 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -1,3 +1,4 @@
+SUMMARY = "Tool to measure maximum TCP bandwidth and allow parameter tuning"
 DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
 HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
 SECTION = "console/network"
diff --git a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
index bb4e91b0..76346038 100644
--- a/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-test/recipes-benchmark/stream/stream_5.10.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Stream Benchmark"
+SUMMARY = "Stream Benchmark"
 HOMEPAGE = "http://www.cs.virginia.edu/stream/"
 LICENSE = "Stream_Benchmark_License"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=bca8cbe07976fe64c8946378d08314b0"
diff --git a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
index 4d4b1f60..df6a96d3 100644
--- a/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-test/recipes-bsp/switch-config/switch-config_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Ethernet Switch configuration management"
+SUMMARY = "Ethernet Switch configuration management"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658cbaba3110b81804af60de75"
 
diff --git a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
index da9b7eac..842332df 100644
--- a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
+++ b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the \
-Network Time Protocol."
+SUMMARY = "OpenNTPD is an implementation of the Network Time Protocol."
+DESCRIPTION = "OpenNTPD is a FREE, easy to use implementation of the Network Time Protocol."
 HOMEPAGE = "http://www.openntpd.org/"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause & ISC"
diff --git a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
index 12d0905d..bd5e04f3 100644
--- a/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
+++ b/meta-arago-test/recipes-devtools/cpuloadgen/cpuloadgen_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Utility to generate specified CPU Load"
+SUMMARY = "Utility to generate specified CPU Load"
 HOMEPAGE = "https://github.com/ptitiano/cpuloadgen"
 
 LICENSE = "BSD-3-Clause"
diff --git a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
index ea3d1df1..54c6b0fc 100644
--- a/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
+++ b/meta-arago-test/recipes-devtools/input-utils/input-utils_1.0.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Utilities for the Linux input drivers"
+SUMMARY = "Utilities for the Linux input drivers"
 HOMEPAGE = "http://packages.tanglu.org/source/aequorea/input-utils"
 
 LICENSE = "GPL-2.0-only"
-- 
2.17.1


