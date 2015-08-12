Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 832585299C
	for <meta-arago@arago-project.org>;
	Wed, 12 Aug 2015 11:13:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7CBDcHR024242
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 06:13:38 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CBDc3l025236
	for <meta-arago@arago-project.org>; Wed, 12 Aug 2015 06:13:38 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 12 Aug 2015 06:13:38 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7CBDc2x031510;
	Wed, 12 Aug 2015 06:13:38 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPTyT-0003si-KA; Wed, 12 Aug 2015 07:13:37 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Aug 2015 07:13:35 -0400
Message-ID: <1439378015-14715-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston-init: UX enhancements.
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
X-List-Received-Date: Wed, 12 Aug 2015 11:13:40 -0000
Content-Type: text/plain

* Add weston wrapper script to
  - switch vt and display status message to hide console output
  - create log for weston.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend  | 11 +++++-
 .../recipes-graphics/wayland/weston-init/init      |  4 +--
 .../recipes-graphics/wayland/weston-init/runWeston | 39 ++++++++++++++++++++++
 3 files changed, 51 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 7825618..d9e15b6 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,3 +1,12 @@
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " \
+    file://runWeston \
+"
+
+do_install_append() {
+    install -d ${D}${bindir}
+    install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
+}
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index b2a2567..b2648f9 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -40,7 +40,7 @@ case "$1" in
             chmod 0700 $XDG_RUNTIME_DIR
         fi
 
-        openvt -s weston
+        openvt -c 4 -f runWeston
 
         # If there's no touchscreen device available, done
         if [ ! -e /dev/input/touchscreen0 ] ; then
@@ -83,7 +83,7 @@ case "$1" in
         udevadm trigger
         killproc weston
         sleep 1
-        openvt -s weston
+        openvt -c 4 -f runWeston
   ;;
 
   stop)
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
new file mode 100644
index 0000000..6ef574a
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -0,0 +1,39 @@
+#!/bin/bash
+
+clear
+cat << EOF
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+                                        Please wait...
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+
+EOF
+
+weston --idle-time=0 >> /var/log/weston.log 2>&1
-- 
1.9.1


