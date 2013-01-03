Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f174.google.com (mail-gg0-f174.google.com
	[209.85.161.174])
	by arago-project.org (Postfix) with ESMTPS id 80CF2529AA
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:17:49 +0000 (UTC)
Received: by mail-gg0-f174.google.com with SMTP id k2so2464509ggd.33
	for <meta-arago@arago-project.org>;
	Thu, 03 Jan 2013 12:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=2zofRYn5EbLiXE6Pmp9EBYc0fYX+FFQgVku9ZwvTmCA=;
	b=P4dAmWflASWaAQLH5iE+RlGf28sqYi45CXXtPYmnNHVCLawyrzHcaUQFDAjZfkhJMj
	tgSwCvJq83Xyk5p3aZ9OVj7IQM1Tz4mgZdNxpAdR2rK8IxqrCheovmt3o8YZX4ug33Lh
	b4dIv2aD6Zh1M+e7UCdqnauDGKn+A/2GbLhQahTlIOt41h0GVojxf4sIhki9i+H4JG0g
	IkL2LoK2RjUgPOnrZ1jrpaKGdmA5im/sbTOytl1QFsei/ZJOQzKNzpunIbGKn+EUqW0Q
	NpzmxZl2tTA9DR6A0qmL4Ofh7VfWJreH+5z21u83c3Mc79SfdAWBoUEsQrTU28jOEZNH
	7lNg==
X-Received: by 10.101.41.8 with SMTP id t8mr15014788anj.35.1357244269001;
	Thu, 03 Jan 2013 12:17:49 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a9sm38275442anb.6.2013.01.03.12.17.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:17:47 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  3 Jan 2013 14:17:38 -0600
Message-Id: <1357244261-22829-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] m4-native: Remove remote-gets.patch from meta-arago
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
X-List-Received-Date: Thu, 03 Jan 2013 20:17:49 -0000

* Patch "gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16"
  in oe-core denzil adds the remove-gets.patch to the SRC_URI of m4-1.4.16.inc.
* Therefore, there is no need to include the patch or bbappends in meta-arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../m4/m4-native/remove-gets.patch                 |   21 --------------------
 .../recipes-devtools/m4/m4-native_1.4.16.bbappend  |    5 ----
 2 files changed, 0 insertions(+), 26 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-devtools/m4/m4-native/remove-gets.patch
 delete mode 100644 meta-arago-distro/recipes-devtools/m4/m4-native_1.4.16.bbappend

diff --git a/meta-arago-distro/recipes-devtools/m4/m4-native/remove-gets.patch b/meta-arago-distro/recipes-devtools/m4/m4-native/remove-gets.patch
deleted file mode 100644
index 9c396d9..0000000
--- a/meta-arago-distro/recipes-devtools/m4/m4-native/remove-gets.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-eglibc has remove gets starting 2.16
-therefore check for its being there before 
-undefining it.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: m4-1.4.16/lib/stdio.in.h
-===================================================================
---- m4-1.4.16.orig/lib/stdio.in.h	2011-03-01 08:39:29.000000000 -0800
-+++ m4-1.4.16/lib/stdio.in.h	2012-07-03 08:32:08.145935928 -0700
-@@ -161,8 +161,10 @@
- /* It is very rare that the developer ever has full control of stdin,
-    so any use of gets warrants an unconditional warning.  Assume it is
-    always declared, since it is required by C89.  */
-+#if defined gets
- #undef gets
- _GL_WARN_ON_USE (gets, "gets is a security hole - use fgets instead");
-+#endif
- 
- #if @GNULIB_FOPEN@
- # if @REPLACE_FOPEN@
diff --git a/meta-arago-distro/recipes-devtools/m4/m4-native_1.4.16.bbappend b/meta-arago-distro/recipes-devtools/m4/m4-native_1.4.16.bbappend
deleted file mode 100644
index f44c927..0000000
--- a/meta-arago-distro/recipes-devtools/m4/m4-native_1.4.16.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-SRC_URI += "file://remove-gets.patch"
-- 
1.7.0.4


