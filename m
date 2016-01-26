Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 55E5A52092
	for <meta-arago@arago-project.org>;
	Tue, 26 Jan 2016 17:07:23 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K00IPTKV26010@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Jan 2016 11:06:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=MtGvkDue c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=7aQ_Q-yQQ-AA:10 a=sozttTNsAAAA:8	a=64GYHyxuAAAA:8
	a=BxI-dNCYCCuEHxmih9cA:9 a=hekxwLru1oAA:10
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0076F161E08;	Tue,
	26 Jan 2016 12:06:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 26 Jan 2016 12:06:36 -0500
Message-id: <1453827997-25553-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] memtester: overlay 4.1.3 from meta-oe
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
X-List-Received-Date: Tue, 26 Jan 2016 17:07:23 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../memtester/files/Makefile.patch                 | 28 ++++++++++++++++++++++
 .../recipes-benchmark/memtester/memtester_4.1.3.bb | 25 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
 create mode 100644 meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb

diff --git a/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch b/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
new file mode 100644
index 0000000..971e52a
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
@@ -0,0 +1,28 @@
+From 9a950b14b9f7767d83e5faac2e1e8203c500e2c2 Mon Sep 17 00:00:00 2001
+From: Rod Whitby <rod@whitby.id.au>
+Date: Tue, 25 Oct 2011 18:43:50 -0500
+Subject: [PATCH] memtester: Added patch to Makefile to change no-longer-supported 'head -1' syntax to 'head -n 1'.
+
+Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
+---
+ Makefile |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a271bf5..6bccff3 100644
+--- a/Makefile
++++ b/Makefile
+@@ -32,8 +32,8 @@ install: all
+ auto-ccld.sh: \
+ conf-cc conf-ld warn-auto.sh
+ 	( cat warn-auto.sh; \
+-	echo CC=\'`head -1 conf-cc`\'; \
+-	echo LD=\'`head -1 conf-ld`\' \
++	echo CC=\'`head -n 1 conf-cc`\'; \
++	echo LD=\'`head -n 1 conf-ld`\' \
+ 	) > auto-ccld.sh
+ 
+ compile: \
+-- 
+1.7.0.4
+
diff --git a/meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb b/meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb
new file mode 100644
index 0000000..74e704b
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/memtester/memtester_4.1.3.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Utility to test for faulty memory subsystem"
+HOMEPAGE = "http://pyropus.ca/software/memtester/"
+SECTION = "console/utils"
+LICENSE = "GPLv2"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+SRC_URI = "http://pyropus.ca/software/memtester/old-versions/memtester-${PV}.tar.gz"
+SRC_URI += "file://Makefile.patch"
+
+SRC_URI[md5sum] = "e562451620cf5343016950462bc0dc38"
+SRC_URI[sha256sum] = "ac56f0b6d6d6e58bcf2a3fa7f2c9b29894f5177871f21115a1906c535106acf6"
+
+do_compile () {
+    echo '${CC} ${CFLAGS} -DPOSIX -c' > conf-cc
+    echo '${CC} ${LDFLAGS}' > conf-ld
+    oe_runmake
+}
+
+do_install () {
+    install -d ${D}${bindir}
+    install -d ${D}${mandir}/man8
+    install -m 0755 memtester ${D}${bindir}/
+    install -m 0755 memtester.8 ${D}${mandir}/man8/
+}
-- 
2.2.0


