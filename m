Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 3B7195296D
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:33:49 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6205625oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:33:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Vn8TbWGqq7wBsXU29yy0e9385RzsZSo+RiUeoDZUS5E=;
	b=N1xXFpSI5oTvQvx16SUtjPlc81SPKjDrpEIxdGnCb871E9apFKj4O5YO1TVJskSoiq
	SQSzhnwJ01zKGB/hhb2++8XL0R5m/q8KcZnRHAN1cp5kPu1gS689RQ4xV76s0iSCfLAx
	oVlZeriyYXLBq6YsrwzHVNPdjf6gSC7jRFS9PXXqJo4yv7KhL8nI+RBdRTq0OOESO16d
	tqlHZ75SWI26wUaHEa1YJgDRuep1sFqIOnsjUGJu2nGC6KDkn6gf8uaOHpq6MUWaWGtV
	h8I79g59tzaKbnNoo2B4fROR5+Dj2fFv1cvp4qEmxSvNa5oVEOfQFWgwzbfT0UChsJtE
	TXMw==
Received: by 10.60.32.136 with SMTP id j8mr236887oei.21.1352759628955;
	Mon, 12 Nov 2012 14:33:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k9sm6403851oeg.6.2012.11.12.14.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:33:48 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:33:44 -0600
Message-Id: <1352759624-5227-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] linux-am335x_3.2.0-psp05.06.00.00: Disable CONFIG_LOCALVERSION_AUTO option
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
X-List-Received-Date: Mon, 12 Nov 2012 22:33:49 -0000

* When a library or application hosted on git is being compiled the .git
  directory still exist. This wasn't the case for oe-classic which did
  not include the .git directory.
* With the git repository still intact having patches applied to the sources
  causes the workdir to become dirty.
* This results in the kernel name including a -dirty tag when the kernel is
  built inside of a dirty working directory.
* Disabling CONFIG_LOCATIONVERSION_AUTO removes the entire -dirty tag that is
  added to the kernel name.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-linux-am335x-Remove-dirty-tag.patch       |   32 ++++++++++++++++++++
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    5 ++-
 2 files changed, 36 insertions(+), 1 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch
new file mode 100644
index 0000000..e9930c9
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch
@@ -0,0 +1,32 @@
+From 293d87edf88049be3f93649626d6d127a59cc71b Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Mon, 5 Nov 2012 07:28:17 -0600
+Subject: [PATCH] linux-am335x: Remove dirty tag
+
+* Disable LOCALVERSION_AUTO. This will prevent -dirty tag from being
+  added to the kernel version. This tag affects the name of the kernel
+  modules directory.
+* This dirty tag is also added if the kernel's git repository has
+  uncommitted changes.
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ arch/arm/configs/am335x_evm_defconfig |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
+index f1471bc..e78b271 100644
+--- a/arch/arm/configs/am335x_evm_defconfig
++++ b/arch/arm/configs/am335x_evm_defconfig
+@@ -37,7 +37,7 @@ CONFIG_BROKEN_ON_SMP=y
+ CONFIG_INIT_ENV_ARG_LIMIT=32
+ CONFIG_CROSS_COMPILE=""
+ CONFIG_LOCALVERSION=""
+-CONFIG_LOCALVERSION_AUTO=y
++# CONFIG_LOCALVERSION_AUTO is not set
+ CONFIG_HAVE_KERNEL_GZIP=y
+ CONFIG_HAVE_KERNEL_LZMA=y
+ CONFIG_HAVE_KERNEL_LZO=y
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index 8248d2d..711103b 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -82,6 +82,9 @@ PATCHES += "file://0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
 # Add patch to enable pullup on WLAN enable
 PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 
+# Add patch to remove dirty tag to kernel local version
+PATCHES += "file://0001-linux-am335x-Remove-dirty-tag.patch"
+
 # Copy the am33x-cm3 firmware if it is available
 do_compile_prepend() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
-- 
1.7.0.4


