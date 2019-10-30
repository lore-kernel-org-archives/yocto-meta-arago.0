Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D532C52A00
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvLv089592
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465357;
	bh=84ndrgq7p4zgGESIjT2VIwa47jXKjzy1wofJdRFYmcA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Ob9y26Qd9VIC9QyLzIDAyf/FSQH+5q2yZ7G3I9IxzdmGSuJVeymuIlBthoKusAfjY
	Z2VepJK+Bztau+T795GP2D+jjIBGkXKTpqYV82J4K1Ohl5vBUVbAH8byfPUVXTZR6P
	AGPLseCWetyYgP5Ns+BhlnAvD2/Rf4frTMZkIZg4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtvkI031259
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:44 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuwn112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:45 -0400
Message-ID: <20191030195550.17767-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 2/7] qtbase-conf: set the default EGLFS mode to kms
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:18 -0000
Content-Type: text/plain

We start to use the Mesa-based EGL 1.5-enabled GLES/EGL libraries where
NullDRM window system is no longer supported and GBM(DRM) window system
should be used instead for full-screen operation.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 2 +-
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 2014d206..2484d82a 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -3,5 +3,5 @@
 ### QT Environment Variables ###
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=none
+export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 8ff05082..76d3804d 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -4,5 +4,5 @@
 export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
-export QT_QPA_EGLFS_INTEGRATION=none
+export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
-- 
2.17.1


