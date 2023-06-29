Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506E2EB64DC
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 16:41:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.1942.1688056896543937428
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 29 Jun 2023 09:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TNktk1Q7;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35TGfZU5050960;
	Thu, 29 Jun 2023 11:41:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688056895;
	bh=8FnSfB6ttMa+sArBsgpXs0D2nMTy/X4wUh5q7cl5yAY=;
	h=From:To:Subject:Date;
	b=TNktk1Q7SP4iKixISqS9BYtDPqCIVdrEFsetGaOPvr3pxo6/FI806Rfp2EtV0OWOc
	 Pce/Owk06SC5uuyqU03812J7lAsqb8yczJHkVulBoo+ZoIitpzejcppBmAUkT8eGO9
	 R1J+Qu/g0BhlMIMVVoTp1n3Xp3+gyN1MjHoXJiGI=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35TGfZ9u027759
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Jun 2023 11:41:35 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 29
 Jun 2023 11:41:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 29 Jun 2023 11:41:34 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35TGfYGU017338;
	Thu, 29 Jun 2023 11:41:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qEui6-0000X9-HU; Thu, 29 Jun 2023 11:41:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 1/2] open62541: Move to version 1.3.6 from meta-networking
Date: Thu, 29 Jun 2023 11:41:33 -0500
Message-ID: <20230629164134.2008-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 29 Jun 2023 16:41:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14736

Migrate from a locked down version of open62541 to whatever
meta-networking wants to point to.  We do need to turn on the examples
and apply some patches to get the examples to compile.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../0001-examples-Remove-sys-io.h.patch       | 68 ++++++++++++++
 ...les-client-allow-configurable-server.patch |  4 +-
 .../open62541/open62541_%.bbappend            | 39 ++++++++
 .../open62541/open62541_git.bb                | 91 -------------------
 4 files changed, 110 insertions(+), 92 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch
