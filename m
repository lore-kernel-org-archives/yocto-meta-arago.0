Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 8C36F529A8
	for <meta-arago@arago-project.org>;
	Fri,  6 Mar 2020 17:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B010140C5A;
	Fri,  6 Mar 2020 17:51:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yXdvRpXwUBaB; Fri,  6 Mar 2020 17:51:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 91F0340C59;
	Fri,  6 Mar 2020 17:51:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E3458172FDE;
	Fri,  6 Mar 2020 12:51:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri,  6 Mar 2020 12:51:50 -0500
Message-Id: <1583517110-3027-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH] linuxptp: drop previously overlayed version
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
X-List-Received-Date: Fri, 06 Mar 2020 17:53:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Version 2.0 is available from meta-oe.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...build-Allow-CC-and-prefix-to-be-overriden.patch | 37 ----------------------
 .../linuxptp/no-incdefs-using-host-headers.patch   | 29 -----------------
 .../recipes-connectivity/linuxptp/linuxptp_2.0.bb  | 22 -------------
 3 files changed, 88 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
 delete mode 100644 meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_2.0.bb

diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
deleted file mode 100644
index b1d96ae..0000000
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/build-Allow-CC-and-prefix-to-be-overriden.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From af485c638c61fa883212ea424e676fbf90bee594 Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Tue, 1 Jul 2014 17:37:31 -0300
-Subject: [PATCH] build: Allow CC and prefix to be overriden
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- makefile |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/makefile b/makefile
-index 22e7d0d..809cc8f 100644
---- a/makefile
-+++ b/makefile
-@@ -18,7 +18,7 @@
- KBUILD_OUTPUT =
- 
- DEBUG	=
--CC	= $(CROSS_COMPILE)gcc
-+CC	?= $(CROSS_COMPILE)gcc
- VER     = -DVER=$(version)
- CFLAGS	= -Wall $(VER) $(incdefs) $(DEBUG) $(EXTRA_CFLAGS)
- LDLIBS	= -lm -lrt $(EXTRA_LDFLAGS)
-@@ -35,7 +35,7 @@ incdefs := $(shell $(srcdir)/incdefs.sh)
- version := $(shell $(srcdir)/version.sh $(srcdir))
- VPATH	= $(srcdir)
- 
--prefix	= /usr/local
-+prefix	?= /usr/local
- sbindir	= $(prefix)/sbin
- mandir	= $(prefix)/man
- man8dir	= $(mandir)/man8
--- 
-1.7.10.4
-
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
deleted file mode 100644
index 02dbb23..0000000
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp/no-incdefs-using-host-headers.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 8a4cad5e2f2cbb6a34bdc6e877fe499502b8c4c8 Mon Sep 17 00:00:00 2001
-From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
-Date: Fri, 23 Dec 2016 18:12:29 +0100
-Subject: [PATCH] linuxptp: no incdefs using host headers
-
-Avoid using host headers via incdefs.sh shell script.
-
-Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
----
-
- makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/makefile b/makefile
-index 8cdbd15..85174b8 100644
---- a/makefile
-+++ b/makefile
-@@ -33,7 +33,7 @@ OBJECTS	= $(OBJ) hwstamp_ctl.o phc2sys.o phc_ctl.o pmc.o pmc_common.o \
- SRC	= $(OBJECTS:.o=.c)
- DEPEND	= $(OBJECTS:.o=.d)
- srcdir	:= $(dir $(lastword $(MAKEFILE_LIST)))
--incdefs := $(shell $(srcdir)/incdefs.sh)
-+#incdefs := $(shell $(srcdir)/incdefs.sh)
- version := $(shell $(srcdir)/version.sh $(srcdir))
- VPATH	= $(srcdir)
- 
--- 
-2.9.3
-
diff --git a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_2.0.bb b/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_2.0.bb
deleted file mode 100644
index eb262d3..0000000
--- a/meta-arago-distro/recipes-connectivity/linuxptp/linuxptp_2.0.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "Precision Time Protocol (PTP) according to IEEE standard 1588 for Linux"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-SRC_URI = "http://sourceforge.net/projects/linuxptp/files/v${PV}/linuxptp-${PV}.tgz \
-           file://build-Allow-CC-and-prefix-to-be-overriden.patch \
-           file://no-incdefs-using-host-headers.patch \
-           "
-
-SRC_URI[md5sum] = "d8bb7374943bb747db7786ac26f17f11"
-SRC_URI[sha256sum] = "0a24d9401e87d4af023d201e234d91127d82c350daad93432106284aa9459c7d"
-
-EXTRA_OEMAKE = "ARCH=${TARGET_ARCH} \
-    EXTRA_CFLAGS='-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME -DHAVE_POSIX_SPAWN -DHAVE_ONESTEP_SYNC ${CFLAGS}'"
-
-do_install () {
-    install -d ${D}/${bindir}
-    install -p ${S}/ptp4l  ${D}/${bindir}
-    install -p ${S}/pmc  ${D}/${bindir}
-    install -p ${S}/phc2sys  ${D}/${bindir}
-    install -p ${S}/hwstamp_ctl  ${D}/${bindir}
-}
-- 
2.7.4


