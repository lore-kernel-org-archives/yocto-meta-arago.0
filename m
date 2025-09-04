Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52BC8CA1015
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 12:43:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.38144.1756989820771377124
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 04 Sep 2025 05:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mUNQuPCq;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: m-shah@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 584CheYE3075254
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:43:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756989820;
	bh=r3HTX/C4+mWH13StUeh2LaW6U/oKTbhAcILGsKDAjo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Post;
	b=mUNQuPCqvoy21V2jS2GAip50fl6z+NDXajWpgMa43QAzjsAeZb3axs7zIiTxjFIz6
	 PMUonOF5tY640tCVkE02xx+TB3RBWLiokpnTfMwB80U3AXy8wYViwzbs5Au+IRRYlL
	 VAPKvrxIdCUF3CqFOGPGPkGEnd1Gf5B2W1Yht1uA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 584CheUp118705
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 4 Sep 2025 07:43:40 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 4
 Sep 2025 07:43:38 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 4 Sep 2025 07:43:38 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.72.162])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 584ChVv23267526;
	Thu, 4 Sep 2025 07:43:35 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <vigneshr@ti.com>, <u-kumar1@ti.com>, <linux-patch-review@list.ti.com>,
        <reatmon@ti.com>, <a-limaye@ti.com>, <n-francis@ti.com>,
        <m-shah@ti.com>, <praneeth@ti.com>, <jm@ti.com>
Subject: [meta-ti][PATCH 1/1 v2] recipes-ti: initramfs: Make minimal initrd image
Date: Thu, 4 Sep 2025 18:13:31 +0530
Message-ID: <20250904124331.1075343-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904124331.1075343-1-m-shah@ti.com>
References: <20250904124331.1075343-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Post: <mailto:linux-patch-review@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 04 Sep 2025 12:43:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16521

Add recipes to make initramfs image based on systemd.
The image will package boot essential and other modules
which will be modprobed by initramfs udev once the inbuilt
drivers gets probed.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 .../initramfs/packagegroup-ti-initramfs.bb    |  5 ++
 .../recipes-ti/initramfs/ti-tiny-initramfs.bb | 49 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
new file mode 100644
index 00000000..5d2ff390
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-initramfs.bb
@@ -0,0 +1,5 @@
+SUMMARY = "Minimal initramfs for boot requirements"
+
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+RDEPENDS:${PN}:remove = "grub-efi kernel"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
new file mode 100644
index 00000000..4cebf595
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-tiny-initramfs.bb
@@ -0,0 +1,49 @@
+SUMMARY = "TI SDK super minimal base image for initramfs"
+
+DESCRIPTION = "Image meant for basic boot of linux kernel. Intended as\
+ bare system, this image does not package the kernel in the\
+ standard /boot folder in rootfs. Instead, it provides a base\
+ rootfs allowing kernel to be deployed elsewhere\
+ (tftp/separate boot partition/jtag log etc..) and boot\
+ the image.\
+"
+
+LICENSE = "MIT"
+
+inherit core-image
+
+IMAGE_FEATURES:remove = "package-management"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+
+#INITRAMFS_MAXSIZE = "65536"
+#IMAGE_OVERHEAD_FACTOR = "1"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+INITRAMFS_SCRIPTS ?= "initramfs-framework-base initramfs-module-udev initramfs-module-nfsrootfs"
+
+MODULES = "\
+    kernel-module-cdns-pltfrm \
+    kernel-module-ti-j721e-ufs \
+    kernel-module-tps6594-i2c \
+"
+
+UTILS = "\
+    cifs-utils \
+    nfs-utils \
+    nfs-utils-client \
+"
+
+PACKAGE_INSTALL = "${INITRAMFS_SCRIPTS} ${UTILS} ${MODULES} packagegroup-ti-initramfs "
+
+export IMAGE_BASENAME = "ti-tiny-initramfs"
+
+# To further reduce the size of the rootfs, remove the /boot directory from
+# the final image this is usually done by adding RDEPENDS_kernel-base = ""
+# in the configuration file. In our case we can't use this method. Instead we
+# just wipe out the content of "/boot" before creating the image.
+ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
+empty_boot_dir () {
+	rm -rf ${IMAGE_ROOTFS}/boot/*
+}
-- 
2.34.1


