Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 92CBB52A65
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 19:25:23 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so887943obb.38
	for <meta-arago@arago-project.org>;
	Wed, 10 Oct 2012 12:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=RtS6IP987enHpDXUyFu+67XB1ktkXr0KuauuFb7yDWc=;
	b=QL6Zcv2yLr4JZeVBhmhE/5rkm7aSpZoJkvhBrvnxSBiuOaNg6Bi5vpzbkOWMn3Zxp/
	cQ+Vi8qMNO8lcgV5tvAR1stxV8oY8ONqQ/uz+rLwnl55CFRMyyithgY49wx1pGMnkngP
	7coKcp/Ob14EVdHiEvSr5SzOyskClAx3Br/hAxAoafaJlguNw1e+OD+tzS/AAQV3jGVD
	/VxoNDWot25YT2Ir1OTZldubqy2GSpeIt5ykUoT2/M9QsIK5IM7EOG6iUb8EweFX39cH
	Udm0laJiXih8ZBTN7LAkrMihwbSE8W0pmEePcjlyY54nHsYRhtmZISeSzTwVZlSKLoPH
	zFdg==
Received: by 10.182.48.69 with SMTP id j5mr5636830obn.17.1349897123142;
	Wed, 10 Oct 2012 12:25:23 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a6sm1513526oeh.1.2012.10.10.12.25.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 12:25:22 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 10 Oct 2012 14:55:49 -0500
Message-Id: <1349898949-413-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] linux: Add copy-defconfig and setup-defconfig include files
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
X-List-Received-Date: Wed, 10 Oct 2012 19:25:23 -0000

* Port copy-defconfig and setup-defconfig from Arago.
* These include files are used in a variety of kernel recipes in the Arago SDK.
* copy-defconfig copies the config file used by the SDK build to the kernel
  sources to be packaged into the sourceipk.
* setup-defconfig.inc determines which kernel configuration file to use.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-kernel/linux/copy-defconfig.inc        |   11 ++++++++
 .../recipes-kernel/linux/setup-defconfig.inc       |   26 ++++++++++++++++++++
 2 files changed, 37 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc

diff --git a/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
new file mode 100644
index 0000000..10be10c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/copy-defconfig.inc
@@ -0,0 +1,11 @@
+CONFIG_NAME ?= "tisdk_${MACHINE}_defconfig"
+
+# Copy the configuration file used during the SDK build in Arago to
+# the kernel sources to be packaged into the sourceipk.  Then call
+# the function to build the sourceipk again.  This is done as a
+# do_compile_prepend so that we can pick up any changes to the
+# defconfig thay may have been done by the sanitizer code.
+do_compile_prepend() {
+    cp ${S}/.config ${S}/arch/arm/configs/${CONFIG_NAME}
+    sourceipk_do_create_srcipk
+}
diff --git a/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc b/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc
new file mode 100644
index 0000000..fc5e18e
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/setup-defconfig.inc
@@ -0,0 +1,26 @@
+# Check the defconfig file and see if it points to an in kernel
+# defconfig that should be used, or if it is a complete config file
+
+addtask setup_defconfig before do_configure after do_patch
+do_setup_defconfig() {
+    # Always copy the defconfig file to .config to keep consistency
+    # between the case where there is a real config and the in kernel
+    # tree config
+    cp ${WORKDIR}/defconfig ${S}/.config
+}
+
+# define our own do_configure that will:
+#   1. Check the .config file and see if string use-kernel-config= is present
+#   2. If the use-kernel-config string is present parse out the config to use
+#      and run make ${config}
+#   3. else run yes '' | oe_runmake oldconfig like the default do_configure
+#      does
+do_configure() {
+    config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
+    if [ "x${config}" != "x" ]
+    then
+        oe_runmake ${config}
+    else
+        yes '' | oe_runmake oldconfig
+    fi
+}
-- 
1.7.0.4


