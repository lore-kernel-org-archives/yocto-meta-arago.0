Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 17D4252982
	for <meta-arago@arago-project.org>;
	Mon,  1 May 2017 20:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F2CCD20BBE;
	Mon,  1 May 2017 20:54:36 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id a2oHvOhzntkY; Mon,  1 May 2017 20:54:36 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CEFA320756;
	Mon,  1 May 2017 20:54:35 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 55DAA162487;
	Mon,  1 May 2017 16:54:35 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  1 May 2017 16:54:33 -0400
Message-Id: <1493672074-71340-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] uvc-gadget: add recipe for UVC gadget test app
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
X-List-Received-Date: Mon, 01 May 2017 20:54:37 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch | 26 ++++++++++++++++++++++
 .../recipes-devtools/uvc-gadget/uvc-gadget_git.bb  | 22 ++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch
 create mode 100644 meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb

diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch b/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch
new file mode 100644
index 0000000..d688422
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch
@@ -0,0 +1,26 @@
+From ae986b12f20b88de5f949062516fff4d8f887645 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 1 May 2017 16:33:33 -0400
+Subject: [PATCH] uvc-gadget: don't hardcode uvc.h path
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ uvc-gadget.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/uvc-gadget.c b/uvc-gadget.c
+index 4d59ab8..cd9e916 100644
+--- a/uvc-gadget.c
++++ b/uvc-gadget.c
+@@ -36,7 +36,7 @@
+ #include <linux/usb/video.h>
+ #include <linux/videodev2.h>
+ 
+-#include "../drivers/usb/gadget/uvc.h"
++#include "uvc.h"
+ 
+ #define clamp(val, min, max) ({                 \
+         typeof(val) __val = (val);              \
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
new file mode 100644
index 0000000..1f75f15
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -0,0 +1,22 @@
+SUMMARY = "UVC gadget userspace sample application"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://uvc-gadget.c;beginline=1;endline=18;md5=414860c3c534dc95d81da9564cfb8d2a"
+
+DEPENDS = "virtual/kernel"
+
+SRC_URI = "git://git.ideasonboard.org/uvc-gadget.git"
+SRC_URI += "file://0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch"
+
+PV = "1.0+git${SRCPV}"
+SRCREV = "3c5a666f9d2eea0e0f7e9a8a0eb8bbfd7687ca13"
+
+S = "${WORKDIR}/git"
+
+do_compile () {
+	${CC} ${CFLAGS} -I${STAGING_KERNEL_DIR}/drivers/usb/gadget/function ${LDFLAGS} -o uvc-gadget uvc-gadget.c
+}
+
+do_install () {
+	install -d ${D}${bindir}
+	install -m755 uvc-gadget ${D}${bindir}
+}
-- 
2.7.4


