Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id AF2C352976
	for <meta-arago@arago-project.org>;
	Mon, 26 Feb 2018 22:28:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 93B6C209AE;
	Mon, 26 Feb 2018 22:27:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id O7BLNBaZrbqX; Mon, 26 Feb 2018 22:27:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 78F9520059;
	Mon, 26 Feb 2018 22:27:50 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 0DB101632C4;
	Mon, 26 Feb 2018 17:27:50 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 26 Feb 2018 17:27:49 -0500
Message-Id: <1519684069-43723-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] kexec-tools: the HACK patch is no longer required
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
X-List-Received-Date: Mon, 26 Feb 2018 22:28:24 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-HACK-TO-get-kexec-up-on-dra7.patch        | 26 ----------------------
 .../recipes-kernel/kexec/kexec-tools_%.bbappend    |  2 --
 2 files changed, 28 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch

diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch b/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch
deleted file mode 100644
index 9abdcb3..0000000
--- a/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From b93a24a4df81abfffb8e275970a98736dd42d4f5 Mon Sep 17 00:00:00 2001
-From: Keerthy <j-keerthy@ti.com>
-Date: Tue, 28 Feb 2017 10:44:45 +0530
-Subject: [PATCH] HACK: TO get kexec up on dra7
-
-Signed-off-by: Keerthy <j-keerthy@ti.com>
----
- kexec/arch/arm/kexec-zImage-arm.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/kexec/arch/arm/kexec-zImage-arm.c b/kexec/arch/arm/kexec-zImage-arm.c
-index 7f02b93..9907496 100644
---- a/kexec/arch/arm/kexec-zImage-arm.c
-+++ b/kexec/arch/arm/kexec-zImage-arm.c
-@@ -572,7 +572,7 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
- 		 * is 4, and just to be safe, place ramdisk after that.
- 		 * Note that we must include space for the compressed
- 		 * image here as well. */
--		initrd_base = kernel_base + _ALIGN(len * 5, getpagesize());
-+		initrd_base = kernel_base + _ALIGN(len * 6, getpagesize());
- 	}
- 
- 	if (use_atags) {
--- 
-1.9.1
-
diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
index 9e1f301..e66dcda 100644
--- a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
@@ -2,8 +2,6 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 PR_append = ".arago2"
 
-#SRC_URI += "file://0001-HACK-TO-get-kexec-up-on-dra7.patch"
-
 do_install_append() {
 	chmod -x ${D}${sysconfdir}/init.d/kdump
 }
-- 
2.7.4


