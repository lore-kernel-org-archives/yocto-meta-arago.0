Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 83168529D8
	for <meta-arago@arago-project.org>;
	Tue,  6 Feb 2018 20:16:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w16KFu0u027928
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517948156;
	bh=ThVSbBY+wQquwWh6yrAG8GS9rQZLGL4L2aoGYbvn2w8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=usDcZiO7xwwjTf8I+WB08Xk0cYQrRtsxAITC5DlH2rP+71RIVrByUD8ulwJBgIqsZ
	YMLVG2hDkoIWeP2uZqzxXPYIB1zgGbM+K+zHZj7MqaKRDPyIpJCrXXiM10szzTdza5
	1Bzn+hJMafTSX3XqKYHVPLPsdsEzxLK6nIWZh3QM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFu1C025442
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:56 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Feb 2018 14:15:55 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Feb 2018 14:15:55 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w16KFtSZ029875
	for <meta-arago@arago-project.org>; Tue, 6 Feb 2018 14:15:55 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Feb 2018 15:15:48 -0500
Message-ID: <1517948150-41783-3-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
References: <1517948150-41783-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 2/4] packagegroup-arago-tisdk-qte(-sdk-host): move qt-tstat to QT_DEMOS
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
X-List-Received-Date: Tue, 06 Feb 2018 20:16:04 -0000
Content-Type: text/plain

qt-tstat has been enhanced to support both Qt4 and Qt5

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb           | 5 ++---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb       | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
index 5d596f8..1cef6bb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related sources into the sdk"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -8,12 +8,11 @@ inherit packagegroup
 
 QT4_DEMOS = "\
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground-src', '', d)} \
-    qt-tstat-src \
 "
 
 QT_DEMOS = "\
+    qt-tstat-src \
 "
-#    qt-tstat-src 
 
 RDEPENDS_${PN} = "\
     ${@base_conditional('QT_PROVIDER', 'qt5', '', "${QT4_DEMOS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index f6f7468..4215653 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r17"
+PR = "r18"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,7 +10,6 @@ QT4_DEMOS = "\
     qt4-embedded-examples \
     qt4-embedded-demos \
     ${@base_conditional('ARAGO_QT_PROVIDER', 'qt4-embedded-gles', 'quick-playground', '', d)} \
-    qt-tstat \
 "
 
 QT5_DEMOS = "\
@@ -29,8 +28,8 @@ QT5_DEMOS = "\
 "
 
 QT_DEMOS = "\
+    qt-tstat \
 "
-#    qt-tstat 
 
 RDEPENDS_${PN} = "\
     packagegroup-arago-qte \
-- 
1.9.1


