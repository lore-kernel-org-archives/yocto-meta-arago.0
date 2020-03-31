Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7943A5298B
	for <meta-arago@arago-project.org>;
	Tue, 31 Mar 2020 20:15:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 02VKDLdJ123536
	for <meta-arago@arago-project.org>; Tue, 31 Mar 2020 15:13:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1585685601;
	bh=bLyr6nHrGw21hLSHiI04/2VXCfIT2/Wx7OLPlfVQVHQ=;
	h=From:To:CC:Subject:Date;
	b=IlSxecHAJFyAlvYTPvfozio7DTHmkUbhoXl1Q/A2TWoY3mu/8iRSj/wbLCZc6HzP5
	la1g1OqgBFF3NDhY76HAMHbXeyp8/rUOvLuBxxklqrN7KNqmHNH7BINaSUxL7wxN2W
	WTrtmgdArn+/YINfpsdaSZmL6tXEZAB/e860mQeM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VKDLOe064181
	for <meta-arago@arago-project.org>; Tue, 31 Mar 2020 15:13:21 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 31 Mar 2020 15:13:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 31 Mar 2020 15:13:21 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 02VKDK2b096832;
	Tue, 31 Mar 2020 15:13:20 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 31 Mar 2020 16:13:18 -0400
Message-ID: <1585685598-8072-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/dunfell/master][PATCH v2] open62541: upgrade to version 1.0.1, other fixes
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
X-List-Received-Date: Tue, 31 Mar 2020 20:15:33 -0000
Content-Type: text/plain

* Update SRCREVs to version 1.0.1.
  - drop 0001-tests-fix-typing-of-size_t-in-printf.patch as it has
    been resolved upstream.
* Fix destsuffix of submodules.
* Enable encryption and default self-signed certificate for testing.
* Configure full, reduced, minimal namespace 0 via PACKAGECONFIG
  - Full namespace zero is required to utilize other standard
    information models, but causes greatly increased build times and
    potentially unstable builds.
* Move unit tests to use PACKAGECONFIG.
  - Diable for now as the build is broken due to missing dependency
    libsubunit.
  - Make installation conditional on PACKAGECONFIG.
* Move tools to dev package, and RDEPENDS on python3 as they contain
  python scripts.
  - This is a bit messy with recipes that depend on open62541, as they
    will be executing the tools from the target package, but this
    works as they are python scripts. However, dependent recipes will
    also need to depend on python3-native.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* move namespace zero config to PACKAGE CONFIG
* slight change to commit message to reflect this change.

 .../open62541/open62541_git.bb                     | 65 +++++++++++++---------
 1 file changed, 38 insertions(+), 27 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
index 89c102c..c9452c2 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
@@ -5,36 +5,28 @@ LICENSE = "MPL-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
 
 SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
-           git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=deps/ua-nodeset;name=ua-nodeset \
-           git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=deps/mdnsd;name=mdnsd \
+           git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset;name=ua-nodeset \
+           git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=git/deps/mdnsd;name=mdnsd \
            file://0001-examples-client-allow-configurable-server.patch \
-           file://0001-tests-fix-typing-of-size_t-in-printf.patch"
+"
 
-BRANCH = "master"
-SRCREV = "7ea5a142bac44d5de7554938360e431d34fe2f59"
+BRANCH = "1.0"
+SRCREV = "e4309754fc2f6ea6508b59ca82e08c27b0118d74"
 
-SRCREV_ua-nodeset = "5bbf784e9376f7230098149dc0218f318a48d630"
-SRCREV_mdnsd = "9e953b8e4c54d50ba0e174f1e98cfca18f933126"
+SRCREV_ua-nodeset = "0777abd1bc407b4dbd79abc515864f8c3ce6812b"
+SRCREV_mdnsd = "f7f0dd543f12fa7bbf2b667cceb287b9c8184b7d"
 
 SRCREV_FORMAT = "default"
 
-PV = "0.4-dev+git${SRCPV}"
+PV = "1.0.1+git${SRCPV}"
 
 inherit cmake python3native
 
-DEPENDS += "python3-six-native libcheck"
+DEPENDS += "python3-six-native"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1 -DUA_BUILD_UNIT_TESTS=1"
-
-# Disable BUILD_OPTIMIZATION as unittests fail due to "strict-overflow"
-DEBUG_BUILD = "1"
-BUILD_OPTIMIZATION = ""
-EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=Debug"
-
-# Or disable unittests
-#EXTRA_OECMAKE += "-DUA_BUILD_UNIT_TESTS=0"
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1"
 
 PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
 PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
@@ -44,11 +36,24 @@ PACKAGECONFIG[pubsub_delta_frames] = "-DUA_ENABLE_PUBSUB_DELTAFRAMES=1,-DUA_ENAB
 PACKAGECONFIG[pubsub_informationmodel] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=0,,"
 PACKAGECONFIG[pubsub_informationmodel_methods] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=0,,"
 PACKAGECONFIG[subscription_events] = "-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=1,-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=0,,"
-
 PACKAGECONFIG[certificate] = "-DUA_BUILD_SELFSIGNED_CERTIFICATE=1,-DUA_BUILD_SELFSIGNED_CERTIFICATE=0,,"
 
+# Namespace zero: minimal, reduced (default), full
+# 
+# Allow all three options, but do not assume default, nor the behavior
+#  if more than one option is chosen.
+#
+# NOTE: enabling ns0_full will cause a large increase in build time
+PACKAGECONFIG[ns0_full] = "-DUA_NAMESPACE_ZERO=FULL,,,"
+PACKAGECONFIG[ns0_reduced] = "-DUA_NAMESPACE_ZERO=REDUCED,,,"
+PACKAGECONFIG[ns0_minimal] = "-DUA_NAMESPACE_ZERO=MINIMAL,,,"
+
+# This is broken due to missing libsubunit dependency. Keep here in case it becomes available.
+PACKAGECONFIG[unit_tests] = "-DUA_BUILD_UNIT_TESTS=1,-DUA_BUILD_UNIT_TESTS=0,libcheck libsubunit,"
+
 PACKAGECONFIG ?= "pubsub pubsub_delta_frames pubsub_informationmodel \
-                  pubsub_informationmodel_methods pubsub_uadp"
+                  pubsub_informationmodel_methods pubsub_uadp encrypt \
+                  certificate"
 
 # Install examples and unit tests
 do_install_append() {
@@ -59,19 +64,25 @@ do_install_append() {
         install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
     done
 
-    # Install unittests
-    install -d "${D}${datadir}/${BPN}/tests"
-    for test in ${B}/bin/tests/*
-    do
-        install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
-    done
+    if ${@bb.utils.contains('PACKAGECONFIG','unit_tests','true','false',d)}
+    then
+        # Install unittests
+        install -d "${D}${datadir}/${BPN}/tests"
+        for test in ${B}/bin/tests/*
+        do
+            install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
+        done
+    fi
 }
 
 PACKAGES =+ "${PN}-examples ${PN}-tests"
-FILES_${PN}-dev += "${libdir}/cmake/*"
+FILES_${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
 FILES_${PN}-examples += "${datadir}/${BPN}/examples"
 FILES_${PN}-tests += "${datadir}/${BPN}/tests"
 
+# This contains some python-based tools
+RDEPENDS_${PN}-dev = "python3"
+
 # Allow staticdev package to be empty incase sharedlibs is switched on
 ALLOW_EMPTY_${PN}-staticdev = "1"
 ALLOW_EMPTY_${PN}-tests = "1"
-- 
2.7.4


