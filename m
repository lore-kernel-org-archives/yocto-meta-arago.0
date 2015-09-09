Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 2E0485209B
	for <meta-arago@arago-project.org>;
	Wed,  9 Sep 2015 21:16:19 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NUF00KS3HQQTM60@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Sep 2015 16:16:03 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=ff-B7xzCdYMA:10 a=sozttTNsAAAA:8
	a=hi-mOv-t5pMd3ZjA8EkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D6199161BCB;	Wed,
	9 Sep 2015 17:16:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Sep 2015 17:16:02 -0400
Message-id: <1441833362-8917-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] switch-config: update to the latest version
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
X-List-Received-Date: Wed, 09 Sep 2015 21:16:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ig.c-include-stdbool.h-to-define-bool-typ.patch | 25 ----------------------
 .../recipes-bsp/switch-config/switch-config_git.bb | 11 +++++-----
 2 files changed, 5 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch

diff --git a/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch b/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch
deleted file mode 100644
index ec5e1db..0000000
--- a/meta-arago-extras/recipes-bsp/switch-config/files/0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 42c76d70760a8b0d19a4126d3c53578f5f5b3606 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Sun, 21 Dec 2014 14:18:46 -0500
-Subject: [PATCH] switch-config.c: include stdbool.h to define bool type
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- switch-config.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/switch-config.c b/switch-config.c
-index d49cac7..0d1f9f9 100644
---- a/switch-config.c
-+++ b/switch-config.c
-@@ -19,6 +19,7 @@
- #include <string.h>
- #include <ctype.h>
- #include <stddef.h>
-+#include <stdbool.h>
- #include <getopt.h>
- #include <sys/ioctl.h>
- #include <net/if.h>
--- 
-2.2.0
-
diff --git a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
index d233599..cf2ccdd 100644
--- a/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
+++ b/meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb
@@ -4,16 +4,15 @@ LIC_FILES_CHKSUM = "file://switch-config.c;beginline=1;endline=14;md5=659ff9658c
 
 DEPENDS = "virtual/kernel"
 
-PV = "1.1"
-PR = "r1"
+PV = "2.0"
+PR = "r0"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH ?= "master"
-SRCREV = "75791ba7f835530f2a10c889977d92e9175faa34"
+BRANCH ?= "v4.1"
+SRCREV = "669334329dff132c4a093351d48252b12e995b6c"
 
-SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH} \
-           file://0001-switch-config.c-include-stdbool.h-to-define-bool-typ.patch"
+SRC_URI = "git://git.ti.com/switch-config/switch-config.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.2.0


