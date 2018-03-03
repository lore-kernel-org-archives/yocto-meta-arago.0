Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id CC76452976
	for <meta-arago@arago-project.org>;
	Sat,  3 Mar 2018 03:17:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 766D620B67;
	Sat,  3 Mar 2018 03:17:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id faxtiBZgvXhi; Sat,  3 Mar 2018 03:17:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 515252098D;
	Sat,  3 Mar 2018 03:17:20 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B4F331632F8;
	Fri,  2 Mar 2018 22:17:19 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  2 Mar 2018 22:17:19 -0500
Message-Id: <1520047039-46621-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] qt-tstat: replace base_conditional with oe.utils.conditional
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
X-List-Received-Date: Sat, 03 Mar 2018 03:17:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
index 43e35ab..b045714 100644
--- a/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-apps/thermostat-demo/qt-tstat_2.0.bb
@@ -23,7 +23,7 @@ SRC_URI = "git://git.ti.com/apps/thermostat-demo.git;protocol=git;branch=${BRANC
 
 S = "${WORKDIR}/git/"
 
-DESKTOP_FILE = "${@base_conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
+DESKTOP_FILE = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'thermostat_demo_qt5.desktop', 'thermostat_demo.desktop', d)}"
 
 
 do_install() {
@@ -36,6 +36,6 @@ do_install() {
 
 PACKAGES += "matrix-gui-thermostat-demo"
 
-RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images ${@base_conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix-gui-submenus-qt4', d)}"
+RDEPENDS_matrix-gui-thermostat-demo += "matrix-gui-apps-images ${@oe.utils.conditional('QT_PROVIDER', 'qt5', 'matrix-gui-submenus-qt5', 'matrix-gui-submenus-qt4', d)}"
 
 FILES_matrix-gui-thermostat-demo += "${MATRIX_APP_DIR}/*"
-- 
2.7.4


