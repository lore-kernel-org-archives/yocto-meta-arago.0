Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 2CF365298F
	for <meta-arago@arago-project.org>;
	Fri,  9 Feb 2018 00:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5D45D20A4B;
	Fri,  9 Feb 2018 00:01:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BP7j7wSJu7Ro; Fri,  9 Feb 2018 00:01:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27ED32085A;
	Fri,  9 Feb 2018 00:01:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D952E163296;
	Thu,  8 Feb 2018 19:01:55 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  8 Feb 2018 19:01:55 -0500
Message-Id: <1518134515-17125-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] cryptodev-module: backport patch fixing builds with kernel 4.13 or later
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
X-List-Received-Date: Fri, 09 Feb 2018 00:02:07 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   | 49 ++++++++++++++++++++++
 .../cryptodev/cryptodev-module_%.bbappend          |  4 ++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
new file mode 100644
index 0000000..a41efac
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
@@ -0,0 +1,49 @@
+From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
+From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Date: Mon, 4 Sep 2017 11:05:08 +0200
+Subject: [PATCH] ioctl.c: Fix build with linux 4.13
+
+git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
+   {0, },
+    ^
+note: (near initialization for 'verbosity_ctl_dir[1]')
+git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
+   {0, },
+    ^
+
+Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
+triggering build errors with gcc 5 and 6 (but not with gcc 4)
+
+Upstream-Status: Backport
+
+Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+---
+ ioctl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 0385203..8d4a162 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
+ 		.mode           = 0644,
+ 		.proc_handler   = proc_dointvec,
+ 	},
+-	{0, },
++	{},
+ };
+ 
+ static struct ctl_table verbosity_ctl_root[] = {
+@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
+ 		.mode           = 0555,
+ 		.child          = verbosity_ctl_dir,
+ 	},
+-	{0, },
++	{},
+ };
+ static struct ctl_table_header *verbosity_sysctl_header;
+ static int __init init_cryptodev(void)
+-- 
+2.7.4
+
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index f8a35cd..647c5ea 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,3 +1,7 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 PR_append = ".arago0"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
+
+SRC_URI += "file://0001-ioctl.c-Fix-build-with-linux-4.13.patch"
-- 
2.7.4


