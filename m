Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 1E01252A43
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 01:49:32 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1051401oag.38
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 18:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l5C/0WrDlkFO5Nltzq/gbqMd4QyVZZP+6YHEzwUl0TM=;
	b=r9LiKmXjTyIx99ZIPEurZ0d+6HW3+wjLc9uYdZu1fAdzW4bSsMtwbBItw/5R3H4WBS
	ekopNoXlecgoNUfQl/EL/tJ6/gVq7WhME9qr40A2rhlRKhLp0jU8uiw+qPUkReOoyWYJ
	AUDGbfLVGdXjvU2UJN15SvlgL0eUPij6dMlr+VH99ZbVvJJFqZ/6b46TTCoTPe7HfmeR
	godN+IaxwT7lThQV2ng+plOMfTVAs+zI45IWbRl6iD1TqZP6btQgyCJsIxRjR8auM9Nk
	cHfRFQYYQNBAK1rCGfxKMJvPtigZS/6jRiKV+TlcGyhUJ5wSIF31k0cnh3ebuTp9hR9g
	EBCQ==
Received: by 10.60.27.68 with SMTP id r4mr15451442oeg.53.1351129771588;
	Wed, 24 Oct 2012 18:49:31 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s5sm17210737obo.10.2012.10.24.18.49.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 18:49:31 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 24 Oct 2012 20:49:27 -0500
Message-Id: <1351129767-19986-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH v2] ti-tisdk-setup: Port ti-tisdk-setup from arago
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
X-List-Received-Date: Thu, 25 Oct 2012 01:49:32 -0000

* Port ti-tisdk-setup from arago to meta-arago.
* This recipe brings in various scripts used to setup the SDK on
  a user's development machine.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 changes:
Move setup scripts into their own git repository

 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
new file mode 100644
index 0000000..d9b5da3
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "Package containing scripts to setup the development host and target board"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
+
+COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "5bbfa583671b87bc8c17316bb3a9787fbc884ec6"
+SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git/"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+UBOOT_ENV_am37x-evm = "setup-uboot-env-am37x.sh"
+UBOOT_ENV_beagleboard = "setup-uboot-env-beagleboard.sh"
+UBOOT_ENV_am3517-evm = "setup-uboot-env-am3517.sh"
+UBOOT_ENV_am180x-evm = "setup-uboot-env-am18x.sh"
+UBOOT_ENV_ti33x = "setup-uboot-env-am335x.sh"
+
+do_install () {
+    install -m 0755 ${S}/setup.sh ${D}/
+    install -d ${D}/bin
+    install -m 0755 ${S}/common.sh ${D}/bin
+    install -m 0755 ${S}/setup-host-check.sh ${D}/bin
+    install -m 0755 ${S}/setup-minicom.sh ${D}/bin
+    install -m 0755 ${S}/setup-package-install.sh ${D}/bin
+    install -m 0755 ${S}/setup-targetfs-nfs.sh ${D}/bin
+    install -m 0755 ${S}/setup-tftp.sh ${D}/bin
+    install -m 0755 ${S}/create-sdcard.sh ${D}/bin
+    install -m 0755 ${S}/${UBOOT_ENV} ${D}/bin/setup-uboot-env.sh
+}
+
+FILES_${PN} += "setup.sh"
-- 
1.7.0.4


