Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5438F52986
	for <meta-arago@arago-project.org>;
	Thu,  5 Apr 2018 00:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9DC6920B22;
	Thu,  5 Apr 2018 00:16:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Bp4VlWIEUZve; Thu,  5 Apr 2018 00:16:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7AB13207AD;
	Thu,  5 Apr 2018 00:16:15 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 020251633BB;
	Wed,  4 Apr 2018 20:16:14 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  4 Apr 2018 20:16:14 -0400
Message-Id: <1522887374-41310-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] omapdrmtest: move -lblah flags from LDFLAGS to LDADD where they belong
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
X-List-Received-Date: Thu, 05 Apr 2018 00:16:18 -0000

Fixes issues like this during linking:
undefined reference to symbol 'tanf@@GLIBC_2.4'

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...m-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch | 28 ++++++++++++++++++++++
 .../omapdrmtest/omapdrmtest_1.0.0.bb               |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
new file mode 100644
index 0000000..f973500
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/files/0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch
@@ -0,0 +1,28 @@
+From 315652fa73555b71b7f1d0c77357f824c432c882 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 4 Apr 2018 20:09:54 -0400
+Subject: [PATCH] Makefile.am: -lblah flags belong to LDADD, not LDFLAGS
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 99f4036..7ac6146 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -26,9 +26,8 @@ if ENABLE_DCE
+ bin_PROGRAMS += viddec3test copycodectest yuvcopytest videnc2test
+ endif
+ 
+-LDADD_COMMON = util/libutil.la @DRM_LIBS@ @DCE_LIBS@ @GBM_LIBS@ @EGL_LIBS@ @GLES2_LIBS@
++LDADD_COMMON = util/libutil.la @DRM_LIBS@ @DCE_LIBS@ @GBM_LIBS@ @EGL_LIBS@ @GLES2_LIBS@ -lm -lavcodec -lpthread
+ AM_CFLAGS = @DRM_CFLAGS@ @DCE_CFLAGS@ @GBM_CFLAGS@ @EGL_CFLAGS@ @GLES2_CFLAGS@ @WARN_CFLAGS@ -I$(top_srcdir)/util
+-LDFLAGS = -lm -lavcodec -lpthread
+ 
+ fliptest_SOURCES = fliptest.c
+ fliptest_LDADD = $(LDADD_COMMON)
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index 47d3245..36f5b81 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -14,6 +14,7 @@ EXTRA_OEMAKE = "CC="${CC}""
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 SRC_URI = "git://git.ti.com/glsdk/omapdrmtest.git;protocol=git \
+        file://0001-Makefile.am-lblah-flags-belong-to-LDADD-not-LDFLAGS.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.7.4


