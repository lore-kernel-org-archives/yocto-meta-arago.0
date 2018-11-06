Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (unknown [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E5AB452092
	for <meta-arago@arago-project.org>;
	Tue,  6 Nov 2018 21:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5E11320B2F;
	Tue,  6 Nov 2018 21:26:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id PVH9A8T-b_fu; Tue,  6 Nov 2018 21:26:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 40DFF206F3;
	Tue,  6 Nov 2018 21:26:45 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D318A164D0C;
	Tue,  6 Nov 2018 16:26:44 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2018 16:26:44 -0500
Message-Id: <1541539604-7713-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH v2 2/2] uvc-gadget: update to the latest for many fixes and new g_uvc API
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
X-List-Received-Date: Tue, 06 Nov 2018 21:26:56 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - remove unneeded patch

 ...0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch | 26 ----------------------
 .../recipes-devtools/uvc-gadget/uvc-gadget_git.bb  | 11 +++++----
 2 files changed, 5 insertions(+), 32 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch

diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch b/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch
deleted file mode 100644
index d688422..0000000
--- a/meta-arago-extras/recipes-devtools/uvc-gadget/files/0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ae986b12f20b88de5f949062516fff4d8f887645 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 1 May 2017 16:33:33 -0400
-Subject: [PATCH] uvc-gadget: don't hardcode uvc.h path
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- uvc-gadget.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/uvc-gadget.c b/uvc-gadget.c
-index 4d59ab8..cd9e916 100644
---- a/uvc-gadget.c
-+++ b/uvc-gadget.c
-@@ -36,7 +36,7 @@
- #include <linux/usb/video.h>
- #include <linux/videodev2.h>
- 
--#include "../drivers/usb/gadget/uvc.h"
-+#include "uvc.h"
- 
- #define clamp(val, min, max) ({                 \
-         typeof(val) __val = (val);              \
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
index 1f75f15..39f8cb3 100644
--- a/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
+++ b/meta-arago-extras/recipes-devtools/uvc-gadget/uvc-gadget_git.bb
@@ -2,18 +2,17 @@ SUMMARY = "UVC gadget userspace sample application"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://uvc-gadget.c;beginline=1;endline=18;md5=414860c3c534dc95d81da9564cfb8d2a"
 
-DEPENDS = "virtual/kernel"
-
 SRC_URI = "git://git.ideasonboard.org/uvc-gadget.git"
-SRC_URI += "file://0001-uvc-gadget-don-t-hardcode-uvc.h-path.patch"
 
-PV = "1.0+git${SRCPV}"
-SRCREV = "3c5a666f9d2eea0e0f7e9a8a0eb8bbfd7687ca13"
+PV = "1.1+git${SRCPV}"
+SRCREV = "aa82df887ab995473cd83c89777cdf4bc4685dd0"
 
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = 'CC="${CC}" CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" KERNEL_INCLUDE=""'
+
 do_compile () {
-	${CC} ${CFLAGS} -I${STAGING_KERNEL_DIR}/drivers/usb/gadget/function ${LDFLAGS} -o uvc-gadget uvc-gadget.c
+	oe_runmake
 }
 
 do_install () {
-- 
2.7.4


