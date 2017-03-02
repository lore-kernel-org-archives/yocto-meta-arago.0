Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id B974352A05
	for <meta-arago@arago-project.org>;
	Thu,  2 Mar 2017 18:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88D9720B64;
	Thu,  2 Mar 2017 18:14:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id EFwYVtRNlz4k; Thu,  2 Mar 2017 18:14:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 69037207AD;
	Thu,  2 Mar 2017 18:14:14 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EB83F1623A0;
	Thu,  2 Mar 2017 13:14:13 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu,  2 Mar 2017 13:14:13 -0500
Message-Id: <1488478453-130620-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [morty/master][PATCH] kexec-tools: add hack to get it working on dra7
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
X-List-Received-Date: Thu, 02 Mar 2017 18:14:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-HACK-TO-get-kexec-up-on-dra7.patch        | 26 ++++++++++++++++++++++
 .../recipes-kernel/kexec/kexec-tools_%.bbappend    |  5 +++++
 2 files changed, 31 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch
 create mode 100644 meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch b/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch
new file mode 100644
index 0000000..9abdcb3
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/kexec/kexec-tools/0001-HACK-TO-get-kexec-up-on-dra7.patch
@@ -0,0 +1,26 @@
+From b93a24a4df81abfffb8e275970a98736dd42d4f5 Mon Sep 17 00:00:00 2001
+From: Keerthy <j-keerthy@ti.com>
+Date: Tue, 28 Feb 2017 10:44:45 +0530
+Subject: [PATCH] HACK: TO get kexec up on dra7
+
+Signed-off-by: Keerthy <j-keerthy@ti.com>
+---
+ kexec/arch/arm/kexec-zImage-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kexec/arch/arm/kexec-zImage-arm.c b/kexec/arch/arm/kexec-zImage-arm.c
+index 7f02b93..9907496 100644
+--- a/kexec/arch/arm/kexec-zImage-arm.c
++++ b/kexec/arch/arm/kexec-zImage-arm.c
+@@ -572,7 +572,7 @@ int zImage_arm_load(int argc, char **argv, const char *buf, off_t len,
+ 		 * is 4, and just to be safe, place ramdisk after that.
+ 		 * Note that we must include space for the compressed
+ 		 * image here as well. */
+-		initrd_base = kernel_base + _ALIGN(len * 5, getpagesize());
++		initrd_base = kernel_base + _ALIGN(len * 6, getpagesize());
+ 	}
+ 
+ 	if (use_atags) {
+-- 
+1.9.1
+
diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
new file mode 100644
index 0000000..ef2a464
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
@@ -0,0 +1,5 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = ".arago0"
+
+SRC_URI_append_dra7xx = "file://0001-HACK-TO-get-kexec-up-on-dra7.patch"
-- 
2.7.4


