Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 83730529AF
	for <meta-arago@arago-project.org>;
	Mon,  7 Oct 2013 19:01:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUB00CCKBH2I6J0@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 07 Oct 2013 14:00:38 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 20F25201AC; Mon,
	07 Oct 2013 15:00:38 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 07 Oct 2013 15:00:19 -0400
Message-id: <1381172427-18302-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
In-reply-to: <1381172427-18302-1-git-send-email-denis@denix.org>
References: <1381172427-18302-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/12] icu: disable LDFLAGSICUDT that prevents loading libicudata.so
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
X-List-Received-Date: Mon, 07 Oct 2013 19:01:03 -0000

From: Denys Dmytriyenko <denys@ti.com>

It seems there is a problem loading libicudata.so library (on ARM?) when it's
built with default -nodefaultlibs and -nostdlib LDFLAGS, disable them.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin S. Cooper Jr <fcooper@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
---
 .../recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch  | 12 ++++++++++++
 meta-arago-distro/recipes-support/icu/icu_51.2.bb            |  3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch

diff --git a/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch b/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch
new file mode 100644
index 0000000..b26d388
--- /dev/null
+++ b/meta-arago-distro/recipes-support/icu/icu-51.2/disable-ldflagsicudt.patch
@@ -0,0 +1,12 @@
+diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
+--- icu-orig/config/mh-linux	2013-05-23 16:02:40.000000000 -0400
++++ icu/config/mh-linux	2013-09-30 00:19:13.772269345 -0400
+@@ -21,7 +21,7 @@
+ LD_RPATH_PRE = -Wl,-rpath,
+ 
+ ## These are the library specific LDFLAGS
+-LDFLAGSICUDT=-nodefaultlibs -nostdlib
++#LDFLAGSICUDT=-nodefaultlibs -nostdlib
+ 
+ ## Compiler switch to embed a library name
+ # The initial tab in the next line is to prevent icu-config from reading it.
diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bb b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
index 1278d22..9a6fd70 100644
--- a/meta-arago-distro/recipes-support/icu/icu_51.2.bb
+++ b/meta-arago-distro/recipes-support/icu/icu_51.2.bb
@@ -2,11 +2,12 @@ require icu.inc
 
 LIC_FILES_CHKSUM = "file://../license.html;md5=443a74288a72fad9069a74e7637192c1"
 
-PR = "r0"
+PR = "r1"
 
 BASE_SRC_URI = "http://download.icu-project.org/files/icu4c/${PV}/icu4c-51_2-src.tgz"
 SRC_URI = "${BASE_SRC_URI} \
            file://icu-pkgdata-large-cmd.patch \
+           file://disable-ldflagsicudt.patch \
           "
 
 SRC_URI[md5sum] = "072e501b87065f3a0ca888f1b5165709"
-- 
1.8.3.2


