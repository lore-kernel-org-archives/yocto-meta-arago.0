Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id D369A529E7
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:46 +0000 (UTC)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00CX46BXKA10@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=J+9Xl1TS c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=FP58Ms26AAAA:8
	a=5r_yuN56d9ztwRJwsj4A:9
Received: by 100.15.86.14 with SMTP id 1e780153; Wed, 20 Apr 2016 19:33:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A9C97161FB5;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:11 -0400
Message-id: <1461180805-25733-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 02/16] linuxptp: available now in meta-oe, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/linuxptp/linuxptp_1.3.bb    | 20 --------------------
 1 file changed, 20 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb

diff --git a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb b/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
deleted file mode 100644
index e8f92db..0000000
--- a/meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "This software is an implementation of the Precision Time Protocol (PTP) \
-according to IEEE standard 1588 for Linux"
-HOMEPAGE = "http://linuxptp.sourceforge.net/"
-SECTION = "console/network"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-PR = "r0"
-
-SRC_URI = "http://iweb.dl.sourceforge.net/project/linuxptp/v${PV}/linuxptp-${PV}.tgz"
-SRC_URI[md5sum] = "664706a86fe1413391d4536080548501"
-SRC_URI[sha256sum] = "b1651186689ef06e56add506bd9bb55a700ca56e3f92ba71d08f3ad12fad3085"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} ARCH=${TARGET_ARCH} \
-		EXTRA_CFLAGS="-D_GNU_SOURCE -DHAVE_CLOCK_ADJTIME \
-		-DHAVE_ONESTEP_SYNC""
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/ptp4l ${D}${bindir}/
-}
-- 
2.2.0


