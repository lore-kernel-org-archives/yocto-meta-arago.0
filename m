Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 6F18D52A51
	for <meta-arago@arago-project.org>;
	Wed,  6 Aug 2014 22:53:57 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9W00D3XQ9R24B0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 06 Aug 2014 17:53:52 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4661921111; Wed,
	06 Aug 2014 18:53:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 06 Aug 2014 18:53:47 -0400
Message-id: <1407365627-29059-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1407365627-29059-1-git-send-email-denis@denix.org>
References: <1407365627-29059-1-git-send-email-denis@denix.org>
Subject: [PATCH 4/4] arago.conf: cleanup and document additional package configuration
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
X-List-Received-Date: Wed, 06 Aug 2014 22:54:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4927fe9..0074b8b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -19,17 +19,20 @@ NO32LIBS = "0"
 # Set our distro features, don't forget all the standard libc ones
 DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
 
-# Set additional distro features to enable Wayland and Weston
+# Set additional distro features
 DISTRO_FEATURES += "opengl pam"
+
+# Set preferred Qt version
+QT_PROVIDER = "qt5"
+
+# Distro-specific package configuration
+# Weston - use fbdev compositor and provide launcher
 PACKAGECONFIG_pn-weston = "fbdev launch"
 
 # Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
 PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
 
-# Set preferred Qt version
-QT_PROVIDER = "qt5"
-
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
-- 
2.0.4


