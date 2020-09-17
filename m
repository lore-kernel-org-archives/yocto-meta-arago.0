Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3DD6A52979
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 19:37:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6F2A140C28;
	Thu, 17 Sep 2020 19:34:28 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Nj3Gr7riXy6z; Thu, 17 Sep 2020 19:34:28 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 52F6A40B66;
	Thu, 17 Sep 2020 19:34:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A593017408E;
	Thu, 17 Sep 2020 15:34:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 17 Sep 2020 15:34:26 -0400
Message-Id: <1600371266-53957-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] cmake: overlay OEToolchainConfig.cmake to fix regex parsing of target sysroot
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
X-List-Received-Date: Thu, 17 Sep 2020 19:37:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

The original regex doesn't work when TARGET_VENDOR is empty.
The fix will be submitted upstream to OE-Core and can be removed locally later.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../cmake/cmake/OEToolchainConfig.cmake            | 25 ++++++++++++++++++++++
 .../recipes-devtools/cmake/cmake_%.bbappend        |  2 ++
 2 files changed, 27 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake

diff --git a/meta-arago-distro/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/meta-arago-distro/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
new file mode 100644
index 0000000..7db6f80
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
@@ -0,0 +1,25 @@
+set( CMAKE_SYSTEM_NAME Linux )
+set( CMAKE_C_FLAGS $ENV{CFLAGS} CACHE STRING "" FORCE )
+set( CMAKE_CXX_FLAGS $ENV{CXXFLAGS}  CACHE STRING "" FORCE )
+set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_LDFLAGS_FLAGS ${CMAKE_CXX_FLAGS} CACHE STRING "" FORCE )
+set( CMAKE_SYSROOT $ENV{OECORE_TARGET_SYSROOT} )
+
+set( CMAKE_FIND_ROOT_PATH $ENV{OECORE_TARGET_SYSROOT} )
+set( CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER )
+set( CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY )
+set( CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY )
+
+set(CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX "$ENV{OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX}")
+
+# Set CMAKE_SYSTEM_PROCESSOR from the sysroot name (assuming processor-distro-os).
+if ($ENV{OECORE_TARGET_SYSROOT} MATCHES "/sysroots/([a-zA-Z0-9_-]+)-.+")
+  set(CMAKE_SYSTEM_PROCESSOR ${CMAKE_MATCH_1})
+endif()
+
+# Include the toolchain configuration subscripts
+file( GLOB toolchain_config_files "${CMAKE_TOOLCHAIN_FILE}.d/*.cmake" )
+foreach(config ${toolchain_config_files})
+    include(${config})
+endforeach()
diff --git a/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend b/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
index 042e4d7..a5f2d01 100644
--- a/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/cmake/cmake_%.bbappend
@@ -1 +1,3 @@
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
 FILES_${PN}-doc += "${datadir}/cmake-${CMAKE_MAJOR_VERSION}/Help/"
-- 
2.7.4


