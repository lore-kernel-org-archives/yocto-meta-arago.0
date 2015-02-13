Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id D8A155299E
	for <meta-arago@arago-project.org>;
	Fri, 13 Feb 2015 10:30:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1DAUgCr029486
	for <meta-arago@arago-project.org>; Fri, 13 Feb 2015 04:30:42 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1DAUfBw029811
	for <meta-arago@arago-project.org>; Fri, 13 Feb 2015 04:30:41 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Feb 2015 04:30:41 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1DAUdGv010954;
	Fri, 13 Feb 2015 04:30:40 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Feb 2015 16:00:36 +0530
Message-ID: <1423823436-21007-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [RFC PATCH - USB DRD] udev: Add rules for DRD usecase
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
X-List-Received-Date: Fri, 13 Feb 2015 10:30:45 -0000
Content-Type: text/plain

For the DRD usecase when switching from host to device mode
some commands have to be executed manually. These script
additions facilatate this to happen automatically.

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |    2 ++
 .../recipes-core/udev/udev/usb1-rules.sh           |    4 ++++
 .../recipes-core/udev/udev/usb2-rules.sh           |    4 ++++
 .../recipes-core/udev/udev_182.bbappend            |   14 +++++++++++++-
 4 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100755 meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
 create mode 100755 meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh

diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/udev/local.rules
index 45c3a46..689e093 100644
--- a/meta-arago-distro/recipes-core/udev/udev/local.rules
+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
@@ -22,3 +22,5 @@ SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLI
 # Auto-mount any SD cards
 ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
 ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
+ACTION=="add", DEVPATH=="/devices/44000000\.ocp/48880000\.omap_dwc3_1/48890000\.usb/udc*", RUN+="/usr/bin/usb1-rules.sh"
+ACTION=="add", DEVPATH=="/devices/44000000\.ocp/488c0000\.omap_dwc3_2/488d0000\.usb/udc*", RUN+="/usr/bin/usb2-rules.sh"
diff --git a/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh b/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
new file mode 100755
index 0000000..8a49cf1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
@@ -0,0 +1,4 @@
+#!bin/sh
+/sbin/modprobe g_ncm -r
+/sbin/modprobe g_ncm
+
diff --git a/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh b/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
new file mode 100755
index 0000000..38a8894
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
@@ -0,0 +1,4 @@
+#!bin/sh
+/sbin/modprobe g_zero -r
+/sbin/modprobe g_zero
+
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
index 838cce8..684f501 100644
--- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -5,4 +5,16 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
+
+SRC_URI_append = " \
+                  file://usb1-rules.sh \
+                  file://usb2-rules.sh"
+
+do_install_append() {
+    install -d ${D}/${bindir}
+
+    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
+    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
+}
+
-- 
1.7.9.5


