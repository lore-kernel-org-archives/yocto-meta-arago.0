Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTPS id 9C16E52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Apr 2016 03:41:51 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.150])
	by vms173013.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4X002NGRLRA050@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 31 Mar 2016 22:41:51 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=0tGySW8maceftNfHUCUfCA==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=mp5G8qmefChaSRYmppUA:9
Received: by 100.15.86.14 with SMTP id 76665ee7; Fri, 01 Apr 2016 03:41:51 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CA063161F60;	Thu,
	31 Mar 2016 23:41:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 31 Mar 2016 23:41:28 -0400
Message-id: <1459482106-27723-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1459482106-27723-1-git-send-email-denis@denix.org>
References: <1459482106-27723-1-git-send-email-denis@denix.org>
Subject: [PATCH 08/26] udev: rename bbappends to eudev, add symlink for libudev.so.0
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
X-List-Received-Date: Fri, 01 Apr 2016 03:41:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Old library name/version is hardcoded in SGX binaries

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../udev/{udev/keystone => eudev/dra7xx}/udev-cache.default            | 0
 .../udev/{udev/dra7xx => eudev/keystone}/udev-cache.default            | 0
 meta-arago-distro/recipes-core/udev/{udev => eudev}/local.rules        | 0
 meta-arago-distro/recipes-core/udev/{udev => eudev}/usb1-rules.sh      | 0
 meta-arago-distro/recipes-core/udev/{udev => eudev}/usb2-rules.sh      | 0
 .../recipes-core/udev/{udev_%.bbappend => eudev_%.bbappend}            | 3 ++-
 6 files changed, 2 insertions(+), 1 deletion(-)
 rename meta-arago-distro/recipes-core/udev/{udev/keystone => eudev/dra7xx}/udev-cache.default (100%)
 rename meta-arago-distro/recipes-core/udev/{udev/dra7xx => eudev/keystone}/udev-cache.default (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/local.rules (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/usb1-rules.sh (100%)
 rename meta-arago-distro/recipes-core/udev/{udev => eudev}/usb2-rules.sh (100%)
 rename meta-arago-distro/recipes-core/udev/{udev_%.bbappend => eudev_%.bbappend} (88%)

diff --git a/meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default b/meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev/keystone/udev-cache.default
rename to meta-arago-distro/recipes-core/udev/eudev/dra7xx/udev-cache.default
diff --git a/meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default b/meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default
rename to meta-arago-distro/recipes-core/udev/eudev/keystone/udev-cache.default
diff --git a/meta-arago-distro/recipes-core/udev/udev/local.rules b/meta-arago-distro/recipes-core/udev/eudev/local.rules
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev/local.rules
rename to meta-arago-distro/recipes-core/udev/eudev/local.rules
diff --git a/meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh b/meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev/usb1-rules.sh
rename to meta-arago-distro/recipes-core/udev/eudev/usb1-rules.sh
diff --git a/meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh b/meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh
similarity index 100%
rename from meta-arago-distro/recipes-core/udev/udev/usb2-rules.sh
rename to meta-arago-distro/recipes-core/udev/eudev/usb2-rules.sh
diff --git a/meta-arago-distro/recipes-core/udev/udev_%.bbappend b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
similarity index 88%
rename from meta-arago-distro/recipes-core/udev/udev_%.bbappend
rename to meta-arago-distro/recipes-core/udev/eudev_%.bbappend
index a84bbd8..4080723 100644
--- a/meta-arago-distro/recipes-core/udev/udev_%.bbappend
+++ b/meta-arago-distro/recipes-core/udev/eudev_%.bbappend
@@ -5,7 +5,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,4 +18,5 @@ do_install_append() {
 
     install -m 0755 ${WORKDIR}/usb1-rules.sh ${D}${bindir}/usb1-rules.sh
     install -m 0755 ${WORKDIR}/usb2-rules.sh ${D}${bindir}/usb2-rules.sh
+    ln -sf libudev.so.1 ${D}${base_libdir}/libudev.so.0
 }
-- 
2.2.0


