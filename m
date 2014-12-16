Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5385F52079
	for <meta-arago@arago-project.org>;
	Tue, 16 Dec 2014 15:46:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id sBGFkjXL029040
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 09:46:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sBGFkjoW018168
	for <meta-arago@arago-project.org>; Tue, 16 Dec 2014 09:46:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 16 Dec 2014 09:46:45 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	sBGFkjAL014330;	Tue, 16 Dec 2014 09:46:45 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Dec 2014 10:46:43 -0500
Message-ID: <1418744803-20385-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] lksctp-tools: Add new recipe for lksctp tools: library and utilities
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
X-List-Received-Date: Tue, 16 Dec 2014 15:46:46 -0000
Content-Type: text/plain

- Stream Control Transmission Protocol (SCTP) is a reliable, message-oriented,
  multihomed transport protocol. Developed by the IETF SIGTRAN working group
  to transport SS7 over IP, it is now the third general-purpose transport developed
  by the IETF.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
- Added new package -withsctp to include withsctp libraries

---
---
 .../lksctp-tools/lksctp-tools_1.0.16.bb            |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100755 meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb

diff --git a/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
new file mode 100755
index 0000000..b08eaa5
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
@@ -0,0 +1,46 @@
+DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
+
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
+SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools pkgconfig binconfig
+
+RREPLACES_${PN} = "lksctp"
+
+PACKAGES =+ "${PN}-withsctp ${PN}-utils"
+
+FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_libdir}/*${SOLIBS}"
+
+FILES_${PN}-withsctp = "${libdir}/lksctp-tools/lib*${SOLIBS}"
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
+  ${datadir}/lksctp-tools/sctp_status.c \
+  ${libdir}/lksctp-tools/lib*.so"
+
+FILES_${PN}-utils = " \
+  ${bindir}/sctp_test \
+  ${bindir}/sctp_darn \
+  ${bindir}/checksctp \
+  ${bindir}/withsctp \
+  ${bindir}/sctp_status"
-- 
1.7.9.5


