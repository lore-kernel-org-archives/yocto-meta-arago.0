Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 66DC5529D4
	for <meta-arago@arago-project.org>;
	Wed, 29 Jan 2020 21:23:55 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TLM3j5049228
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 15:22:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580332923;
	bh=NJG/cprRPFL5ujAMUvXFNxlQMWmqKXKP34L/4pEIUEs=;
	h=From:To:CC:Subject:Date;
	b=IeN2TmcCDcqflo26J0pyXNGEuQpIFL0SxulkYSSZ3SGEgW0ubBDa+haEEkCCQjtBL
	tnKzXGozH9SZeBElKszTUgIajVo2jMkHhqYWuskJp1yo+BGyj6QANMbrLCZI1kk9Z/
	7EmlcxWbCzbggrqbb0vzSTaEn5NyU/xuikM7XSzo=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TLM37V032362
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 29 Jan 2020 15:22:03 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 29 Jan 2020 15:22:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 29 Jan 2020 15:22:03 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TLM2G0045356;
	Wed, 29 Jan 2020 15:22:03 -0600
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.97])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	00TLM2306458; Wed, 29 Jan 2020 15:22:02 -0600 (CST)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 29 Jan 2020 15:22:06 -0600
Message-ID: <20200129212206.27512-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: vijayp@ti.com
Subject: [thud/zeus/master][PATCH v2] recipes-graphics: Add recipe for DevIL
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
X-List-Received-Date: Wed, 29 Jan 2020 21:23:58 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Developers Image Library (DevIL) is a cross-platform image utility
library with simple syntax (openil.sourceforge.net). Adding recipe to
build from sources.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../recipes-graphics/devil/devil_1.8.0.bb     | 25 +++++++++++++++++++
 .../devil/files/Remove-ILUT-dependency.patch  | 13 ++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
 create mode 100644 meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch

diff --git a/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
new file mode 100644
index 00000000..3502ed0c
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/devil/devil_1.8.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "DevIL cross platform image utility library"
+DESCRIPTION = "Developer's Image Library (DevIL) is a cross-platform image \
+               library utilizing simple syntax to load, save, convert, \
+               manipulate, filter and display a variety of images."
+HOMEPAGE = "https://github.com/DentonW/DevIL"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
+
+SRC_URI = "git://github.com/dentonw/devil.git;protocol=git;branch=master \
+           file://Remove-ILUT-dependency.patch"
+
+SRCREV = "e34284a7e07763769f671a74b4fec718174ad862"
+
+PR = "r1"
+S = "${WORKDIR}/git"
+
+COMPATIBLE_MACHINE = "j7-evm"
+
+# Build only DevIL
+OECMAKE_SOURCEPATH = "${S}/DevIL"
+
+PACKAGECONFIG ??= "png"
+PACKAGECONFIG[png] = "-DIL_NO_PNG=0,-DIL_NO_PNG=1,libpng,"
+
+inherit pkgconfig cmake
diff --git a/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
new file mode 100644
index 00000000..4f0f9dfa
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/devil/files/Remove-ILUT-dependency.patch
@@ -0,0 +1,13 @@
+diff --git a/DevIL/CMakeLists.txt b/DevIL/CMakeLists.txt
+index e342f93d..fae40167 100644
+--- a/DevIL/CMakeLists.txt
++++ b/DevIL/CMakeLists.txt
+@@ -6,7 +6,7 @@ set (CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules")
+ 
+ add_subdirectory(src-IL)
+ add_subdirectory(src-ILU)
+-add_subdirectory(src-ILUT)
++# add_subdirectory(src-ILUT)
+ option(IL_TESTS "build DevIL tests" ON)
+ if (IL_TESTS)
+     ENABLE_TESTING()
-- 
2.25.0


