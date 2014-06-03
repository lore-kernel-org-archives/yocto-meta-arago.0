Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 6A13E52AA6
	for <meta-arago@arago-project.org>;
	Tue,  3 Jun 2014 02:30:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N6K00BBFMXPP2G0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 Jun 2014 21:30:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 971392011D; Mon,
	02 Jun 2014 22:29:49 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 Jun 2014 22:29:37 -0400
Message-id: <1401762581-31370-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
In-reply-to: <1401762581-31370-1-git-send-email-denis@denix.org>
References: <1401762581-31370-1-git-send-email-denis@denix.org>
Subject: [PATCH 1/5] qt-tstat: fix install with Qt5, broken by latest change
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
X-List-Received-Date: Tue, 03 Jun 2014 02:30:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Last change broke Qt5 install, which uses B!=S unlike Qt4.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index d0a9f7a..1b15f2f 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -12,7 +12,7 @@ require recipes-core/matrix/matrix-gui-paths.inc
 
 inherit qt-provider
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS += "${QT_DEPENDS_SVG} ${QT_DEPENDS_SCRIPT}"
 
@@ -28,13 +28,11 @@ SRC_URI += "${@base_conditional('QT_PROVIDER', 'qt5', 'file://0002-Replace-QtGui
 
 S = "${WORKDIR}/git/"
 
-BUILDDIR ?= "."
-
 do_install() {
 	install -d ${D}/usr/bin
-	install -m 0755 ${BUILDDIR}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
+	install -m 0755 ${B}/ThermostatDemo ${D}/usr/bin/ThermostatDemo
 	install -d ${D}${MATRIX_APP_DIR}/qt_tstat
-	cp -rf matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
+	cp -rf ${S}/matrix-files/*  ${D}${MATRIX_APP_DIR}/qt_tstat
 }
 
 PACKAGES += "matrix-gui-thermostat-demo"
-- 
1.9.2


