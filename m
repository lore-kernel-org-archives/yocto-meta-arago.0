Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 26FDB52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:29:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICSU5q035187
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:28:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560860910;
	bh=ourb2LtfpiBtHAzxnZ7QclKX3OW8a9zTXffuWpWKMzk=;
	h=From:To:CC:Subject:Date;
	b=CHyhYEfGSnnrTQaejXDEwSrBKwMyNnb+/T9xdGsiFTbWrYVaDuSVkRqJ081sVdHl9
	H0qL8rLc4agskkysCJ7T8rudBOhnBHRXkcM06rCHtIlJOH/BsuWXm4RapVuuD01YM8
	MtnyEPvABDxOYIyPP1lOX76NfRuH63J10nyNHhb8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICSUSl007888
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:28:30 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:28:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 07:28:30 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ICSUNO089988;
	Tue, 18 Jun 2019 07:28:30 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Jun 2019 08:12:30 -0400
Message-ID: <1560859950-12071-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] tisdk-server-rootfs-image: remove ubi/ubifs freom IMAGE_FSTYPES
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
X-List-Received-Date: Tue, 18 Jun 2019 12:29:12 -0000
Content-Type: text/plain

* The tisdk-server-rootfs-image size has exceeded HW limitations so
  remove ubi/ubifs from IMAGE_FSTYPES.
* Remove the tisdk-server-extra-rootfs-image as this was the original
  intent of that image.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-image.inc          |  6 +++---
 .../recipes-core/images/tisdk-server-extra-rootfs-image.bb  | 13 -------------
 .../recipes-core/images/tisdk-server-rootfs-image.bb        |  8 ++++++++
 3 files changed, 11 insertions(+), 16 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
index 45a8c1b..0125bb5 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.inc
@@ -38,9 +38,9 @@ TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image arago-tiny-image"
 TARGET_IMAGES_append_dra7xx-evm = " netboot-initrd"
 
 # Some devices do not support display and use a server image instead
-TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
-TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
-TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image tisdk-server-extra-rootfs-image arago-tiny-image"
+TARGET_IMAGES_keystone = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
+TARGET_IMAGES_omapl138 = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
+TARGET_IMAGES_j7-evm = "arago-base-tisdk-image tisdk-server-rootfs-image arago-tiny-image"
 
 TISDK_TOOLCHAIN = "meta-toolchain-arago-tisdk"
 TOOLCHAIN_SUFFIX = "-tisdk"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
deleted file mode 100644
index 359dc90..0000000
--- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
+++ /dev/null
@@ -1,13 +0,0 @@
-require recipes-core/images/tisdk-server-rootfs-image.bb
-
-IMAGE_INSTALL += "\
-    packagegroup-arago-test-addons \
-    packagegroup-arago-tisdk-addons-extra \
-    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
-    packagegroup-arago-tisdk-multimedia \
-    packagegroup-arago-tisdk-matrix-extra \
-"
-
-export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
-
-IMAGE_FSTYPES = "tar.xz"
diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index b64d092..09d9f9d 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -6,11 +6,19 @@ SPLASH = ""
 
 IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
+    packagegroup-arago-tisdk-addons-extra \
     ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
     packagegroup-arago-tisdk-crypto \
+    packagegroup-arago-tisdk-multimedia \
     packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-tisdk-matrix-extra \
     packagegroup-arago-base-tisdk-server-extra \
     packagegroup-arago-tisdk-connectivity \
 "
 
 export IMAGE_BASENAME = "tisdk-server-rootfs-image"
+
+# Disable ubi/ubifs as the filesystem requires more space than is
+# available on the HW.
+IMAGE_FSTYPES_remove = "ubifs ubi"
-- 
2.7.4


