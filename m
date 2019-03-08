Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 5C33552987
	for <meta-arago@arago-project.org>;
	Fri,  8 Mar 2019 23:02:22 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x28N2EpV126224
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552086134;
	bh=Wzxs2M05OYvddOCINLBEGOdUVgBvz/Xwug/7FHBVVWg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=C3wHoV2pVewZIMVBp1BDVr7RFGAeM/8nXgNNjMcqOQX+2Yw4WTw0yXhsr+i8JEovO
	qeHm2xVbG276k3i7euO7wyOtTvp0W67HrmztwPadHhT2FLY1UhT3oZLvgIBv2Qx0kG
	p6TRRGxyKa4cdPRpBgYi9Y8oDBQzHIau9zoOwwoE=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x28N2EGm041208
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 8 Mar 2019 17:02:13 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 8 Mar 2019 17:02:13 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x28N2D1G026555
	for <meta-arago@arago-project.org>; Fri, 8 Mar 2019 17:02:13 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Mar 2019 18:02:07 -0500
Message-ID: <1552086127-40979-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
References: <1552086127-40979-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] atbase-config: add eglfs_kms configuration file and change wl shell
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
X-List-Received-Date: Fri, 08 Mar 2019 23:02:22 -0000
Content-Type: text/plain

- add eglfs_kms configuration file
- switch to wl-shell because xdb-shell-v5 is obsolete

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json         | 15 +++++++++++++++
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh    |  3 ++-
 .../recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh            |  3 ++-
 meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb       | 10 +++++++---
 4 files changed, 26 insertions(+), 5 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
new file mode 100644
index 0000000..61b834b
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
@@ -0,0 +1,15 @@
+{
+  "device": "/dev/dri/card0",
+  "hwcursor": false,
+  "pbuffers": true,
+  "outputs": [
+    {
+      "name": "VGA1",
+      "mode": "off"
+    },
+    {
+      "name": "HDMI1",
+      "mode": "1024x768"
+    }
+  ]
+}
\ No newline at end of file
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 9701a8e..2014d20 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -2,5 +2,6 @@
 
 ### QT Environment Variables ###
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
+export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=none
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
+export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 68ccf04..8ff0508 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -3,5 +3,6 @@
 ### QT Environment Variables ###
 export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
+export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=none
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
+export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
index b2ad0a8..5c2974e 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf_1.0.bb
@@ -5,12 +5,16 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "file://qt_env.sh"
+SRC_URI = "file://qt_env.sh \
+           file://eglfs_kms_cfg.json \
+          "
 
-# Add custom Arago qtbase Environment script file
+# Add custom Arago qtbase Environment script and eglfs_kms configuration file
 do_install () {
     install -d ${D}${sysconfdir}/profile.d
     install -m 0644 ${WORKDIR}/qt_env.sh ${D}${sysconfdir}/profile.d/
+    install -d ${D}${sysconfdir}/qt5
+    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
 }
 
-FILES_${PN} += "${sysconfdir}/profile.d/*"
+FILES_${PN} += "${sysconfdir}/profile.d/* ${sysconfdir}/qt5/*"
-- 
1.9.1


