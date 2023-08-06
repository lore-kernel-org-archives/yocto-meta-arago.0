Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA73C04A6A
	for <webhook@archiver.kernel.org>; Sun,  6 Aug 2023 04:39:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5872.1691296790681823971
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 05 Aug 2023 21:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KvmCGyqX;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3764dn8P081392;
	Sat, 5 Aug 2023 23:39:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691296789;
	bh=gZKqe4L0h9znpYv9Ywesgv9q9LnjWOYMZHk/Kkn3gd4=;
	h=From:To:Subject:Date;
	b=KvmCGyqXqbbfAXMIASRX26k97+vu2KCNEKANU9O+DtWOHxKJDsuUQShFfLswv1suY
	 jVar1hn9qpN/sdxrsUDfRxKNWlWnUSF6iW5XwmJjqg65GsgNBeRoVxZJfHzaOpqQI4
	 Y6kFvAJLhNVQ03wRPtFgxkELnf9fQ46mv5b7ayQ0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3764dnuk003730
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 5 Aug 2023 23:39:49 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 5
 Aug 2023 23:39:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 5 Aug 2023 23:39:49 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3764dnXL010528;
	Sat, 5 Aug 2023 23:39:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qSVYS-000573-UW; Sat, 05 Aug 2023 23:39:48 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v3 1/2] tisdk-tiny-initramfs: Create a smaller dedicated initramfs for tiny
Date: Sat, 5 Aug 2023 23:39:47 -0500
Message-ID: <20230806043948.19613-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sun, 06 Aug 2023 04:39:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14827

The initramfs does not need grub-efi or the /boot directory since it
does not have to boot the system itself.  So create a version of the
tiny-image that strips those out and follow the oe-core methodology for
initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../classes/remove-boot-dir.bbclass           |  8 ++++++
 .../images/tisdk-tiny-initramfs.bb            | 26 +++++++++++++++++++
 .../packagegroup-arago-initramfs.bb           |  4 +++
 3 files changed, 38 insertions(+)
 create mode 100644 meta-arago-distro/classes/remove-boot-dir.bbclass
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb

diff --git a/meta-arago-distro/classes/remove-boot-dir.bbclass b/meta-arago-distro/classes/remove-boot-dir.bbclass
new file mode 100644
index 00000000..bd0c09fc
--- /dev/null
+++ b/meta-arago-distro/classes/remove-boot-dir.bbclass
@@ -0,0 +1,8 @@
+# Add a ROOTFS_POSTPROCESS_COMMAND that will remove some files from the
+# rootfs for initramfs images.
+
+ROOTFS_POSTPROCESS_COMMAND += "remove_boot_dir;"
+
+remove_boot_dir () {
+    rm -rf ${IMAGE_ROOTFS}/boot
+}
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
new file mode 100644
index 00000000..0bea8276
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -0,0 +1,26 @@
+SUMMARY = "Arago TI SDK super minimal base image for initramfs"
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
+inherit remove-boot-dir
+
+IMAGE_FEATURES:remove = "package-management"
+
+INITRAMFS_FSTYPES = "cpio cpio.xz"
+INITRAMFS_MAXSIZE = "65536"
+IMAGE_OVERHEAD_FACTOR = "1"
+
+IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
+
+PACKAGE_INSTALL = "packagegroup-arago-initramfs"
+
+export IMAGE_BASENAME = "tisdk-tiny-initramfs"
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
new file mode 100644
index 00000000..380cc0e3
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
@@ -0,0 +1,4 @@
+
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+RDEPENDS:${PN}:remove = "grub-efi kernel"
-- 
2.17.1


