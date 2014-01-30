Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 06450529C3
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 18:34:51 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UIYp7m030223
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:51 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UIYpo0012856
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 12:34:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 12:34:51 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UIYJOS003617;	Thu, 30 Jan 2014 12:34:49 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 12:34:17 -0600
Message-ID: <1391106857-17112-12-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
References: <1391106857-17112-1-git-send-email-chase.maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 11/11] bc: remove bbappend for Dora release
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
X-List-Received-Date: Thu, 30 Jan 2014 18:34:52 -0000
Content-Type: text/plain

* This patch has been picked up in the bc sources and is no
  longer required for the Dora release

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../recipes-extended/bc/bc/bc-1.06-fixes-1.patch   |   27 --------------------
 .../recipes-extended/bc/bc_1.06.bbappend           |    7 -----
 2 files changed, 34 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
 delete mode 100644 meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend

diff --git a/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch b/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
deleted file mode 100644
index afcdba2..0000000
--- a/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-Submitted By: Jim Gifford (jim at linuxfromscratch dot org)
-Date: 2003-09-26
-Initial Package Version: 1.06
-Origin: Mandrake CVS
-Description: Fixes a few typos
- 
---- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
-+++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
-@@ -34,6 +34,7 @@
- #include <number.h>
- #include <assert.h>
- #include <stdlib.h>
-+#include <string.h>
- #include <ctype.h>/* Prototypes needed for external utility routines. */
- 
- #define bc_rt_warn rt_warn
---- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
-+++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
-@@ -156,7 +156,7 @@
-   long  label_no;
-   long  vaf_name;	/* variable, array or function number. */
-   long  func;
--  program_counter save_adr;
-+  static program_counter save_adr;
- 
-   /* Initialize. */
-   str = code;
diff --git a/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend b/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
deleted file mode 100644
index 4860160..0000000
--- a/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-# Add commit that fixes segementation fault when using -l option
-SRC_URI += "file://bc-1.06-fixes-1.patch"
-- 
1.7.9.5


