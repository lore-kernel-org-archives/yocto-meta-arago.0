Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id CF3BC52979
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 22:20:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NB3000PHA0ZE500@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Aug 2014 17:19:57 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2CED420085; Fri,
	29 Aug 2014 18:19:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Aug 2014 18:19:47 -0400
Message-id: <1409350787-5342-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] arago.conf: prevent pulling mesa/mesa-gl into the build
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
X-List-Received-Date: Fri, 29 Aug 2014 22:20:15 -0000

From: Denys Dmytriyenko <denys@ti.com>

Now that all platforms have their respective GLES libraries enabled, there's
no reason to enable "opengl" distro feature anymore.
Select preferred provider for libgbm on omap-a15 platforms.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              | 2 +-
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 17f3c3d..c86b255 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -20,7 +20,7 @@ NO32LIBS = "0"
 DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
 
 # Set additional distro features
-DISTRO_FEATURES += "opengl pam"
+DISTRO_FEATURES += "pam"
 
 # Set preferred Qt version
 QT_PROVIDER = "qt5"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index fbbf904..510ca3c 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -47,6 +47,7 @@ PREFERRED_PROVIDER_virtual/libgles2 = "libgles-omap3"
 PREFERRED_PROVIDER_virtual/egl_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles1_omap-a15 = "omap5-sgx-ddk-um-linux"
 PREFERRED_PROVIDER_virtual/libgles2_omap-a15 = "omap5-sgx-ddk-um-linux"
+PREFERRED_PROVIDER_libgbm_omap-a15 = "libgbm"
 
 PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
 PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
-- 
2.0.4


