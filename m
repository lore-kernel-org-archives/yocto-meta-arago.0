Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 849C15203A
	for <meta-arago@arago-project.org>;
	Fri, 22 Jan 2016 17:47:13 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1D00ARH81ZPPJ0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 22 Jan 2016 11:47:00 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8
	a=hOrLMiWP5yuW7MMXINYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CE2BA161DFD;	Fri,
	22 Jan 2016 12:46:47 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 22 Jan 2016 12:46:46 -0500
Message-id: <1453484806-10950-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] weston: disable required opengl feature due to mesa/libgbm conflicts
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
X-List-Received-Date: Fri, 22 Jan 2016 17:47:13 -0000

From: Denys Dmytriyenko <denys@ti.com>

Follow up with upstream to properly resolve this in the future.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/include/arago-prefs.inc      | 3 +++
 meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index a1213ec..ec6238d 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -39,16 +39,19 @@ PREFERRED_PROVIDER_virtual/egl_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles1_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles2_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_libgbm_omap-a15 = "libgbm"
+PREFERRED_PROVIDER_libgbm-dev_omap-a15 = "libgbm-dev"
 
 PREFERRED_PROVIDER_virtual/egl_ti43x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles1_ti43x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles2_ti43x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_libgbm_ti43x = "libgbm"
+PREFERRED_PROVIDER_libgbm-dev_ti43x = "libgbm-dev"
 
 PREFERRED_PROVIDER_virtual/egl_ti33x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles1_ti33x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles2_ti33x = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_libgbm_ti33x = "libgbm"
+PREFERRED_PROVIDER_libgbm-dev_ti33x = "libgbm-dev"
 
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
index e14ea9d..439b279 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.9.0.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "9c1b03f3184fa0b0dfdf67e215048085156e1a2ca344af6613fed36794
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
-REQUIRED_DISTRO_FEATURES = "opengl"
+#REQUIRED_DISTRO_FEATURES = "opengl"
 
 DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
 DEPENDS += "wayland libinput virtual/egl pango"
-- 
2.2.0


