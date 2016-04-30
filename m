Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 1976952004
	for <meta-arago@arago-project.org>;
	Sat, 30 Apr 2016 01:20:01 +0000 (UTC)
Received: from vz-proxy-l005.mx.aol.com ([64.236.82.152])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6F00EJ4ACSFU50@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 29 Apr 2016 20:19:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=Ur62FL3oYWbrJEDz5v4A:9
Received: by 100.15.86.14 with SMTP id 5b4d9e14; Sat, 30 Apr 2016 01:19:45 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 3A2E1161FD0;	Fri,
	29 Apr 2016 21:19:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 29 Apr 2016 21:19:39 -0400
Message-id: <1461979179-7317-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf, images, packagegroups: add systemd initial support
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
X-List-Received-Date: Sat, 30 Apr 2016 01:20:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf               | 18 +++++++++++++-----
 meta-arago-distro/conf/distro/include/arago-prefs.inc  |  8 --------
 meta-arago-distro/recipes-core/images/arago-image.inc  |  5 -----
 .../packagegroup-arago-standalone-sdk-target.bb        |  3 +--
 4 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 409b96a..de6064e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -28,13 +28,21 @@ IMAGE_FSTYPES += "tar.gz.md5 tar.xz.md5"
 # Also build 32bit Pseudo on 64bit machines, fix error when preloading libpseudo.so
 NO32LIBS = "0"
 
-# Set our distro features, don't forget all the standard libc ones
-DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
-DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5"
+# Start with default set of distro features
+DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
-# Set additional distro features
-DISTRO_FEATURES += "pam wayland opengl"
+# Remove some unwanted features
+DISTRO_FEATURES_remove = "x11"
+DISTRO_FEATURES_BACKFILL_CONSIDERED = "bluez5 sysvinit"
 
+# Add additional distro features
+DISTRO_FEATURES_append = " pam wayland opengl systemd"
+
+# Set global runtime providers for major components
+VIRTUAL-RUNTIME_dev_manager = "systemd"
+VIRTUAL-RUNTIME_init_manager = "systemd"
+VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
+VIRTUAL-RUNTIME_login_manager = "busybox shadow"
 
 # Set preferred Qt version
 QT_PROVIDER ?= "qt5"
diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index b64d0d3..14a7c8a 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -45,10 +45,6 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 PREFERRED_VERSION_u-boot-ti-staging = "2016.05%"
 
-# Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
-PREFERRED_VERSION_eudev = "3.1.5"
-PREFERRED_PROVIDER_eudev = "eudev"
-
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 
 # Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
@@ -70,7 +66,3 @@ PREFERRED_PROVIDER_wpa-supplicant = "wpa-supplicant"
 PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
-
-def filter_out(f, str, d):
-    from re import match
-    return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index c14a5ee..7fb5726 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -8,11 +8,6 @@ IMAGE_FEATURES += "package-management splash"
 # 4KB per 1 inode should be enough
 EXTRA_IMAGECMD_ext2.gz += "-i 4096"
 
-VIRTUAL-RUNTIME_dev_manager = "udev"
-VIRTUAL-RUNTIME_init_manager = "sysvinit"
-VIRTUAL-RUNTIME_initscripts = "initscripts"
-VIRTUAL-RUNTIME_login_manager = "tinylogin shadow"
-
 ARAGO_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL += " \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
index e9a0e0b..e2f4f50 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r11"
+PR = "r12"
 LICENSE = "MIT"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -31,7 +31,6 @@ RDEPENDS_${PN} = "\
     zlib-dev \
     ncurses-dev \
     opkg-dev \
-    sysvinit-dev \
     util-linux-dev \
     ${@base_conditional('TCMODE', 'external-linaro', 'libgomp-dev', '', d)} \
     "
-- 
2.2.0


