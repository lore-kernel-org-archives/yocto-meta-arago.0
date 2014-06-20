Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 3707452A6A
	for <meta-arago@arago-project.org>;
	Fri, 20 Jun 2014 17:57:22 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7H0076GB7BVM40@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 20 Jun 2014 12:57:12 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 70C0B24A72; Fri,
	20 Jun 2014 13:57:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 20 Jun 2014 13:56:38 -0400
Message-id: <1403287009-11256-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1403287009-11256-1-git-send-email-denis@denix.org>
References: <1403287009-11256-1-git-send-email-denis@denix.org>
Subject: [PATCH 08/19] icu: remove bbappend and patch to disable LDFLAGSICUDT, applied upstream
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
X-List-Received-Date: Fri, 20 Jun 2014 17:57:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/icu/icu/disable-ldflagsicudt.patch       | 12 ------------
 meta-arago-distro/recipes-support/icu/icu_51.2.bbappend      |  5 -----
 2 files changed, 17 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-support/icu/icu/disable-ldflagsicudt.patch
 delete mode 100644 meta-arago-distro/recipes-support/icu/icu_51.2.bbappend

diff --git a/meta-arago-distro/recipes-support/icu/icu/disable-ldflagsicudt.patch b/meta-arago-distro/recipes-support/icu/icu/disable-ldflagsicudt.patch
deleted file mode 100644
index b26d388..0000000
--- a/meta-arago-distro/recipes-support/icu/icu/disable-ldflagsicudt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -uNr icu-orig/config/mh-linux icu/config/mh-linux
---- icu-orig/config/mh-linux	2013-05-23 16:02:40.000000000 -0400
-+++ icu/config/mh-linux	2013-09-30 00:19:13.772269345 -0400
-@@ -21,7 +21,7 @@
- LD_RPATH_PRE = -Wl,-rpath,
- 
- ## These are the library specific LDFLAGS
--LDFLAGSICUDT=-nodefaultlibs -nostdlib
-+#LDFLAGSICUDT=-nodefaultlibs -nostdlib
- 
- ## Compiler switch to embed a library name
- # The initial tab in the next line is to prevent icu-config from reading it.
diff --git a/meta-arago-distro/recipes-support/icu/icu_51.2.bbappend b/meta-arago-distro/recipes-support/icu/icu_51.2.bbappend
deleted file mode 100644
index f812148..0000000
--- a/meta-arago-distro/recipes-support/icu/icu_51.2.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-SRC_URI += "file://disable-ldflagsicudt.patch"
-- 
2.0.0


