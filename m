Return-Path: <fcooperjr27@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by arago-project.org (Postfix) with ESMTPS id B396852A61
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:17:51 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id b12so956519yha.28
	for <meta-arago@arago-project.org>;
	Thu, 03 Jan 2013 12:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zM4zcKlg9MS7T095/Ppr4ogfkEqklkxekhfL1eOffeI=;
	b=CULbIFxO47ZgQP1IGlMrEXEGotgqR3AX/qqr9uskE8HTUKUG66+3FOoOUAgoW4y41O
	tPCjH3eee5vGASb5UVHN0waRpKpn10UfYVPEpmBm5+ZBrUujW+40/C9jnO10S6BvCVBM
	gOJh5p+8pNjnuNc2P9amKEWMGYhLSx+sQi1ufii2URjd+vTjW9L2xcvMGR/WQzFaD7Yy
	OdQJQHNoAf7JK+NIdyqvAVNpOUYWLSjkfdkBr+BAfIqRGd456MaoI2lGBuvbtKJn54JJ
	di6mtBJUk1i0NlOq1CFp1nKuqHmpLkYTVxJuH7Ta/9wHWiCF4tN/KHIbz/4+2pgf3nql
	3obw==
X-Received: by 10.236.141.132 with SMTP id g4mr51083324yhj.24.1357244271415;
	Thu, 03 Jan 2013 12:17:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a9sm38275442anb.6.2013.01.03.12.17.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:17:50 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  3 Jan 2013 14:17:39 -0600
Message-Id: <1357244261-22829-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1357244261-22829-1-git-send-email-fcooper@ti.com>
References: <1357244261-22829-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] gettext: Remove remote-gets.patch from meta-arago
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
X-List-Received-Date: Thu, 03 Jan 2013 20:17:51 -0000

* Patch "gettext,m4,augeas,gnutls: Account for removal of gets in eglibc 2.16"
  in oe-core denzil adds the remove-gets.patch to the SRC_URI of m4-1.4.16.inc.
* Therefore, there is no need to include the patch or bbappends in meta-arago.
---
 .../recipes-core/gettext/gettext/remove_gets.patch |   58 --------------------
 .../recipes-core/gettext/gettext_0.18.1.1.bbappend |    5 --
 2 files changed, 0 insertions(+), 63 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-core/gettext/gettext/remove_gets.patch
 delete mode 100644 meta-arago-distro/recipes-core/gettext/gettext_0.18.1.1.bbappend

diff --git a/meta-arago-distro/recipes-core/gettext/gettext/remove_gets.patch b/meta-arago-distro/recipes-core/gettext/gettext/remove_gets.patch
deleted file mode 100644
index 3d3c400..0000000
--- a/meta-arago-distro/recipes-core/gettext/gettext/remove_gets.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-eglibc 2.16 has removed gets so we need to check for it
-being there before using it.
-
-
-From glibc stdio.h
-
-The function has been officially removed in ISO C11.  This opportunity
-   is used to also remove it from the GNU feature list.  It is now only
-   available when explicitly using an old ISO C, Unix, or POSIX standard.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-runtime/gnulib-lib/stdio.in.h	2010-05-17 12:56:12.000000000 -0700
-+++ gettext-0.18.1.1/gettext-runtime/gnulib-lib/stdio.in.h	2012-07-02 22:42:21.292223316 -0700
-@@ -140,8 +140,10 @@
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
-Index: gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/gnulib-lib/stdio.in.h	2010-05-24 02:42:46.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/gnulib-lib/stdio.in.h	2012-07-02 23:02:33.476281979 -0700
-@@ -140,8 +140,10 @@
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
-Index: gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h
-===================================================================
---- gettext-0.18.1.1.orig/gettext-tools/libgettextpo/stdio.in.h	2010-05-17 12:58:03.000000000 -0700
-+++ gettext-0.18.1.1/gettext-tools/libgettextpo/stdio.in.h	2012-07-02 23:01:57.440280253 -0700
-@@ -140,8 +140,10 @@
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
diff --git a/meta-arago-distro/recipes-core/gettext/gettext_0.18.1.1.bbappend b/meta-arago-distro/recipes-core/gettext/gettext_0.18.1.1.bbappend
deleted file mode 100644
index 5daed97..0000000
--- a/meta-arago-distro/recipes-core/gettext/gettext_0.18.1.1.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-SRC_URI_append_virtclass-native += "file://remove_gets.patch"
-- 
1.7.0.4


