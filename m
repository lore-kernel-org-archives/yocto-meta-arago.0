Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 78EBC52991
	for <meta-arago@arago-project.org>;
	Tue, 25 Jun 2019 02:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 84E5C40BBF;
	Tue, 25 Jun 2019 02:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RgSfbQMiH1NT; Tue, 25 Jun 2019 02:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2EB8F40B7B;
	Tue, 25 Jun 2019 02:37:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DD0D516B9E5;
	Mon, 24 Jun 2019 22:37:07 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon, 24 Jun 2019 22:37:07 -0400
Message-Id: <1561430227-13864-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [thud/master][PATCH] v4l-utils: switch to git/master to pick up multiplanar and other fixes
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
X-List-Received-Date: Tue, 25 Jun 2019 02:37:57 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../0001-Makefile.am-skip-po-dirs-for-now.patch    | 26 ++++++++++++++++++++++
 .../v4l2apps/v4l-utils_%.bbappend                  | 25 ++++++++++++++++++---
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch

diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
new file mode 100644
index 0000000..87f1eef
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils/0001-Makefile.am-skip-po-dirs-for-now.patch
@@ -0,0 +1,26 @@
+From 8c3531847894cc28aa8d0489332f893d69beab1e Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 24 Jun 2019 20:54:18 -0400
+Subject: [PATCH] Makefile.am: skip po dirs for now
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 8abe4f9..26a4609 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -1,7 +1,7 @@
+ AUTOMAKE_OPTIONS = foreign
+ ACLOCAL_AMFLAGS = -I m4
+ 
+-SUBDIRS = v4l-utils-po libdvbv5-po lib
++SUBDIRS = lib
+ 
+ if WITH_V4LUTILS
+ SUBDIRS += utils contrib
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
index 759139a..dd8c9bd 100644
--- a/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
+++ b/meta-arago-extras/recipes-multimedia/v4l2apps/v4l-utils_%.bbappend
@@ -1,4 +1,23 @@
-PV = "1.16.5"
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-SRC_URI[md5sum] = "de272817133c0dca000a78a5c8c8ec8b"
-SRC_URI[sha256sum] = "ed80242510385017a1dc566e17a285a77222bb301f5bc19386badfcc2c19df1b"
+PV = "1.16.99+1.17-rc+git${SRCPV}"
+
+SRCREV = "e30639edd74f12f8f58d8e9cf10d85a1f071a6c3"
+
+SRC_URI = " \
+	git://linuxtv.org/v4l-utils.git \
+	file://0001-Revert-media-ctl-Don-t-install-libmediactl-and-libv4.patch \
+	file://mediactl-pkgconfig.patch \
+	file://export-mediactl-headers.patch \
+	file://0002-contrib-test-Link-mc_nextgen_test-with-libargp-if-ne.patch \
+	file://0003-v4l2-ctl-Do-not-use-getsubopt.patch \
+	file://0001-Makefile.am-skip-po-dirs-for-now.patch \
+"
+
+S = "${WORKDIR}/git"
+B = "${S}"
+
+do_configure() {
+	./bootstrap.sh
+	oe_runconf
+}
-- 
2.7.4


