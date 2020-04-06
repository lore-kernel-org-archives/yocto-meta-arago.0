Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 425C35298B
	for <meta-arago@arago-project.org>;
	Mon,  6 Apr 2020 22:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8CC8240BA3;
	Mon,  6 Apr 2020 22:43:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vUzmJGE00hgN; Mon,  6 Apr 2020 22:43:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5663B40027;
	Mon,  6 Apr 2020 22:43:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AA10A17126C;
	Mon,  6 Apr 2020 18:43:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon,  6 Apr 2020 18:43:11 -0400
Message-Id: <1586212991-51780-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] ltp-ddt: disable stime syscall due to glibc-2.31 deprecation
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
X-List-Received-Date: Mon, 06 Apr 2020 22:45:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ernel-syscalls-disable-stime-due-to-glibc.patch | 25 ++++++++++++++++++++++
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb   |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch
new file mode 100644
index 0000000..dbe4f50
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt/0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch
@@ -0,0 +1,25 @@
+From a7b8b39581a195e5f7d5bd4185d59ad146d54bce Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 6 Apr 2020 18:15:12 -0400
+Subject: [PATCH] testcases/kernel/syscalls: disable stime due to glibc-2.31
+ deprecation
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ testcases/kernel/syscalls/Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/testcases/kernel/syscalls/Makefile b/testcases/kernel/syscalls/Makefile
+index 45a00cf..d7b1d3b 100644
+--- a/testcases/kernel/syscalls/Makefile
++++ b/testcases/kernel/syscalls/Makefile
+@@ -45,4 +45,6 @@ FILTER_OUT_DIRS	+= \
+ 	setdomainname sethostname symlinkat ulimit ustat vfork vhangup vmsplice
+ endif
+ 
++FILTER_OUT_DIRS	+= stime
++
+ include $(top_srcdir)/include/mk/generic_trunk_target.mk
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
index 2c50813..9d36d37 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200217.bb
@@ -47,6 +47,7 @@ SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;bran
     file://0002-check-for-RES_USE_INET6-during-configure.patch \
     file://0003-Add-knob-to-control-tirpc-support.patch \
     file://0001-getcpu01-Rename-getcpu-to-avoid-conflict-with-glibc-.patch \
+    file://0001-testcases-kernel-syscalls-disable-stime-due-to-glibc.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


