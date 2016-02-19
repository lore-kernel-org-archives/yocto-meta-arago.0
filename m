Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C31BC52AD2
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2oX006625
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1GI022378
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1jW002855;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxA-0006eR-Oa; Fri, 19 Feb 2016 14:43:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:52 -0500
Message-ID: <1455910978-25530-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/7] openmpacc: Add clacc, the OpenMP-Acc compiler
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:03 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-ti/openmpacc/clacc_git.bb              | 38 ++++++++++++++++++++++
 .../recipes-ti/openmpacc/openmpacc.inc             | 21 ++++++++++++
 2 files changed, 59 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc

diff --git a/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
new file mode 100644
index 0000000..f41c291
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/openmpacc/clacc_git.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "TI OpenMP-Acc C compiler"
+
+include openmpacc.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "boost elfutils"
+RDEPENDS_${PN} += "clocl"
+
+S = "${WORKDIR}/git/host"
+
+TARGET_class-target = "clacc_arm"
+TARGET_class-native = "clacc_x86"
+TARGET_class-nativesdk = "clacc_x86"
+
+export LINUX_DEVKIT_ROOT = "${STAGING_DIR_HOST}"
+export X86_HOST_ROOT = "${STAGING_DIR_HOST}"
+
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE = " -C ${S}/clacc \
+                  ${TARGET} \
+                  CXX="${CXX}" \
+"
+
+do_compile() {
+    oe_runmake
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 clacc/${TARGET} ${D}${bindir}/clacc
+
+    install -d ${D}${mandir}/man1
+    install -m 644 clacc/clacc.1 ${D}${mandir}/man1
+}
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
new file mode 100644
index 0000000..4f55d0d
--- /dev/null
+++ b/meta-arago-extras/recipes-ti/openmpacc/openmpacc.inc
@@ -0,0 +1,21 @@
+SUMMARY = "TI OpenMP Accelerator Model"
+HOMEPAGE = "http://downloads.ti.com/mctools/esd/docs/openmpacc/"
+LICENSE = "BSD"
+
+PV = "1.3.0.1"
+INC_PR = "r0"
+
+LIC_FILES_CHKSUM = "file://../debian/copyright;md5=aaa2a0939d08197132fc382e97b62eb0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/openmpacc:"
+
+OMPACC_GIT_URI = "git://git.ti.com/openmp/ti-openmpacc.git"
+OMPACC_GIT_PROTOCOL = "git"
+OMPACC_GIT_BRANCH = "master"
+
+OMPACC_SRCREV = "814accdbb441a3b258a548c6fbaa087b314ee18b"
+
+BRANCH = "${OMPACC_GIT_BRANCH}"
+SRC_URI = "${OMPACC_GIT_URI};protocol=${OMPACC_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${OMPACC_SRCREV}"
+
-- 
1.9.1


