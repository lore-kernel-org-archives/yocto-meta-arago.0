Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F3F6552AE0
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1F89520BAA
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UpXgx32BffxA for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ECA0D20BA6
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 01:27:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 1D9171623A7;
	Thu,  2 Mar 2017 20:27:15 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 20:27:02 -0500
Message-Id: <1488504432-12167-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488504432-12167-1-git-send-email-denis@denix.org>
References: <1488504432-12167-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 02/12] Revert "cryptodev: backport patch for user page API change in recent kernels"
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
X-List-Received-Date: Fri, 03 Mar 2017 01:27:17 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 5e120638b973c8f5edbb53cca587c9050e1c4750.
---
 .../cryptodev/cryptodev-module_%.bbappend          |  6 +---
 ...st-to-another-change-in-the-user-page-API.patch | 40 ----------------------
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index 02bf90b..f8a35cd 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,7 +1,3 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
-
-PR_append = ".arago1"
+PR_append = ".arago2"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
-
-SRC_URI += "file://0001-Adjust-to-another-change-in-the-user-page-API.patch"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
deleted file mode 100644
index fb75278..0000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Adjust-to-another-change-in-the-user-page-API.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From f126e4837e6334d0464540995df7426fedf6b175 Mon Sep 17 00:00:00 2001
-From: Michael Weiser <michael.weiser@gmx.de>
-Date: Fri, 11 Nov 2016 18:09:32 +0100
-Subject: [PATCH] Adjust to another change in the user page API
-
-4.9.0 will replace the write and force flags of get_user_pages_remote()
-with a gup_flags parameter[1]. Distinguish the two APIs based on kernel
-version we're compiling for.
-
-[1] https://github.com/torvalds/linux/commit/9beae1ea89305a9667ceaab6d0bf46a045ad71e7
-
-Upstream-Status: Backport
-
-Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
----
- zc.c | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/zc.c b/zc.c
-index a97b49f..e766ee3 100644
---- a/zc.c
-+++ b/zc.c
-@@ -65,7 +65,13 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
- 	ret = get_user_pages(
- #endif
- 			task, mm,
--			(unsigned long)addr, pgcount, write, 0, pg, NULL);
-+			(unsigned long)addr, pgcount,
-+#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 9, 0))
-+			write ? FOLL_WRITE : 0,
-+#else
-+			write, 0,
-+#endif
-+			pg, NULL);
- 	up_read(&mm->mmap_sem);
- 	if (ret != pgcount)
- 		return -EINVAL;
--- 
-1.9.1
-
-- 
2.7.4


