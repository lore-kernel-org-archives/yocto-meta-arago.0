Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E95C6C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 21:48:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.146771.1692136094396994267
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Aug 2023 14:48:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qnJ/0/3v;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37FLmDDu117536;
	Tue, 15 Aug 2023 16:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692136093;
	bh=ckVrkFNFWA9B5Mxpr5Z8rgSMksff2uyhhonWQ5AkW2o=;
	h=From:To:Subject:Date;
	b=qnJ/0/3vgTsoOeR/SiAPP8C8gT8kS20puk4j9rSoNUAqVeGADrfAMPso7+2m0YVzi
	 4OYdZSIn2eX/qaHPJWidmrhH+u9cVjFMA3wo01Nuvg3hvH8Jh6apcoRHQlN8Vv9LZ9
	 s+oiBRioMDgfRWVl98FOgFDiIZr/x/7WLQMci0Pc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37FLmDSQ036112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 15 Aug 2023 16:48:13 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Aug 2023 16:48:13 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Aug 2023 16:48:13 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37FLmC8E007718;
	Tue, 15 Aug 2023 16:48:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qW1tc-00057g-Rq; Tue, 15 Aug 2023 16:48:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH v4 1/2] tisdk-tiny-initramfs: Create a smaller dedicated initramfs for tiny
Date: Tue, 15 Aug 2023 16:48:11 -0500
Message-ID: <20230815214812.19652-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Aug 2023 21:48:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14851

The initramfs does not need grub-efi or the /boot directory since it
does not have to boot the system itself.  So create a version of the
tiny-image that strips those out and follow the oe-core methodology for
initramfs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v4: Remove class for removing boot dir and put the logic in the recipe
    instead.

 .../images/tisdk-tiny-initramfs.bb            | 34 +++++++++++++++++++
 .../packagegroup-arago-initramfs.bb           |  4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-initramfs.bb

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
new file mode 100644
index 00000000..551cf67c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-initramfs.bb
@@ -0,0 +1,34 @@
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
+# To further reduce the size of the rootfs, remove the /boot directory from
+# the final image this is usually done by adding RDEPENDS_kernel-base = ""
+# in the configuration file. In our case we can't use this method. Instead we
+# just wipe out the content of "/boot" before creating the image.
+ROOTFS_POSTPROCESS_COMMAND += "empty_boot_dir; "
+empty_boot_dir () {
+	rm -rf ${IMAGE_ROOTFS}/boot/*
+}
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


