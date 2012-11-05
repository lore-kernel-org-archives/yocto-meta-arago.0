Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 0C9E75208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:02 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yS2iOhEnnObnRP/wgeFiHzyHgw3yhM1rMa/rrJlf9No=;
	b=dvmBKELoft1GWNiioxLX6Sdos8SEt93bP3wf3GxwodaS4aw9QtnY8Sv983tn+PQiwK
	4p81x4SAn6TYlQ9psAAZdaxeZs7G/pLMZm2Qwe/GcgwSgGDX6pIFcGdZriRoGKnBHljf
	kkwJzvtBRFoeRoAQ1YWaZBUUC/YnH9cP6KEE7VHN66mX+UbjepWyFvAV0lg+cY1oBOd4
	xFNIuV3LdJEuMBQgU6Aos7610Gca1zPKCAi1X4znYmWyKNFoj/jggTVDTpV6aVYMx1EB
	w49HamAHxVgdHj6qpkrlK/FkmOw7VvZOfOZ6hcy8zgQZ6mjbL2cXtSUPRRB7Zp8kvJMC
	zxyg==
Received: by 10.60.32.178 with SMTP id k18mr6864946oei.8.1352080441741;
	Sun, 04 Nov 2012 17:54:01 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:01 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:07 -0600
Message-Id: <1352080417-9792-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/42] task-arago-tisdk-amsdk: Add a new SDK related task
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:02 -0000

* Add a task to pull in amsdk related recipes. This includes applications and
  scripts installed in the SDK and scripts installed in the filesystem for the
  SDK's out of box experience (OOBE).

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-amsdk-sdk-host.bb       |   24 ++++++++++++++++++++
 .../recipes-core/tasks/task-arago-tisdk-amsdk.bb   |   21 +++++++++++++++++
 2 files changed, 45 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
new file mode 100644
index 0000000..3c5f4b1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk-sdk-host.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Task to install additional scripts and applications into the SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+# Choose the kernel and u-boot recipe sources to use
+U-BOOT_SRC = ""
+KERNEL_SRC = ""
+
+U-BOOT_SRC_am335x-evm = "u-boot-src"
+KERNEL_SRC_am335x-evm = "linux-am335x-src"
+
+RDEPENDS_${PN} = "\
+    pinmux-utility \
+    ti-tisdk-setup \
+    board-port-labs-src \
+    ti-tisdk-makefile \
+    ${U-BOOT_SRC} \
+    ${KERNEL_SRC} \
+"
diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
new file mode 100644
index 0000000..1351030
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+ALLOW_EMPTY = "1"
+
+# Out of Box Experience (OOBE)
+OOBE = ""
+
+OOBE_ti33x += "\
+    gadget-init \
+    parse-ip \
+"
+
+RDEPENDS_${PN} = "\
+    ${OOBE} \
+"
-- 
1.7.0.4


