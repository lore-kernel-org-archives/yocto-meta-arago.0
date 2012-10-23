Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 2EA11529B6
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 21:30:33 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so3851455oag.38
	for <meta-arago@arago-project.org>;
	Tue, 23 Oct 2012 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=azQR6WhEFDMJXO4dBRHiK1EB3IG+DE2EvtEr3fINxXk=;
	b=gMRSbQrpO40Xbn+JpSArqHQL8c5tUVqKmL7rVAgi4TGXkm/lI7xcRM+0DBXSEE+WDa
	vyqZBPG0eCa4dZI6wHynPkRe1rOwrcJDxbRmHnzVYFamzj0MA7pqBAfxEeqsep/cAFu+
	YEZeT+GE3vMP5L7PaQDa8e2BRAaFQXG/O9WxCcQtoc67zgAGy43IyDeyJm++Q/D2Ob/N
	GULV1gqEBXCzykSB16duXlF3lKi6EQxNFfrhKqQxcXk1a/9QlPjjfLcDdCSel2ugwn+E
	F1uAxcnETZCfFgTN28SL99/0RDD9qbD9OxP+jGh69HylS3+1G2SkLqiXOH/qAPEgPX1t
	npWQ==
Received: by 10.182.150.105 with SMTP id uh9mr10991475obb.85.1351027832404;
	Tue, 23 Oct 2012 14:30:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m9sm10716613oem.4.2012.10.23.14.30.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 23 Oct 2012 14:30:31 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 23 Oct 2012 16:30:26 -0500
Message-Id: <1351027826-12640-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] qt-tstat: Add TI thermostat demo v2
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
X-List-Received-Date: Tue, 23 Oct 2012 21:30:33 -0000

* This Qt base demo was developed by TI to show an example of a thermostat
  and connected home application for customers.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |   33 ++++++++++++++++++++
 1 files changed, 33 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
new file mode 100644
index 0000000..a05aec4
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -0,0 +1,33 @@
+DESCRIPTION = "Qt Thermostat Demo"
+HOMEPAGE = "https://gitorious.org/thermostat-demo"
+
+LICENSE = "BSD & CC-BY-SA-2.0 & CC-BY-SA-3.0 & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
+                    file://IMAGE-LICENSE;md5=fce98146123de13a189c234a5e4cfa0d \
+                    file://API-LICENSE;md5=5e32280d79a1eab76729c50d79ecfe72 \
+                    file://remote/MIT-LICENSE.txt;md5=6a24093faaae5d5c198578c88e220071 \
+"
+
+require recipes-core/matrix/matrix-gui-paths.inc
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "2f461242d469871538e6cd05e887457674347e8f"
+
+SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
+
+S = "${WORKDIR}/git/"
+
+inherit qt4e
+
+# use the make targets already created in the Makefile.build files
+do_install() {
+	make -f Makefile.build DESTDIR=${D} install_common
+}
+
+PACKAGES  += "matrix-gui-thermostat-demo"
+
+RDEPENDS_matrix-gui-thermostat-demo  += "matrix-gui-apps-images matrix-gui-submenus-qt4"
+
+FILES_matrix-gui-thermostat-demo += "${MATRIX_APP_DIR}/*"
-- 
1.7.0.4


