Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C1D55529F6
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2020 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 22A25409DE;
	Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AjT_nPP28_Hg; Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E9D8240BAC;
	Tue, 24 Mar 2020 15:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A0AF317136D;
	Tue, 24 Mar 2020 11:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 24 Mar 2020 11:46:58 -0400
Message-Id: <1585064820-39907-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585064820-39907-1-git-send-email-denys@ti.com>
References: <1585064820-39907-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/4] v4l-utils: drop locally overlayed 1.17-rc in favor of upstream 1.18.0
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
X-List-Received-Date: Tue, 24 Mar 2020 15:49:12 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Makefile.am-skip-po-dirs-for-now.patch    | 24 ----------------------
 .../v4l2apps/v4l-utils_%.bbappend                  | 23 ---------------------
 2 files changed, 47 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
deleted file mode 100644
index c164568..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From f21271f720000c9f91569b8a7dfe71d4b74850f8 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 24 Jun 2019 20:54:18 -0400
-Subject: [PATCH] Makefile.am: skip po dirs for now
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
-
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 8abe4f9..26a4609 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- AUTOMAKE_OPTIONS = foreign
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS = v4l-utils-po libdvbv5-po lib
-+SUBDIRS = lib
- 
- if WITH_V4LUTILS
- SUBDIRS += utils contrib
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
deleted file mode 100644
index f428b8d..0000000
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
+++ /dev/null
@@ -1,23 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PV = "1.16.99+1.17-rc+git${SRCPV}"
-
-SRCREV = "9343eaf5433135b3360e34db606c0d7de95ed289"
-
-SRC_URI = " \
-	git://linuxtv.org/v4l-utils.git \
-	file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
-	file://mediactl-pkgconfig.patch \
-	file://export-mediactl-headers.patch \
-	file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
-	file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
-	file://0001-Makefile.am-skip-po-dirs-for-now.patch \
-"
-
-S = "${WORKDIR}/git"
-B = "${S}"
-
-do_configure() {
-	./bootstrap.sh
-	oe_runconf
-}
-- 
2.7.4


