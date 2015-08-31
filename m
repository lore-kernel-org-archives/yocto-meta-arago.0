Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 96D0952094
	for <meta-arago@arago-project.org>;
	Mon, 31 Aug 2015 17:02:26 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTY009IHHZEFF10@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 31 Aug 2015 12:02:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=uRRa74qj2VoA:10 a=sozttTNsAAAA:8
	a=egt8tntDSJK_np_zHJsA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B4679161BC9;	Mon,
	31 Aug 2015 13:02:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 31 Aug 2015 13:02:00 -0400
Message-id: <1441040521-4327-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] Revert "weston: don't make fbdev compositor default when enabled"
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
X-List-Received-Date: Mon, 31 Aug 2015 17:02:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 6f3c83ac23a05ed63deffbbb7b13b6ecc4fd1f74.
---
 meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
index 57505a0..af504b4 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.6.0.bbappend
@@ -1,6 +1,8 @@
+# When configured for fbdev compositor, make it the default
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor WESTON_NATIVE_BACKEND="fbdev-backend.so",--disable-fbdev-compositor,udev mtdev"
 PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
 
-PR_append = "-arago5"
+PR_append = "-arago6"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
2.2.0


