Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id DA5C6529EF
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 05:01:29 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7B00IFU1YHA090@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 May 2016 00:01:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=tFufItSYxAUvd9BczkcA:9
	a=74t91kaTrlQt6Mav:21 a=vcU7XVlOS-NqqPy-:21
Received: by 100.15.86.14 with SMTP id 380292e8; Tue, 17 May 2016 05:01:29 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id DF765162005;	Tue,
	17 May 2016 01:01:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 May 2016 01:01:27 -0400
Message-id: <1463461288-32423-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [RFC][PATCH 1/2] systemd: port our own custom rules from old udev
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
X-List-Received-Date: Tue, 17 May 2016 05:01:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/systemd/systemd/local.rules       | 26 ++++++++++++++++++++++
 .../recipes-core/systemd/systemd/usb1-rules.sh     |  3 +++
 .../recipes-core/systemd/systemd/usb2-rules.sh     |  3 +++
 .../recipes-core/systemd/systemd_%.bbappend        | 17 +++++++++++---
 4 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/systemd/systemd/local.rules
 create mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
 create mode 100755 meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh

diff --git a/meta-arago-distro/recipes-core/systemd/systemd/local.rules b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
new file mode 100644
index 0000000..689e093
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/local.rules
@@ -0,0 +1,26 @@
+# There are a number of modifiers that are allowed to be used in some
+# of the different fields. They provide the following subsitutions:
+#
+# %n the "kernel number" of the device.
+#    For example, 'sda3' has a "kernel number" of '3'
+# %e the smallest number for that name which does not matches an existing node
+# %k the kernel name for the device
+# %M the kernel major number for the device
+# %m the kernel minor number for the device
+# %b the bus id for the device
+# %c the string returned by the PROGRAM
+# %s{filename} the content of a sysfs attribute
+# %% the '%' char itself
+#
+
+# Try and modprobe for drivers for new hardware
+ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe $env{MODALIAS}"
+
+# Create a symlink to any touchscreen input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ENV{ID_INPUT_TOUCHSCREEN}=="1", SYMLINK+="input/touchscreen0"
+
+# Auto-mount any SD cards
+ACTION=="add", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
+ACTION=="remove", KERNEL=="mmcblk[0-9]p[0-9]", SUBSYSTEM=="block", RUN+="/etc/udev/scripts/mount.sh"
+ACTION=="add", DEVPATH=="/devices/44000000\.ocp/48880000\.omap_dwc3_1/48890000\.usb/udc*", RUN+="/usr/bin/usb1-rules.sh"
+ACTION=="add", DEVPATH=="/devices/44000000\.ocp/488c0000\.omap_dwc3_2/488d0000\.usb/udc*", RUN+="/usr/bin/usb2-rules.sh"
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
new file mode 100755
index 0000000..51dfd71
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/usb1-rules.sh
@@ -0,0 +1,3 @@
+#!bin/sh
+/sbin/modprobe g_ncm -r
+/sbin/modprobe g_ncm
diff --git a/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
new file mode 100755
index 0000000..f00565e
--- /dev/null
+++ b/meta-arago-distro/recipes-core/systemd/systemd/usb2-rules.sh
@@ -0,0 +1,3 @@
+#!bin/sh
+/sbin/modprobe g_zero -r
+/sbin/modprobe g_zero
diff --git a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
index 5556eea..3fbe57e 100644
--- a/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
+++ b/meta-arago-distro/recipes-core/systemd/systemd_%.bbappend
@@ -1,6 +1,17 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI_append = " \
+                  file://local.rules \
+                  file://usb1-rules.sh \
+                  file://usb2-rules.sh"
 
 do_install_append() {
-    install -d ${D}/${base_libdir}
-    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
+    install -d ${D}${sysconfdir}/udev/rules.d/
+    install -m 0644 ${WORKDIR}/local.rules ${D}${sysconfdir}/udev/rules.d/
+
+    install -d ${D}${bindir}
+    install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
+    install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
 }
-- 
2.2.0


