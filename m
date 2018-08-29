Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EB4E752A87
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 15:03:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TF3QQv089693
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535555006;
	bh=LUzWpEFOPUlTK8cAPrzx06IALbfM4TmIyXsH2EIPfqI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=a7YknjMQzlYRQ9fbcUKbHKsXvADgZ3l0gqWhWJUMzrywNLM0pv+Yv/cM/mU7YLSHp
	xMOmIMVdPU2zcxMdqqsgM+VlzJ2HAJLjWmpeuz/lBoEjhUvAacvjgaaW2DB82dGY3J
	F+uT//TKn+IcDeV77ts/zC6leRX4RUlkUrvLDTGA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3QDc024373
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 10:03:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 29 Aug 2018 10:03:25 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TF3OiY028516
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 10:03:25 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 29 Aug 2018 11:03:19 -0400
Message-ID: <1535555000-25564-7-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
References: <1535555000-25564-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 6/7] matrix-gui-qt5-demos: use webkit browser instead of webengine browser for k3 devices
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
X-List-Received-Date: Wed, 29 Aug 2018 15:03:36 -0000
Content-Type: text/plain

Note: qtwebengine-based browser does not work on k3 devices

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 ...-use-webkit-browser-instead-of-webengine-.patch | 31 ++++++++++++++++++++++
 .../matrix/matrix-gui-qt5-demos_2.0.bb             |  6 ++++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos/0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos/0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos/0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch
new file mode 100644
index 0000000..b10a436
--- /dev/null
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos/0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch
@@ -0,0 +1,31 @@
+From 05e10a940ca734df90684059963b10bd0a832584 Mon Sep 17 00:00:00 2001
+From: Eric Ruei <e-ruei1@ti.com>
+Date: Sat, 25 Aug 2018 16:24:10 -0400
+Subject: [PATCH] qt5_broswer: use webkit/browser instead of
+ webengine/demobrowser
+
+Upstream_Status: Inappropriate [other]
+- This patch is a tentative workaround until the webengine web page
+  display problem can be fixed.
+
+Signed-off-by: Eric Ruei <e-ruei1@ti.com>
+---
+ qt5_apps/qt5_browser/qt5_browser.desktop | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/qt5_apps/qt5_browser/qt5_browser.desktop b/qt5_apps/qt5_browser/qt5_browser.desktop
+index a5d3953..2f6636f 100644
+--- a/qt5_apps/qt5_browser/qt5_browser.desktop
++++ b/qt5_apps/qt5_browser/qt5_browser.desktop
+@@ -4,7 +4,7 @@
+ Name=Browser
+ GenericName=Demo App
+ Icon=/usr/share/matrix-gui-2.0/apps/images/web-icon.png
+-Exec=/usr/share/qt5/examples/webenginewidgets/demobrowser/demobrowser http://www.ti.com
++Exec=/usr/share/qt5/examples/webkitwidgets/browser/browser http://www.ti.com
+ Type=Application
+ ProgramType=gui
+ Categories=Qt5
+-- 
+1.9.1
+
diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
index 2dfeba3..2401832 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb
@@ -3,10 +3,14 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 inherit allarch
 
+SRC_URI_append_k3 = " \
+           file://0001-qt5_broswer-use-webkit-browser-instead-of-webengine-.patch;pnum=2 \
+"
+
 S = "${WORKDIR}/git/qt5_apps"
 
 # Make sure qt5 submenu and app images has been installed
-- 
1.9.1


