Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E3DA9529AC
	for <meta-arago@arago-project.org>;
	Tue, 15 Nov 2016 00:58:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C60A9209D7;
	Tue, 15 Nov 2016 00:58:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id NAazTjroilTt; Tue, 15 Nov 2016 00:58:57 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A08FB204E0;
	Tue, 15 Nov 2016 00:58:56 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id E5CDF162199;
	Mon, 14 Nov 2016 19:58:55 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Nov 2016 19:58:55 -0500
Message-Id: <1479171535-16418-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] libloki: fix C++ compile errors with gcc-6
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
X-List-Received-Date: Tue, 15 Nov 2016 00:58:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...i-Threads.h-return-statement-with-a-value.patch | 36 ++++++++++++++++++++++
 ...on-FunctionTest.cpp-reference-to-bad_func.patch | 27 ++++++++++++++++
 .../recipes-support/loki/libloki_0.1.7.bb          | 10 +++---
 3 files changed, 69 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
 create mode 100644 meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch

diff --git a/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
new file mode 100644
index 0000000..91a78e8
--- /dev/null
+++ b/meta-arago-extras/recipes-support/loki/libloki/0001-include-loki-Threads.h-return-statement-with-a-value.patch
@@ -0,0 +1,36 @@
+From 18a569d3d8106bac85fdf127edf70292113edc2c Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 14 Nov 2016 19:41:28 -0500
+Subject: [PATCH] include/loki/Threads.h: return-statement with a value, in
+ function returning 'void'
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ include/loki/Threads.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/loki/Threads.h b/include/loki/Threads.h
+index cb44f09..983e573 100644
+--- a/include/loki/Threads.h
++++ b/include/loki/Threads.h
+@@ -251,7 +251,7 @@
+             ::pthread_mutex_lock( &atomic_mutex_ );                      \
+             lval = val;                                                  \
+             ::pthread_mutex_unlock( &atomic_mutex_ );                    \
+-            return lval;                                                 \
++            return;                                                      \
+         }                                                                \
+                                                                          \
+         static void AtomicAssign(IntType& lval, volatile const IntType& val) \
+@@ -259,7 +259,7 @@
+             ::pthread_mutex_lock( &atomic_mutex_ );                      \
+             lval = val;                                                  \
+             ::pthread_mutex_unlock( &atomic_mutex_ );                    \
+-            return lval;                                                 \
++            return;                                                      \
+         }                                                                \
+                                                                          \
+         static IntType AtomicIncrement(volatile IntType& lval, const IntType compare, bool & matches ) \
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch
new file mode 100644
index 0000000..0de9f61
--- /dev/null
+++ b/meta-arago-extras/recipes-support/loki/libloki/0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch
@@ -0,0 +1,27 @@
+From 490b7998a15487356a9a80531db030583f13f3a9 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 14 Nov 2016 19:55:08 -0500
+Subject: [PATCH] test/Function/FunctionTest.cpp: reference to
+ 'bad_function_call' is ambiguous
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ test/Function/FunctionTest.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/Function/FunctionTest.cpp b/test/Function/FunctionTest.cpp
+index 5106eeb..c9a338b 100644
+--- a/test/Function/FunctionTest.cpp
++++ b/test/Function/FunctionTest.cpp
+@@ -754,7 +754,7 @@ static void test_exception()
+         f(5, 4);
+         BOOST_CHECK(false);
+     }
+-    catch(bad_function_call)
++    catch(Loki::bad_function_call)
+     {
+         // okay
+     }
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
index 2d48561..d7d7980 100644
--- a/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
+++ b/meta-arago-extras/recipes-support/loki/libloki_0.1.7.bb
@@ -1,13 +1,15 @@
-DESCRIPTION = "Loki C++ Library"
+SUMMARY = "Loki C++ Library"
 HOMEPAGE = "http://sourceforge.net/projects/loki-lib/"
 LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://README;md5=5f7c1a2bebe34fc290234984d5845b03"
 
-SRC_URI="http://libloki.sourcearchive.com/downloads/${PV}-3/${PN}_${PV}.orig.tar.gz;name=libloki"
+SRC_URI = "http://libloki.sourcearchive.com/downloads/${PV}-3/${PN}_${PV}.orig.tar.gz \
+           file://0001-include-loki-Threads.h-return-statement-with-a-value.patch \
+           file://0002-test-Function-FunctionTest.cpp-reference-to-bad_func.patch"
 
-SRC_URI[libloki.md5sum] = "af532c24a7f2e12d0829be8201934d92"
-SRC_URI[libloki.sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
+SRC_URI[md5sum] = "af532c24a7f2e12d0829be8201934d92"
+SRC_URI[sha256sum] = "0c2094ce916b106731c8be61c32f538a22e1c0f8398bd5d6295b13d08e0c41a3"
 
 S = "${WORKDIR}/${PN}-${PV}.orig"
 
-- 
2.7.4


