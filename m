Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 60B6652A23
	for <meta-arago@arago-project.org>;
	Fri, 18 Jul 2014 18:52:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N8X001ZV8F4XY10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 18 Jul 2014 13:52:29 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id E9908214E1; Fri,
	18 Jul 2014 14:52:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Jul 2014 14:51:54 -0400
Message-id: <1405709522-404-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1405709522-404-1-git-send-email-denis@denix.org>
References: <1405709522-404-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/11] arago.conf: re-enable gles2 flag for qt5 builds
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
X-List-Received-Date: Fri, 18 Jul 2014 18:52:29 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index b9af13f..def7a42 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -23,9 +23,8 @@ DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbh
 DISTRO_FEATURES += "opengl"
 PACKAGECONFIG_pn-weston = "kms fbdev"
 
-# Configure Qt5 flags (GLES is disabled for now)
-#PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
-PACKAGECONFIG_GL_pn-qtbase = "linuxfb"
+# Configure Qt5 flags (GLES is still required for qtdeclarative and qtwebkit)
+PACKAGECONFIG_GL_pn-qtbase = "gles2 linuxfb"
 PACKAGECONFIG_DISTRO_pn-qtbase = "icu"
 
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
-- 
2.0.0


