Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E0F1352986
	for <meta-arago@arago-project.org>;
	Fri, 16 Feb 2018 20:56:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1GKtfxv007365
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518814541;
	bh=ZdcJtvIVBj+m3FV8hIzP49t81I82IrcXUFjNU+/56VE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Es4dsiQveP3kaPidklvkMyBwcKDoeibzPLjcZwiKCCv7gHIBQhYAPFYWx+wow2gf6
	I9hfYPOdx37SAueLd2HXC3bcu2AsYR6ID6WHr/Azfx9FTJuyxgJ5Ns99bPBvyTncCo
	e1ZCStMU/zvtRK5LZYslRHwG7WJpADpeIVgzA+Kk=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtfpn023827
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:41 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Feb 2018 14:55:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Feb 2018 14:55:40 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1GKtepf017265
	for <meta-arago@arago-project.org>; Fri, 16 Feb 2018 14:55:40 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Feb 2018 15:55:33 -0500
Message-ID: <1518814536-42298-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
References: <1518814536-42298-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH v2 1/4] qt-tstat: pickup the latest version for both Qt4/Qt5 support
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
X-List-Received-Date: Fri, 16 Feb 2018 20:56:01 -0000
Content-Type: text/plain

- update the git URL and SRCREV
- select matrix desktop file based on QT vesion
- add qt-tstat.sh to force the QT5 demo to run as eglfs full-screen app

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../thermostat-demo/qt-tstat/qt_tstat.sh            | 13 +++++++++++++
 .../recipes-apps/thermostat-demo/qt-tstat_2.0.bb    | 21 +++++++++++----------
 2 files changed, 24 insertions(+), 10 deletions(-)
 create mode 100755 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh

diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
new file mode 100755
index 0000000..01ca4f9
--- /dev/null
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat/qt_tstat.sh
@@ -0,0 +1,13 @@
+#!/bin/bash
+
+/etc/init.d/weston stop
+sleep 1
+
+echo 0 > /sys/class/graphics/fbcon/cursor_blink
+
+ThermostatDemo -platform eglfs
+
+echo 1 > /sys/class/graphics/fbcon/cursor_blink
+
+/etc/init.d/weston start
+sleep 1
diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 494d582..acb0720 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -12,31 +12,32 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
 BRANCH ?= "master"
-SRCREV = "2512773c2d9da989e6a42c1e90b2b34496713072"
+SRCREV = "db7959b200e0ecbe59ff1c867251b1a8b17bd567"
 
-SRC_URI = " \
-	git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git \
-"
-
-SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui-with-QtWidgets-per-Qt5-migration-guide.patch \
-	file://0003-Replace-fromAscii-toAscii-with-fromLatin1-toLatin1-p.patch', '', d)}"
+SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANCH} \
+	   file://qt_tstat.sh"
 
 S = "${WORKDIR}/git/"
 
+DESKTOP_FILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
+
+
 do_install() {
 	install -d ${D}/usr/bin
 	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
+	install ${WORKDIR}/qt_tstat.sh ${D}/usr/bin/qt_tstat.sh
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


