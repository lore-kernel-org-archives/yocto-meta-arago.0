Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id A649B52094
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:28 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OOcTl07VNhm2TqMtGEoqqv1sXCQ7tKRLJOQfkk7dajo=;
	b=yTZYUTsXmkUFI28S45rMwqDAo0GjPB3UIsdwlE04tXkzbg+tBtfNV8uU9hwDeI6OkT
	ILYRR3cCz70f1Sruz8TmOF8vK3q/C8hKM5kgPsrW2MlS0oijTFImI95YCbHzeVUrcQuV
	77kLJxbHH1cOQEqsV42jSsUFjihZ8KXVmX12x6UoVDrMqsPbvDKECc2ybpKAV7lteF9w
	ZfEA0RB4mSUCvBb/iGaGJCfVVKrYPbIPDmvlJptpmofJHXTPwzT0CwT4Ktgxulfxtnza
	46+U1ZSCuFq+kqHiCZmEUzKWZ3A/q4NcCqD4EPEHq352kxJxz2CfWGjoPKtJ2N9mGUD2
	6EOw==
Received: by 10.182.127.102 with SMTP id nf6mr6926244obb.14.1352080468372;
	Sun, 04 Nov 2012 17:54:28 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:27 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:31 -0600
Message-Id: <1352080417-9792-34-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 36/42] u-boot: Add PSP version 05.06.00.00 of u-boot
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:29 -0000

* Add PSP version of 05.06.00.00 of u-boot.
* This version of u-boot is 2012.10 base with additional am335x specific
  patches.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |   31 ++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
new file mode 100644
index 0000000..1fed08b
--- /dev/null
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -0,0 +1,31 @@
+# Use the version of u-boot.inc in oe-core not the meta-ti version
+require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
+
+# Reset OEMAKE. Current u-boot.inc sets -02 which breaks this version of u-boot's build.
+# This issue was fixed in oe-core master by removing the -02 statement.
+EXTRA_OEMAKE = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}"'
+
+DESCRIPTION = "u-boot bootloader for ARM MPU devices"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1707d6db1d42237583f50183a5651ecb"
+
+COMPATIBLE_MACHINE = "ti33x|omap3"
+
+DEFAULT_PREFERENCE = "-1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+PR = "r0+gitr${SRCPV}"
+
+SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH}"
+
+BRANCH = "amsdk-05.06.00.00"
+
+SRCREV = "${AUTOREV}"
+
+S = "${WORKDIR}/git"
+
+UBOOT_SUFFIX = "img"
+
+# Set the name of the SPL that will built so that it is also packaged with u-boot.
+SPL_BINARY = "MLO"
-- 
1.7.0.4


