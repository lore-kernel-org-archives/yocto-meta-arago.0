Return-Path: <danielrparks@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE23C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 18:33:35 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2108.1654540410230666261
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Jun 2022 11:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RCaMi65I;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: danielrparks@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 256IXTj5107304
	for <meta-arago@lists.yoctoproject.org>; Mon, 6 Jun 2022 13:33:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1654540409;
	bh=brhjGF2liyxktuGd43/F9TWREYncYe42NWS4RImKjgo=;
	h=From:To:CC:Subject:Date;
	b=RCaMi65IWCt+O3gyeOmYnXJ6hPobB5kAnfwx5l2TSGxGHxuOJyZ7RMUetEbguvvzE
	 54jTiEa3ypQlQQEGiFH7ssLLpZ2OO/Rzzka/QhHBaGDNy3IZDpUMDF7NIvQczNedEd
	 esqt/QbaAseIrUN1xA3GG/z7h2exFyQwltpgXihQ=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 256IXTnx127375
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 6 Jun 2022 13:33:29 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 6
 Jun 2022 13:33:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 6 Jun 2022 13:33:28 -0500
Received: from uda0500628.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 256IXSqA045734;
	Mon, 6 Jun 2022 13:33:28 -0500
From: Daniel Parks <danielrparks@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Daniel Parks <danielrparks@ti.com>
Subject: [dunfell PATCH] cifs-utils: add patch for upstream build bug
Date: Mon, 6 Jun 2022 13:33:17 -0500
Message-ID: <20220606183317.706-1-danielrparks@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Jun 2022 18:33:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13888

cifs-utils upstream has a bug that causes our build to fail when
PARALLEL_MAKE is set to "-j1". This adds an overlay with the patch for
the bug, which I have also submitted upstream.

It only changes the order of the build process, so rebuilding already
built packages is not necessary.

Signed-off-by: Daniel Parks <danielrparks@ti.com>
---
 ...automake-treat-sbin-as-exec-not-data.patch | 34 +++++++++++++++++++
 .../cifs/cifs-utils_6.10.bbappend             |  4 +++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
 create mode 100644 meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend

diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
new file mode 100644
index 00000000..5a7bdd20
--- /dev/null
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils/0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch
@@ -0,0 +1,34 @@
+From fd5f395514256572c451127006a68483106cf2b8 Mon Sep 17 00:00:00 2001
+From: Daniel Parks <danielrparks@ti.com>
+Date: Fri, 3 Jun 2022 15:34:59 -0500
+Subject: [PATCH] cifs-utils: Make automake treat /sbin as exec, not data
+
+Otherwise, $(DESTDIR)/sbin doesn't get created until install-data on a
+-j1 build and install-exec-hook can fail because it might not exist.
+
+Steps to reproduce this bug:
+$ autoreconf -i
+$ ./configure
+$ mkdir image
+$ make DESTDIR=image install -j1
+
+Signed-off-by: Daniel Parks <danielrparks@ti.com>
+---
+ Makefile.am | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index e9be6b3..edb1b7f 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,8 +1,8 @@
+ AM_CFLAGS = -Wall -Wextra -D_FORTIFY_SOURCE=2 $(PIE_CFLAGS) $(RELRO_CFLAGS)
+ ACLOCAL_AMFLAGS = -I aclocal
+ 
+-root_sbindir = $(ROOTSBINDIR)
+-root_sbin_PROGRAMS = mount.cifs
++root_exec_sbindir = $(ROOTSBINDIR)
++root_exec_sbin_PROGRAMS = mount.cifs
+ mount_cifs_SOURCES = mount.cifs.c mtab.c resolve_host.c util.c
+ mount_cifs_LDADD = $(LIBCAP) $(CAPNG_LDADD) $(RT_LDADD)
+ include_HEADERS = cifsidmap.h
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
new file mode 100644
index 00000000..33030b87
--- /dev/null
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils_6.10.bbappend
@@ -0,0 +1,4 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch"
+
-- 
2.17.1


