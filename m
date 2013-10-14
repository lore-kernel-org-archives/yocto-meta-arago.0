Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C44AA5299B
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:42:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJgomX019563
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:42:50 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJgogE023937
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:42:50 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 14 Oct 2013 14:42:49 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJgko9001453;
	Mon, 14 Oct 2013 14:42:48 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 14 Oct 2013 15:32:08 -0500
Message-ID: <1381782728-11639-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH] udev: fix touchscreen detection rule
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
X-List-Received-Date: Mon, 14 Oct 2013 19:42:51 -0000
Content-Type: text/plain

* Fix the rule to detect the touchscreen and create the
  /dev/input/touchscreen0 device node.
* This has already been submitted upstream and can be removed
  when meta-arago switches to Dora
* The patch has already been submitted to oe-core at:
    http://article.gmane.org/gmane.comp.handhelds.openembedded.core/43958

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/udev/udev/local.rules             |   23 ++++++++++++++++++++
 .../recipes-core/udev/udev_182.bbappend            |    8 +++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/local.rules
 create mode 100644 meta-arago-distro/recipes-core/udev/udev_182.bbappend

diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/udev/local.rules
new file mode 100644
index 0000000..d0cbf91
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/local.rules
@@ -0,0 +1,23 @@
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
+# Trigger based on input type, that the evbit (-e) has EV_SYN and EV_ABS,
+# has an EV_ABS value (-a) which is used for touchscreen type devices.
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*", SYMLINK+="input/touchscreen0"
+
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
new file mode 100644
index 0000000..27bf4da
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -0,0 +1,8 @@
+# This fixes an issue with touchscreens not being detected with the default
+# local.rules.  This can be removed when this change is picked up and
+# meta-arago switches to Dora
+
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
-- 
1.7.0.4


