Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 9F4C9529C0
	for <meta-arago@arago-project.org>;
	Tue, 19 Nov 2019 20:39:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAJKcLUf122686
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 14:38:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574195901;
	bh=mOuyu98aiA4vPl67IFoAZaxNge9auccDGUnYn8IstJ4=;
	h=From:To:Subject:Date;
	b=i/jOFKNMSa5glDHsKhNxpmncatzbbLkKpkAueC0cofKq75hDY+oOTWiHmEOtsb7fm
	MRvgkQj/kC5WA+3MF+2K4J3EZnuoU/YL9hW+HMfMurxKwRZQwD1MLb2Pjja5cFmK1i
	f0I++MUeirEj5J7HCGzb9fl1It6qAImuwTO0ubeE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJKcLx4011110
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 14:38:21 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 19 Nov 2019 14:38:18 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 19 Nov 2019 14:38:18 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAJKcILa073079
	for <meta-arago@arago-project.org>; Tue, 19 Nov 2019 14:38:18 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Nov 2019 15:38:08 -0500
Message-ID: <20191119203808.8050-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] packagegroup-arago-*-qte-*: re-enable qtwebengine/webbrowser for AM6/J7
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
X-List-Received-Date: Tue, 19 Nov 2019 20:39:49 -0000
Content-Type: text/plain

qtwebengine 5.11.3 and qtwebbrowser works on AM6/J7 when the page size
is set to 4K instead of 64K.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-qte.bb  | 6 +++---
 .../packagegroups/packagegroup-arago-tisdk-qte.bb         | 6 +++---
 .../packagegroup-arago-qte-toolchain-target.bb            | 8 ++++----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index b48b8c9f..5984fee7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -50,9 +50,9 @@ QT5_ESSENTIALS = "\
 #QT5_ESSENTIALS_append_k3 = "\
 #    qtwebkit-qmlplugins \
 #"
-QT5_ESSENTIALS_remove_k3 = "\
-    qtwebengine-qmlplugins \
-"
+#QT5_ESSENTIALS_remove_k3 = "\
+#    qtwebengine-qmlplugins \
+#"
 
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 09516693..f742c0f7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -24,15 +24,15 @@ QT5_DEMOS = "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
     qtwebkit-examples-examples \
     qtwebengine-examples \
+    qtwebbrowser \
+    qtwebbrowser-examples \
     qtserialport-examples \
     qtcharts-examples \
 "
 
 #QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
 #
-QT5_DEMOS_remove_k3 = "\
-    qtwebengine-examples \
-"
+#QT5_DEMOS_remove_k3 = "\
 #    qtwebbrowser \
 #    qtwebbrowser-examples \
 #    qtwebengine-examples \
diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index a90f56c0..ac3c6b13 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -76,10 +76,10 @@ QT5_DEV = " \
 #        qtwebkit-dev \
 #"
 #
-QT5_DEV_remove_k3 = " \
-        qtwebengine-mkspecs \
-        qtwebengine-dev \
-"
+#QT5_DEV_remove_k3 = " \
+#        qtwebengine-mkspecs \
+#        qtwebengine-dev \
+#"
 
 RDEPENDS_${PN} += " \
         ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
-- 
2.17.1


