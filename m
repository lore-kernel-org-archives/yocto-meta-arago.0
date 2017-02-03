Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4258B52AFD
	for <meta-arago@arago-project.org>;
	Fri,  3 Feb 2017 22:22:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v13MMU46015669
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v13MMU0H018482
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2017 16:22:30 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Feb 2017 16:22:30 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v13MMTKw025786;	Fri, 3 Feb 2017 16:22:30 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Feb 2017 17:22:14 -0500
Message-ID: <1486160539-23523-2-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1486160539-23523-1-git-send-email-h-gou@ti.com>
References: <1486160539-23523-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [morty/krogoth][PATCH 1/6] barcode-roi: add barcode ROI detection demo
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
X-List-Received-Date: Fri, 03 Feb 2017 22:22:32 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-apps/barcode-demo/barcode-roi_git.bb   | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb

diff --git a/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
new file mode 100644
index 0000000..d828ef7
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/barcode-demo/barcode-roi_git.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "Barcode demo to detect region of interest"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://detect_barcode.cpp;beginline=1;endline=25;md5=babab64d39715b3671dd16bcb4f4917b"
+
+DEPENDS += "opencv"
+
+PV = "01.00.00"
+PR = "r1"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/apps/barcode-roi-detection.git;protocol=git;branch=${BRANCH}"
+
+SRCREV = "50fa051f66012ebaa10eba1cb289287c4c5e7432"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 755 ${S}/detect_barcode ${D}${bindir}
+
+    install -d ${D}${datadir}/ti/image
+    install -m 644 ${S}/test/sample_barcode.jpg ${D}${datadir}/ti/image
+}
+
+FILES_${PN} += "\
+    ${datadir}/ti/image \
+"
+
+INSANE_SKIP_${PN} = "ldflags"
-- 
1.9.1


