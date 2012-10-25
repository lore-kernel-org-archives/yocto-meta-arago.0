Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 59F4D5209D
	for <meta-arago@arago-project.org>;
	Thu, 25 Oct 2012 02:33:41 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so1072031obb.38
	for <meta-arago@arago-project.org>;
	Wed, 24 Oct 2012 19:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=l5C/0WrDlkFO5Nltzq/gbqMd4QyVZZP+6YHEzwUl0TM=;
	b=SYLfo5QUZ5dQ/78MyVBu5Ok+TcwTKeesY/wvqXmcJ2uTXdKS4VjY20Alc9g3S+qzQd
	iDXohSn0e+DZbuZ4QyIO60O5Kkdda0ViO5F0KQ4AY44WXUIBoCAeslzmFtzzjflI6/Zx
	qj4EHwFAHyxN7sogtbVoXUCrHZorJalplFl+o5k7riy9hf/mI7zvOTG1MrKZbprQnMng
	6paKUbpxAN55Q8E5CmQFM5upWlbAk9UI6OJRMo9aLDRQFkMH9S4A7exBP4CqYdQ3ZmJV
	GE/K0KwtPzkZP271mfkDtZb3LoztIi7SSzeS2KWduuystasL/pek7fXJZS9EKgILQ8c/
	DOTQ==
Received: by 10.60.25.198 with SMTP id e6mr15995333oeg.83.1351132420884;
	Wed, 24 Oct 2012 19:33:40 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id xj9sm17299070obb.17.2012.10.24.19.33.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 24 Oct 2012 19:33:40 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 24 Oct 2012 21:33:37 -0500
Message-Id: <1351132417-21255-1-git-send-email-fcooper@ti.com>
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
X-List-Received-Date: Thu, 25 Oct 2012 02:33:41 -0000

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


