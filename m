Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A20DA529C0
	for <meta-arago@arago-project.org>;
	Tue, 10 Jul 2018 19:19:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6AJIxKt112257
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 14:18:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531250339;
	bh=X5hpJy0pn/kBlHSA6nIb3XKHTe3PA3gbbVtSf2NuSI0=;
	h=From:To:Subject:Date;
	b=vnVt+dyX7zotuQI3l+3jMwMRZ6Knl21LJwZcFyzjiF3fQFXi2VKcnvLd4SBSziNtO
	8I2sHbO7uZfyxumjzg5/HZVRpuAdoEP3Fh81Yc4/NL0YBHCwjlp9cqp11toW3PqqSh
	3pucTGVff7YPQ0Jw472qtx5FpeZ2q98Fqw91u6AY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AJIwPd011827
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 14:18:59 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 10 Jul 2018 14:18:58 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 10 Jul 2018 14:18:58 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6AJIwMB030568
	for <meta-arago@arago-project.org>; Tue, 10 Jul 2018 14:18:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 10 Jul 2018 15:18:48 -0400
Message-ID: <1531250328-4168-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/ti2018.01][PATCH] qtbase-conf: update QT environment variables per QT5.9
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
X-List-Received-Date: Tue, 10 Jul 2018 19:19:06 -0000
Content-Type: text/plain

- QT_QPA_GENERIC_PLUGINS: obsolete
- SSL_CERT_FILE: for qtwebengine-based browser
- QT_QPA_EGLFS_INTEGRATION: the default one eglfs_viv is not supported
- QT_WAYLAND_SHELL_INTEGRATION: the default shell xdg-shell-v6 does not
  support full-screen.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh       | 4 +++-
 meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
index f888d50..9701a8e 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/qt_env.sh
@@ -1,4 +1,6 @@
 #!/bin/sh
 
 ### QT Environment Variables ###
-export QT_QPA_GENERIC_PLUGINS=Auto
+export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
+export QT_QPA_EGLFS_INTEGRATION=none
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
index 8f47083..68ccf04 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase-conf/ti33x/qt_env.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
 ### QT Environment Variables ###
-export QT_QPA_GENERIC_PLUGINS=Auto
 export QT_QPA_EVDEV_TOUCHSCREEN_PARAMETERS="rotate=180"
+export SSL_CERT_FILE=/etc/ssl/certs/ca-certificates.crt
+export QT_QPA_EGLFS_INTEGRATION=none
+export QT_WAYLAND_SHELL_INTEGRATION=xdg-shell-v5
-- 
1.9.1


