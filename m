Return-Path: <a0273011@sdit-build02.dal.design.ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id A176D529CF
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2012 18:19:57 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q7KIJuFp032398
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2012 13:19:56 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q7KIJuga015081
	for <meta-arago@arago-project.org>; Mon, 20 Aug 2012 13:19:56 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 20 Aug 2012 13:19:56 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q7KIJutc021410;	Mon, 20 Aug 2012 13:19:56 -0500
Received: from a0273011 by sdit-build02.dal.design.ti.com with local (Exim
	4.71)	(envelope-from <a0273011@sdit-build02.dal.design.ti.com>)	id
	1T3Wl1-00042r-9T; Mon, 20 Aug 2012 13:31:23 -0500
From: Franklin S Cooper Jr <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 20 Aug 2012 13:31:20 -0500
Message-ID: <1345487480-15513-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Franklin S Cooper Jr <fcooper@ti.com>
Subject: [meta-arago-distro][PATCH] php: Add patch to fix host contamination issue
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
X-List-Received-Date: Mon, 20 Aug 2012 18:19:58 -0000
Content-Type: text/plain

* Add a patch to /etc/iconv/config.m4 that fixes a host contamination
  issue that was detected when building php-native.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
---
 ...1-php-native-Fix-host-contamination-issue.patch |   55 ++++++++++++++++++++
 .../recipes-devtools/php/php_5.3.6.bbappend        |    6 ++
 2 files changed, 61 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host-contamination-issue.patch
 create mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend

diff --git a/meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host-contamination-issue.patch b/meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host-contamination-issue.patch
new file mode 100644
index 0000000..6ad5b63
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/php/php/0001-php-native-Fix-host-contamination-issue.patch
@@ -0,0 +1,55 @@
+From 48350388ab4cb8a0965e7a3f8630bc3f3e3c8d7b Mon Sep 17 00:00:00 2001
+From: Franklin S Cooper Jr <fcooper@ti.com>
+Date: Mon, 20 Aug 2012 07:16:18 -0500
+Subject: [PATCH] php-native: Fix host contamination issue
+
+* Within ext/iconv/config.m4 there is a check in place to try to locate
+  particular header files and if the header files aren't found then a
+  default location is used (/usr/). Both the CFLAGS and LDFLAGS have this
+  default location added to it. This leads to a host contamination issue
+  which propagates to the rest of the entire config/build since CFLAGS and
+  LDFLAGS will use the host's include and lib directory as the first place
+  to check.
+
+* This issue was discovered when the configure was failing due to seeing the
+  following error in the config.log:
+  <path to work dir>/sysroots/x86_64-linux/usr/lib/libxml2.so: undefined reference to
+  gzopen64@ZLIB_1.2.3.3. The /usr/lib directory in /sysroots/x86_64-linux
+  contained zlib 1.2.6 while my host (Ubuntu 10.04) /usr/lib directory had
+  zlib 1.2.3.3
+
+* Deleting the two lines solves that alter the CFLAGS and LDFLAGS fixes this
+  issue. This isn't a valid fix for PHP but should work for OE.
+
+* This issue is in the latest 5.3.x version of php and possibly under 5.4.x.
+
+* Below contains several bug reports that seem to be based on this same issue:
+    https://bugs.php.net/bug.php?id=53443
+    https://bugs.php.net/bug.php?id=61130
+    https://bugs.php.net/bug.php?id=53442
+  None of the suggested fixes seem valid since /usr/ and /usr/local should never
+  be considered a proper default location. A similar type of check is done in
+  several other ext but for some reason only this issue shows up.
+
+Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>
+---
+ ext/iconv/config.m4 |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/ext/iconv/config.m4 b/ext/iconv/config.m4
+index 13e0371..41c2db9 100644
+--- a/ext/iconv/config.m4
++++ b/ext/iconv/config.m4
+@@ -28,9 +28,6 @@ if test "$PHP_ICONV" != "no"; then
+       PHP_ICONV_PREFIX="$ICONV_DIR"
+     fi
+ 
+-    CFLAGS="-I$PHP_ICONV_PREFIX/include $CFLAGS"
+-    LDFLAGS="-L$PHP_ICONV_PREFIX/$PHP_LIBDIR $LDFLAGS"
+-
+     if test -r "$PHP_ICONV_PREFIX/include/giconv.h"; then
+       PHP_ICONV_H_PATH="$PHP_ICONV_PREFIX/include/giconv.h"
+     else
+-- 
+1.7.0.4
+
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
new file mode 100644
index 0000000..0d16ebe
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
@@ -0,0 +1,6 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+SRC_URI += "file://0001-php-native-Fix-host-contamination-issue.patch"
-- 
1.7.0.4


