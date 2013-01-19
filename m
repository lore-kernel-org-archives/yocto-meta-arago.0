Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by arago-project.org (Postfix) with ESMTPS id 347EC52AB2
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:22 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id wd20so4728502obb.39
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=116SZYOVAYTEADm2Kwh+LXm603bjzjwaWpBM3MDo0ug=;
	b=ZOh1CYlpAB2wm6bD7B1P8uex3C+GlchVqh3EA125oOISGnhn8QAu3t8zsvRVYgAIx6
	9C/c+Om9aRa6FXxkobJ07zRUITS+GY8wk+cWujC8o9Hs3s9Q2huxwvZCLGv3lG8JhwdR
	YaxaMFBoZsLxTzVcM3XNtz5YkoXeftBxFOtRvE6t9u4VEKLrtE8ZzW6kU9DUOtuwFadq
	r69COmA8IPvv13arkeS5DK2VhLdro/SDIlfVM6CPE4c45St5gdxEHzGJxcKM1J4fCa2n
	WjkFzJVVdRvzYsWk8csqNaQrr3dlXEHqkvzbtej4rymsthhx3ndmDmOJNp1OwXAI5wij
	83Sg==
X-Received: by 10.60.32.69 with SMTP id g5mr10756191oei.21.1358632341290;
	Sat, 19 Jan 2013 13:52:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:20 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:36 -0600
Message-Id: <1358632316-12266-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/31] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:22 -0000

* Port wl12xx-firmware recipe from arago. This recipe was originally
  named linux-firmware in arago.
* Wl12xx-firmware provides the firmware files for use with the TI
  Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wl12xx-firmware/wl12xx-firmware_git.bb         |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
new file mode 100644
index 0000000..12df963
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Firmware files for use with TI wl12xx"
+LICENSE = "TI-TSPA"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
+
+PACKAGE_ARCH = "all"
+
+PR = "r0+gitr${SRCREV}"
+
+# This recipe provides the latest firmware files for wl12xx.
+# Therefore, use the contents of this recipe instead of the contents
+# of linux-firmware-wl12xx.
+RCONFLICTS_${PN} = "linux-firmware-wl12xx"
+RPROVIDES_${PN}  = "linux-firmware-wl12xx"
+
+SRCREV = "38e0dd7999b9087e00d1a59306a7c22fd23246cf"
+SRC_URI = "git://github.com/TI-ECS/ti-utils.git;protocol=git"
+
+S = "${WORKDIR}/git/hw/firmware"
+
+do_compile() {
+    :
+}
+
+do_install() {
+    oe_runmake 'DEST_DIR=${D}' install
+}
+
+FILES_${PN} = "/lib/firmware/ti-connectivity/*"
-- 
1.7.0.4


