Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id E18BE52A97
	for <meta-arago@arago-project.org>;
	Wed, 15 May 2013 03:54:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4F3slMu005365
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4F3sljs014521
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 22:54:47 -0500
Received: from dlelxv23.itg.ti.com (172.17.1.198) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 22:54:46 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlelxv23.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4F3sXkS004084;
	Tue, 14 May 2013 22:54:45 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 22:54:25 -0500
Message-ID: <1368590069-6700-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1368590069-6700-1-git-send-email-fcooper@ti.com>
References: <1368590069-6700-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 5/9] wpa-gui-e: Fix "was not declared in this scope" compiler error
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
X-List-Received-Date: Wed, 15 May 2013 03:54:48 -0000
Content-Type: text/plain

* Newer toolchains are alot stricter. Add in header file to satisfy newer
  toolchains.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...was-not-declared-in-this-scope-when-using.patch |   39 ++++++++++++++++++++
 .../wpa-supplicant/wpa-gui-e_git.bb                |    5 ++-
 2 files changed, 42 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch
new file mode 100644
index 0000000..e6bc83a
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e/0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch
@@ -0,0 +1,39 @@
+From 8c707dd7af988ea29b569f42a8c462c86d65817b Mon Sep 17 00:00:00 2001
+From: Franklin S. Cooper Jr <fcooper@ti.com>
+Date: Fri, 10 May 2013 10:43:36 -0500
+Subject: [PATCH] wpagui: Fix was not declared in this scope when using gcc 4.7 based toolchain
+
+* Adding missing header to fix the following errors:
+    error: 'getopt' was not declared in this scope
+    error: 'optarg' was not declared in this scope
+
+Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
+---
+ wpagui.cpp |    5 +----
+ 1 files changed, 1 insertions(+), 4 deletions(-)
+
+diff --git a/wpagui.cpp b/wpagui.cpp
+index 97bf5ac..4b5ec23 100644
+--- a/wpagui.cpp
++++ b/wpagui.cpp
+@@ -12,16 +12,13 @@
+  * See README and COPYING for more details.
+  */
+ 
+-#ifdef __MINGW32__
+-/* Need to get getopt() */
+-#include <unistd.h>
+-#endif
+ 
+ #ifdef CONFIG_NATIVE_WINDOWS
+ #include <windows.h>
+ #endif /* CONFIG_NATIVE_WINDOWS */
+ 
+ #include <cstdio>
++#include <unistd.h>
+ #include <QMessageBox>
+ #include <QCloseEvent>
+ #include <QImageReader>
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
index 1f9b2d1..3e7415f 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-gui-e_git.bb
@@ -10,11 +10,12 @@ LIC_FILES_CHKSUM = "file://../../COPYING;md5=c54ce9345727175ff66d17b67ff51f58 \
 "
 
 PV = "0.7.3+0.8.0-rc"
-PR = "r0+gitr${SRCPV}"
+PR = "r1+gitr${SRCPV}"
 
 SRCREV = "653c4893be17d12ef7bc6e941b765c92c1e4a161"
 
-SRC_URI = "git://w1.fi/srv/git/hostap.git;protocol=git"
+SRC_URI = "git://w1.fi/srv/git/hostap.git;protocol=git \
+           file://0001-wpagui-Fix-was-not-declared-in-this-scope-when-using.patch"
 
 S = "${WORKDIR}/git/wpa_supplicant/wpa_gui-qt4"
 
-- 
1.7.0.4


