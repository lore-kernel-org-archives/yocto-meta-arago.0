Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D2D5C529D3
	for <meta-arago@arago-project.org>;
	Tue, 12 Nov 2019 21:46:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xACLioB9085453
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 15:44:50 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573595090;
	bh=WggkvIxNVO5zu0Hra5r+cHB3gxnlSEpDgw48PpD+Ifw=;
	h=From:To:Subject:Date;
	b=p9eJ3uGnGVa1yktaG4WQqfHyi9FW3y/svX4pguo3mtcN6mPLrE4XaMeZ23xvdnJYd
	lqzQAguDuXSJ9b1xp8IVOb1Puwgkmno52LgDP+mtNqqiT7dIbfUCOVOIKJkjsjRwnM
	N7lN9i4aX23Ux3uPIwfC3SSGExL1LC6GqB4IFtYQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACLioXD032878
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 15:44:50 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 12 Nov 2019 15:44:32 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 12 Nov 2019 15:44:32 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xACLinA8012152
	for <meta-arago@arago-project.org>; Tue, 12 Nov 2019 15:44:49 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Nov 2019 16:44:40 -0500
Message-ID: <20191112214440.36572-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] qtbase-conf: add environment variable QT_QPA_EGLFS_ALWAYS_SET_MODE
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
X-List-Received-Date: Tue, 12 Nov 2019 21:46:15 -0000
Content-Type: text/plain

Ensure that drmModeSetCrtc() is invoked once prior to drmModePageFlip()
calls for QPA platform EGLFS_KMS.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 1 +
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index 2484d82a..146ee07e 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -4,4 +4,5 @@
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
+export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 76d3804d..29fa2969 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -5,4 +5,5 @@ export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
 export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
 export QT_QPA_EGLFS_KMS_CONFIG=/etc/qt5/eglfs_kms_cfg.json
 export QT_QPA_EGLFS_INTEGRATION=eglfs_kms
+export QT_QPA_EGLFS_ALWAYS_SET_MODE=1
 export QT_WAYLAND_SHELL_INTEGRATION=wl-shell
-- 
2.17.1