new file mode 100644
index 00000000..3119fb3d
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-Remove-sys-io.h.patch
@@ -0,0 +1,68 @@
+From 123f7274cf6cb65866c910dec16ec1595495d1dc Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 29 Jun 2023 11:14:50 -0500
+Subject: [PATCH] examples: Remove sys/io.h
+
+This header is missing on some architectures, aarch64 being one of them.
+
+Upstream-Status: Pending
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ examples/pubsub_realtime/pubsub_TSN_loopback.c                  | 1 -
+ examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c    | 1 -
+ examples/pubsub_realtime/pubsub_TSN_publisher.c                 | 1 -
+ examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c | 1 -
+ 4 files changed, 4 deletions(-)
+
+diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback.c b/examples/pubsub_realtime/pubsub_TSN_loopback.c
+index 803a3c107..e90015aa3 100644
+--- a/examples/pubsub_realtime/pubsub_TSN_loopback.c
++++ b/examples/pubsub_realtime/pubsub_TSN_loopback.c
+@@ -77,7 +77,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <linux/types.h>
+-#include <sys/io.h>
+ #include <getopt.h>
+ 
+ /* For thread operations */
+diff --git a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
+index 7db37e9d5..ba5f7aff6 100644
+--- a/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
++++ b/examples/pubsub_realtime/pubsub_TSN_loopback_single_thread.c
+@@ -54,7 +54,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <linux/types.h>
+-#include <sys/io.h>
+ #include <getopt.h>
+ 
+ /* For thread operations */
+diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher.c b/examples/pubsub_realtime/pubsub_TSN_publisher.c
+index 945ec3d4f..5ff866908 100644
+--- a/examples/pubsub_realtime/pubsub_TSN_publisher.c
++++ b/examples/pubsub_realtime/pubsub_TSN_publisher.c
+@@ -78,7 +78,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <linux/types.h>
+-#include <sys/io.h>
+ #include <getopt.h>
+ 
+ /* For thread operations */
+diff --git a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
+index 72dcd3997..73967577f 100644
+--- a/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
++++ b/examples/pubsub_realtime/pubsub_TSN_publisher_multiple_thread.c
+@@ -57,7 +57,6 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <linux/types.h>
+-#include <sys/io.h>
+ #include <getopt.h>
+ 
+ /* For thread operations */
+-- 
+2.17.1
+
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
index 97d241ed..742d56ac 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
@@ -36,8 +36,9 @@ index f04bed9..dfc56f5 100644
 +    UA_StatusCode retval = UA_Client_getEndpoints(client, ua_server,
                                                    &endpointArraySize, &endpointArray);
      if(retval != UA_STATUSCODE_GOOD) {
+         printf("Could not get the endpoints\n");
          UA_Array_delete(endpointArray, endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
-@@ -51,8 +56,8 @@ int main(int argc, char *argv[]) {
+@@ -52,8 +57,8 @@ int main(int argc, char *argv[]) {
      UA_Array_delete(endpointArray,endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
  
      /* Connect to a server */
@@ -46,6 +47,7 @@ index f04bed9..dfc56f5 100644
 +    /* anonymous connect would be: retval = UA_Client_connect(client, ua_server); */
 +    retval = UA_Client_connect_username(client, ua_server, "user1", "password");
      if(retval != UA_STATUSCODE_GOOD) {
+         printf("Could not connect\n");
          UA_Client_delete(client);
          return EXIT_FAILURE;
 -- 
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
new file mode 100644
index 00000000..7ce16235
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
@@ -0,0 +1,39 @@
+
+FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+SRC_URI:append = " file://0001-examples-client-allow-configurable-server.patch \
+                   file://0001-examples-Remove-sys-io.h.patch \
+"
+
+EXTRA_OECMAKE = "-DUA_BUILD_EXAMPLES=1"
+
+# Install examples and unit tests
+do_install:append() {
+    # Install examples
+    install -d "${D}${datadir}/${BPN}/examples"
+    for example in ${B}/bin/examples/*
+    do
+        install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
+    done
+
+    if ${@bb.utils.contains('PACKAGECONFIG','unit_tests','true','false',d)}
+    then
+        # Install unittests
+        install -d "${D}${datadir}/${BPN}/tests"
+        for test in ${B}/bin/tests/*
+        do
+            install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
+        done
+    fi
+}
+
+PACKAGES =+ "${PN}-examples ${PN}-tests"
+FILES:${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
+FILES:${PN}-examples += "${datadir}/${BPN}/examples"
+FILES:${PN}-tests += "${datadir}/${BPN}/tests"
+
+# Allow staticdev package to be empty incase sharedlibs is switched on
+ALLOW_EMPTY:${PN}-staticdev = "1"
+ALLOW_EMPTY:${PN}-tests = "1"
+
+BBCLASSEXTEND = "native nativesdk"
+
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
deleted file mode 100644
index 02b63738..00000000
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
+++ /dev/null
@@ -1,91 +0,0 @@
-SUMMARY = "Open source implementation of OPC UA"
-HOMEPAGE = "http://open62541.org/"
-LICENSE = "MPL-2.0"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
-
-SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
-           git://github.com/OPCFoundation/UA-Nodeset.git;protocol=https;branch=v1.04;destsuffix=git/deps/ua-nodeset;name=ua-nodeset \
-           git://github.com/Pro/mdnsd.git;protocol=https;branch=master;destsuffix=git/deps/mdnsd;name=mdnsd \
-           file://0001-examples-client-allow-configurable-server.patch \
-           file://0001-CMakeLists-do-not-install-git-directories.patch \
-"
-
-BRANCH = "1.0"
-SRCREV = "e4309754fc2f6ea6508b59ca82e08c27b0118d74"
-
-SRCREV_ua-nodeset = "0777abd1bc407b4dbd79abc515864f8c3ce6812b"
-SRCREV_mdnsd = "f7f0dd543f12fa7bbf2b667cceb287b9c8184b7d"
-
-SRCREV_FORMAT = "default"
-
-PV = "1.0.1+git${SRCPV}"
-
-inherit cmake python3native
-
-DEPENDS += "python3-six-native"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1"
-
-PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
-PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
-PACKAGECONFIG[pubsub] = "-DUA_ENABLE_PUBSUB=1,-DUA_ENABLE_PUBSUB=0,,"
-PACKAGECONFIG[pubsub_uadp] = "-DUA_ENABLE_PUBSUB_ETH_UADP=1,-DUA_ENABLE_PUBSUB_ETH_UADP=0,,"
-PACKAGECONFIG[pubsub_delta_frames] = "-DUA_ENABLE_PUBSUB_DELTAFRAMES=1,-DUA_ENABLE_PUBSUB_DELTAFRAMES=0,,"
-PACKAGECONFIG[pubsub_informationmodel] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL=0,,"
-PACKAGECONFIG[pubsub_informationmodel_methods] = "-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=1,-DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=0,,"
-PACKAGECONFIG[subscription_events] = "-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=1,-DUA_ENABLE_SUBSCRIPTIONS_EVENTS=0,,"
-PACKAGECONFIG[certificate] = "-DUA_BUILD_SELFSIGNED_CERTIFICATE=1,-DUA_BUILD_SELFSIGNED_CERTIFICATE=0,,"
-
-# Namespace zero: minimal, reduced (default), full
-# 
-# Allow all three options, but do not assume default, nor the behavior
-#  if more than one option is chosen.
-#
-# NOTE: enabling ns0_full will cause a large increase in build time
-PACKAGECONFIG[ns0_full] = "-DUA_NAMESPACE_ZERO=FULL,,,"
-PACKAGECONFIG[ns0_reduced] = "-DUA_NAMESPACE_ZERO=REDUCED,,,"
-PACKAGECONFIG[ns0_minimal] = "-DUA_NAMESPACE_ZERO=MINIMAL,,,"
-
-# This is broken due to missing libsubunit dependency. Keep here in case it becomes available.
-PACKAGECONFIG[unit_tests] = "-DUA_BUILD_UNIT_TESTS=1,-DUA_BUILD_UNIT_TESTS=0,libcheck libsubunit,"
-
-PACKAGECONFIG ?= "pubsub pubsub_delta_frames pubsub_informationmodel \
-                  pubsub_informationmodel_methods pubsub_uadp encrypt \
-                  certificate"
-
-# Install examples and unit tests
-do_install:append() {
-    # Install examples
-    install -d "${D}${datadir}/${BPN}/examples"
-    for example in ${B}/bin/examples/*
-    do
-        install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
-    done
-
-    if ${@bb.utils.contains('PACKAGECONFIG','unit_tests','true','false',d)}
-    then
-        # Install unittests
-        install -d "${D}${datadir}/${BPN}/tests"
-        for test in ${B}/bin/tests/*
-        do
-            install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
-        done
-    fi
-}
-
-PACKAGES =+ "${PN}-examples ${PN}-tests"
-FILES:${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
-FILES:${PN}-examples += "${datadir}/${BPN}/examples"
-FILES:${PN}-tests += "${datadir}/${BPN}/tests"
-
-# This contains some python-based tools
-RDEPENDS:${PN}-dev = "python3"
-
-# Allow staticdev package to be empty incase sharedlibs is switched on
-ALLOW_EMPTY:${PN}-staticdev = "1"
-ALLOW_EMPTY:${PN}-tests = "1"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


