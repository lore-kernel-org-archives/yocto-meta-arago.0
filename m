Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 86245529C8
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2018 20:36:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wASKajrf089500
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:45 -0600
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wASKajYU040196
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:45 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 28 Nov 2018 14:36:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 28 Nov 2018 14:36:45 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wASKagmq014881;
	Wed, 28 Nov 2018 14:36:44 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Nov 2018 15:24:03 -0500
Message-ID: <1543436645-4503-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH 1/3] open62541: open source implementation of OPC/UA
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
X-List-Received-Date: Wed, 28 Nov 2018 20:36:57 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...examples-client-allow-configurable-server.patch | 52 ++++++++++++++++++++
 .../open62541/open62541_git.bb                     | 57 ++++++++++++++++++++++
 2 files changed, 109 insertions(+)
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
 create mode 100644 meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
new file mode 100644
index 0000000..1cf89a9
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541/0001-examples-client-allow-configurable-server.patch
@@ -0,0 +1,52 @@
+From da2b9a741c3116a7774989f6338976c00a4c0496 Mon Sep 17 00:00:00 2001
+From: Jacob Stiffler <j-stiffler@ti.com>
+Date: Wed, 28 Nov 2018 14:31:22 -0500
+Subject: [PATCH] examples: client: allow configurable server
+
+* Enable a remote server URL to be provided as an argument.
+* Default to localhost if no arguments are provided.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
+---
+ examples/client.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/examples/client.c b/examples/client.c
+index c3147b7..90ab1c7 100644
+--- a/examples/client.c
++++ b/examples/client.c
+@@ -25,12 +25,17 @@ nodeIter(UA_NodeId childId, UA_Boolean isInverse, UA_NodeId referenceTypeId, voi
+ }
+ 
+ int main(int argc, char *argv[]) {
++    char *ua_server = "opc.tcp://localhost:4840";
++    if(argc > 1) {
++        ua_server = argv[1];
++    }
++
+     UA_Client *client = UA_Client_new(UA_ClientConfig_default);
+ 
+     /* Listing endpoints */
+     UA_EndpointDescription* endpointArray = NULL;
+     size_t endpointArraySize = 0;
+-    UA_StatusCode retval = UA_Client_getEndpoints(client, "opc.tcp://localhost:4840",
++    UA_StatusCode retval = UA_Client_getEndpoints(client, ua_server,
+                                                   &endpointArraySize, &endpointArray);
+     if(retval != UA_STATUSCODE_GOOD) {
+         UA_Array_delete(endpointArray, endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
+@@ -46,8 +51,8 @@ int main(int argc, char *argv[]) {
+     UA_Array_delete(endpointArray,endpointArraySize, &UA_TYPES[UA_TYPES_ENDPOINTDESCRIPTION]);
+ 
+     /* Connect to a server */
+-    /* anonymous connect would be: retval = UA_Client_connect(client, "opc.tcp://localhost:4840"); */
+-    retval = UA_Client_connect_username(client, "opc.tcp://localhost:4840", "user1", "password");
++    /* anonymous connect would be: retval = UA_Client_connect(client, ua_server); */
++    retval = UA_Client_connect_username(client, ua_server, "user1", "password");
+     if(retval != UA_STATUSCODE_GOOD) {
+         UA_Client_delete(client);
+         return (int)retval;
+-- 
+2.7.4
+
diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
new file mode 100644
index 0000000..1166e26
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_git.bb
@@ -0,0 +1,57 @@
+SUMMARY = "Open source implementation of OPC UA"
+HOMEPAGE = "http://open62541.org/"
+LICENSE = "MPL-2.0"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = "git://github.com/open62541/open62541.git;protocol=https;branch=${BRANCH} \
+           file://0001-examples-client-allow-configurable-server.patch"
+
+BRANCH = "0.3"
+SRCREV = "9f46963240854d9a65d1784a3d2d8440c70157e8"
+
+PV = "0.3-rc4+git${SRCPV}"
+
+inherit cmake python3native
+
+DEPENDS += "python3-six-native libcheck"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECMAKE = "-DCMAKE_BUILD_TYPE=RelWithDebInfo -DUA_BUILD_EXAMPLES=1 -DUA_BUILD_UNIT_TESTS=1"
+
+PACKAGECONFIG[sharedlibs] = "-DBUILD_SHARED_LIBS=1,-DBUILD_SHARED_LIBS=0,,"
+PACKAGECONFIG[encrypt] = "-DUA_ENABLE_ENCRYPTION=1 -DMBEDTLS_FOLDER_LIBRARY=${STAGING_LIBDIR} -DMBEDTLS_FOLDER_INCLUDE=${STAGING_INCDIR},-DUA_ENABLE_ENCRYPTION=0,mbedtls,"
+
+# Current mbedtls is not sufficient.
+PACKAGECONFIG ?= ""
+
+do_install_append() {
+    # header file is not installed by default
+    install -d ${D}${includedir}
+    install -m 644 ${B}/open62541.h ${D}${includedir}
+
+    # Install examples
+    install -d "${D}${datadir}/${BPN}/examples"
+    for example in ${B}/bin/examples/*
+    do
+        install -m 755 "$example" "${D}${datadir}/${BPN}/examples"
+    done
+
+    # Install unittests
+    install -d "${D}${datadir}/${BPN}/tests"
+    for test in ${B}/bin/tests/*
+    do
+        install -m 755 "$test" "${D}${datadir}/${BPN}/tests"
+    done
+}
+
+PACKAGES =+ "${PN}-examples ${PN}-tests"
+FILES_${PN}-dev += "${libdir}/cmake/*"
+FILES_${PN}-examples += "${datadir}/${BPN}/examples"
+FILES_${PN}-tests += "${datadir}/${BPN}/tests"
+
+# Allow staticdev package to be empty incase sharedlibs is switched on
+ALLOW_EMPTY_${PN}-staticdev = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


