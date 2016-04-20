Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTPS id A220752A5B
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:49 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173015.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y005ZM6BYD950@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=64GYHyxuAAAA:8
	a=OELxueTLnZdOVqLfWuMA:9 a=hekxwLru1oAA:10
Received: by 100.15.86.14 with SMTP id 28e4d4e9; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9D87B161FB3;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:10 -0400
Message-id: <1461180805-25733-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 01/16] memtester: change got upstreamed, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../memtester/files/Makefile.patch                 | 28 ----------------------
 .../recipes-benchmark/memtester/memtester_4.3.0.bb | 25 -------------------
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb

diff --git a/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch b/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
deleted file mode 100644
index 971e52a..0000000
--- a/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 9a950b14b9f7767d83e5faac2e1e8203c500e2c2 Mon Sep 17 00:00:00 2001
-From: Rod Whitby <rod@whitby.id.au>
-Date: Tue, 25 Oct 2011 18:43:50 -0500
-Subject: [PATCH] memtester: Added patch to Makefile to change no-longer-supported 'head -1' syntax to 'head -n 1'.
-
-Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
----
- Makefile |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index a271bf5..6bccff3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -32,8 +32,8 @@ install: all
- auto-ccld.sh: \
- conf-cc conf-ld warn-auto.sh
- 	( cat warn-auto.sh; \
--	echo CC=\'`head -1 conf-cc`\'; \
--	echo LD=\'`head -1 conf-ld`\' \
-+	echo CC=\'`head -n 1 conf-cc`\'; \
-+	echo LD=\'`head -n 1 conf-ld`\' \
- 	) > auto-ccld.sh
- 
- compile: \
--- 
-1.7.0.4
-
diff --git a/meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb b/meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
deleted file mode 100644
index 0964c04..0000000
--- a/meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Utility to test for faulty memory subsystem"
-HOMEPAGE = "http://pyropus.ca/software/memtester/"
-SECTION = "console/utils"
-LICENSE = "GPLv2"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-SRC_URI = "http://pyropus.ca/software/memtester/old-versions/${BP}.tar.gz"
-SRC_URI += "file://Makefile.patch"
-
-SRC_URI[md5sum] = "598f41b7308e1f736164bca3ab84ddbe"
-SRC_URI[sha256sum] = "f9dfe2fd737c38fad6535bbab327da9a21f7ce4ea6f18c7b3339adef6bf5fd88"
-
-do_compile () {
-    echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
-    echo '${CC} ${LDFLAGS}' > conf-ld
-    oe_runmake
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install -d ${D}${mandir}/man8
-    install -m 0755 memtester ${D}${bindir}/
-    install -m 0755 memtester.8 ${D}${mandir}/man8/
-}
-- 
2.2.0


