Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 19C83529AE
	for <meta-arago@arago-project.org>;
	Sun, 23 Feb 2014 02:46:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1N2kgOr021069
	for <meta-arago@arago-project.org>; Sat, 22 Feb 2014 20:46:42 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1N2kgNP023404
	for <meta-arago@arago-project.org>; Sat, 22 Feb 2014 20:46:42 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Sat, 22 Feb 2014 20:46:41 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s1N2kfsR031452;	Sat, 22 Feb 2014 20:46:41 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 22 Feb 2014 21:46:39 -0500
Message-ID: <1393123599-4661-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] lksctp-tools: Add recipe for lksctp
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
X-List-Received-Date: Sun, 23 Feb 2014 02:46:43 -0000
Content-Type: text/plain

- The linux kernel Stream control transmission protocol
- Original recipe by Jingting Zhou

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Updated RREPLACES_${PN}
Fix build issue with .so
---
---
 .../recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb |   51 ++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100755 meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb

diff --git a/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
new file mode 100755
index 0000000..5c75552
--- /dev/null
+++ b/meta-arago-extras/recipes-bsp/lksctp-tools/lksctp-tools_1.0.7.bb
@@ -0,0 +1,51 @@
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://src/include/netinet/sctp.h;md5=8089fbe48b63b73c8d091bee750b2ebc"
+
+INC_PR = "r0"
+PR = "${INC_PR}.0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "047562b40537eb3be5d5ec3ae0a2198b"
+SRC_URI[sha256sum] = "e920e89d110cff9847f1d86a1d7a23a156a8abcc9e65a35655d687fd08377595"
+
+S = "${WORKDIR}/${BPN}-${PV}"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+do_install_append_virtclass-native() {
+	:
+}
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


