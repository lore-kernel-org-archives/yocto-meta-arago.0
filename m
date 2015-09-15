Return-Path: <jake@udd0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 582D452979
	for <meta-arago@arago-project.org>;
	Tue, 15 Sep 2015 16:42:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8FGggYY030086
	for <meta-arago@arago-project.org>; Tue, 15 Sep 2015 11:42:42 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8FGgf9m026590
	for <meta-arago@arago-project.org>; Tue, 15 Sep 2015 11:42:42 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Sep 2015 11:42:42 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8FGgfcZ008313;
	Tue, 15 Sep 2015 11:42:41 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1ZbtJY-0005MI-V5; Tue, 15 Sep 2015 12:42:41 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 15 Sep 2015 12:42:36 -0400
Message-ID: <1442335356-20564-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-tisdk-makefile: Fix CROSS_COMPILE path in Rules.make
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
X-List-Received-Date: Tue, 15 Sep 2015 16:42:44 -0000
Content-Type: text/plain

* Previously, the path was hardcoded for the 32-bit devkit.
* Fix by using SDKMACHINE in the path

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make       | 2 +-
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb           | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
index 9070781..f3c36e4 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Rules.make
@@ -21,7 +21,7 @@ DESTDIR=__DESTDIR__
 export LINUX_DEVKIT_PATH=$(TI_SDK_PATH)/linux-devkit
 
 #Cross compiler prefix
-export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/sysroots/i686-arago-linux/usr/bin/__TOOLCHAIN_PREFIX__
+export CROSS_COMPILE=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/bin/__TOOLCHAIN_PREFIX__
 
 #Default CC value to be used when cross compiling.  This is so that the
 #GNU Make default of "cc" is not used to point to the host compiler
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 4e0d190..a770117 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -41,7 +41,7 @@ SRC_URI = "\
     file://Makefile_omapdrm-pvr \
 "
 
-PR = "r50"
+PR = "r51"
 
 MAKEFILES_COMMON = "linux \
                     matrix-gui \
@@ -215,6 +215,7 @@ do_install () {
     sed -i -e "s/__TOOLCHAIN_PREFIX__/${TOOLCHAIN_SYS}-/" ${D}/Rules.make
     sed -i -e "s/__UBOOT_MACHINE__/${UBOOT_MACHINE}/" ${D}/Rules.make
     sed -i -e "s/__CFLAGS__/${TARGET_CC_ARCH}/" ${D}/Rules.make
+    sed -i -e "s/__SDKMACHINE__/${SDKMACHINE}/" ${D}/Rules.make
 
 }
 
-- 
1.9.1


