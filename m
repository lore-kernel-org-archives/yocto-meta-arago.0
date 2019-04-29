Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 50A34529EF
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 15:08:42 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TF8Fv4012675
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:08:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556550495;
	bh=cUDGiO20INsrd2t8DX8kZM93TOmqoKJ5bfbEFzrUIWU=;
	h=From:To:Subject:Date;
	b=lk3tVWjFIhjuYobIWRjHEkLaEOitSSx/lgQvxnx7EX7sQQAcuEpVftwjWcHmZS51c
	fC0P70GWo8tRdwTsDRddhw+86jgIFhyOgUoUwWMWl0TUSRF9Mz62UXypTuSr1bkaF+
	JcPHbIWY2Arp5LgZJmg5AGqGWfNb+F/PfgLcwDMg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TF8F7v096519
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:08:15 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 10:08:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 10:08:15 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TF8E6i119404
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 10:08:15 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 29 Apr 2019 11:08:10 -0400
Message-ID: <20190429150810.23357-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase-conf: removed duplicated patch
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
X-List-Received-Date: Mon, 29 Apr 2019 15:08:42 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@UDA0850410>

This patch has been upstreamed.

Signed-off-by: Eric Ruei <a0850410@UDA0850410>
---
 recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json | 15 ---------------
 recipes-qt/qt5/qtbase-conf/qt_env.sh          |  7 -------
 recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh    |  8 --------
 recipes-qt/qt5/qtbase-conf_1.0.bbappend       | 12 ------------
 4 files changed, 42 deletions(-)
 delete mode 100644 recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
 delete mode 100644 recipes-qt/qt5/qtbase-conf/qt_env.sh
 delete mode 100644 recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
 delete mode 100644 recipes-qt/qt5/qtbase-conf_1.0.bbappend

diff --git a/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json b/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
deleted file mode 100644
index 61b834b..0000000
--- a/recipes-qt/qt5/qtbase-conf/eglfs_kms_cfg.json
+++ /dev/null
@@ -1,15 +0,0 @@
-{
-  "device": "/dev/dri/card0",
-  "hwcursor": false,
-  "pbuffers": true,
-  "outputs": [
-    {
-      "name": "VGA1",
-      "mode": "off"
-    },
-    {
-      "name": "HDMI1",
-      "mode": "1024x768"
-    }
-  ]
-}
\ No newline at end of file
diff --git a/recipes-qt/qt5/qtbase-conf/qt_env.sh b/recipes-qt/qt5/qtbase-conf/qt_env.sh
deleted file mode 100644
index 758d75c..0000000
--- a/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ /dev/null
@@ -1,7 +0,0 @@
-#!/bin/sh
-
-### QT Environment Variables ###
-export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
-export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=none
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
diff --git a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
deleted file mode 100644
index fa51fca..0000000
--- a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-### QT Environment Variables ###
-export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
-export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
-export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=none
-export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
diff --git a/recipes-qt/qt5/qtbase-conf_1.0.bbappend b/recipes-qt/qt5/qtbase-conf_1.0.bbappend
deleted file mode 100644
index 75cd457..0000000
--- a/recipes-qt/qt5/qtbase-conf_1.0.bbappend
+++ /dev/null
@@ -1,12 +0,0 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".tisdk2"
-
-SRC_URI += "file://eglfs_kms_cfg.json"
-
-# Add custom Arago qtbase eglfs_kms configuration file
-do_install_append () {
-    install -d ${D}${sysconfdir}/qt5
-    install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
-}
-
-FILES_${PN} += "${sysconfdir}/qt5/*"
-- 
2.17.1


