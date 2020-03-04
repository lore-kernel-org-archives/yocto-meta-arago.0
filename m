Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 0F6EF52A6A
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2020 22:07:53 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024M5neF009052
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2020 16:05:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583359549;
	bh=uPT6W8ptyRM/Ba1HZbyRU4z/wj/6kO3K2yo2SOJMGVM=;
	h=From:To:CC:Subject:Date;
	b=mo/I/oZ7l9pYx1fzTIUDNnVnf6BROuKxpsweIGz4qqd6jnUJDorq6sx6lk2NfzhMP
	Eu3zJIJ6X990ls9VqCUBicximecmWJzoQOCF15Mj/8YcbU53WT2/t3MTinNt1p7gN9
	+PSayR56dah1PAJqnxgIaJoj3KYcX2aa7K6tfP/w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 024M5naV082971
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2020 16:05:49 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 4 Mar 2020 16:05:49 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 4 Mar 2020 16:05:49 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 024M5n8n044508;
	Wed, 4 Mar 2020 16:05:49 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 4 Mar 2020 16:45:15 -0500
Message-ID: <1583358315-5293-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] open62541: upgrade to version 1.0.1, other fixes
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
X-List-Received-Date: Wed, 04 Mar 2020 22:07:53 -0000
Content-Type: text/plain

* Update SRCREVs to version 1.0.1.
  - drop 0001-tests-fix-typing-of-size_t-in-printf.patch as it has
    been resolved upstream.
* Fix destsuffix of submodules.
* Enable encryption and default self-signed certificate for testing.
* Enable full namespace 0
  - This is required to utilize other official information models.
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
 .../open62541/open62541_git.bb                     | 55 +++++++++++-----------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
index 89c102c..bcdeb32 100644
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
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_NAMESPACE_ZERO=FULL -DUA_BUILD_EXAMPLES=1"
 
 PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
 PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
@@ -44,11 +36,14 @@ PACKAGECONFIG[pubsub_delta_frames] = "-DUA_ENABLE_PUBSUB_DELTAFRAMES=1,-DUA_ENAB
 PACKAGECONFIG[pubsub_informationmodel] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=0,,"
 PACKAGECONFIG[pubsub_informationmodel_methods] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=0,,"
 PACKAGECONFIG[subscription_events] = "-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=1,-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=0,,"
-
 PACKAGECONFIG[certificate] = "-DUA_BUILD_SELFSIGNED_CERTIFICATE=1,-DUA_BUILD_SELFSIGNED_CERTIFICATE=0,,"
 
+# This is broken due to missing libsubunit dependency. Keep here in case it becomes available.
+PACKAGECONFIG[unit_tests] = "-DUA_BUILD_UNIT_TESTS=1,-DUA_BUILD_UNIT_TESTS=0,libcheck libsubunit,"
+
 PACKAGECONFIG ?= "pubsub pubsub_delta_frames pubsub_informationmodel \
-                  pubsub_informationmodel_methods pubsub_uadp"
+                  pubsub_informationmodel_methods pubsub_uadp encrypt \
+                  certificate"
 
 # Install examples and unit tests
 do_install_append() {
@@ -59,19 +54,25 @@ do_install_append() {
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


