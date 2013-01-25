Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by arago-project.org (Postfix) with ESMTPS id 2DA3B529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:05 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id wc18so1045553obb.12
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fLb6i/CK42bcO640dSXKkHWd1OyBnhgat8BcQ27M3HM=;
	b=IlFV/AiVQDOB0DPZI+PW01ZbGZ4QZDgLHLOz1MlJfvq5YyXIN196uYSltRMZ83I5lE
	NETDsn2EtsYV+K5sxnQIDGrYkkWyDm7yHE2RIQmLHSbOhSTEQ4EpOzE2wPqW1B38H0w5
	t7pucV4/aPa6NIH4yaaI4dRn2k/7CDqCX77Y8h4PoCEaRt8mmh8UOiNhTmA2x1K0PLRJ
	neYVMa7U/66Du1Iw+y+nMkV8TkgslxmE6EW4wX5IGWteMcF/gffEVt1mBGknOGQIiKIZ
	alZ6XLNMUiZRr5tZ/7rq1Qd129vHftSOBBmwHZa3H1fS5cnu4P9GUBHOAG5E7qT8kLT9
	3pzw==
X-Received: by 10.182.188.101 with SMTP id fz5mr5791451obc.0.1359151084630;
	Fri, 25 Jan 2013 13:58:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:03 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:44 -0600
Message-Id: <1359150851-23602-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: Eyal Reizer <eyalr@ti.com>, "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/31] wl12xx-firmware: update for wlan r5_sp3 release
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:05 -0000

From: Eyal Reizer <eyalr@ti.com>

* Update the firmware recipe for using the firmware files supplied
  with wlan r5_sp3 release

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl12xx-firmware/wl12xx-firmware/Makefile       |    7 +++++++
 .../wl12xx-firmware/wl12xx-firmware_git.bb         |    9 ++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile
new file mode 100644
index 0000000..0bb7ab8
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware/Makefile
@@ -0,0 +1,7 @@
+# Installs the the ti-connectiviy wlan firmware files into the root file system
+
+install:
+	install -d  $(DEST_DIR)/lib/firmware/ti-connectivity
+	cp -RpP * $(DEST_DIR)/lib/firmware/ti-connectivity/
+	rm -f $(DEST_DIR)/lib/firmware/ti-connectivity/Makefile
+
diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
index 12df963..5d73038 100644
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
 
 PACKAGE_ARCH = "all"
 
-PR = "r0+gitr${SRCREV}"
+PR = "r1+gitr${SRCREV}"
 
 # This recipe provides the latest firmware files for wl12xx.
 # Therefore, use the contents of this recipe instead of the contents
@@ -12,8 +12,10 @@ PR = "r0+gitr${SRCREV}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RPROVIDES_${PN}  = "linux-firmware-wl12xx"
 
-SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
-SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
+SRCREV = "ol_R5.SP3.05"
+SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
+           file://Makefile \
+          "
 
 S = "${WORKDIR}/git/hw/firmware"
 
@@ -22,6 +24,7 @@ do_compile() {
 }
 
 do_install() {
+    cp ${WORKDIR}/Makefile ${S}
     oe_runmake 'DEST_DIR=${D}' install
 }
 
-- 
1.7.0.4


