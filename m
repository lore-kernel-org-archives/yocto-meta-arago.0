Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id A368852A55
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 19:58:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54Jwrn8002979
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 14:58:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528142333;
	bh=KznMra42g/zroeDTb3PrJbIEQ9yasd+P1kCC/DyPlHM=;
	h=From:To:Subject:Date;
	b=l1jCe3StLDijd8p8VzOk3t9Ib1SPN9uguEahgyBO6r61hjb8Uaut8C7Ac1lECfr3o
	dIsuIyjej8XJRBei4LRrSHfi/zDn5HzCCuuRNaV0esqmbb8ATtba54gDVoHfyCtpEo
	1/u+NxLk1D6D4AGIxZdckw7whODQphD0pDZ4j0gs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54Jwq8Z005563
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 14:58:52 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 14:58:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 14:58:52 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54JwqhJ003286
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 14:58:52 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 15:58:05 -0400
Message-ID: <1528142285-57335-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] qtbase-conf: add env variable QT_WAYLAND_SHELL_INTEGRATION
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
X-List-Received-Date: Mon, 04 Jun 2018 19:58:59 -0000
Content-Type: text/plain

To enable WAYLAND full-screen capability for QT 5.9 plus:
export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-qt/qt5/qtbase-conf/qt_env.sh       | 1 +
 recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 1 +
 recipes-qt/qt5/qtbase-conf_1.0.bbappend    | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-qt/qt5/qtbase-conf/qt_env.sh b/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 6abf5e9..758d75c 100644
--- a/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -4,3 +4,4 @@
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=none
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
diff --git a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 8975458..fa51fca 100644
--- a/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -5,3 +5,4 @@ export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=none
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
diff --git a/recipes-qt/qt5/qtbase-conf_1.0.bbappend b/recipes-qt/qt5/qtbase-conf_1.0.bbappend
index 5eac07e..75cd457 100644
--- a/recipes-qt/qt5/qtbase-conf_1.0.bbappend
+++ b/recipes-qt/qt5/qtbase-conf_1.0.bbappend
@@ -1,5 +1,5 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-PR_append = ".tisdk1"
+PR_append = ".tisdk2"
 
 SRC_URI += "file://eglfs_kms_cfg.json"
 
-- 
1.9.1


