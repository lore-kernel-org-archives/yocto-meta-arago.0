Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 51B62529B1
	for <meta-arago@arago-project.org>;
	Tue,  8 Oct 2019 21:27:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x98LQE0Z107410
	for <meta-arago@arago-project.org>; Tue, 8 Oct 2019 16:26:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570569974;
	bh=85s/wSzu9thP4khaqQ3AIvmiSBM12OvuiNLTAiVuePs=;
	h=From:To:CC:Subject:Date;
	b=Gp06Ts8L8SRHzeR0keYwMgpCD5bVOLcOg2Jhn6hjzOoN73EGLOzhhlQIEqdVMeR3g
	/3AhZUdeE2t51+OlJ1O45pHAC/d89hdUOV+8hvC3bYN8oGBGSHWY4nj1iK2wIr+qSk
	qV/wGkO60ZTpxTKDbmrkcurK8ipO+D7Jbb8M27Zw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x98LQEAa083034
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 8 Oct 2019 16:26:14 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 8 Oct 2019 16:26:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 8 Oct 2019 16:26:11 -0500
Received: from UDA0869574A.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x98LQEcH005972;
	Tue, 8 Oct 2019 16:26:14 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 8 Oct 2019 17:26:18 -0400
Message-ID: <20191008212618.56782-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk] [PATCH] tvm: fix TVM runtime problem
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
X-List-Received-Date: Tue, 08 Oct 2019 21:27:28 -0000
Content-Type: text/plain

* add run-time depends of Python3 decorator
* use latest code (Mon Oct 7) from master branch
* update patch file accordingly

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../0001-CMakeLists-install-unit-tests.patch  | 29 ++++++++++---------
 recipes-support/tvm/tvm_git.bb                |  7 +++--
 2 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch b/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
index 6582d70..a79856f 100644
--- a/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
+++ b/recipes-support/tvm/tvm/0001-CMakeLists-install-unit-tests.patch
@@ -1,26 +1,29 @@
-From 2663c9682e427ce64f5bfa53e1ee389f80133cac Mon Sep 17 00:00:00 2001
-From: Jacob Stiffler <j-stiffler@ti.com>
-Date: Wed, 14 Aug 2019 16:27:51 -0400
-Subject: [PATCH] CMakeLists: install unit tests
+From 5904aa69d8f022678aa19dd4c1b5569d5fc243ee Mon Sep 17 00:00:00 2001
+From: Jianzhong Xu <xuj@ti.com>
+Date: Tue, 8 Oct 2019 16:56:30 -0400
+Subject: [PATCH] [PATCH] CMakeLists: install unit tests
 
 * Install the unittests (cpptest) to /usr/share/tvm/cpptest
 * For simplicity, do not exclude cpptest from the default build.
 
 Upstream-Status: Innappropriate [Configuration]
 
-Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+Signed-off-by: Jianzhong Xu <xuj@ti.com>
 ---
  CMakeLists.txt | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
+ mode change 100644 => 100755 CMakeLists.txt
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 494afbd..7e887f6 100644
+old mode 100644
+new mode 100755
+index 10730ac7..ea369a6e
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -233,10 +233,11 @@ if(GTEST_LIB)
+@@ -333,10 +333,11 @@ if(GTEST_INCLUDE_DIR AND GTEST_LIB)
      list(APPEND TEST_EXECS ${__execname})
-     target_link_libraries(${__execname}
-       tvm ${GTEST_LIB} pthread)
+     target_include_directories(${__execname} PUBLIC ${GTEST_INCLUDE_DIR})
+     target_link_libraries(${__execname} tvm ${GTEST_LIB} pthread dl)
 -    set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_ALL 1)
 -    set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_DEFAULT_BUILD 1)
 +    #set_target_properties(${__execname} PROPERTIES EXCLUDE_FROM_ALL 1)
@@ -28,9 +31,9 @@ index 494afbd..7e887f6 100644
    endforeach()
    add_custom_target(cpptest DEPENDS ${TEST_EXECS})
 +  install(TARGETS ${TEST_EXECS} DESTINATION share/tvm/cpptest)
- endif()
- 
- # Custom targets
+ elseif(NOT GTEST_INCLUDE_DIR)
+   add_custom_target(cpptest
+       COMMAND echo "Missing Google Test headers in include path"
 -- 
-2.7.4
+2.17.1
 
diff --git a/recipes-support/tvm/tvm_git.bb b/recipes-support/tvm/tvm_git.bb
index 9750726..5bbdd36 100644
--- a/recipes-support/tvm/tvm_git.bb
+++ b/recipes-support/tvm/tvm_git.bb
@@ -8,9 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e \
                     file://3rdparty/HalideIR/LICENSE;md5=9910386e68f0616e1ecf1037479fa97e \
 "
 
+RDEPENDS_${PN} = " python3-decorator \
+"
+
 PV = "0.5"
 
-BRANCH ?= "v${PV}"
+BRANCH = "master"
 
 # Main TVM sources plus submodules.
 SRC_URI = "git://github.com/dmlc/tvm;protocol=https;branch=${BRANCH};name=tvm \
@@ -21,7 +24,7 @@ SRC_URI = "git://github.com/dmlc/tvm;protocol=https;branch=${BRANCH};name=tvm \
            file://0001-CMakeLists-install-unit-tests.patch \
 "
 
-SRCREV_tvm = "f08015e7fde92c835907d4c9b7ad6d3f634e94a5"
+SRCREV_tvm = "76c239269935288e51fbce14f135d75ad9742b2a"
 SRCREV_dmlc-core = "d07fb7a443b5db8a89d65a15a024af6a425615a5"
 SRCREV_halideir = "b257a9221ee1e5180d994b3488ddcc259b0ac157"
 SRCREV_dlpack = "5c792cef3aee54ad8b7000111c9dc1797f327b59"
-- 
2.17.1


