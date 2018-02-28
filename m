Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3D49F5298F
	for <meta-arago@arago-project.org>;
	Wed, 28 Feb 2018 18:41:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1SIf4r8014310
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519843264;
	bh=/kcnfNQtdwhO3a5T9ZQk73QHGR8JdX9Cu9ZaTlJUG/Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v3x8Ggaet1KZVm5OZWwMJoZ22b3vZ6YY+/KQ6PEF3NCRkPDia2WBML2SlDSLlbMMy
	DQXQT+6UaSzVevPJJ+V28wJyouxLc4/nODkt3NxowOK9G2VZxc9gIDDJE4uQr+SV6H
	2T+J/tYto+B4CIc2oCQ7CqerpIFXbGd3jr0mZo2I=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf45o004548
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 28 Feb 2018 12:41:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 28 Feb 2018 12:41:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1SIf3H4030624
	for <meta-arago@arago-project.org>; Wed, 28 Feb 2018 12:41:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Feb 2018 13:40:57 -0500
Message-ID: <1519843260-55405-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
References: <1519843260-55405-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v3 1/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Wed, 28 Feb 2018 18:41:40 -0000
Content-Type: text/plain

- update the git URL and SRCREV
- select matrix desktop file based on QT vesion

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb      | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 494d582..43e35ab 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -12,31 +12,30 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "2512773c2d9da989e6a42c1e90b2b34496713072"
+SRCREV = "3429dfc4333f11b9022e3aa6fd2850c5093777f9"
 
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


