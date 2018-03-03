Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id B3DEA529EE
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 19:31:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w23JV1F3000809
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520105461;
	bh=7u21qYFRmPShKXSb2LiB1Dggw/E5+09SKpVmWwPrIUw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=NcY0jEyYqkIQHexQ3UhW8qL7pQRuTflil0ZlAJbyVvD7Ky1wRnTenZWn+so+U81Kf
	LeE1D/QTd/x3CdDF36/gyEEn4oKjxU0m7Q8eVHmsCvFlzKxnJW2rcqPuXmdYXFFSDU
	EXpJ6dUY5um00qO3Ibnvos1ekLMNRHHgkgrxW9o4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV1tP021009
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:01 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 3 Mar 2018 13:31:00 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 3 Mar 2018 13:31:00 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w23JV07Y019492
	for <meta-arago@arago-project.org>; Sat, 3 Mar 2018 13:31:00 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 3 Mar 2018 14:30:52 -0500
Message-ID: <1520105455-43017-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
References: <1520105455-43017-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v4 1/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Sat, 03 Mar 2018 19:31:39 -0000
Content-Type: text/plain

- update the git URL and SRCREV
- select matrix desktop file based on QT vesion

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb      | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 494d582..e87a558 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -12,31 +12,30 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "2512773c2d9da989e6a42c1e90b2b34496713072"
+SRCREV = "665bff9a7bc0dbf82f9d6a58ff2778c03fe04fd1"
 
-SRC_URI = " \
-	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
-"
-
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
-	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch', '', d)}"
+SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
 
+DESKTOP_FILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
+
+
 do_install() {
 	install -d ${D}/usr/bin
 	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
 	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
-	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
+	install ${S}/matrix-files/desc_thermostat_demo.html  ${D}${MATRIX_APP_DIR}/qt_tstat
+	install ${S}/matrix-files/${DESKTOP_FILE}  ${D}${MATRIX_APP_DIR}/qt_tstat/thermostat_demo.desktop
 }
 
 PACKAGES += "matrix-gui-thermostat-demo"
 
-RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images matrix-gui-submenus-qt4"
+RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images ${@base_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix-gui-submenus-qt4', d)}"
 
 FILES_matrix-gui-thermostat-demo += "${MATRIX_APP_DIR}/*"
-- 
1.9.1


