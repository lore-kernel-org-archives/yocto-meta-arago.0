Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6C0C00528
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 20:45:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5110.1691095509540201058
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 13:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bRpC+8JY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 373Kj7eF010671;
	Thu, 3 Aug 2023 15:45:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691095507;
	bh=dUCHCyZQz5H4vTDZ8GJGieXdz7/GuN3IRJNEGxU4hJ0=;
	h=From:To:Subject:Date;
	b=bRpC+8JYags6jhDDHrIlzMTNkesVdz0/y8fPfkobqczAUVIOCiNWUij16SBjxMHqk
	 jraXGvXAnRrHQfCp8x+13aA40rykHwMd6iK5Ede83y6X/85A1+gifHR64SJEEfEBwx
	 hI/tSKku0h0Ip9rF9YzYdwKC4FiS1U6hq4XFjX/w=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 373Kj7kt107903
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 3 Aug 2023 15:45:07 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 3
 Aug 2023 15:45:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 3 Aug 2023 15:45:07 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 373Kj7aN033599;
	Thu, 3 Aug 2023 15:45:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qRfBz-0002CG-95; Thu, 03 Aug 2023 15:45:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] tisdk-tiny-initramfs: Create a smaller dedicated initramfs for tiny
Date: Thu, 3 Aug 2023 15:45:06 -0500
Message-ID: <20230803204507.8402-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 03 Aug 2023 20:45:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14817

The initramfs does not need grub-efi or the /boot directory since it
does not have to boot the system itself.  So create a version of the
tiny-image that strips those out and follow the oe-core methodology for
initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../classes/remove-boot-dir.bbclass           |  9 +++++++
 .../images/tisdk-tiny-initramfs.bb            | 27 +++++++++++++++++++
 .../packagegroup-arago-initramfs.bb           |  5 ++++
 3 files changed, 41 insertions(+)
 create mode 100644 meta-arago-distro/classes/remove-boot-dir.bbclass
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb

diff --git a/meta-arago-distro/classes/remove-boot-dir.bbclass b/meta-arago-distro/classes/remove-boot-dir.bbclass
new file mode 100644
index 00000000..61c8f22d
--- /dev/null
+++ b/meta-arago-distro/classes/remove-boot-dir.bbclass
@@ -0,0 +1,9 @@
+# Add a ROOTFS_POSTPROCESS_COMMAND that will remove some files from the
+# rootfs for initramfs images.
+
+ROOTFS_POSTPROCESS_COMMAND += "remove_boot_dir;"
+
+remove_boot_dir () {
+    rm -rf ${IMAGE_ROOTFS}/boot
+}
+
diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
new file mode 100644
index 00000000..0b8bfba8
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -0,0 +1,27 @@
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
+
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
new file mode 100644
index 00000000..63e3da01
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb
@@ -0,0 +1,5 @@
+
+require recipes-core/packagegroups/packagegroup-core-boot.bb
+
+RDEPENDS:${PN}:remove = "grub-efi kernel"
+
-- 
2.17.1


