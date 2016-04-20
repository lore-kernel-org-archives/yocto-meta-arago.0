Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id EF12F52A65
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:49 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00JAX6BXD160@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:33 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=rhVk5xCkAAAA:8
	a=FBDtl16M8nMqZr4Fi9UA:9 a=vks7AOE7cWEA:10
Received: by 100.15.86.14 with SMTP id 4ff3fa9f; Wed, 20 Apr 2016 19:33:33 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id AD95F161FB7;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:13 -0400
Message-id: <1461180805-25733-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1461180805-25733-1-git-send-email-denis@denix.org>
References: <1461180805-25733-1-git-send-email-denis@denix.org>
Subject: [PATCH 04/16] obexftp: available from meta-oe, drop locally
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-connectivity/obexftp/obexftp_0.23.bb   | 29 ----------------------
 1 file changed, 29 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb

diff --git a/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb
deleted file mode 100644
index b540efe..0000000
--- a/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-DESCRIPTION = "OBEX Ftp Client based on openobex."
-SECTION = "console/network"
-HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-DEPENDS = "openobex bluez4 virtual/libusb0 virtual/libiconv"
-PR = "r0"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2"
-
-inherit autotools
-
-EXTRA_OECONF += "--enable-bluetooth \
-		 --disable-swig \
-		 --disable-perl \
-		 --disable-python \
-		 --disable-tcl \
-		 --disable-ruby \
-		 --disable-builddocs \
-		 --disable-rpath \
-		"
-
-PARALLEL_MAKE = ""
-
-LEAD_SONAME = "libobexftp.so"
-
-SRC_URI[md5sum] = "f20762061b68bc921e80be4aebc349eb"
-SRC_URI[sha256sum] = "44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36"
-- 
2.2.0


