Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BA793529AC
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 21:34:08 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAKLXw82084678
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:33:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542749638;
	bh=j3D36Q4oQKQphNk/rqXcGMrSfj9oRG1UkIb3J7/ip84=;
	h=From:To:CC:Subject:Date;
	b=FK1CZrrv1lX8C+eKUYcvtyDn3OsC42AgJZU9OflxLIVhqiK4OOeFGE0BgMOzlrc+l
	aOsS0OtvIjEJPHkOeLxDusG1exAwdy9O77vMY3iAf+4rXlfguc9jWO2RVSkDtTEp6k
	auXSNJBtbM+hFjMqbTjf4pFVlv+FLhlo7ERN7qgk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAKLXw1N004099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 20 Nov 2018 15:33:58 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 20 Nov 2018 15:33:58 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 20 Nov 2018 15:33:58 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAKLXv5c018563;
	Tue, 20 Nov 2018 15:33:57 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 20 Nov 2018 16:33:55 -0500
Message-ID: <1542749635-31317-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [rocko/master] [PATCH] matrix-gui: replace SysVinit with systemd service
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
X-List-Received-Date: Tue, 20 Nov 2018 21:34:09 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-core/matrix/matrix-gui/matrix-gui-2.0.service | 10 ++++++++++
 meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb   | 15 +++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
new file mode 100644
index 0000000..3ce1024
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui/matrix-gui-2.0.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Matrix GUI
+After=weston.service
+
+[Service]
+Type=forking
+ExecStart=/etc/init.d/matrix-gui-2.0 start
+
+[Install]
+WantedBy=multi-user.target
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index d8aa00b..c79f13e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -6,14 +6,13 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a886c9ef769b2d8271115d2502512e5d"
 
 SECTION = "multimedia"
 
-PR = "r35"
+PR = "r36"
 
-INITSCRIPT_NAME = "matrix-gui-2.0"
-INITSCRIPT_PARAMS = "defaults 97"
+SYSTEMD_SERVICE_${PN} = "matrix-gui-2.0.service"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-inherit update-rc.d
+inherit systemd
 
 BRANCH ?= "master"
 SRCREV = "9a2d12590102fefc5c29fc9e8d346ce6b0198468"
@@ -23,6 +22,7 @@ MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
+           file://matrix-gui-2.0.service \
            ${@base_conditional('QT_PROVIDER', 'qt5', bb.utils.contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
            ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'file://0001-execute_command-workaround-for-GUI-apps-with-weston.patch', '', d)} \
 "
@@ -46,10 +46,13 @@ do_install(){
 	sed -i -e "s/__MATRIX_FLAGS__/\"${MATRIX_FLAGS}\"/" ${WORKDIR}/${MATRIX_INITSCRIPT}
 	sed -i -e "s/__SWITCH_FOREGROUND_VT__/${SWITCH_FOREGROUND_VT}/" ${WORKDIR}/${MATRIX_INITSCRIPT}
 
-	# Install the init script
-	# TODO: replace init script with systemd files
+	# Install the script
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/${MATRIX_INITSCRIPT} ${D}${sysconfdir}/init.d/matrix-gui-2.0
+
+	# Install the systemd unit file
+	install -d ${D}${systemd_system_unitdir}
+	install -m 0644 ${WORKDIR}/matrix-gui-2.0.service ${D}${systemd_system_unitdir}
 }
 
 GUIDEPS = "matrix-gui-browser refresh-screen"
-- 
1.9.1


