Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1AFC0529A1
	for <meta-arago@arago-project.org>;
	Tue,  4 Mar 2014 00:14:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s240E6mU026864
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 18:14:06 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s240E6XA029310
	for <meta-arago@arago-project.org>; Mon, 3 Mar 2014 18:14:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 3 Mar 2014 18:14:05 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s240E5xD029394;	Mon, 3 Mar 2014 18:14:05 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Mar 2014 19:14:03 -0500
Message-ID: <1393892044-17112-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v3 1/2] lksctp-tools: Add recipe for lksctp tools
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
X-List-Received-Date: Tue, 04 Mar 2014 00:14:07 -0000
Content-Type: text/plain

- Copied as is from meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
- With intention to fix issues to make it work.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-bsp/lksctp-tools/lksctp-tools.inc      |   47 ++++++++++++++++++++
 .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |    8 ++++
 2 files changed, 55 insertions(+)
 create mode 100644 meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
 create mode 100755 meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb

diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
new file mode 100644
index 0000000..8a66dc9
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools.inc
@@ -0,0 +1,47 @@
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+INC_PR = "r1"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+do_install_append_virtclass-native() {
+	:
+}
+
+RREPLACES = "lksctp"
+
+LEAD_SONAME = "libsctp.so"
+
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+FILES_${PN}-withsctp = " \
+  ${libdir}/lksctp-tools/lib*"
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
+  ${datadir}/lksctp-tools/sctp_darn.h"
+
+FILES_${PN}-utils = " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp"
+
diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
new file mode 100755
index 0000000..000bc31
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -0,0 +1,8 @@
+require lksctp-tools.inc
+PR = "${INC_PR}.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
+SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
+
-- 
1.7.9.5


