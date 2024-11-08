Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0616D5C0EF
	for <webhook@archiver.kernel.org>; Fri,  8 Nov 2024 15:44:05 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.15617.1731080638596485981
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 08 Nov 2024 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=waYij37z;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8Fhv0p2095935
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Nov 2024 09:43:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731080637;
	bh=KMhWxEliWwl5ShgbjPQ58xAPNp3JpBHeKMxABVf4drw=;
	h=From:To:Subject:Date;
	b=waYij37zHHb10muJbzCCM3P1YzNLy7ZFBK2cWM1icNm3pb2ZRZwJ4ry9hij2UqWMA
	 kyBpBbXaIqPeU02QEXllyq50auJKEOSujtimMRIK2Wo7s4PAD7fFo55OrFBLsVF6L1
	 1uI9IFDS/0YeUE+tccNfCSLaTDNec28uadx+iXi4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A8Fhvkm029337
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 8 Nov 2024 09:43:57 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 8
 Nov 2024 09:43:57 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 8 Nov 2024 09:43:57 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A8FhvRr112923;
	Fri, 8 Nov 2024 09:43:57 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t9R9Q-0003YS-TA; Fri, 08 Nov 2024 09:43:56 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Add a v3 config for master (and future) branches
Date: Fri, 8 Nov 2024 09:43:56 -0600
Message-ID: <20241108154356.13625-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 08 Nov 2024 15:44:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15602

The master branch of oe-core just removed "debug-tweaks" and requires
that you set the individual flags directly.  So create a v3 version of
the local.conf file and document the new change.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-master-chromium-config.txt      |  3 +-
 configs/arago-master-config.txt               |  3 +-
 configs/arago-master-next-config.txt          |  4 ++-
 configs/arago-master-wip-config.txt           |  3 +-
 configs/distroless-master-config.txt          |  4 ++-
 configs/poky-master-config.txt                |  2 +-
 configs/poky-master-wip-config.txt            |  2 +-
 ...nf.sample => local-arago64-v3.conf.sample} | 32 ++++++++++---------
 ....conf.sample => local-poky-v3.conf.sample} | 18 ++++++-----
 ...al-v2.conf.sample => local-v3.conf.sample} | 18 ++++++-----
 10 files changed, 51 insertions(+), 38 deletions(-)
 copy sample-files/{local-arago64-v2.conf.sample => local-arago64-v3.conf.sample} (84%)
 copy sample-files/{local-poky-v2.conf.sample => local-poky-v3.conf.sample} (92%)
 copy sample-files/{local-v2.conf.sample => local-v3.conf.sample} (92%)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index 1ff5fed..189d6aa 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -11,6 +11,7 @@ meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:m
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index b06d51c..95d4ede 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -11,6 +11,7 @@ meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:m
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 667478d..aecddcd 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -19,7 +19,9 @@ meta-ti,https://git.yoctoproject.org/meta-ti,master-next,HEAD,layers=meta-ti-ext
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
+
 LOCALCONF:OVERRIDES:append = ":recipe-${@os.path.basename(d.getVar('FILE'))}"
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index a96e127..0c4a031 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -11,6 +11,7 @@ meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extr
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index b938035..01e4553 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,9 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index ae003b4..307d79d 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -10,5 +10,5 @@ oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras:meta-arago-test
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-poky-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
index 8781dd3..6602ce8 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -10,5 +10,5 @@ oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras:meta-arago-test
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
+OECORELOCALCONF=./sample-files/local-poky-v3.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/sample-files/local-arago64-v2.conf.sample b/sample-files/local-arago64-v3.conf.sample
similarity index 84%
copy from sample-files/local-arago64-v2.conf.sample
copy to sample-files/local-arago64-v3.conf.sample
index 76419a0..b067597 100644
--- a/sample-files/local-arago64-v2.conf.sample
+++ b/sample-files/local-arago64-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${OEBASE}/downloads"
+DL_DIR = "${TOPDIR}/downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${OEBASE}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${OEBASE}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
 
 #
 # Shared-state files from other locations
@@ -59,7 +59,7 @@ TMPDIR = "${TOPDIR}/arago-tmp"
 # You need to select a specific machine to target the build with. There are a selection
 # of emulated machines available which can boot and run in the QEMU emulator:
 #
-MACHINE ?= "arago"
+#MACHINE ?= "arago"
 
 #
 # Package Management configuration
@@ -90,20 +90,22 @@ SDKMACHINE ?= "x86_64"
 # The EXTRA_IMAGE_FEATURES variable allows extra packages to be added to the generated 
 # images. Some of these options are added to certain image types automatically. The
 # variable can contain the following options:
