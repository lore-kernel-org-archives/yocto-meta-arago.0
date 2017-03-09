Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2E4DB52AC3
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:27:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRlhV006567
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094867;
	bh=NQOeazUFJhZKPNEY0kFJgSsi4XBPyj0mjBoYSmQktko=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=i+DOKscvOwZXBEOl+KKlRhRVpIFg0bVbLDc4fu0+KpjXYuwzX1HUrJo92r8us/fcQ
	6fpmyX9pCGUns+S7ZQf7qLhvseF87xw54E7J2sZBjO0c3DIz5LsOOiecwZArOVkHt+
	taEXpmq/ckSLaIiy2RxZo5qgDcdP7k79x3XO1ic8=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRlXd021905
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:46 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEq025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:47 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:34 -0500
Message-ID: <1489094857-27497-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
References: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty][PATCH V2 2/5] weston: fix virtual keyboard display issue of QT5 applications
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
X-List-Received-Date: Thu, 09 Mar 2017 21:27:48 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...eston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch} | 11 +++++------
 .../recipes-graphics/wayland/weston_1.11.0.bbappend           |  3 ++-
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch => 0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch} (81%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
similarity index 81%
rename from meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
rename to meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
index 576b37e..bdf5626 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
+++ b/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
@@ -1,7 +1,7 @@
-From 7d2f4a97306707fb29e743bf66a827e661aa5615 Mon Sep 17 00:00:00 2001
+From 0d15218ced5bf2e6f3d05758f0f5f21c2a0303f2 Mon Sep 17 00:00:00 2001
 From: Eric Ruei <e-ruei1@ti.com>
-Date: Tue, 23 Feb 2016 18:26:57 -0500
-Subject: [PATCH 3/3] Weston1.9.0: Fix virtual keyboard display issue for QT5
+Date: Thu, 9 Mar 2017 14:33:08 -0500
+Subject: [PATCH 3/4] Weston: Fix virtual keyboard display issue for QT5
  application
 
 The virtual keyboard does pop up as expected, however, it will never hide
@@ -17,17 +17,16 @@ cannot be hidden.
 It is required to set the current_panel to the text_input when the input_panel
 becomes visible at the first time.
 
-
 Signed-off-by: Eric Ruei <e-ruei1@ti.com>
 ---
  src/text-backend.c | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/src/text-backend.c b/src/text-backend.c
-index cd6c4d99..ba60949 100644
+index ab4667f..36c70a5 100644
 --- a/src/text-backend.c
 +++ b/src/text-backend.c
-@@ -338,6 +338,7 @@ text_input_show_input_panel(struct wl_client *client,
+@@ -337,6 +337,7 @@ text_input_show_input_panel(struct wl_client *client,
  			       text_input->surface);
  		wl_signal_emit(&ec->update_input_panel_signal,
  			       &text_input->cursor_rectangle);
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index 9a2c3a7..f2e22ca 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,7 +2,7 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago18"
+PR_append = ".arago19"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
@@ -12,4 +12,5 @@ RDEPENDS_${PN} += "weston-conf"
 SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
 	file://0002-Weston-Allow-visual_id-to-be-0.patch \
+	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
 "
-- 
1.9.1


