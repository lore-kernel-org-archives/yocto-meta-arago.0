Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 35CE65297F
	for <meta-arago@arago-project.org>;
	Fri, 20 Feb 2015 02:46:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1K2klS8002028
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:46:47 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1K2kkdP027899
	for <meta-arago@arago-project.org>; Thu, 19 Feb 2015 20:46:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 19 Feb 2015 20:46:46 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1K2kkX9002671;	Thu, 19 Feb 2015 20:46:46 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Feb 2015 21:46:44 -0500
Message-ID: <1424400404-29489-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] ipsecmgr: Add recipes for ipsec manager kernel module and libraries
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
X-List-Received-Date: Fri, 20 Feb 2015 02:46:48 -0000
Content-Type: text/plain

- Provides module and libraries to offload IPSec security
 policy & associated security association to NETCP for
 crypto operations

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
- Adjusted path wrt WORKDIR
---
---
 .../recipes-support/ipsecmgr/ipsecmgr-mod_git.bb   |   20 +++++++++++++
 .../recipes-support/ipsecmgr/ipsecmgr.inc          |    6 ++++
 .../recipes-support/ipsecmgr/ipsecmgr_git.bb       |   30 ++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
 create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
 create mode 100644 meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb

diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
new file mode 100644
index 0000000..b00da58
--- /dev/null
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr-mod_git.bb
@@ -0,0 +1,20 @@
+SUMMARY = "IPSec Manager kernel module"
+DESCRIPTION = "Provides Module to offload IPSec security policy & associated security association to NETCP for crypto operations"
+
+LIC_FILES_CHKSUM = "file://../../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"
+
+include ipsecmgr.inc
+
+MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+PR = "${MACHINE_KERNEL_PR}"
+
+EXTRA_OEMAKE += "KDIR="${STAGING_KERNEL_DIR}""
+
+inherit module
+
+S = "${WORKDIR}/git/src/module"
+
+do_install() {
+# Install kernel module
+	oe_runmake INSTALL_MOD_PATH="${D}" install
+}
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
new file mode 100644
index 0000000..2aafa57
--- /dev/null
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr.inc
@@ -0,0 +1,6 @@
+LICENSE = "BSD-3-Clause"
+BRANCH="master"
+SRC_URI = "git://arago-project.org/git/projects/ipsecmgr.git;protocol=git;branch=${BRANCH}"
+#Commit ID corresponding to DEV.IPSECMGR.01.01.00.03
+SRCREV = "1ea8355ae9142311901c842c97a58d2846b308e6"
+PV     = "01.01.00.03"
diff --git a/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
new file mode 100644
index 0000000..d134baf
--- /dev/null
+++ b/meta-arago-extras/recipes-support/ipsecmgr/ipsecmgr_git.bb
@@ -0,0 +1,30 @@
+SUMMARY = "IPSec Manager libraries"
+DESCRIPTION = "Provides library to offload IPSec security policy & associated security association to NETCP for crypto operations"
+
+LIC_FILES_CHKSUM = "file://../ipsecmgr_snoop.h;beginline=1;endline=33;md5=f7eadca4fb5599f508dc11fa1e752919"
+
+include ipsecmgr.inc
+
+DEPENDS = "libnl-xfrm"
+
+CFLAGS += "-I${STAGING_INCDIR}/libnl3"
+
+S = "${WORKDIR}/git/build"
+LIB_INC_DIR = "${WORKDIR}/git"
+UTILS_LIB_INC_DIR = "${WORKDIR}/git/utils/iface/"
+
+do_compile() {
+# Compile the library
+	make clean
+	make all
+}
+do_install() {
+# Install libraries
+	install -d ${D}${libdir}/
+	install -c -m 666 libipsecmgr_snoop.a ${D}${libdir}/
+	install -c -m 666 libipsecmgr_ipc.a ${D}${libdir}/
+	install -c -m 666 libipsecmgr_syslog.a ${D}${libdir}/
+	install -d ${D}${includedir}/
+	install -c -m 666 ${LIB_INC_DIR}/*.h ${D}${includedir}/
+	install -c -m 666 ${UTILS_LIB_INC_DIR}/*.h ${D}${includedir}/
+}
-- 
1.7.9.5