-#  "dbg-pkgs"       - add -dbg packages for all installed packages
-#                     (adds symbol information for debugging/profiling)
-#  "dev-pkgs"       - add -dev packages for all installed packages
-#                     (useful if you want to develop against libs in the image)
-#  "tools-sdk"      - add development tools (gcc, make, pkgconfig etc.)
-#  "tools-debug"    - add debugging tools (gdb, strace)
-#  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
-#  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "dbg-pkgs"             - add -dbg packages for all installed packages
+#                           (adds symbol information for debugging/profiling)
+#  "dev-pkgs"             - add -dev packages for all installed packages
+#                           (useful if you want to develop against libs in the image)
+#  "tools-sdk"            - add development tools (gcc, make, pkgconfig etc.)
+#  "tools-debug"          - add debugging tools (gdb, strace)
+#  "tools-profile"        - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
+#  "tools-testapps"       - add useful testing tools (ts_print, aplay, arecord etc.)
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v3.conf.sample
similarity index 92%
copy from sample-files/local-poky-v2.conf.sample
copy to sample-files/local-poky-v3.conf.sample
index 4cb1bbd..443a004 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${OEBASE}/downloads"
+DL_DIR = "${TOPDIR}/downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${OEBASE}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${OEBASE}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
 
 #
 # Shared-state files from other locations
@@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/poky-tmp"
+TMPDIR = "${TOPDIR}/build/poky-tmp"
 
 #
 # Machine Selection
@@ -56,7 +56,7 @@ TMPDIR = "${OEBASE}/build/poky-tmp"
 # You need to select a specific machine to target the build with. There are a selection
 # of emulated machines available which can boot and run in the QEMU emulator:
 #
-MACHINE ?= "arago"
+#MACHINE ?= "arago"
 
 #
 # Package Management configuration
@@ -95,12 +95,14 @@ SDKMACHINE ?= "x86_64"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
diff --git a/sample-files/local-v2.conf.sample b/sample-files/local-v3.conf.sample
similarity index 92%
copy from sample-files/local-v2.conf.sample
copy to sample-files/local-v3.conf.sample
index 67c4a46..bad99cd 100644
--- a/sample-files/local-v2.conf.sample
+++ b/sample-files/local-v3.conf.sample
@@ -10,7 +10,7 @@ CONF_VERSION = "2"
 # wiping and rebuilding you can preserve this directory to speed up this part
 # of subsequent builds. This directory is safe to share between multiple builds
 # on the same machine too.
-DL_DIR = "${OEBASE}/downloads"
+DL_DIR = "${TOPDIR}/downloads"
 
 #
 # Where to place shared-state files
@@ -23,7 +23,7 @@ DL_DIR = "${OEBASE}/downloads"
 # regenerate from these files if no changes were made to the configuration.
 # If changes were made to the configuration, only shared state files where the
 # state was still valid would be used (done using checksums).
-SSTATE_DIR = "${OEBASE}/build/sstate-cache"
+SSTATE_DIR = "${TOPDIR}/build/sstate-cache"
 
 #
 # Shared-state files from other locations
@@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/arago-tmp"
+TMPDIR = "${TOPDIR}/build/arago-tmp"
 
 #
 # Machine Selection
@@ -56,7 +56,7 @@ TMPDIR = "${OEBASE}/build/arago-tmp"
 # You need to select a specific machine to target the build with. There are a selection
 # of emulated machines available which can boot and run in the QEMU emulator:
 #
-MACHINE ?= "arago"
+#MACHINE ?= "arago"
 
 #
 # Package Management configuration
@@ -95,12 +95,14 @@ SDKMACHINE ?= "i686"
 #  "tools-debug"    - add debugging tools (gdb, strace)
 #  "tools-profile"  - add profiling tools (oprofile, exmap, lttng valgrind (x86 only))
 #  "tools-testapps" - add useful testing tools (ts_print, aplay, arecord etc.)
-#  "debug-tweaks"   - make an image suitable for development
-#                     e.g. ssh root access has a blank password
+#  "empty-root-password"  - the root user has no password set
+#  "allow-empty-password" - users can have an empty password
+#  "allow-root-login"     - the root user can login
+#  "post-install-logging" - log the output of postinstall scriptlets
 # There are other application targets that can be used here too, see
 # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
-# We default to enabling the debugging tweaks.
-EXTRA_IMAGE_FEATURES = "debug-tweaks"
+# We default to enabling the empty root login settings for debugging/testing.
+EXTRA_IMAGE_FEATURES = "empty-root-password allow-empty-password allow-root-login post-install-logging"
 
 #
 # Additional image features
-- 
2.17.1


