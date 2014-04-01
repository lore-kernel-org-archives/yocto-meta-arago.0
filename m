Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 3123A52A5B
	for <meta-arago@arago-project.org>;
	Tue,  1 Apr 2014 03:06:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3C000620LVG090@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 31 Mar 2014 22:05:56 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C48C820182; Mon,
	31 Mar 2014 23:05:55 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 31 Mar 2014 23:05:38 -0400
Message-id: <1396321538-12363-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
In-reply-to: <1396321538-12363-1-git-send-email-denis@denix.org>
References: <1396321538-12363-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] arago.conf: additional configuration to enable Wayland/Weston
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
X-List-Received-Date: Tue, 01 Apr 2014 03:06:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Select mesa-gl as a preferred provider of OpenGL (but not GLES), required by Weston
* Set distro features to configure Wayland/Weston to use KMS and fbdev compositors

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf              | 4 ++++
 meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 601c30c..798dd49 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -22,6 +22,10 @@ NO32LIBS = "0"
 # Set our distro features, don't forget all the standard libc ones
 DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
 
+# Set additional distro features to enable Wayland and Weston
+DISTRO_FEATURES += "opengl"
+PACKAGECONFIG_pn-weston = "kms fbdev"
+
 # ARM9 is not supported by the Linaro toolchain so default back to the Arago
 # toolchain for ARM9 based SOCs.
 TC_SANE_DEFAULT := "${@bb.utils.contains('SOC_FAMILY','omapl138','arago','linaro',d)}"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 366db42..6ae11e9 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -44,6 +44,9 @@ PREFERRED_PROVIDER_virtual/egl = "libgles-omap3"
 PREFERRED_PROVIDER_virtual/libgles1 = "libgles-omap3"
 PREFERRED_PROVIDER_virtual/libgles2 = "libgles-omap3"
 
+PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
+PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
+
 # Use latest TI staging kernel and u-boot trees
 PREFERRED_VERSION_linux-libc-headers_am335x-evm = "3.10"
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-ti-staging"
-- 
1.9.1


