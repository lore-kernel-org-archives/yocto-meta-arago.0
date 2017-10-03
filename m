Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9E79252AF5
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:32 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsMhA005621
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046062;
	bh=9Gp574AxG7i3PoluT1pZDwzOH0FAvwzmEK17CFWQy2E=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=cOi20hnSP8Ia490D0I5mphcr9i7B+FIJnUY3gbSKYyZkTlgY9YBNN6knDxNOy7IDo
	hmz9ZMFo203DeeVS7YpC2vFraz5ej/cB6EpO6bgsvm4pJJkjOskDWHesBn03I9G6bI
	uUgb3a7TjUEOFWZpX80TSP7hJhJCrQWA2MBCQLV0=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsHf5013476
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:17 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFS6013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:17 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:53:57 -0400
Message-ID: <1507046051-57949-10-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 09/23] qtbase-conf: add qt_env.sh for X11 support
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:33 -0000
Content-Type: text/plain

X11: need to set DISPLAY and LD_LIBRARY_PATH

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh | 6 ++++++
 recipes-qt/qt5/qtbase-conf_1.0.bbappend   | 9 +++++++--
 2 files changed, 13 insertions(+), 2 deletions(-)
 create mode 100644 recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh

diff --git a/recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh b/recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh
new file mode 100644
index 0000000..43da0cd
--- /dev/null
+++ b/recipes-qt/qt5/qtbase-conf/qt_env_xsgx.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+
+### QT Environment Variables ###
+export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
+export DISPLAY=:0
+export LD_LIBRARY_PATH=/usr/local/XSGX/lib
\ No newline at end of file
diff --git a/recipes-qt/qt5/qtbase-conf_1.0.bbappend b/recipes-qt/qt5/qtbase-conf_1.0.bbappend
index 5eac07e..047dca7 100644
--- a/recipes-qt/qt5/qtbase-conf_1.0.bbappend
+++ b/recipes-qt/qt5/qtbase-conf_1.0.bbappend
@@ -1,12 +1,17 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 
-SRC_URI += "file://eglfs_kms_cfg.json"
+SRC_URI += " file://eglfs_kms_cfg.json \
+             file://qt_env_xsgx.sh     \
+           "
 
 # Add custom Arago qtbase eglfs_kms configuration file
 do_install_append () {
     install -d ${D}${sysconfdir}/qt5
     install -m 0644 ${WORKDIR}/eglfs_kms_cfg.json ${D}${sysconfdir}/qt5/
+    if [ "${@bb.utils.contains('MACHINE_FEATURES','xsgx','true','false',d)}" = "true" ]; then
+        install -m 0644 ${WORKDIR}/qt_env_xsgx.sh ${D}${sysconfdir}/profile.d/qt_env.sh
+    fi
 }
 
 FILES_${PN} += "${sysconfdir}/qt5/*"
-- 
1.9.1


