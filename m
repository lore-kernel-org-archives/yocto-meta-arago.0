Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1F246529DC
	for <meta-arago@arago-project.org>;
	Wed,  5 Feb 2020 23:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6300740C0A;
	Wed,  5 Feb 2020 23:35:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qM-SdpR_KW_F; Wed,  5 Feb 2020 23:35:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4185140A4E;
	Wed,  5 Feb 2020 23:35:15 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CC5F51743E0;
	Wed,  5 Feb 2020 18:35:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed,  5 Feb 2020 18:35:04 -0500
Message-Id: <1580945704-37891-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Scott Murray <scott.murray@konsulko.com>
Subject: [zeus/master][PATCH] weston: re-enable patches #3 and #4
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
X-List-Received-Date: Wed, 05 Feb 2020 23:37:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

The following patches are still applicable to Weston 7.0:
* 0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
* 0004-weston-Fix-touch-screen-crash-issue.patch

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reported-by: Scott Murray <scott.murray@konsulko.com>
---
 .../recipes-graphics/wayland/weston_7.0.0.bbappend         | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
index c2f4ef3..92e5570 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
@@ -1,16 +1,16 @@
 PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/libgbm mtdev"
 
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-#SRC_URI += " \
-#        file://0002-weston-Allow-visual_id-to-be-0.patch \
-#        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
-#        file://0004-weston-Fix-touch-screen-crash-issue.patch \
-#        file://0005-weston-drm-fix-dual-display-issue.patch \
-#"
+#        file://0002-weston-Allow-visual_id-to-be-0.patch
+#        file://0005-weston-drm-fix-dual-display-issue.patch
+SRC_URI += " \
+        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
+        file://0004-weston-Fix-touch-screen-crash-issue.patch \
+"
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4


