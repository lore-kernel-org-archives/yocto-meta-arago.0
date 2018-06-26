Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 70A5A52987
	for <meta-arago@arago-project.org>;
	Tue, 26 Jun 2018 23:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6CF9820BD9;
	Tue, 26 Jun 2018 23:57:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id LHPGp4xo6TLL; Tue, 26 Jun 2018 23:57:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44B4F20151;
	Tue, 26 Jun 2018 23:57:44 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id AA6B91634C7;
	Tue, 26 Jun 2018 19:57:43 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 26 Jun 2018 19:57:40 -0400
Message-Id: <1530057460-30460-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [rocko/master][PATCH] iperf: fix aarch64 build due to math.h conflict
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
X-List-Received-Date: Tue, 26 Jun 2018 23:57:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...remove-math.h-include-that-breaks-aarch64.patch | 40 ++++++++++++++++++++++
 .../recipes-benchmark/iperf/iperf_2.0.5.bb         |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
new file mode 100644
index 0000000..abd2315
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf-2.0.5/0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch
@@ -0,0 +1,40 @@
+From c9d104a51f4f62e157f01e1fd47f534aa22a9d81 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 26 Jun 2018 15:55:31 -0400
+Subject: [PATCH] headers.h: remove math.h include that breaks aarch64
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+| In file included from .../aarch64-linux-gnu/include/c++/7.2.1/cmath:42:0,
+|                  from .../aarch64-linux-gnu/include/c++/7.2.1/math.h:36,
+|                  from ../../iperf-2.0.5/include/headers.h:85,
+|                  from ../../iperf-2.0.5/include/Timestamp.hpp:63,
+|                  from ../../iperf-2.0.5/compat/delay.cpp:53:
+| .../aarch64-linux-gnu/include/c++/7.2.1/bits/cpp_type_traits.h:205:12: error: redefinition of ‘struct std::__is_integer<int>’
+|      struct __is_integer<int>
+|             ^~~~~~~~~~~~~~~~~
+| .../aarch64-linux-gnu/include/c++/7.2.1/bits/cpp_type_traits.h:138:12: note: previous definition of ‘struct std::__is_integer<int>’
+|      struct __is_integer<bool>
+|             ^~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ include/headers.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/headers.h b/include/headers.h
+index 4667bfe..7e5efd7 100644
+--- a/include/headers.h
++++ b/include/headers.h
+@@ -82,7 +82,6 @@
+ #include <errno.h>
+ #include <string.h>
+ #include <time.h>
+-#include <math.h>
+ 
+ #ifdef WIN32
+ 
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
index 9981d82..f863348 100644
--- a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -8,6 +8,7 @@ SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
             file://iperf-2.0.5_ManPage.patch \
             file://0001-fix-out-of-tree-config.patch \
             file://0002-fix-bool-size-m4.patch \
+            file://0001-headers.h-remove-math.h-include-that-breaks-aarch64.patch \
           "
 
 SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
-- 
2.7.4


