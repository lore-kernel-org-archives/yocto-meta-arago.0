Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 88C7C529A5
	for <meta-arago@arago-project.org>;
	Fri,  3 Apr 2020 19:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A657740BAC;
	Fri,  3 Apr 2020 19:53:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id w48tAwdBo2LK; Fri,  3 Apr 2020 19:53:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 395D5400E8;
	Fri,  3 Apr 2020 19:53:35 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 587FC1718E9;
	Fri,  3 Apr 2020 15:53:35 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  3 Apr 2020 15:53:34 -0400
Message-Id: <1585943614-35729-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] machine_features_check: functionality has been upstreamed into features_check.bbclass
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Apr 2020 19:55:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-apps/voxelsdk/voxelsdk_%.bbappend      |  2 +-
 .../packagegroup-arago-tisdk-graphics-sdk-host.bb  |  2 +-
 ...packagegroup-arago-tisdk-graphics-sdk-target.bb |  2 +-
 .../packagegroup-arago-tisdk-graphics.bb           |  2 +-
 .../packagegroup-arago-tisdk-gtk-sdk-target.bb     |  2 +-
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb  |  2 +-
 .../recipes-support/armnn/armnn_%.bbappend         |  2 +-
 .../classes/machine_features_check.bbclass         | 31 ----------------------
 .../recipes-apps/barcode-demo/barcode-roi_git.bb   |  2 +-
 9 files changed, 8 insertions(+), 39 deletions(-)
 delete mode 100644 meta-arago-extras/classes/machine_features_check.bbclass

diff --git a/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend b/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
index bc885a4..249ddb7 100644
--- a/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
+++ b/meta-arago-distro/recipes-apps/voxelsdk/voxelsdk_%.bbappend
@@ -1,3 +1,3 @@
-inherit machine_features_check
+inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
index 675c756..6ae773d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bb
@@ -4,7 +4,7 @@ PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup machine_features_check
+inherit packagegroup features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
index 96a5bd9..0a2b8f6 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bb
@@ -4,7 +4,7 @@ PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup machine_features_check
+inherit packagegroup features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 131ec71..65b921c 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -4,7 +4,7 @@ PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup machine_features_check
+inherit packagegroup features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
index d1783d1..f45d642 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk-sdk-target.bb
@@ -4,7 +4,7 @@ PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup machine_features_check
+inherit packagegroup features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
index 4baba84..0d281c9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
@@ -4,7 +4,7 @@ PR = "r2"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit packagegroup machine_features_check
+inherit packagegroup features_check
 
 REQUIRED_MACHINE_FEATURES = "gpu"
 
diff --git a/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend b/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
index bc885a4..249ddb7 100644
--- a/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
+++ b/meta-arago-distro/recipes-support/armnn/armnn_%.bbappend
@@ -1,3 +1,3 @@
-inherit machine_features_check
+inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
diff --git a/meta-arago-extras/classes/machine_features_check.bbclass b/meta-arago-extras/classes/machine_features_check.bbclass
deleted file mode 100644
index da9ee61..0000000
--- a/meta-arago-extras/classes/machine_features_check.bbclass
+++ /dev/null
@@ -1,31 +0,0 @@
-# Allow checking of required and conflicting MACHINE_FEATURES
-#
-# ANY_OF_MACHINE_FEATURES:   ensure at least one item on this list is included
-#                           in MACHINE_FEATURES.
-# REQUIRED_MACHINE_FEATURES: ensure every item on this list is included
-#                           in MACHINE_FEATURES.
-# CONFLICT_MACHINE_FEATURES: ensure no item in this list is included in
-#                           MACHINE_FEATURES.
-# Derived from OE-Core distro_features_check.bbclass
-
-python () {
-    # Assume at least one var is set.
-    machine_features = set((d.getVar('MACHINE_FEATURES') or '').split())
-
-    any_of_machine_features = set((d.getVar('ANY_OF_MACHINE_FEATURES') or '').split())
-    if any_of_machine_features:
-        if set.isdisjoint(any_of_machine_features, machine_features):
-            raise bb.parse.SkipRecipe("one of '%s' needs to be in MACHINE_FEATURES" % ' '.join(any_of_machine_features))
-
-    required_machine_features = set((d.getVar('REQUIRED_MACHINE_FEATURES') or '').split())
-    if required_machine_features:
-        missing = set.difference(required_machine_features, machine_features)
-        if missing:
-            raise bb.parse.SkipRecipe("missing required machine feature%s '%s' (not in MACHINE_FEATURES)" % ('s' if len(missing) > 1 else '', ' '.join(missing)))
-
-    conflict_machine_features = set((d.getVar('CONFLICT_MACHINE_FEATURES') or '').split())
-    if conflict_machine_features:
-        conflicts = set.intersection(conflict_machine_features, machine_features)
-        if conflicts:
-            raise bb.parse.SkipRecipe("conflicting machine feature%s '%s' (in MACHINE_FEATURES)" % ('s' if len(conflicts) > 1 else '', ' '.join(conflicts)))
-}
diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
index 051b83d..69e06f3 100644
--- a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Barcode demo to detect region of interest"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://detect_barcode.cpp;beginline=1;endline=25;md5=babab64d39715b3671dd16bcb4f4917b"
 
-inherit machine_features_check
+inherit features_check
 
 REQUIRED_MACHINE_FEATURES = "dsp"
 
-- 
2.7.4


