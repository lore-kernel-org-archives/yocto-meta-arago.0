Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 0F25852976
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 02:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ADEF120B67;
	Sat,  3 Mar 2018 02:46:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ya3vcUuRmnLh; Sat,  3 Mar 2018 02:46:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8CBBB2098D;
	Sat,  3 Mar 2018 02:46:24 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 342FC1632EF;
	Fri,  2 Mar 2018 21:46:24 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  2 Mar 2018 21:46:24 -0500
Message-Id: <1520045184-26984-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] netapi: move from meta-ti due to ipsecmgr dependency being in meta-arago
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
X-List-Received-Date: Sat, 03 Mar 2018 02:47:04 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-ti/netapi/netapi-test_git.bb           | 51 ++++++++++++++++++++++
 meta-arago-extras/recipes-ti/netapi/netapi.inc     | 33 ++++++++++++++
 meta-arago-extras/recipes-ti/netapi/netapi_git.bb  | 32 ++++++++++++++
 3 files changed, 116 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/netapi/netapi.inc
 create mode 100644 meta-arago-extras/recipes-ti/netapi/netapi_git.bb

diff --git a/meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb b/meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb
new file mode 100644
index 0000000..3b7825c
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/netapi/netapi-test_git.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "Provides test and application binaries using NETAPI module"
+
+DEPENDS = "netapi ipsecmgr"
+
+include netapi.inc
+
+PR = "${INC_PR}.1"
+
+EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+#   Build the netapi binaries
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake -f makefile_armv7 tests NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+
+#     Now build the netapi appplications
+		cd ${S}/applications/ipsec_offload/ipsecmgr/build
+		oe_runmake clean NETAPI_SRC_DIR=${S} DEVICE="$device"
+		oe_runmake app NETAPI_SRC_DIR=${S} DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/config-app/build
+		oe_runmake clean DEVICE="$device"
+		oe_runmake app DEVICE="$device"
+		cd ${S}
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake -f makefile_armv7 installbin INSTALL_INC_BASE_DIR=${D}/${includedir} \
+			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
+			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/ipsecmgr/build
+		oe_runmake install \
+			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
+			DEVICE="$device"
+
+		cd ${S}/applications/ipsec_offload/config-app/build
+		oe_runmake install \
+			INSTALL_BIN_BASE_DIR=${D}${bindir} SYSCONFDIR=${D}${sysconfdir} \
+			DEVICE="$device"
+		cd ${S}
+	done
+}
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi.inc b/meta-arago-extras/recipes-ti/netapi/netapi.inc
new file mode 100644
index 0000000..83fb6aa
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/netapi/netapi.inc
@@ -0,0 +1,33 @@
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://${WORKDIR}/git/COPYING.txt;md5=f2b4f162358b1ffaf3f2307287ca2074"
+
+COMPATIBLE_MACHINE = "keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEBIAN_NOAUTONAME_${PN} = "1"
+DEBIAN_NOAUTONAME_${PN}-dev = "1"
+DEBIAN_NOAUTONAME_${PN}-dbg = "1"
+DEBIAN_NOAUTONAME_${PN}-staticdev = "1"
+
+NETAPI_GIT_URI = "git://git.ti.com/keystone-rtos/netapi.git"
+NETAPI_GIT_PROTOCOL = "git"
+NETAPI_GIT_BRANCH = "master"
+
+# Below Commit ID corresponds to "DEV.NETAPI.01.01.00.07"
+NETAPI_SRCREV = "50026020384737d253668c4be80745a3653106f8"
+
+BRANCH = "${NETAPI_GIT_BRANCH}"
+SRC_URI = "${NETAPI_GIT_URI};protocol=${NETAPI_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${NETAPI_SRCREV}"
+
+PV = "01.01.00.07"
+INC_PR = "r0"
+
+DEVICELIST_k2hk = "k2h k2k"
+DEVICELIST_k2l-evm  = "k2l"
+DEVICELIST_k2e  = "k2e"
+
+CHOICELIST = "yes no"
+
+BASEDIR = "${WORKDIR}/git"
+S = "${BASEDIR}/ti/runtime/netapi"
diff --git a/meta-arago-extras/recipes-ti/netapi/netapi_git.bb b/meta-arago-extras/recipes-ti/netapi/netapi_git.bb
new file mode 100644
index 0000000..4427ecc
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/netapi/netapi_git.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "Provides NETAPI module: TI user space network library"
+
+DEPENDS = "common-csl-ip rm-lld qmss-lld cppi-lld sa-lld hplib pktlib nwal-lld"
+
+include netapi.inc
+
+PR = "${INC_PR}.1"
+
+EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
+
+do_compile () {
+#   Now build the netapi
+	for device in ${DEVICELIST}
+	do
+		for choice in ${CHOICELIST}
+		do
+			oe_runmake  clean NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+			oe_runmake lib NETAPI_SRC_DIR=${S} NETAPI_INC_DIR=${BASEDIR} \
+				USEDYNAMIC_LIB="$choice" DEVICE="$device"
+		done
+	done
+}
+
+do_install () {
+	for device in ${DEVICELIST}
+	do
+		oe_runmake install INSTALL_INC_BASE_DIR=${D}${includedir} \
+			INSTALL_LIB_BASE_DIR=${D}${libdir} INSTALL_BIN_BASE_DIR=${D}${bindir} \
+			SYSCONFDIR=${D}${sysconfdir} DEVICE="$device"
+	done
+}
-- 
2.7.4


