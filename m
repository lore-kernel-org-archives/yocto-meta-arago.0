Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E1B60529AA
	for <meta-arago@arago-project.org>;
	Thu,  8 Jun 2017 18:54:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v58IsR5X025041
	for <meta-arago@arago-project.org>; Thu, 8 Jun 2017 13:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496948067;
	bh=whR/VQqPoOBgywUyeMxnCtEgoL7ou4FfBw37xGBw0is=;
	h=From:To:Subject:Date;
	b=LMNeZtbV346tUJ3HViPDN8vOrn5klUvBu+dWY8LVEqCYws0Cbocv+PHwUIEEvivYx
	JEs/2CBa9MLGpWfxdmKgrVRFZJE89/buYxdLa0IDb++CibrejHX0jcqw68qNYET3EY
	t1b9S4k7RNxvmGaryjop4o23/bQDHliYYQ9EKIpY=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v58IsRtU031273
	for <meta-arago@arago-project.org>; Thu, 8 Jun 2017 13:54:27 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 8 Jun 2017 13:54:27 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v58IsRNC028339	for <meta-arago@arago-project.org>;
	Thu, 8 Jun 2017 13:54:27 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 8 Jun 2017 14:54:22 -0400
Message-ID: <1496948064-3161-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 1/3] qtwebbrowser: add QT web browser
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
X-List-Received-Date: Thu, 08 Jun 2017 18:54:28 -0000
Content-Type: text/plain

- This is a touch-friendly web broswer based on qtwebengine and QML

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-qt/examples/qtwebbrowser_1.0.bb        | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb

diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
new file mode 100644
index 0000000..c484bd9
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Qt Touch-Friendly WebBroswer"
+HOMEPAGE = "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
+SECTION = "multimedia"
+LICENSE = "GPL-3.0 & GFDL-1.3"
+LIC_FILES_CHKSUM = " \
+    file://LICENSE.GPLv3;md5=a40e2bb02b1ac431f461afd03ff9d1d6 \
+    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
+"
+DEPENDS += "qtwebengine"
+
+PR = "r0"
+
+BRANCH = "dev"
+SRCREV = "023733af5523a5ad84359926224fa106001215f4"
+
+SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH} \
+"
+
+S = "${WORKDIR}/git"
+
+inherit qt-provider
+
+# Install qtwebbrowser under /usr/bin
+do_install() {
+    install -d ${D}${bindir}
+    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
+    install -m 0755 src/qtwebbrowser ${D}${bindir}/qtwebbrowser
+    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
+}
+
+FILES_${PN} +=  " \
+${bindir}/qtwebbrowser \
+${datadir}/qt5/examples/webengine/webbrowser/* \
+"
-- 
1.9.1


