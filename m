Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id D917E52972
	for <meta-arago@arago-project.org>;
	Tue,  8 Apr 2014 15:21:35 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3P00DE7XBV78O0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 08 Apr 2014 10:21:31 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0C0AA200AC; Tue,
	08 Apr 2014 11:21:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 08 Apr 2014 11:21:30 -0400
Message-id: <1396970490-17670-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] arago.conf: unbreak internal toolchain by updating STAGING_BINDIR_TOOLCHAIN
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
X-List-Received-Date: Tue, 08 Apr 2014 15:21:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is due to our PACKAGE_ARCH containing linux-libc-headers version and
some toolchain components cannot be found during bootstrap, so fix the path.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 798dd49..cc3cedf 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -74,3 +74,5 @@ LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
 PACKAGE_ARCH := "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
 # Need to include the new PACKAGE_ARCH to the PACKAGE_ARCHS variable
 PACKAGE_ARCHS += "${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}"
+# Adjust some vars accordingly
+STAGING_BINDIR_TOOLCHAIN = "${STAGING_DIR_NATIVE}${bindir_native}/${TUNE_PKGARCH}-${PREFERRED_VERSION_linux-libc-headers}${TARGET_VENDOR}-${TARGET_OS}"
-- 
1.9.1


