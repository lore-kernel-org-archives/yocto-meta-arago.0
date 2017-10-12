Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 912BF529CC
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BDF9C20B03;
	Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nnvgf48SHVyy; Thu, 12 Oct 2017 21:28:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3DA32043F;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1E3E11626F4;
	Thu, 12 Oct 2017 17:28:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Oct 2017 17:28:13 -0400
Message-Id: <1507843693-2615-9-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507843693-2615-1-git-send-email-denis@denix.org>
References: <1507843693-2615-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 9/9] ltp-ddt: fix gcc7-specific breakage in dirtyc0w
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
X-List-Received-Date: Thu, 12 Oct 2017 21:28:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch   | 34 ++++++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch
new file mode 100644
index 0000000..5c73be4
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-dirtyc0w-Include-stdint.h.patch
@@ -0,0 +1,34 @@
+From 1b30d8dac1a37dc0abbb3b545db2824d6489e23f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 9 Jun 2017 09:32:13 -0700
+Subject: [PATCH] dirtyc0w: Include stdint.h
+
+uintptr_t is defined in stdint.h
+
+Fixes
+| dirtyc0w_child.c:76:15: error: 'uintptr_t' undeclared (first use in this function); did you mean 'intptr_t'?
+|    lseek(mfd, (uintptr_t) map, SEEK_SET);
+|                ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ testcases/kernel/security/dirtyc0w/dirtyc0w_child.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
+index 5328a9bc4..49abdd6ba 100644
+--- a/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
++++ b/testcases/kernel/security/dirtyc0w/dirtyc0w_child.c
+@@ -23,6 +23,7 @@
+ #include <sys/stat.h>
+ #include <string.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <pwd.h>
+ 
+ #include "tst_safe_pthread.h"
+-- 
+2.13.1
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
index edc43f3..d97e0e0 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20170116.bb
@@ -18,6 +18,7 @@ SRCREV = "4a32e93b9fb16da6e26ab84cb225f89255aeb7db"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
+SRC_URI += "file://0001-dirtyc0w-Include-stdint.h.patch"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


