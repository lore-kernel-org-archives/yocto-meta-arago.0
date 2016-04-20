Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by arago-project.org (Postfix) with ESMTPS id AC6EA52A98
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:51 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173011.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00IU56BXE500@vms173011.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=kkPoSj1V_nOLM3jp1ocA:9
Received: by 100.15.86.14 with SMTP id 5b16b046; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id ABBEF161FB6;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:12 -0400
Message-id: <1461180805-25733-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 03/16] lksctp-tools: available in meta-networking, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../lksctp-tools/lksctp-tools_1.0.16.bb            | 46 ----------------------
 1 file changed, 46 deletions(-)
 delete mode 100755 meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb

diff --git a/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb b/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
deleted file mode 100755
index b08eaa5..0000000
--- a/meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
+++ /dev/null
@@ -1,46 +0,0 @@
-DESCRIPTION = "The Linux Kernel Stream Control Transmission Protocol (lksctp) project"
-SECTION = "libs"
-PRIORITY = "optional"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0c56db0143f4f80c369ee3af7425af6e"
-
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/lksctp/lksctp-tools-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "708bb0b5a6806ad6e8d13c55b067518e"
-SRC_URI[sha256sum] = "0903dd526b7f30a89d5031aa2c82757612becc38ed7bc6e4f972f8deae351f26"
-
-BBCLASSEXTEND = "native"
-
-inherit autotools pkgconfig binconfig
-
-RREPLACES_${PN} = "lksctp"
-
-PACKAGES =+ "${PN}-withsctp ${PN}-utils"
-
-FILES_${PN} = "${libexecdir}/* ${libdir}/lib*${SOLIBS} \
-            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-            ${base_libdir}/*${SOLIBS}"
-
-FILES_${PN}-withsctp = "${libdir}/lksctp-tools/lib*${SOLIBS}"
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
-  ${datadir}/lksctp-tools/sctp_darn.h \
-  ${datadir}/lksctp-tools/sctp_status.c \
-  ${libdir}/lksctp-tools/lib*.so"
-
-FILES_${PN}-utils = " \
-  ${bindir}/sctp_test \
-  ${bindir}/sctp_darn \
-  ${bindir}/checksctp \
-  ${bindir}/withsctp \
-  ${bindir}/sctp_status"
-- 
2.2.0


