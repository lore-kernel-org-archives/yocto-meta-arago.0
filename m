Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id 0AD3152AB6
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:14 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc20so4008107obb.22
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=YTNCT/XHrU5GwOS/uKoWDzA4NfSkYQN8MCmo0rUdoNk=;
	b=gfB5L2OjlKxGcMNYYDScxp9eRLHjXiBxnwmPiXEovmUkQWm5swIBXvov8QfgGNi1aM
	x699L/M8/c0H8nJWdCEVnqgTdtEgDIvglPGew+tDA6yj9Ubh/vSPahIukn4HRy1Axwaq
	9Ath2gpslkH88cSH2szPOqG1ney0CtYn2BxdFc01LypX8LY9fk4bS0Ke58/KI309YBLZ
	+oC134dlaBAC75SeEANk5CWTtp7A7acxRO5BxisVl0PBoE0olfykStXzdls0dHzV31MJ
	D+Uaa2bPRc8Hwnc0Vp9ELqigHSUv549Q5CLc55XyhWcu1qw4QFl9X5/VwZyAzQEHAHD5
	bCmg==
X-Received: by 10.60.12.103 with SMTP id x7mr6055919oeb.56.1358632334327;
	Sat, 19 Jan 2013 13:52:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.12
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:13 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:32 -0600
Message-Id: <1358632316-12266-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/31] bt-enable: Add bt-enable recipe
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:15 -0000

* Port bt-enable recipe from arago.
* Bt-enable is used to enable the BT module on the TI wl12xx
  Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...kefile-Update-makefile-to-work-well-in-OE.patch |   78 ++++++++++++++++++++
 .../recipes-bsp/bt-enable/bt-enable_1.0.bb         |   32 ++++++++
 2 files changed, 110 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
 create mode 100644 meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb

diff --git a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
new file mode 100644
index 0000000..7e6756c
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable/0001-Makefile-Update-makefile-to-work-well-in-OE.patch
@@ -0,0 +1,78 @@
+From a400ac3d83023a66a356d056899d6b380cb30473 Mon Sep 17 00:00:00 2001
+From: Chase Maupin <Chase.Maupin@ti.com>
+Date: Wed, 7 Mar 2012 10:51:43 -0600
+Subject: [PATCH] Makefile: Update makefile to work with OE
+
+* Updated the makefile to with OE
+* Use the kernel install target for installing the module
+
+Upstream-Status: Pending
+    * will be in next release
+
+Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
+---
+ Makefile |   45 ++++++++++++++++++++++++++++++++++++++++-----
+ 1 files changed, 40 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index ebbcd11..b17d33e 100755
+--- a/Makefile
++++ b/Makefile
+@@ -7,15 +7,50 @@ else
+   EXTRA_CFLAGS += -O2
+ endif
+
++-include ../../../Rules.make
++
++# If KERNEL_DIR is not set then use the default in Rules.make
++KERNEL_DIR ?= ${LINUXKERNEL_INSTALL_DIR}
++DEST_DIR ?= ${DESTDIR}
++
++PLATFORM ?= "unknown"
++MACHINE_NAME ?= "unknown"
++
++# Use the PLATFORM value from the Rules.make if it was sourced
++ifeq ($(PLATFORM), am335x-evm)
++    MACHINE_NAME := "am335x"
++endif
++ifeq ($(PLATFORM), am180x-evm)
++    MACHINE_NAME := "am1808"
++endif
++ifeq ($(PLATFORM), da850-omapl138-evm)
++    MACHINE_NAME := "am1808"
++endif
++ifeq ($(PLATFORM), am37x-evm)
++    MACHINE_NAME := "omap3evm"
++endif
++
++# If CROSS_COMPILE is not set by Rules.make then set a sane default
++CROSS_COMPILE ?= arm-arago-linux-gnueabi-
++export CROSS_COMPILE
++
++# set the INSTALL_MOD_DIR so that the executables won't be placed in extra
++INSTALL_MOD_DIR = kernel/drivers/bt_enable
++export INSTALL_MOD_DIR
++
+ obj-m := gpio_en.o
+
++MAKE_ENV = ARCH=arm
++
+ PWD := $(shell pwd)
+ all:
+-	pwd
+-	@echo EXTRA_CFLAGS = $(EXTRA_CFLAGS)
+-	$(MAKE) CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) M=$(PWD) modules
++	@cp -f gpio_en_${MACHINE_NAME}.c gpio_en.c
++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=$(PWD) modules
++
+ install:
+-	install -d ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
+-	install -m 0755 ./gpio_en.ko ${DEST_DIR}${BASE_LIB_DIR}/modules/${KRNL_VER}/kernel/drivers/bt_enable
++	$(MAKE) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" -C $(KERNEL_DIR) $(MAKE_ENV) \
++    M=$(PWD) INSTALL_MOD_PATH="${DEST_DIR}" modules_install
++
+ clean:
+	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions *.symvers
+--
+1.7.0.4
diff --git a/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb
new file mode 100644
index 0000000..4689f41
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/bt-enable/bt-enable_1.0.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "BT GPIO Enable"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://gpio_en_am1808.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+                    file://gpio_en_am335x.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+                    file://gpio_en_omap3evm.c;beginline=1;endline=34;md5=fe94639d8f61c867d1bc4bf61473d3cd \
+"
+COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
+
+PR = "${MACHINE_KERNEL_PR}"
+PR_append = "a+gitr${SRCREV}"
+
+SRCREV = "97c4600ff7d39f1cc6079939248cd9ed15100db4"
+
+SRC_URI = "git://github.com/TI-ECS/bt_enable.git;protocol=git \
+           file://0001-Makefile-Update-makefile-to-work-well-in-OE.patch \
+"
+
+S = "${WORKDIR}/git"
+
+inherit module
+
+INHIBIT_PACKAGE_STRIP = "1"
+
+PLATFORM_ti33x = "am335x-evm"
+PLATFORM_omap3 = "am37x-evm"
+PLATFORM_omapl138 = "am180x-evm"
+
+EXTRA_OEMAKE += "KERNEL_DIR=${STAGING_KERNEL_DIR} PLATFORM=${PLATFORM}"
+
+do_install () {
+    oe_runmake 'DEST_DIR=${D}' install
+}
-- 
1.7.0.4


