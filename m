Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 13B12529A1
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 00:14:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s240EDAL026883
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 18:14:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s240ED6r029365
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 18:14:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 18:14:12 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s240E5xE029394;	Mon, 3 Mar 2014 18:14:12 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Mar 2014 19:14:04 -0500
Message-ID: <1393892044-17112-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
References: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/2] lksctp-tools: Update recipe to make it work in dylan branch
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
X-List-Received-Date: Tue, 04 Mar 2014 00:14:14 -0000
Content-Type: text/plain

- Combined to one recipe file
- Fixed build issues

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
Changes from earlier patch
- Produced patch as 2 patches including original files
  as first commit.
---
---
 .../recipes-bsp/lksctp-tools/lksctp-tools.inc      |   47 --------------------
 .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   41 ++++++++++++++++-
 2 files changed, 40 insertions(+), 48 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc

diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
deleted file mode 100644
index 8a66dc9..0000000
--- a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
+++ /dev/null
@@ -1,47 +0,0 @@
-DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "LGPLv2"
-
-S = "${WORKDIR}/${BPN}-${PV}"
-
-INC_PR = "r1"
-
-BBCLASSEXTEND = "native"
-
-inherit autotools pkgconfig binconfig
-
-do_install_append_virtclass-native() {
-	:
-}
-
-RREPLACES = "lksctp"
-
-LEAD_SONAME = "libsctp.so"
-
-PACKAGES =+ "${PN}-withsctp ${PN}-utils"
-
-FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_libdir}/*${SOLIBS}"
-
-FILES_${PN}-withsctp = " \
-  ${libdir}/lksctp-tools/lib*"
-
-FILES_${PN}-dev += " \
-  ${datadir}/lksctp-tools/checksctp.c \
-  ${datadir}/lksctp-tools/sctp_socket.c \
-  ${datadir}/lksctp-tools/sctp_bind.c \
-  ${datadir}/lksctp-tools/sctp_darn.c \
-  ${datadir}/lksctp-tools/sctp_load_libs.c \
-  ${datadir}/lksctp-tools/sctp_sockopt.c \
-  ${datadir}/lksctp-tools/sctp_socket.h \
-  ${datadir}/lksctp-tools/sctp_test.c \
-  ${datadir}/lksctp-tools/sctp_darn.h"
-
-FILES_${PN}-utils = " \
-  ${bindir}/sctp_test \
-  ${bindir}/sctp_darn \
-  ${bindir}/checksctp \
-  ${bindir}/withsctp"
-
diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
index 000bc31..f98ffc7 100755
--- a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -1,4 +1,10 @@
-require lksctp-tools.inc
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://src/include/netinet/sctp.h;md5=8089fbe48b63b73c8d091bee750b2ebc"
+
+INC_PR = "r0"
 PR = "${INC_PR}.0"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
@@ -6,3 +12,36 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
 SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
 SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
 
+S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+RREPLACES_${PN} = "lksctp"
+
+LEAD_SONAME = "libsctp.so"
+
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+FILES_${PN}-dev += " \
+  ${datadir}/lksctp-tools/checksctp.c \
+  ${datadir}/lksctp-tools/sctp_socket.c \
+  ${datadir}/lksctp-tools/sctp_bind.c \
+  ${datadir}/lksctp-tools/sctp_darn.c \
+  ${datadir}/lksctp-tools/sctp_load_libs.c \
+  ${datadir}/lksctp-tools/sctp_sockopt.c \
+  ${datadir}/lksctp-tools/sctp_socket.h \
+  ${datadir}/lksctp-tools/sctp_test.c \
+  ${datadir}/lksctp-tools/sctp_darn.h \
+  ${libdir}/lksctp-tools/lib*.so"
+
+FILES_${PN}-utils = " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp"
-- 
1.7.9.5


