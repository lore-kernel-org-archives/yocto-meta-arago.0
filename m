Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 45E70529D2
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 11:53:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GBrpn7005235
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489665231;
	bh=PfqRu3K/82RDCeojoZGE9HQouK0Q/arPmrzg41Rwrig=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=y/t6bUvj7NTywqWYmSBKU4TTUh4+hqCHlXD14VMQi3iH2jWZiF7+L7lrcEX49vcUd
	te7j9ewAUnT9tCWqvdt2C+4LqEhfssWCgenmWalQo8JP2eJgTxrakxx1KfmQTDgTiZ
	CAJ0S82AjqX0N5N14irE9fj3SKtR6BZNrbHUYf8M=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBrpt7031492
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:51 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 06:53:50 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBrkh7001278;
	Thu, 16 Mar 2017 06:53:50 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Mar 2017 17:23:44 +0530
Message-ID: <1489665224-95346-3-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489665224-95346-1-git-send-email-a0393906@ti.com>
References: <1489665224-95346-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty] omapdrmtest: Update SRCREV and remove local patch
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
X-List-Received-Date: Thu, 16 Mar 2017 11:53:51 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 ...gure.ac-also-check-for-libavcodec-library.patch | 28 ----------------------
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch
deleted file mode 100644
index 5b7d3f4..0000000
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-configure.ac-also-check-for-libavcodec-library.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From e74fe2b030a841387e026cb7d37e8fb0c411075f Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Wed, 16 Nov 2016 19:52:36 -0500
-Subject: [PATCH] configure.ac: also check for libavcodec library
-
-Required for av_bitstream_filter_close and such.
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 31762f5..649c97a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -75,7 +75,7 @@ fi
- AM_CONDITIONAL(ENABLE_WAYLAND, [test "x$HAVE_WAYLAND" = xyes])
- 
- # Check for libdce and libav..
--PKG_CHECK_MODULES(DCE, libdce libavformat libavutil, [HAVE_DCE=yes], [HAVE_DCE=no])
-+PKG_CHECK_MODULES(DCE, libdce libavformat libavcodec libavutil, [HAVE_DCE=yes], [HAVE_DCE=no])
- if test "x$HAVE_DCE" = "xyes"; then
- 	AC_DEFINE(HAVE_DCE, 1, [Have DCE support])
- 	AC_MSG_NOTICE([Detected libdce and libavformat, building video codec tests])
--- 
-2.7.4
-
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index bb787ec..4090061 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -7,14 +7,13 @@ DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
 inherit autotools pkgconfig
 
-PR = "r21"
-SRCREV = "809e72b2c5ebe45bb7ba13bcfe964b1ef69f98f0"
+PR = "r22"
+SRCREV = "116c940c2b06b221c13be28bb79af49233ba462a"
 
 EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
-           file://0001-configure.ac-also-check-for-libavcodec-library.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


