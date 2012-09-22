Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 683F1529A1
	for <meta-arago@arago-project.org>;
	Sat, 22 Sep 2012 00:25:27 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so3676751obb.38
	for <meta-arago@arago-project.org>;
	Fri, 21 Sep 2012 17:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=7S/R297ujj9whSEl07ZaipU7qGWHRinZHvWKkDwf/qk=;
	b=pSmXEB+ztnqueJPhE9uJCGo0DrFZpBda0fb5kHFTFU5XB+l0n9IlO9fIwEohU5IcS2
	aV1+6p00/KKsQDKmajzjYgkS04rPYT5+TYWdFedzyKlO+Zr0HYski7RfmvtLQBh17Tx1
	JdTRsJ3h3Ew9E7b84OAzrarHanhbLjusQ2IswcQRiklG7rvU0PMkaNKpqF+NcWbfoo5n
	iYcHtYe3J8xSVaSFFk2WyWVCfSQSu4q9g4fq3HV1wGiegM8n3UDMQcYQmSWUM1f3s79T
	PrikkiGrX3FDoPUOSFg4kR7MsumV4ASmMKWCap8WQBFMIWDXJG7iaHuHoxugkOsWizwM
	h38Q==
Received: by 10.60.170.83 with SMTP id ak19mr4750457oec.113.1348273526469;
	Fri, 21 Sep 2012 17:25:26 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id hz6sm9342729obb.1.2012.09.21.17.25.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 17:25:26 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 21 Sep 2012 19:48:50 -0500
Message-Id: <1348274930-27708-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [meta-arago-extras][PATCH] obexftp: Add ObexFTP
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
X-List-Received-Date: Sat, 22 Sep 2012 00:25:27 -0000

* Port obexftp recipe from oe-classic.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-connectivity/obexftp/obexftp_0.23.bb   |   29 ++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb

diff --git a/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb b/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb
new file mode 100644
index 0000000..b540efe
--- /dev/null
+++ b/meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "OBEX Ftp Client based on openobex."
+SECTION = "console/network"
+HOMEPAGE = "http://dev.zuckschwerdt.org/openobex/wiki/ObexFtp"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+DEPENDS = "openobex bluez4 virtual/libusb0 virtual/libiconv"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/openobex/obexftp-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF += "--enable-bluetooth \
+		 --disable-swig \
+		 --disable-perl \
+		 --disable-python \
+		 --disable-tcl \
+		 --disable-ruby \
+		 --disable-builddocs \
+		 --disable-rpath \
+		"
+
+PARALLEL_MAKE = ""
+
+LEAD_SONAME = "libobexftp.so"
+
+SRC_URI[md5sum] = "f20762061b68bc921e80be4aebc349eb"
+SRC_URI[sha256sum] = "44a74ff288d38c0f75354d6bc2efe7d6dec10112eaff2e7b10e292b0d2105b36"
-- 
1.7.0.4


