Return-Path: <sam.nelson@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 47B60529B3
	for <meta-arago@arago-project.org>;
	Thu, 17 May 2018 02:22:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4H2MflI028562
	for <meta-arago@arago-project.org>; Wed, 16 May 2018 21:22:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526523761;
	bh=KGQOXqFcXg45HLcVscDlmZjoxH/+jpRrB41dEApfyL4=;
	h=From:To:CC:Subject:Date;
	b=jBWISOQoFAlIJH8jZNgQfT1hlMjjj7XZ/zJ6q3VMoH6hchwnwV3zMStfuLAtlkWKb
	ywEedXp1u/fXbApAxyCQphHjtFXMIcUYCmGWXSjPXjrZT8pJWpPObJIvRRWFxO/8j2
	YQ63YWurpIhPbdr4ZIwjGv/sbrm/ApIeq4tN21ow=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4H2Mfv4015500
	for <meta-arago@arago-project.org>; Wed, 16 May 2018 21:22:41 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 16 May 2018 21:22:41 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 16 May 2018 21:22:41 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4H2MfuH003032;
	Wed, 16 May 2018 21:22:41 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 May 2018 22:22:38 -0400
Message-ID: <1526523758-12681-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-ipc: Update to new version 3.47.02.00
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
X-List-Received-Date: Thu, 17 May 2018 02:22:50 -0000
Content-Type: text/plain

Added new examples for AM571X

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc-3.47.01.00.inc              |  4 --
 recipes-ti/ipc/ti-ipc-3.47.02.00.inc              |  4 ++
 recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend |  4 +-
 recipes-ti/ipc/ti-ipc-examples_git.bbappend       | 57 ++++++++++++++++++-
 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc         |  2 -
 recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc         |  5 ++
 recipes-ti/ipc/ti-ipc-rtos_git.bbappend           | 67 ++++++++++++++++++++++-
 recipes-ti/ipc/ti-ipc_git.bbappend                |  2 +-
 8 files changed, 132 insertions(+), 13 deletions(-)
 delete mode 100644 recipes-ti/ipc/ti-ipc-3.47.01.00.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-3.47.02.00.inc
 delete mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
 create mode 100644 recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc

diff --git a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
deleted file mode 100644
index 66bcda4..0000000
--- a/recipes-ti/ipc/ti-ipc-3.47.01.00.inc
+++ /dev/null
@@ -1,4 +0,0 @@
-PV = "3.47.01.00"
-
-#Corresponds to 3.47.01.00
-TI_IPC_SRCREV = "6a2595a4148fb12f259efc19164a9d33ad2ed294"
diff --git a/recipes-ti/ipc/ti-ipc-3.47.02.00.inc b/recipes-ti/ipc/ti-ipc-3.47.02.00.inc
new file mode 100644
index 0000000..970f04b
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-3.47.02.00.inc
@@ -0,0 +1,4 @@
+PV = "3.47.02.00"
+
+#Corresponds to 3.47.02.00
+TI_IPC_SRCREV = "24c36385d096613af123d1e1696fb2fee652ef36"
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
index 4adc0e6..b2a28b6 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bbappend
@@ -1,5 +1,5 @@
 PR_append = ".tisdk0"
 
-require ti-ipc-3.47.01.00.inc
+require ti-ipc-3.47.02.00.inc
 
-require ti-ipc-rtos-3.47.01.00.inc
+require ti-ipc-rtos-3.47.02.00.inc
diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bbappend b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
index 4adc0e6..6482e1e 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bbappend
@@ -1,5 +1,58 @@
 PR_append = ".tisdk0"
 
-require ti-ipc-3.47.01.00.inc
+require ti-ipc-3.47.02.00.inc
+
+require ti-ipc-rtos-3.47.02.00.inc
+
+ALT_PLATFORM_dra7xx = "AM572X AM571X"
+
+do_compile() {
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+
+  for alt_platform in ${ALT_PLATFORM}; do
+    oe_runmake .examples "PLATFORM=${alt_platform}" \
+      IPCTOOLS="${S_ipc-metadata}/src/etc"
+  done
+}
+
+do_compile_append() {
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake extract PLATFORM="${alt_platform}" HOSTOS="bios" \
+         IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    done
+    oe_runmake -C examples all HOSTOS="bios" \
+      IPC_INSTALL_DIR="${IPC_INSTALL_DIR}"
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake -C examples all HOSTOS="bios" \
+        IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" PLATFORM="${alt_platform}"
+    done
+  fi
+}
+
+do_install_append() {
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    # Install directory for bios examples
+    install -d ${D}/ipc_${IPC_VERSION}/examples/bios
+    oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
+    oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+      HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/bios"
+
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake -C examples install IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
+      oe_runmake -C examples install_rov IPC_INSTALL_DIR="${IPC_INSTALL_DIR}" \
+        HOSTOS="bios" EXEC_DIR="${D}/ipc_${IPC_VERSION}/examples/${alt_platform}/bios" \
+        PLATFORM="${alt_platform}"
+    done
+  fi
+}
 
