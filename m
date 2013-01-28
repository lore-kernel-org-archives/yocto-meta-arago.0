Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by arago-project.org (Postfix) with ESMTPS id 5435052A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:33 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id h1so3006725oag.6
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=p9bbWfY4etOl458PhhVQHPmkRkcqDlpW7aGNbmZw3yI=;
	b=wvtgT2HwnUKnVMw1PBK7k4vp9kRYAbavTVuo6m9xOq/+my0Cct49AX6DvGr4OW2Vbp
	BSATVgJrSbOy+pI+jCmHIga0ixrbibh5FMw6rzZ8GrX8dhPjJ1Gnt4rBZvaUjQnZ6g8Q
	qe4jM3b98NKgk3br5QNSU6Qbv8OS6kvjx7jT+ffk+172b31SSQnmCy8X0l+V1ohE/AiY
	zGBYoW6weSnrV/cdc7rIOJxT/+GtVx5Kw59jLx+kSlNQnFCe1LGLfE/8GgIvy2W5Z6yS
	Yp6S7SP0tITj1CZhOPagWWpsW8jm7YrbHWyua4J1IGoNqIVDZSIDu6eI+CM00VzLfPNv
	X9CA==
X-Received: by 10.60.172.131 with SMTP id bc3mr4666007oec.79.1359393992800;
	Mon, 28 Jan 2013 09:26:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.30
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:31 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:30 -0600
Message-Id: <1359393932-31361-30-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 30/32] bc: Fix segmentation fault when using -l option
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:33 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Mimic patch "bc 1.06: fix segfault when using -l" from oe-classic that
  includes a patch that fixes the segmentation fault when the -l option
  is used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-extended/bc/bc/bc-1.06-fixes-1.patch   |   27 ++++++++++++++++++++
 .../recipes-extended/bc/bc_1.06.bbappend           |    7 +++++
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
 create mode 100644 meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend

diff --git a/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch b/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
new file mode 100644
index 0000000..afcdba2
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/bc/bc/bc-1.06-fixes-1.patch
@@ -0,0 +1,27 @@
+Submitted By: Jim Gifford (jim at linuxfromscratch dot org)
+Date: 2003-09-26
+Initial Package Version: 1.06
+Origin: Mandrake CVS
+Description: Fixes a few typos
+ 
+--- bc-1.06/lib/number.c.orig	2003-09-26 21:14:02.000000000 +0000
++++ bc-1.06/lib/number.c	2003-09-26 21:14:26.000000000 +0000
+@@ -34,6 +34,7 @@
+ #include <number.h>
+ #include <assert.h>
+ #include <stdlib.h>
++#include <string.h>
+ #include <ctype.h>/* Prototypes needed for external utility routines. */
+ 
+ #define bc_rt_warn rt_warn
+--- bc-1.06/bc/load.c.orig	2003-09-26 21:14:14.000000000 +0000
++++ bc-1.06/bc/load.c	2003-09-26 21:14:26.000000000 +0000
+@@ -156,7 +156,7 @@
+   long  label_no;
+   long  vaf_name;	/* variable, array or function number. */
+   long  func;
+-  program_counter save_adr;
++  static program_counter save_adr;
+ 
+   /* Initialize. */
+   str = code;
diff --git a/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend b/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
new file mode 100644
index 0000000..4860160
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/bc/bc_1.06.bbappend
@@ -0,0 +1,7 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+# Add commit that fixes segementation fault when using -l option
+SRC_URI += "file://bc-1.06-fixes-1.patch"
-- 
1.7.0.4


