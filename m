Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id CD979529EA
	for <meta-arago@arago-project.org>;
	Tue, 17 May 2016 05:01:29 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7B00HST1YH4D00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 17 May 2016 00:01:29 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=ILGZMsoTJXbWJGZJjogA:9
Received: by 100.15.86.14 with SMTP id 57ac7b67; Tue, 17 May 2016 05:01:29 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E1B2916200E;	Tue,
	17 May 2016 01:01:28 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 17 May 2016 01:01:28 -0400
Message-id: <1463461288-32423-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1463461288-32423-1-git-send-email-denis@denix.org>
References: <1463461288-32423-1-git-send-email-denis@denix.org>
Subject: [RFC][PATCH 2/2] weston-init: disable systemd service to fall back to old initscript
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
X-List-Received-Date: Tue, 17 May 2016 05:01:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Touchscreen calibration and other customizations are required from initscript

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend  | 5 ++++-
 meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston | 2 +-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 78a839f..041e5ab 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago6"
+PR_append = ".arago7"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -9,4 +9,7 @@ SRC_URI_append = " \
 do_install_append() {
     install -d ${D}${bindir}
     install -m 755 ${WORKDIR}/runWeston ${D}${bindir}
+    rm -rf ${D}${systemd_system_unitdir}
 }
+
+SYSTEMD_SERVICE_${PN} = ""
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
index 6ef574a..aed5d5f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 clear
 cat << EOF
-- 
2.2.0