-require ti-ipc-rtos-3.47.01.00.inc
diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc b/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
deleted file mode 100644
index ffe6ef9..0000000
--- a/recipes-ti/ipc/ti-ipc-rtos-3.47.01.00.inc
+++ /dev/null
@@ -1,2 +0,0 @@
-# Corresponds to tag: 3.47.01.00
-SRCREV_ipc-metadata = "f78329ff0b2c65469271dab59e232e6e0dc82dc7"
diff --git a/recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc b/recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc
new file mode 100644
index 0000000..84178e7
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-rtos-3.47.02.00.inc
@@ -0,0 +1,5 @@
+# Corresponds to tag: 3.47.02.00
+SRCREV_ipc-metadata = "e8aff83111b8a0d64d7a77413b6f66d3106084d8"
+
+# Corresponds to tag: 3.47.02.00
+SRCREV_ipc-examples = "351e9a6d94c68f7ff64b2c002ee6750242ece6d9"
diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
index 4adc0e6..ab578dd 100644
--- a/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc-rtos_git.bbappend
@@ -1,5 +1,68 @@
 PR_append = ".tisdk0"
 
-require ti-ipc-3.47.01.00.inc
+require ti-ipc-3.47.02.00.inc
 
-require ti-ipc-rtos-3.47.01.00.inc
+require ti-ipc-rtos-3.47.02.00.inc
+
+ALT_PLATFORM_dra7xx = "AM572X AM571X"
+
+require recipes-ti/includes/ti-paths-append.inc
+
+DEPENDS_append = " ti-eclipse-signit-native "
+
+do_compile() {
+  oe_runmake -f ipc-bios.mak clean
+  oe_runmake -f ipc-bios.mak release
+
+  cd ${S_ipc-metadata}
+  oe_runmake .all-files IPC_INSTALL_DIR="${S}" \
+    BUILD_HOST_OS="linux" \
+    RELEASE_TYPE="${RELEASE_TYPE}"
+
+  cd ${S_ipc-examples}/src
+  oe_runmake .examples \
+    IPCTOOLS="${S_ipc-metadata}/src/etc"
+  for alt_platform in ${ALT_PLATFORM}; do
+    oe_runmake .examples \
+      IPCTOOLS="${S_ipc-metadata}/src/etc" \
+      PLATFORM=${alt_platform}
+  done
+
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    oe_runmake extract HOSTOS="bios" IPC_INSTALL_DIR="${S}"
+    oe_runmake extract HOSTOS="linux" IPC_INSTALL_DIR="${S}"
+
+    for alt_platform in ${ALT_PLATFORM}; do
+      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="bios" IPC_INSTALL_DIR="${S}"
+      oe_runmake extract PLATFORM=${alt_platform} HOSTOS="linux" IPC_INSTALL_DIR="${S}"
+    done
+  fi
+
+  IPC_VERSION=`echo ${PV}${RELEASE_SUFFIX} | sed -e 's|\.|_|g'`
+  install -d ${IPC_PACKAGE_DIR}
+  # Copy docs and other meta files
+  cp -pPrf  ${S_ipc-metadata}/exports/ipc_${IPC_VERSION}/* -d ${IPC_PACKAGE_DIR}
+
+  # Copy example folders corresponding to the platforms
+  if [  "${PLATFORM}" != "UNKNOWN" ]; then
+    install -d ${IPC_PACKAGE_DIR}/examples
+    cp -pPf ${S_ipc-examples}/src/examples/*.* ${IPC_PACKAGE_DIR}/examples/
+    cp -pPf ${S_ipc-examples}/src/examples/makefile ${IPC_PACKAGE_DIR}/examples/
+    cp -pPrf ${S_ipc-examples}/src/examples/${PLATFORM}* ${IPC_PACKAGE_DIR}/examples/
+    for alt_platform in ${ALT_PLATFORM}; do
+      cp -pPrf ${S_ipc-examples}/src/examples/${alt_platform}* ${IPC_PACKAGE_DIR}/examples/
+    done
+    find ${IPC_PACKAGE_DIR}/examples/ -name "*zip" -type f | xargs -I {} rm {}
+  fi
+}
+
+do_install_append() {
+    # Sign the eclipse plugins 
+    cd ${TI_ECLIPSE_SIGNIT_INSTALL_DIR}
+    for dir_name in ${D}${IPC_INSTALL_DIR_RECIPE}/eclipse/features/*; do
+        PATH=${JDK_INSTALL_DIR}/bin:$PATH bash -e ./signit "${dir_name}"
+    done
+    for dir_name in ${D}${IPC_INSTALL_DIR_RECIPE}/eclipse/plugins/*; do
+        PATH=${JDK_INSTALL_DIR}/bin:$PATH bash -e ./signit "${dir_name}"
+    done
+}
diff --git a/recipes-ti/ipc/ti-ipc_git.bbappend b/recipes-ti/ipc/ti-ipc_git.bbappend
index 96b3c2d..3451b19 100644
--- a/recipes-ti/ipc/ti-ipc_git.bbappend
+++ b/recipes-ti/ipc/ti-ipc_git.bbappend
@@ -1,3 +1,3 @@
 PR_append = ".tisdk0"
 
-require ti-ipc-3.47.01.00.inc
+require ti-ipc-3.47.02.00.inc
-- 
1.9.1


