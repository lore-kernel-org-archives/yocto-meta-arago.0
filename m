Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id 9955352A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:51 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so2186627oag.25
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=o9T9B4JKJjHUXWzkhX6CoUElTBZPIYTnSUbp1tYC4Hg=;
	b=UwUa+/0DsqZtOhcGbbcDQJ4Lf43Mk9wN49T0ADxQVDCylnWxTOkeR4Adnbq8dnw3bu
	AfUB8vLNssSVMKRPC/Z7wQmLHl22RVYStS4FSsP4Qh1rS+x4k4CexZthxcbG+Xx5YkeG
	q8qNmS9C1m1GVzYui05/6pH1KktdyIzJ9iUaaMAZPrlgTICJadgrkNrpXGlkmR5shCEY
	UOqEPxUABgc2deDrZEIgUIDc+1obFvwNh+mSygmEKUtwUKATqsbO1yijdF+DK/tXOa+a
	Siz6tbg1hjF76IGtiPu5otE06J1SScYbBlFk08nvtXmQZZ4Z4eaTCAotnBZM2jvfnclb
	dYCw==
X-Received: by 10.60.31.205 with SMTP id c13mr11631165oei.135.1359393951179;
	Mon, 28 Jan 2013 09:25:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:49 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:07 -0600
Message-Id: <1359393932-31361-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/32] linux-am335x: Remove dirty tag patch
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:52 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* We are no longer preserving the git repositories. This means the kernel
  script that manipulates the kernel version will no longer run.
* Therefore, the kernel version will go from 3.2.0+ back to 3.2.0.
* Removing this unnecessary patch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../0001-linux-am335x-Remove-dirty-tag.patch       |   32 --------------------
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    5 +--
 2 files changed, 1 insertions(+), 36 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch
deleted file mode 100644
index e9930c9..0000000
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp05.06.00.00/0001-linux-am335x-Remove-dirty-tag.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 293d87edf88049be3f93649626d6d127a59cc71b Mon Sep 17 00:00:00 2001
-From: Franklin S. Cooper Jr <fcooper@ti.com>
-Date: Mon, 5 Nov 2012 07:28:17 -0600
-Subject: [PATCH] linux-am335x: Remove dirty tag
-
-* Disable LOCALVERSION_AUTO. This will prevent -dirty tag from being
-  added to the kernel version. This tag affects the name of the kernel
-  modules directory.
-* This dirty tag is also added if the kernel's git repository has
-  uncommitted changes.
-
-Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
----
- arch/arm/configs/am335x_evm_defconfig |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/arch/arm/configs/am335x_evm_defconfig b/arch/arm/configs/am335x_evm_defconfig
-index f1471bc..e78b271 100644
---- a/arch/arm/configs/am335x_evm_defconfig
-+++ b/arch/arm/configs/am335x_evm_defconfig
-@@ -37,7 +37,7 @@ CONFIG_BROKEN_ON_SMP=y
- CONFIG_INIT_ENV_ARG_LIMIT=32
- CONFIG_CROSS_COMPILE=""
- CONFIG_LOCALVERSION=""
--CONFIG_LOCALVERSION_AUTO=y
-+# CONFIG_LOCALVERSION_AUTO is not set
- CONFIG_HAVE_KERNEL_GZIP=y
- CONFIG_HAVE_KERNEL_LZMA=y
- CONFIG_HAVE_KERNEL_LZO=y
--- 
-1.7.0.4
-
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index 53ed93a..aefa361 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,7 +25,7 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
@@ -83,9 +83,6 @@ PATCHES += "file://0001-am335xevm-using-edge-triggered-interrupts-for-WLAN.patch
 # Add patch to enable pullup on WLAN enable
 PATCHES += "file://0001-am335x-enable-pullup-on-the-WLAN-enable-pin-fo.patch"
 
-# Add patch to remove dirty tag to kernel local version
-PATCHES += "file://0001-linux-am335x-Remove-dirty-tag.patch"
-
 # Copy the am33x-cm3 firmware if it is available
 do_compile_prepend() {
     if [ -e "${STAGING_DIR_HOST}/${base_libdir}/firmware/am335x-pm-firmware.bin" ]
-- 
1.7.0.4


