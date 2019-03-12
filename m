Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B6BFB52978
	for <meta-arago@arago-project.org>;
	Tue, 12 Mar 2019 22:32:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2CMWUov061733
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 17:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552429950;
	bh=Wzxs2M05OYvddOCINLBEGOdUVgBvz/Xwug/7FHBVVWg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xu77uqqnAWeBh0IyGM1/iWaNlJ/pwJrgK0QPb7b6hqS/BqoKj/QAIEAaVm31sVwd/
	D/FROcvuWhV70pw++OOSMJeuGUPnxFyFw7jGGQ4A/RrOUHRN+aYN8/x7VytuBQhyTY
	3sqwqEn7DZ/3SWIJP3pJ2IahWvqA05BonKuJJ/wo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2CMWU2G040908
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 17:32:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 12 Mar 2019 17:32:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 12 Mar 2019 17:32:29 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2CMWTGI024029
	for <meta-arago@arago-project.org>; Tue, 12 Mar 2019 17:32:29 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Mar 2019 18:32:23 -0400
Message-ID: <1552429943-26165-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552429943-26165-1-git-send-email-e-ruei1@ti.com>
References: <1552429943-26165-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 2/2] qtbase-config: add eglfs_kms configuration file and change wl shell
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
X-List-Received-Date: Tue, 12 Mar 2019 22:32:41 -0000
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


