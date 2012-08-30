Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 695E952960
	for <meta-arago@arago-project.org>;
	Thu, 30 Aug 2012 13:40:41 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7UDecKt032132
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 08:40:38 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7UDecas015042
	for <meta-arago@arago-project.org>; Thu, 30 Aug 2012 08:40:38 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 30 Aug 2012 08:40:38 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7UDecWu001706;	Thu, 30 Aug 2012 08:40:38 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T75Dk-0004h9-Gx; Thu, 30 Aug 2012 08:55:44 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Aug 2012 08:55:42 -0500
Message-ID: <1346334943-18012-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH v2] task-arago-tisdk-crypto: Port crypto tasks from arago to meta-arago
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
X-List-Received-Date: Thu, 30 Aug 2012 13:40:48 -0000
Content-Type: text/plain

* Port task-arago-tisdk-crypto including the host and target version
  from arago to meta-arago. These tasks are significantly smaller
  compared to the versions in arago. This is due to the contents of
  these tasks being either split into new tasks or simply moved to
  other tasks.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-crypto-host.bb          |   12 ++++++++
 .../tasks/task-arago-tisdk-crypto-target.bb        |   12 ++++++++
 .../recipes-core/tasks/task-arago-tisdk-crypto.bb  |   29 ++++++++++++++++++++
 3 files changed, 53 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-target.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-host.bb
new file mode 100644
index 0000000..071a28c
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-host.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Task to install crypto sources in SDK"
+PR = "r0"
+LICENSE = "MIT"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_MACHINE = "(am37x-evm|am3517-evm)"
+
+RDEPENDS_${PN} = "\
+    ti-ocf-crypto-module-src \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-target.bb
new file mode 100644
index 0000000..f675058
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto-target.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Task to install crypto dev packages in SDK"
+PR = "r0"
+LICENSE = "MIT"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+RDEPENDS_${PN} = "\
+    openssl-dev \
+    ocf-linux-dev \
+    "
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
new file mode 100644
index 0000000..42672c6
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-crypto.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Task to install crypto packages into target FS"
+PR = "r0"
+LICENSE = "MIT"
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


