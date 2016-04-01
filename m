Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id F121152A8B
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:52:02 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.153])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X0069ES2BDF30@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:51:48 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=tHoVJYAslwCI2Lp5fK4A:9
Received: by 100.15.86.14 with SMTP id 42420126; Fri, 01 Apr 2016 03:51:47 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 32AAB161F70;	Thu,
	31 Mar 2016 23:41:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:44 -0400
Message-id: <1459482106-27723-25-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 24/26] arago-prefs: update toolchain preferences, drop gstreamer 0.10
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
X-List-Received-Date: Fri, 01 Apr 2016 03:52:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../conf/distro/include/arago-prefs.inc            | 27 ++++++----------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
index 8acd156..4a02e79 100644
--- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
+++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
@@ -1,10 +1,10 @@
 # Set *target* toolchain preferences at global distro level.
 # Cross and SDK toolchain preferences are set in toolchain-*.inc files
-GCCVERSION ?= "linaro-4.9%"
+GCCVERSION ?= "linaro-5.2%"
 BINUVERSION ?= "linaro-2.25%"
-GLIBCVERSION ?= "2.21%"
-GLIBCINITVERSION ?= "2.21%"
-LINUXLIBCVERSION ?= "4.1"
+GLIBCVERSION ?= "2.23%"
+GLIBCINITVERSION ?= "2.23%"
+LINUXLIBCVERSION ?= "4.4"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_binutils ?= "${BINUVERSION}"
@@ -78,8 +78,8 @@ PREFERRED_PROVIDER_u-boot_omap-a15 = "u-boot-ti-staging"
 PREFERRED_VERSION_u-boot-ti-staging = "2015.07%"
 
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
-PREFERRED_VERSION_udev = "182"
-PREFERRED_PROVIDER_udev = "udev"
+PREFERRED_VERSION_eudev = "3.1.5"
+PREFERRED_PROVIDER_eudev = "eudev"
 
 # Set the PREFERRED_PROVIDER for jpeg functionality based on the MACHINE
 # architecture.  For armv7a devices libjpeg-turbo should be used to take
@@ -95,7 +95,7 @@ PREFERRED_VERSION_readline-native = "5.2"
 PREFERRED_VERSION_readline-nativesdk = "5.2"
 
 PREFERRED_VERSION_libnl = "3.2.25"
-PREFERRED_VERSION_crda = "3.13"
+PREFERRED_VERSION_crda = "3.18"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bash = "3.2.48"
 PREFERRED_VERSION_gettext = "0.16.1"
@@ -107,19 +107,6 @@ PREFERRED_PROVIDER_wpa-supplicant_ti33x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_ti43x = "wpa-supplicant-wl18xx"
 PREFERRED_PROVIDER_wpa-supplicant_omap-a15 = "wpa-supplicant-wl18xx"
 
-PREFERRED_PROVIDER_gstreamer = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel', 'gstreamer', d)}"
-PREFERRED_PROVIDER_gstreamer-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dev', 'gstreamer-dev', d)}"
-PREFERRED_PROVIDER_gstreamer-dbg = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gstreamer-mm-accel-dbg', 'gstreamer-dbg', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel', 'gst-plugins-bad', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-dev', 'gst-plugins-bad-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-bad-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-bad-mm-accel-meta', 'gst-plugins-bad-meta', d)}"
-PREFERRED_PROVIDER_gst-plugins-base = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel', 'gst-plugins-base', d)}"
-PREFERRED_PROVIDER_gst-plugins-base-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-dev', 'gst-plugins-base-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-base-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-base-mm-accel-meta', 'gst-plugins-base-meta', d)}"
-PREFERRED_PROVIDER_gst-plugins-good = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel', 'gst-plugins-good', d)}"
-PREFERRED_PROVIDER_gst-plugins-good-dev = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-dev', 'gst-plugins-good-dev', d)}"
-PREFERRED_PROVIDER_gst-plugins-good-meta = "${@base_contains('MACHINE_FEATURES', 'mmip', 'gst-plugins-good-mm-accel-meta', 'gst-plugins-good-meta', d)}"
-
 def filter_out(f, str, d):
     from re import match
     return " ".join(filter(lambda x: not match(f, x, 0), str.split()))
-- 
2.2.0


