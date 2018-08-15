Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 4B2E152A49
	for <meta-arago@arago-project.org>;
	Wed, 15 Aug 2018 17:52:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7FHqYe5123157
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2018 12:52:34 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FHqYGQ017398
	for <meta-arago@arago-project.org>; Wed, 15 Aug 2018 12:52:34 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 15 Aug 2018 12:52:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 15 Aug 2018 12:52:34 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7FHqYTb019774;
	Wed, 15 Aug 2018 12:52:34 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 15 Aug 2018 17:49:59 +0000
Message-ID: <20180815174959.22322-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] cryptodev-module: drop patch now being applied in oe-core
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
X-List-Received-Date: Wed, 15 Aug 2018 17:52:42 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...01-ioctl.c-Fix-build-with-linux-4.13.patch | 49 -------------------
 .../cryptodev/cryptodev-module_%.bbappend     |  4 --
 2 files changed, 53 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
deleted file mode 100644
index a41efacd..00000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module/0001-ioctl.c-Fix-build-with-linux-4.13.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Date: Mon, 4 Sep 2017 11:05:08 +0200
-Subject: [PATCH] ioctl.c: Fix build with linux 4.13
-
-git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
-   {0, },
-    ^
-note: (near initialization for 'verbosity_ctl_dir[1]')
-git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
-   {0, },
-    ^
-
-Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
-triggering build errors with gcc 5 and 6 (but not with gcc 4)
-
-Upstream-Status: Backport
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
----
- ioctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index 0385203..8d4a162 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
- 		.mode           = 0644,
- 		.proc_handler   = proc_dointvec,
- 	},
--	{0, },
-+	{},
- };
- 
- static struct ctl_table verbosity_ctl_root[] = {
-@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
- 		.mode           = 0555,
- 		.child          = verbosity_ctl_dir,
- 	},
--	{0, },
-+	{},
- };
- static struct ctl_table_header *verbosity_sysctl_header;
- static int __init init_cryptodev(void)
--- 
-2.7.4
-
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index 647c5ea8..f8a35cd7 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,7 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
 PR_append = ".arago0"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
-
-SRC_URI += "file://0001-ioctl.c-Fix-build-with-linux-4.13.patch"
-- 
2.17.1


