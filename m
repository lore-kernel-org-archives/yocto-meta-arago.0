Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id D825C52A70
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:00:10 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2437217obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YcOjilWzzqlCu8iEfkvLz2vl0pTg+svOOjHUQ88kotg=;
	b=ju2XIDF5uAExtJjNy5DekYSW9HVHf8Ke+UJ191bwViLQeoHkQz0ZyghvUg9+RR9pZZ
	Dxjs6RvfTgyN3RHBOdaIsYZbjpanjbV+p4lpsovy4lcZvyEDa65bL/ZC5XcqYMY2ThGA
	72o5LuKdmKZSXrWONw2z+tiEqpA0JExHVSqsYlq3BasCNZTBLc9dPXnkC/wEa6E04uQd
	PBHrelC2XaV6kdMFJNKgENxrm5JPJEwg8dQlM6tMT+2lbG3kFx5ALkuHZ9+rT+XNb7cb
	I+s8wb+P7xt+uqIIbX/pMIEhFdSykZMDJ7r06VPO4f17kne6GJP7oICr2osb42NgsqgB
	wfjg==
Received: by 10.60.12.103 with SMTP id x7mr2497576oeb.142.1350018010409;
	Thu, 11 Oct 2012 22:00:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f3sm2960651obz.8.2012.10.11.22.00.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:00:09 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:31:00 -0500
Message-Id: <1350019860-10978-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [PATCH v3] task-arago-tisdk-crypto: Port crypto tasks from arago to meta-arago
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
X-List-Received-Date: Fri, 12 Oct 2012 05:00:11 -0000

From: Franklin S Cooper Jr <fcooper@ti.com>

* Port task-arago-tisdk-crypto including the host and target version
  from arago to meta-arago. These tasks are significantly smaller
  compared to the versions in arago. This is due to the contents of
  these tasks being either split into new tasks or simply moved to
  other tasks.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
Version 3 changes:
Remove unneeded PACKAGE_ARCH

 .../tasks/task-arago-tisdk-crypto-sdk-host.bb      |   11 +++++++
 .../tasks/task-arago-tisdk-crypto-sdk-target.bb    |   11 +++++++
 .../recipes-core/tasks/task-arago-tisdk-crypto.bb  |   30 ++++++++++++++++++++
 3 files changed, 52 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
new file mode 100644
index 0000000..34093d6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-host.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Task to install crypto sources in SDK"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    ti-ocf-crypto-module-src \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
new file mode 100644
index 0000000..15f4b99
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-sdk-target.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Task to install crypto dev packages in SDK"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    openssl-dev \
+    ocf-linux-dev \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
new file mode 100644
index 0000000..9636644
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "Task to install crypto packages into target FS"
+PR = "r0"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
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


