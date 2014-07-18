Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 863D252ABD
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X005D88F4AHR0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:16 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ECA6B21CF3; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:55 -0400
Message-id: <1405709522-404-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/11] weston: set default fbdev backend automatically when building for it
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:32 -0000

From: Denys Dmytriyenko <denys@ti.com>

Otherwise the default is always DRM/KMS

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
index 5213166..7a3d2ae 100644
--- a/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.4.0.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/l
 # Headless Weston
 PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
 # Weston on framebuffer
-PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 # weston-launch
 PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam drm"
 # VA-API desktop recorder
-- 
2.0.0


