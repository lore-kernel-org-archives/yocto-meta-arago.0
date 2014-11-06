Return-Path: <karthik.ramanan@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 05B9B529B0
	for <meta-arago@arago-project.org>;
	Thu,  6 Nov 2014 09:43:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sA69hAVk022208
	for <meta-arago@arago-project.org>; Thu, 6 Nov 2014 03:43:10 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sA69hA4M027629
	for <meta-arago@arago-project.org>; Thu, 6 Nov 2014 03:43:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 6 Nov 2014 03:43:10 -0600
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sA69h8SC001739;	Thu, 6 Nov 2014 03:43:09 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 6 Nov 2014 15:08:13 +0530
Message-ID: <1415266693-10556-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master PATCH] wayland 1.3.0: Add patch referenced by the recipe
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
X-List-Received-Date: Thu, 06 Nov 2014 09:43:13 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../wayland/wayland/just-scanner.patch             |   36 ++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch b/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
new file mode 100644
index 0000000..234a9c5
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland/just-scanner.patch
@@ -0,0 +1,36 @@
+We only build wayland-native for the scanner, so disable the bits we don't
+actually need.  This gives us a small speed up but importantly should allow
+wayland-native to compile on older hosts such as CentOS 5 which currently fails:
+
+| wayland-1.0.6/src/wayland-server.c:1245: error: 'O_CLOEXEC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:34:25: error: sys/timerfd.h: No such file or directory
+| wayland-1.0.6/src/event-loop.c:199: error: 'CLOCK_MONOTONIC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:199: error: 'TFD_CLOEXEC' undeclared (first use in this function)
+| wayland-1.0.6/src/event-loop.c:268: error: 'SFD_CLOEXEC' undeclared (first use in this function)
+
+Upstream-Status: Inappropriate
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/Makefile.am b/Makefile.am
+index 306d7b3..571fe89 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,7 +2,7 @@ if BUILD_DOCS
+ doc_subdir = doc
+ endif
+ 
+-SUBDIRS = src protocol $(doc_subdir) tests cursor
++SUBDIRS = src protocol $(doc_subdir)
+ 
+ ACLOCAL_AMFLAGS = -I m4 ${ACLOCAL_FLAGS}
+ 
+diff --git a/src/Makefile.am b/src/Makefile.am
+index e1d04ea..702342e 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -1,4 +1,4 @@
+-lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
++#lib_LTLIBRARIES = libwayland-server.la libwayland-client.la
+ noinst_LTLIBRARIES = libwayland-util.la
+ 
+ include_HEADERS =				\
-- 
1.7.9.5


