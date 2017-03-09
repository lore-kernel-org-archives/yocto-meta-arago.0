Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 54D6B52AD5
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 20:08:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29K8F9c018285
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 14:08:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489090095;
	bh=nNUuKSdM0BW2t+utBd6LyC1O/9W8yMFXvGFvGu7PDBw=;
	h=From:To:Subject:Date;
	b=CBWaCtaRPKTXk3cG9xHd01d6Ei5wS99I4MQo4gOQ8YmyCSYpgaXgO+BMjT/86b6hy
	wf5XKd/wdgfIijDezU5m15FvB2uJ4OXwfk3KybQuxKRnnvAjf3IG3jWp9btrYBZPew
	L+BWHG5uAWpYDQivRQm7UYrGgSxOLe8gJ4nfzT44=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29K8ASl004904
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 14:08:10 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 14:08:09 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29K89Nl024535	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 14:08:09 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 15:08:07 -0500
Message-ID: <1489090087-35884-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty][PATCH] weston: fix virtual keyboard display issue of QT5 applications
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
X-List-Received-Date: Thu, 09 Mar 2017 20:08:25 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend      | 3 ++-
 .../0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch    | 0
 2 files changed, 2 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-graphics/wayland/{weston => weston_update}/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch (100%)

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
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch b/meta-arago-distro/recipes-graphics/wayland/weston_update/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
rename to meta-arago-distro/recipes-graphics/wayland/weston_update/0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
-- 
1.9.1


