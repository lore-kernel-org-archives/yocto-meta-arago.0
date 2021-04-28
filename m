Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id F3FD852B0C
	for <meta-arago@arago-project.org>;
	Wed, 28 Apr 2021 00:14:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13S0Ea6k040999;
	Tue, 27 Apr 2021 19:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1619568876;
	bh=mNcEVHZRo4rXcyOo/J5xdiSI/GGAYeYP2lO8jmAyaa8=;
	h=From:To:CC:Subject:Date;
	b=aM/UUQfjfDORqssbsYFpBMLn1VCSkn/vyCWyrtzTW6OhX1nP7rpqz9WY06iVDyvSt
	fxj8kGCLAcjwnXs5rpJFzB5cYIluobnApcvoI4PzFYLILlEwiUsYx5ni7/mB9l/WwH
	TzmVq9recOXhTpiDCNc5laQ80IeUIVNf8D5SFdks=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13S0EaPh050807
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Apr 2021 19:14:36 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 27 Apr 2021 19:14:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 27 Apr 2021 19:14:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13S0EaQ0031413;
	Tue, 27 Apr 2021 19:14:36 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>, <yogeshs@ti.com>
Date: Tue, 27 Apr 2021 19:14:33 -0500
Message-ID: <20210428001433.27555-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell PATCH] cryptodev-module: Backport a patch to fix build failure with kernel v5.11
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
X-List-Received-Date: Wed, 28 Apr 2021 00:14:09 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Fix the following build failure with v5.11+ kernel
cryptodev-module/1.10-r0.arago0/git/authenc.c: In function 'pad_record':
cryptodev-module/1.10-r0.arago0/git/authenc.c:317:2: warning: ISO C90 forbids variable length array 'pad' [-Wvla]
 317 |  uint8_t pad[block_size];
     |  ^~~~~~~
cryptodev-module/1.10-r0.arago0/git/ioctl.c: In function 'cryptodev_ioctl':
cryptodev-module/1.10-r0.arago0/git/ioctl.c:875:4: error: implicit declaration of function 'ksys_close'; did you mean 'ksys_chown'? [-Werror=implicit-function-declaration]
 875 |    ksys_close(fd);
     |    ^~~~~~~~~~
     |    ksys_chown


OE Core does'nt plan on fixing dunfell branch up for newer kernel, and
oe master already is on 1.12 cryptodev with the fixes already in place.

Signed-off-by: Nishanth Menon <nm@ti.com>
---

oe master is already at 1.12 release which has this fix incorporated, so
this should NOT be applied on meta-arago master.

dunfell has fixes for the previous kernel already, so we just append to
the list of fixes from oe-core.

 .../cryptodev/cryptodev-module_%.bbappend     |  6 +++-
 .../0001-Fix-build-for-Linux-5.11-rc1.patch   | 36 +++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index f8a35cd73765..c210cc4e2613 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -1,3 +1,7 @@
-PR_append = ".arago0"
+PR_append = ".arago1"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://0001-Fix-build-for-Linux-5.11-rc1.patch"
 
 KERNEL_MODULE_AUTOLOAD += "cryptodev"
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch
new file mode 100644
index 000000000000..df07b9ea251c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch
@@ -0,0 +1,36 @@
+From 55c6315058fc0dd189ffd116f2cc27ba4fa84cb6 Mon Sep 17 00:00:00 2001
+From: Joan Bruguera <joanbrugueram@gmail.com>
+Date: Mon, 28 Dec 2020 01:41:31 +0100
+Subject: [PATCH] Fix build for Linux 5.11-rc1
+
+ksys_close was removed, as far as I can tell, close_fd replaces it.
+
+See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8760c909f54a82aaa6e76da19afe798a0c77c3c3
+          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1572bfdf21d4d50e51941498ffe0b56c2289f783
+
+Upstream-status: Backport [55c6315058fc0dd189ffd116f2cc27ba4fa84cb6]
+
+Signed-off-by: Nishanth Menon <nm@ti.com>
+---
+ ioctl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/ioctl.c b/ioctl.c
+index 3d33238021dc..95481d4ff8e2 100644
+--- a/ioctl.c
++++ b/ioctl.c
+@@ -871,8 +871,10 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
+ 		if (unlikely(ret)) {
+ #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
+ 			sys_close(fd);
+-#else
++#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
+ 			ksys_close(fd);
++#else
++			close_fd(fd);
+ #endif
+ 			return ret;
+ 		}
+-- 
+2.31.0
+
-- 
2.31.0


