Return-Path: <anandb@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id E533252A77
	for <meta-arago@arago-project.org>;
	Wed,  8 Mar 2017 07:58:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v287wXjQ007151
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 01:58:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488959913;
	bh=G2uPsFD5L6zrdAIXy729sEiOdNbpSq/3eyCCFbeOpjg=;
	h=From:To:CC:Subject:Date;
	b=c28Zw+SEx0Jxqi75TvKBmGUG+DH0Wn0jYBq2o7aUqRIueRZUcYbkxBOy6j/HgoJ15
	e5TfAQzcfywXgj8W98/EDujJ4Y3Bx6Mw94tErzBGGzj281tkm9/uzUycL1NCZhU8q/
	dDyUJAz59Cb3LKHTAW1+0MVW4rIUOHUfahKWvvu4=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v287wSD9014796
	for <meta-arago@arago-project.org>; Wed, 8 Mar 2017 01:58:28 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 01:58:28 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v287wRup029944;
	Wed, 8 Mar 2017 01:58:27 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Mar 2017 13:28:25 +0530
Message-ID: <1488959905-187610-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] weston: restrict udev enumeration to /dev/dri/card0
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
X-List-Received-Date: Wed, 08 Mar 2017 07:58:44 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../wayland/weston_1.11.0.bbappend                 | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index d0691ad..36585bd 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -2,19 +2,20 @@
 PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = ".arago16"
+PR_append = ".arago17"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-#SRC_URI += " \
-#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
-#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
-#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
-#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
-#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-#	file://0001-Add-soc-performance-monitor-utilites.patch \
-#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
-#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
-#"
+
+SRC_URI += " \
+	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+"
+#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch
+#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch
+#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch
+#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch
+#	file://0001-Add-soc-performance-monitor-utilites.patch
+#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
+#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
-- 
1.9.1


