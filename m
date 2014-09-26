Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id F1F54529EA
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:32 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI00FB2M83DL60@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:07 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8B2FE20654; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:36 -0400
Message-id: <1411746038-21612-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 5/7] weston_1.4.0.bbappend: remove no longer needed bbappend
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston_1.4.0.bbappend    | 19 -------------------
 1 file changed, 19 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
deleted file mode 100644
index e62cfa3..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.4.0.bbappend
+++ /dev/null
@@ -1,19 +0,0 @@
-PR_append = "-arago2"
-
-# When configured for fbdev compositor, make it the default
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://wayland_env.sh"
-
-# Add custom Arago Wayland Environment script file
-do_install_append () {
-    install -d ${D}${sysconfdir}/profile.d
-    install -m 0644 ${WORKDIR}/wayland_env.sh ${D}${sysconfdir}/profile.d/
-}
-
-PACKAGES += "${PN}-conf"
-
-FILES_${PN}-conf += "${sysconfdir}/profile.d/*"
-RDEPENDS_${PN} += "${PN}-conf"
-- 
2.0.4


