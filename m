Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5552AEB64DB
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 01:29:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.834.1687224548120112586
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 Jun 2023 18:29:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vZjK7CcB;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35K1T4W5028394;
	Mon, 19 Jun 2023 20:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687224544;
	bh=HEr5x+84/sD8nxXVjKo9GvpoM8svkIBCUxLJZyx+Ca0=;
	h=From:To:CC:Subject:Date;
	b=vZjK7CcBhd1hLmNR20KYwglvFouQyiDaMpT38dHXqCUCF0Saz57YdLKDBZK7C4nfZ
	 pEjhGNC/mqW2rIAXuEK9BMMhJmo1wWlqWznNAgY5JTHauM23Bkym/PLdjfBH6yRyh9
	 1Ig0PxdioGvxv4n99GD3kJfoome3A31X7dcnegpM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35K1T4BE130328
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Jun 2023 20:29:04 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 Jun 2023 20:29:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 Jun 2023 20:29:03 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35K1T33R025954;
	Mon, 19 Jun 2023 20:29:03 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][kirkstone][PATCH] vk-gl-cts: copy recipe from meta-oe with my patches
Date: Mon, 19 Jun 2023 20:28:53 -0500
Message-ID: <20230620012853.1667776-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 Jun 2023 01:29:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14656

From: Randolph Sapp <rs@ti.com>

I'm backporting a series of patches but it sounds like meta-oe won't be
taking them before our next release. Adding them here for our testing at
least.

To be dropped when the following is accepted upstream:
https://lists.openembedded.org/g/openembedded-devel/message/103326

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../files/0001-Include-missing-cstdint.patch  |  34 ++++++
 .../files/0001-Remove-dead-variable-984.patch |  34 ++++++
 ...LAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch |  37 ++++++
 .../files/0001-include-missing-cstdint.patch  |  61 ++++++++++
 ...0001-use-library-sonames-for-linking.patch | 114 ++++++++++++++++++
 ...01-vulkancts-Include-missing-cstdint.patch |  32 +++++
 .../files/fix-clang-private-operator.patch    |  13 ++
 .../vk-gl-cts/files/fix-musl.patch            |  20 +++
 .../vk-gl-cts/files/gen-framework-path.patch  |  20 +++
 .../vk-gl-cts/khronos-cts.inc                 |  84 +++++++++++++
 .../vk-gl-cts/opengl-es-cts_3.2.9.3.bb        |  36 ++++++
 .../vk-gl-cts/vulkan-cts_1.3.3.1.bb           |  34 ++++++
 12 files changed, 519 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-musl.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/khronos-cts.inc
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
 create mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
