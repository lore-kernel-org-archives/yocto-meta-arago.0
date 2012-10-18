Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 4F84152980
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 22:18:47 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so8828872obb.38
	for <meta-arago@arago-project.org>;
	Thu, 18 Oct 2012 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=wXOgu7FF3DzKjoi7NpgHgX1f1Gz92b6h3GL5y9SSaYY=;
	b=foIVwHgm9JXrdpeYdU136PAheeRwau77IuiPhKE+7T5TWMYNdbUclZGUvrGrI/YaiQ
	Uy+uTZpbebRp1ol15nWmOHS79a3MamajgMKmB9PTYtYZxkHTsrojigYVu57dmiGk6H5K
	MitVPDsmwNntTdk5QcXHNNap2j7tH3ibnYRLDg76QaerLngzXpjNiglX1MAvqH+Siovj
	aZaNDVaPS9a2zmqnjgk/1WjUo0EVJZEfdGXgwlGTM4T9voy2cWMtTZqNMQlgPEJ0AhGR
	PaKV6ivWnsRTZBghIPWhS2hxHnlGL7nq+Ihnip41Gnm7P8Gz888UkOAHS9hRsvqYlYWK
	6Z5Q==
Received: by 10.60.169.197 with SMTP id ag5mr15002528oec.137.1350598726761;
	Thu, 18 Oct 2012 15:18:46 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k8sm3714061oee.11.2012.10.18.15.18.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 18 Oct 2012 15:18:45 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 18 Oct 2012 17:18:41 -0500
Message-Id: <1350598721-17604-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v4] task-arago-tisdk-crypto: Port crypto tasks from arago to meta-arago
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
X-List-Received-Date: Thu, 18 Oct 2012 22:18:47 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Port task-arago-tisdk-crypto including the host and target version
  from arago to meta-arago. These tasks are significantly smaller
  compared to the versions in arago. This is due to the contents of
  these tasks being either split into new tasks or simply moved to
  other tasks.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 4 changes:
 Remove COMPATIBLE_MACHINE.
 Added PACKAGE_ARCH and ALLOW_EMPTY when needed.

Version 3 changes:
 Remove unneeded PACKAGE_ARCH

 .../tasks/task-arago-tisdk-crypto-sdk-host.bb      |   23 ++++++++++++++
 .../tasks/task-arago-tisdk-crypto-sdk-target.bb    |   12 +++++++
 .../recipes-core/tasks/task-arago-tisdk-crypto.bb  |   31 ++++++++++++++++++++
 3 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
new file mode 100644
index 0000000..12e3362
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Task to install crypto sources in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+CRYPTO_RDEPENDS = ""
+
+CRYPTO_RDEPENDS_am37x-evm = "\
+    ti-ocf-crypto-module-src \
+"
+
+CRYPTO_RDEPENDS_am3517-evm = "\
+    ti-ocf-crypto-module-src \
+"
+RDEPENDS_${PN} = "\
+    ${CRYPTO_RDEPENDS} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
new file mode 100644
index 0000000..c5e28f5
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Task to install crypto dev packages in SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    openssl-dev \
+    ocf-linux-dev \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
new file mode 100644
index 0000000..0adfc7a
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "Task to install crypto packages into target FS"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Add openssl-misc to get the openssl.cnf file which is
+# needed for "openssl req" and to avoid warnings.
+# NOTE: This may change to openssl-conf in the future
+CRYPTO_SUPPORT = "\
+    openssl \
+    openssl-misc \
+    "
+
+# Add crypto hardware support for am37x-evm
+# NOTE: this package depends on a kernel patch which also has a TSU
+#       exemption filed.  The current name and checksums of the
+#       kernel patch are:
+# Name: 0001-linux-omap3-PSP-3.0.1.6-kernel-with-OCF-Linux.patch
+# md5sum: 00bb20f2f33a37489d8c52212933368d
+# sha256sum: 1fea8323d12cf1ee4f743f0f1c82d7f3821a7d9b7996c44b17d7761579bb090d
+CRYPTO_SUPPORT_append_am37x-evm = " ti-ocf-crypto-module"
+CRYPTO_SUPPORT_append_am3517-evm = " ti-ocf-crypto-module"
+
+RDEPENDS_${PN} = "\
+    ${CRYPTO_SUPPORT} \
+    "
-- 
1.7.0.4


