Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id A029952A0D
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 23:04:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CN4er1027061
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 18:04:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497308680;
	bh=Z4E/V04HDkaVKxkQMJsE4H6Xuk/JSfwPy7DZi12BgEo=;
	h=From:To:Subject:Date;
	b=rBbc7Ey2XSCJiWDASDSqQvbCcy5GUOcbTsUu9I6e9/+es5/debM59eH6Q+e/nCz15
	GNB1a7qVNZnDLm0fMS0FfQsti993KY4cp7zD59Nu//aTmNk8sHPNKl6uTdnLnLo9Q2
	gMhnL1Tx9wPvtPvk07TSTeCCpebbiy3MThOU4fbw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CN4e90008096
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 18:04:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 18:04:40 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5CN4d3h023863	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 18:04:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 12 Jun 2017 19:04:33 -0400
Message-ID: <1497308675-64220-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v4 1/3] qtwebbrowser: add QT web browser
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
X-List-Received-Date: Mon, 12 Jun 2017 23:04:41 -0000
Content-Type: text/plain

- This is a touch-friendly web broswer based on qtwebengine and QML

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-qt/examples/qtwebbrowser_1.0.bb        | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb

diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
new file mode 100644
index 0000000..170481f
--- /dev/null
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -0,0 +1,32 @@
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
+FILES_${PN} +=  "${bindir}/qtwebbrowser"
+FILES_${PN}-examples +=  "${datadir}/qt5/examples/webengine/webbrowser/*"
-- 
1.9.1