new file mode 100644
index 00000000..0dd59713
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Include-missing-cstdint.patch
@@ -0,0 +1,34 @@
+From b07f6ecd6ab83b788301a555dc546b9a5c9dd8a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 19:19:34 -0800
+Subject: [PATCH] Include missing <cstdint>
+
+This error is seen with gcc-13 where include headers are not implicitly
+included [1]
+
+Fixes errors e.g.
+error: 'uint32_t' does not name a type
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/common/tcuDefs.hpp | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/framework/common/tcuDefs.hpp b/framework/common/tcuDefs.hpp
+index ad3d0736d..6dfac10fb 100644
+--- a/framework/common/tcuDefs.hpp
++++ b/framework/common/tcuDefs.hpp
+@@ -26,6 +26,7 @@
+ #include "deDefs.hpp"
+ #include "qpTestLog.h"
+ 
++#include <cstdint>
+ #include <string>
+ #include <stdexcept>
+ 
+-- 
+2.39.1
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
new file mode 100644
index 00000000..c29d80aa
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-Remove-dead-variable-984.patch
@@ -0,0 +1,34 @@
+From 0d863b444c9a54a92dab176b1b656c116923e1ca Mon Sep 17 00:00:00 2001
+From: alan-baker <alanbaker@google.com>
+Date: Wed, 30 Mar 2022 12:59:28 -0400
+Subject: [PATCH] Remove dead variable (#984)
+
+Upstream-Status: Backport [https://github.com/google/amber/commit/627ee453d6047ced0e2dd13cde983b341d0615e3]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/vkscript/command_parser.cc | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/vkscript/command_parser.cc b/src/vkscript/command_parser.cc
+index 610c7e6..3429d4d 100644
+--- a/src/vkscript/command_parser.cc
++++ b/src/vkscript/command_parser.cc
+@@ -486,7 +486,6 @@ Result CommandParser::ParseValues(const std::string& name,
+                                   std::vector<Value>* values) {
+   assert(values);
+ 
+-  uint32_t row_index = 0;
+   auto token = tokenizer_->NextToken();
+   size_t seen = 0;
+   while (!token->IsEOL() && !token->IsEOS()) {
+@@ -515,7 +514,6 @@ Result CommandParser::ParseValues(const std::string& name,
+     values->push_back(v);
+     token = tokenizer_->NextToken();
+ 
+-    ++row_index;
+     ++seen;
+   }
+ 
+-- 
+2.37.3
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
new file mode 100644
index 00000000..d7000b7d
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch
@@ -0,0 +1,37 @@
+From ec12bb7bda60cdf2c848e13df67452a7d30a42be Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 3 Sep 2022 18:52:42 -0700
+Subject: [PATCH] cmake: Define WAYLAND_SCANNER and WAYLAND_PROTOCOLS_DIR if
+ not already defined
+
+This helps with cross compiling and providing these knobs from cmake
+cmdline
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ framework/platform/CMakeLists.txt | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/framework/platform/CMakeLists.txt b/framework/platform/CMakeLists.txt
+index c3ac463e4..030163f6c 100644
+--- a/framework/platform/CMakeLists.txt
++++ b/framework/platform/CMakeLists.txt
+@@ -73,8 +73,12 @@ if (NOT DEFINED TCUTIL_PLATFORM_SRCS)
+ 			add_definitions(-DDEQP_SUPPORT_WAYLAND=1)
+ 			include_directories(lnx/wayland)
+ 
+-			pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
+-			pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
++			if (NOT DEFINED WAYLAND_PROTOCOLS_DIR)
++				pkg_get_variable(WAYLAND_PROTOCOLS_DIR wayland-protocols pkgdatadir)
++			endif()
++			if (NOT DEFINED WAYLAND_SCANNER)
++				pkg_get_variable(WAYLAND_SCANNER wayland-scanner wayland_scanner)
++			endif()
+ 
+ 			set(DEQP_XDG_SHELL_PROTOCOL ${WAYLAND_PROTOCOLS_DIR}/stable/xdg-shell/xdg-shell.xml)
+ 			set(DEQP_XDG_SHELL_GEN_OUTPUTS_DIR ${PROJECT_BINARY_DIR}/framework/platform)
+-- 
+2.37.3
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
new file mode 100644
index 00000000..47d9fc74
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-include-missing-cstdint.patch
@@ -0,0 +1,61 @@
+From 74cf53d89529902ecdef5b230421bc4d30fd089b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 25 Jan 2023 15:36:14 -0800
+Subject: [PATCH] include missing <cstdint>
+
+gcc-13 exposed errors like below due to it removing indirect includes of
+these headers in libstdc++ [1]
+
+../git/external/amber/src/include/amber/shader_info.h:60:15: error: 'uint32_t' was not declared in this scope
+   60 |   std::vector<uint32_t> shader_data;
+      |               ^~~~~~~~
+
+[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
+
+Upstream-Status: Submitted [https://github.com/google/amber/pull/1016]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/amber/recipe.h                  | 1 +
+ include/amber/shader_info.h             | 1 +
+ src/descriptor_set_and_binding_parser.h | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/include/amber/recipe.h b/include/amber/recipe.h
+index 310a86a..1b83213 100644
+--- a/include/amber/recipe.h
++++ b/include/amber/recipe.h
+@@ -15,6 +15,7 @@
+ #ifndef AMBER_RECIPE_H_
+ #define AMBER_RECIPE_H_
+ 
++#include <cstdint>
+ #include <string>
+ #include <utility>
+ #include <vector>
+diff --git a/include/amber/shader_info.h b/include/amber/shader_info.h
+index 6c9126a..b5ce751 100644
+--- a/include/amber/shader_info.h
++++ b/include/amber/shader_info.h
+@@ -15,6 +15,7 @@
+ #ifndef AMBER_SHADER_INFO_H_
+ #define AMBER_SHADER_INFO_H_
+ 
++#include <cstdint>
+ #include <string>
+ #include <vector>
+ 
+diff --git a/src/descriptor_set_and_binding_parser.h b/src/descriptor_set_and_binding_parser.h
+index 145aa42..4b0d774 100644
+--- a/src/descriptor_set_and_binding_parser.h
++++ b/src/descriptor_set_and_binding_parser.h
+@@ -15,6 +15,7 @@
+ #ifndef SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
+ #define SRC_DESCRIPTOR_SET_AND_BINDING_PARSER_H_
+ 
++#include <cstdint>
+ #include <string>
+ 
+ #include "amber/result.h"
+-- 
+2.39.1
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
new file mode 100644
index 00000000..b5a1d331
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-use-library-sonames-for-linking.patch
@@ -0,0 +1,114 @@
+From acd25c4b8d5b7e420a7a89bdfd6551c70de828b3 Mon Sep 17 00:00:00 2001
+From: Trevor Woerner <twoerner@gmail.com>
+Date: Thu, 23 Sep 2021 19:36:43 -0400
+Subject: [PATCH] use library sonames for linking
+
+The recommended "best practices" for applications is to link to library
+sonames (e.g. libGL.so.1) instead of library names (e.g. libGL.so). This
+ensures that applications don't try to use libraries if an incompatible ABI
+change occurs.
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/288]
+Signed-off-by: Trevor Woerner <twoerner@gmail.com>
+---
+ framework/egl/egluGLContextFactory.cpp                      | 4 ++--
+ framework/egl/wrapper/eglwLibrary.cpp                       | 2 +-
+ framework/platform/android/tcuAndroidPlatform.cpp           | 2 +-
+ framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp   | 2 +-
+ .../platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp | 2 +-
+ framework/platform/surfaceless/tcuSurfacelessPlatform.cpp   | 6 +++---
+ 6 files changed, 9 insertions(+), 9 deletions(-)
+
+--- a/framework/egl/egluGLContextFactory.cpp
++++ b/framework/egl/egluGLContextFactory.cpp
+@@ -63,7 +63,7 @@ using std::vector;
+ #	if (DE_OS == DE_OS_WIN32)
+ #		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.dll"
+ #	else
+-#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#		define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #	endif
+ #endif
+ 
+@@ -75,7 +75,7 @@ using std::vector;
+ #	if (DE_OS == DE_OS_WIN32)
+ #		define DEQP_OPENGL_LIBRARY_PATH "opengl32.dll"
+ #	else
+-#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#		define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #	endif
+ #endif
+ 
+--- a/framework/egl/wrapper/eglwLibrary.cpp
++++ b/framework/egl/wrapper/eglwLibrary.cpp
+@@ -148,7 +148,7 @@ DefaultLibrary::~DefaultLibrary (void)
+ const char* DefaultLibrary::getLibraryFileName (void)
+ {
+ #if (DE_OS == DE_OS_ANDROID) || (DE_OS == DE_OS_UNIX)
+-	return "libEGL.so";
++	return "libEGL.so.1";
+ #elif (DE_OS == DE_OS_WIN32)
+ 	return "libEGL.dll";
+ #else
+--- a/framework/platform/android/tcuAndroidPlatform.cpp
++++ b/framework/platform/android/tcuAndroidPlatform.cpp
+@@ -57,7 +57,7 @@ static const eglu::NativeWindow::Capabil
+ class NativeDisplay : public eglu::NativeDisplay
+ {
+ public:
+-									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so") {}
++									NativeDisplay			(void) : eglu::NativeDisplay(DISPLAY_CAPABILITIES), m_library("libEGL.so.1") {}
+ 	virtual							~NativeDisplay			(void) {}
+ 
+ 	virtual EGLNativeDisplayType	getLegacyNative			(void)			{ return EGL_DEFAULT_DISPLAY;	}
+--- a/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
++++ b/framework/platform/lnx/X11/tcuLnxX11EglDisplayFactory.cpp
+@@ -75,7 +75,7 @@ class Library : public eglw::DefaultLibr
+ {
+ public:
+ 	Library (void)
+-		: eglw::DefaultLibrary("libEGL.so")
++		: eglw::DefaultLibrary("libEGL.so.1")
+ 	{
+ 	}
+ 
+--- a/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
++++ b/framework/platform/lnx/wayland/tcuLnxWaylandEglDisplayFactory.cpp
+@@ -66,7 +66,7 @@ public:
+ 													 EGL_PLATFORM_WAYLAND_KHR,
+ 													 "EGL_KHR_platform_wayland")
+ 									, m_display		(waylandDisplay)
+-									, m_library		("libEGL.so") {}
++									, m_library		("libEGL.so.1") {}
+ 
+ 	~Display(void) {}
+ 	wayland::Display&			getWaylandDisplay	(void)	{ return *m_display; }
+--- a/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
++++ b/framework/platform/surfaceless/tcuSurfacelessPlatform.cpp
+@@ -69,7 +69,7 @@ using std::vector;
+ 
+ // Default library names
+ #if !defined(DEQP_GLES2_LIBRARY_PATH)
+-#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so"
++#	define DEQP_GLES2_LIBRARY_PATH "libGLESv2.so.2"
+ #endif
+ 
+ #if !defined(DEQP_GLES3_LIBRARY_PATH)
+@@ -77,7 +77,7 @@ using std::vector;
+ #endif
+ 
+ #if !defined(DEQP_OPENGL_LIBRARY_PATH)
+-#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so"
++#	define DEQP_OPENGL_LIBRARY_PATH "libGL.so.1"
+ #endif
+ 
+ #if !defined(DEQP_VULKAN_LIBRARY_PATH)
+@@ -234,7 +234,7 @@ glu::RenderContext* ContextFactory::crea
+ }
+ 
+ EglRenderContext::EglRenderContext(const glu::RenderConfig& config, const tcu::CommandLine& cmdLine)
+-	: m_egl("libEGL.so")
++	: m_egl("libEGL.so.1")
+ 	, m_contextType(config.type)
+ 	, m_eglDisplay(EGL_NO_DISPLAY)
+ 	, m_eglContext(EGL_NO_CONTEXT)
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
new file mode 100644
index 00000000..40aea8f2
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/0001-vulkancts-Include-missing-cstdint.patch
@@ -0,0 +1,32 @@
+From 1b7646ced0f0b969f818084887885827ed1a4244 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 31 May 2021 17:31:33 -0700
+Subject: [PATCH] vulkancts: Include missing <cstdint>
+
+Fixes build with gcc-13
+
+../git/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp:2798:102: error: 'uintptr_t' in namespace 'std' does not name a type
+ 2798 |                 BufferDataType type              = static_cast<BufferDataType>(reinterpret_cast<std::uintptr_t>(expectedOutputs[resultIndex].getUserData()));
+      |                                                                                                      ^~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/VK-GL-CTS/pull/378]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp        | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+index ab02be1dc..3d3ee4829 100644
+--- a/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
++++ b/external/vulkancts/modules/vulkan/spirv_assembly/vktSpvAsmFloatControlsTests.cpp
+@@ -33,6 +33,7 @@
+ #include "deFloat16.h"
+ #include "vkQueryUtil.hpp"
+ #include "vkRefUtil.hpp"
++#include <cstdint>
+ #include <cstring>
+ #include <vector>
+ #include <limits>
+-- 
+2.39.1
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
new file mode 100644
index 00000000..ea7659c6
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-clang-private-operator.patch
@@ -0,0 +1,13 @@
+--- a/external/glslang/src/glslang/Include/PoolAlloc.h
++++ b/external/glslang/src/glslang/Include/PoolAlloc.h
+@@ -240,8 +240,9 @@ protected:
+ 
+     int numCalls;           // just an interesting statistic
+     size_t totalBytes;      // just an interesting statistic
+-private:
++public:
+     TPoolAllocator& operator=(const TPoolAllocator&);  // don't allow assignment operator
++private:
+     TPoolAllocator(const TPoolAllocator&);  // don't allow default copy constructor
+ };
+ 
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-musl.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-musl.patch
new file mode 100644
index 00000000..99cb87b3
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/fix-musl.patch
@@ -0,0 +1,20 @@
+--- a/framework/delibs/dethread/CMakeLists.txt
++++ b/framework/delibs/dethread/CMakeLists.txt
+@@ -42,6 +42,7 @@ if (DE_OS_IS_UNIX)
+ 		add_definitions(-D__BSD_VISIBLE)
+ 		add_definitions(-D_XOPEN_SOURCE=600)
+ 	endif ()
++	add_definitions(-D_XOPEN_SOURCE=600)
+ 	add_definitions(-D_GNU_SOURCE)
+ 
+ 	set(DETHREAD_LIBS ${DETHREAD_LIBS} pthread)
+--- a/framework/qphelper/CMakeLists.txt
++++ b/framework/qphelper/CMakeLists.txt
+@@ -28,6 +28,7 @@ set(QPHELPER_LIBS
+ if (DE_OS_IS_UNIX OR DE_OS_IS_QNX)
+ 	# For vsnprintf()
+ 	add_definitions(-D_XOPEN_SOURCE=600)
++	set(QPHELPER_LIBS ${QPHELPER_LIBS} execinfo)
+ endif ()
+ 
+ if (DE_OS_IS_WIN32 AND DE_COMPILER_IS_MSC)
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
new file mode 100644
index 00000000..8a8d8d2c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/files/gen-framework-path.patch
@@ -0,0 +1,20 @@
+Prepend instead of append to the module search path, as this script needs to use
+the local module build, not the host module build.
+
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+
+diff --git a/external/vulkancts/scripts/gen_framework.py b/external/vulkancts/scripts/gen_framework.py
+index 83c5329ce..10e720910 100755
+--- a/external/vulkancts/scripts/gen_framework.py
++++ b/external/vulkancts/scripts/gen_framework.py
+@@ -33 +33 @@ from collections import OrderedDict
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
+diff --git a/external/vulkancts/scripts/gen_framework_c.py b/external/vulkancts/scripts/gen_framework_c.py
+index 95587e642..84b878cb2 100644
+--- a/external/vulkancts/scripts/gen_framework_c.py
++++ b/external/vulkancts/scripts/gen_framework_c.py
+@@ -28 +28 @@ import re
+-sys.path.append(os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
++sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", "..", "..", "scripts"))
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-arago-distro/recipes-graphics/vk-gl-cts/khronos-cts.inc
new file mode 100644
index 00000000..097acc1a
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -0,0 +1,84 @@
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+SRC_URI = "\
+	git://github.com/KhronosGroup/VK-GL-CTS.git;protocol=https;name=vk-gl-cts;nobranch=1 \
+	git://github.com/google/amber;protocol=https;destsuffix=git/external/amber/src;name=amber;branch=main \
+	git://github.com/KhronosGroup/glslang.git;protocol=https;destsuffix=git/external/glslang/src;name=glslang;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Headers.git;protocol=https;destsuffix=git/external/spirv-headers/src;name=spirv-headers;branch=main \
+	git://github.com/KhronosGroup/SPIRV-Tools.git;protocol=https;destsuffix=git/external/spirv-tools/src;name=spirv-tools;branch=main \
+        git://github.com/open-source-parsers/jsoncpp.git;protocol=https;destsuffix=git/external/jsoncpp/src;name=jsoncpp;branch=master \
+        git://github.com/KhronosGroup/Vulkan-Docs.git;protocol=https;destsuffix=git/external/vulkan-docs/src;name=vulkan-docs;branch=main \
+        https://raw.githubusercontent.com/baldurk/renderdoc/v1.1/renderdoc/api/app/renderdoc_app.h;subdir=git/external/renderdoc/src;name=renderdoc \
+        git://github.com/Igalia/ESExtractor.git;protocol=https;destsuffix=git/external/ESExtractor/src;name=ESExtractor;branch=main \
+        git://github.com/nvpro-samples/vk_video_samples.git;protocol=https;destsuffix=git/external/video-parser/src;name=video-parser;branch=main \
+        file://gen-framework-path.patch \
+"
+
+S = "${WORKDIR}/git"
+
+SRCREV_FORMAT = "vk-gl-cts_amber_glslang_spirv-headers_spirv-tools_jsoncpp_vulkan-docs"
+
+S = "${WORKDIR}/git"
+
+inherit pkgconfig cmake features_check python3native qemu
+
+ANY_OF_DISTRO_FEATURES += "opengl vulkan"
+
+DEPENDS += "python3-lxml-native libpng zlib virtual/libgles2 qemu-native"
+
+SRC_URI += " \
+            file://0001-vulkancts-Include-missing-cstdint.patch \
+            file://0001-use-library-sonames-for-linking.patch \
+"
+
+SRC_URI:append:libc-musl = "\
+	file://fix-musl.patch \
+"
+DEPENDS:append:libc-musl = " libexecinfo"
+
+SRC_URI:append:toolchain-clang = "\
+	file://fix-clang-private-operator.patch \
+"
+
+EXTRA_OECMAKE:prepend:class-target = "-DCMAKE_CROSSCOMPILING_EMULATOR=${WORKDIR}/qemuwrapper -DWAYLAND_SCANNER=${STAGING_BINDIR_NATIVE}/wayland-scanner -DWAYLAND_PROTOCOLS_DIR=${STAGING_DATADIR}/wayland-protocols"
+
+# The best thing for the user to do is to not specify any of the following
+# PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its own
+# probing and build what it thinks is appropriate.
+# However, if you want, you can specify one of the following PACKAGECONFIGs
+# to override this behaviour.
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[surfaceless] = "-DDEQP_TARGET=surfaceless,,,,,wayland x11_egl x11_glx x11_egl_glx"
+PACKAGECONFIG[wayland] = "-DDEQP_TARGET=wayland,,wayland-native wayland wayland-protocols,,,surfaceless x11_egl x11_glx x11_egl_glx"
+PACKAGECONFIG[x11_egl] = "-DDEQP_TARGET=x11_egl,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_glx x11_egl_glx"
+PACKAGECONFIG[x11_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11,,,surfaceless wayland x11_egl x11_egl_glx"
+PACKAGECONFIG[x11_egl_glx] = "-DDEQP_TARGET=x11_glx,,virtual/libx11 virtual/egl,,,surfaceless wayland x11_egl x11_glx"
+
+do_configure:append() {
+        # Write out a qemu wrapper that will be used by cmake
+        # so that it can run target helper binaries through that.
+        qemu_binary="${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HOST}${base_libdir}')])}"
+        cat > ${WORKDIR}/qemuwrapper << EOF
+#!/bin/sh
+$qemu_binary "\$@"
+EOF
+        chmod +x ${WORKDIR}/qemuwrapper
+}
+
+python __anonymous() {
+    # if the user doesn't specify any PACKAGECONFIG then the cts build system
+    # is going to probe the sysroot to try to figure out what to build
+    # in this case we try to guess whether the user is building for wayland
+    # or x11 and add the required dependencies automatically
+    distrofeatures = (d.getVar("DISTRO_FEATURES") or "")
+    if not bb.utils.contains_any("PACKAGECONFIG", ["surfaceless", "wayland", "x11_egl", "x11_glx", "x11_egl_glx"], True, False, d):
+        if "wayland" in distrofeatures:
+            d.appendVar("DEPENDS", " wayland-native wayland wayland-protocols")
+        if "x11" in distrofeatures:
+            d.appendVar("DEPENDS", " virtual/libx11 virtual/egl ")
+}
+
+CTSDIR = "/usr/lib/${BPN}"
+
+FILES:${PN} += "${CTSDIR}"
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb b/meta-arago-distro/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
new file mode 100644
index 00000000..67ce5f2b
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.9.3.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "OpenGL CTS"
+
+require khronos-cts.inc
+# opengl-es-cts-3.2.9.3
+SRCREV_vk-gl-cts = "7f5fb62245d535a1fc0bf50b2c7e5a342dc551fe"
+SRCREV_amber = "933ecb4d6288675a92eb1650e0f52b1d7afe8273"
+SRCREV_glslang = "a0ad0d7067521fff880e36acfb8ce453421c3f25"
+SRCREV_spirv-headers = "87d5b782bec60822aa878941e6b13c0a9a954c9b"
+SRCREV_spirv-tools = "f98473ceeb1d33700d01e20910433583e5256030"
+SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
+# Not yet needed
+SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV_vulkan-docs = "9a2e576a052a1e65a5d41b593e693ff02745604b"
+SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/openglcts/modules/* ${D}/${CTSDIR}
+
+	install -m 0755 ${B}/modules/egl/deqp-egl ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles2/deqp-gles2 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles3/deqp-gles3 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/gles31/deqp-gles31 ${D}/${CTSDIR}
+	install -m 0755 ${B}/modules/internal/de-internal-tests ${D}/${CTSDIR}
+
+	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/common/subgroups/*.a ${D}/${CTSDIR}/common/subgroups/cmake_install.cmake ${D}/${CTSDIR}/common/subgroups/CMakeFiles
+}
+
+SECURITY_CFLAGS:riscv64 = "${SECURITY_NOPIE_CFLAGS}"
+LTO = ""
+
diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
new file mode 100644
index 00000000..d086c012
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.3.1.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Vulkan CTS"
+
+require khronos-cts.inc
+# vulkan-cts-1.3.3.1
+SRCREV_vk-gl-cts = "6024a88390942876147a88dce82bbed73b866c1b"
+SRCREV_amber = "8b145a6c89dcdb4ec28173339dd176fb7b6f43ed"
+SRCREV_glslang = "7dda6a6347b0bd550e202942adee475956ef462a"
+SRCREV_spirv-headers = "b765c355f488837ca4c77980ba69484f3ff277f5"
+SRCREV_spirv-tools = "b930e734ea198b7aabbbf04ee1562cf6f57962f0"
+SRCREV_jsoncpp = "9059f5cad030ba11d37818847443a53918c327b1"
+SRCREV_vulkan-docs = "9b5562187a8ad72c171410b036ceedbc450153ba"
+SRC_URI[renderdoc.sha256sum] = "e7b5f0aa5b1b0eadc63a1c624c0ca7f5af133aa857d6a4271b0ef3d0bdb6868e"
+# Not yet needed
+SRCREV_ESExtractor = "ce5d7ebcf0ebb0d78385ee4cc34653eb6764bfc4"
+SRCREV_video-parser = "7d68747d3524842afaf050c5e00a10f5b8c07904"
+
+SRC_URI += "file://0001-cmake-Define-WAYLAND_SCANNER-and-WAYLAND_PROTOCOLS_D.patch \
+            file://0001-Include-missing-cstdint.patch \
+            file://0001-include-missing-cstdint.patch;patchdir=external/amber/src \
+"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+inherit features_check
+
+DEPENDS += " vulkan-loader"
+
+do_install() {
+	install -d ${D}/${CTSDIR}
+	cp -r ${B}/external/vulkancts/modules/vulkan/* ${D}/${CTSDIR}/
+	rm -rf ${D}/${CTSDIR}/*.a ${D}/${CTSDIR}/cmake_install.cmake ${D}/${CTSDIR}/CMakeFiles
+	rm -rf ${D}/${CTSDIR}/*/*.a ${D}/${CTSDIR}/*/cmake_install.cmake ${D}/${CTSDIR}/*/CMakeFiles
+}
-- 
2.41.0


