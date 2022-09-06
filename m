Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 984EDECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 16:21:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1283.1662481302014584599
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 09:21:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lR+6WxZ/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286GLdC6054675;
	Tue, 6 Sep 2022 11:21:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662481299;
	bh=yytWHVdUw0TCoyhBzKUCBYvKEGMwgQMC70rIztUvS10=;
	h=From:To:Subject:Date;
	b=lR+6WxZ/2OIGFeAtxuxhcvkOgGvDTJISRhIQZ8u67MgFd/S/2bZLcMHHIEAisFgNO
	 jtAd/qOCrinyoG02sCW5T1OMr62pNFT234It761D1L7jpZEEyifCAbkUq5XBcnZ7Qo
	 A5EIXfOU4W/4EDuPW1gmPtPTgKVtFY6ECCjx36NE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286GLdPf073135
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Sep 2022 11:21:39 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 11:21:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 11:21:39 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286GLd6O086403;
	Tue, 6 Sep 2022 11:21:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oVbKV-0003sC-0H; Tue, 06 Sep 2022 11:21:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] cryptodev-module: Remove 5.11 build
 patch
Date: Tue, 6 Sep 2022 11:21:38 -0500
Message-ID: <20220906162138.14849-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Sep 2022 16:21:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13982

Upstream oecore is now carrying the same patch and having this
patch causes build errors.  So remove it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../cryptodev/cryptodev-module_%.bbappend     |  1 -
 .../0001-Fix-build-for-Linux-5.11-rc1.patch   | 36 -------------------
 2 files changed, 37 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch

diff --git a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
index 4f17153a..4f55b0ad 100644
--- a/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
+++ b/meta-arago-distro/recipes-kernel/cryptodev/cryptodev-module_%.bbappend
@@ -3,7 +3,6 @@ PR_append = ".arago1"
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 SRC_URI += " \
-file://0001-Fix-build-for-Linux-5.11-rc1.patch \
 file://0001-remove-VLA-usage-from-authenc.c.patch \
 "
 
diff --git a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch b/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch
deleted file mode 100644
index df07b9ea..00000000
--- a/meta-arago-distro/recipes-kernel/cryptodev/files/0001-Fix-build-for-Linux-5.11-rc1.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 55c6315058fc0dd189ffd116f2cc27ba4fa84cb6 Mon Sep 17 00:00:00 2001
-From: Joan Bruguera <joanbrugueram@gmail.com>
-Date: Mon, 28 Dec 2020 01:41:31 +0100
-Subject: [PATCH] Fix build for Linux 5.11-rc1
-
-ksys_close was removed, as far as I can tell, close_fd replaces it.
-
-See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8760c909f54a82aaa6e76da19afe798a0c77c3c3
-          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=1572bfdf21d4d50e51941498ffe0b56c2289f783
-
-Upstream-status: Backport [55c6315058fc0dd189ffd116f2cc27ba4fa84cb6]
-
-Signed-off-by: Nishanth Menon <nm@ti.com>
----
- ioctl.c | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index 3d33238021dc..95481d4ff8e2 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -871,8 +871,10 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
- 		if (unlikely(ret)) {
- #if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
- 			sys_close(fd);
--#else
-+#elif (LINUX_VERSION_CODE < KERNEL_VERSION(5, 11, 0))
- 			ksys_close(fd);
-+#else
-+			close_fd(fd);
- #endif
- 			return ret;
- 		}
--- 
-2.31.0
-
-- 
2.17.1


