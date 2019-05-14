Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id F1A18529E7
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:44:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iTSg120462
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798269;
	bh=RLiXnbr5ZHj4cT5kFyKIcchuqGdEb3Fqa6jZeaiaFFw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ttbpavfPHfbIb2++Va6Kps/ZFNqxOvA6nyKqftBz5bU5yb4crRPlm8rt9+MNXbEmO
	nETuJlB4H7YSndM4XdP3xAakgNnjSV6ji9JdaNn1BvHKByR//FozyFTosenvHUgK+u
	ZXIIuiuGHYGlag4xsP9H/xYro07J93e1BTAzAgKA=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iTAP073590
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:29 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuH064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:16 -0400
Message-ID: <20190514014418.20156-4-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514014418.20156-1-e-ruei1@ti.com>
References: <20190514014418.20156-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/5] ackagegroup-arago-tisdk-qte: replace qtwebengine examples with qtwebkit ones
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
X-List-Received-Date: Tue, 14 May 2019 01:45:02 -0000
Content-Type: text/plain

- qtwebengine 5.11.3 does not work, replace it with qtwebkit until the
  fix is available

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-qte.bb           | 20 +++++++++----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
index 43a0d02f..b2ca56eb 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r19"
+PR = "r20"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,19 +22,17 @@ QT5_DEMOS = "\
     qtscript-examples \
     qtsvg-examples \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'qtwayland-examples', '', d)} \
-    qtwebbrowser \
-    qtwebbrowser-examples \
-    qtwebengine-examples \
+    qtwebkit-examples \
     qtserialport-examples \
 "
 
-QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
-
-QT5_DEMOS_remove_k3 = "\
-    qtwebbrowser \
-    qtwebbrowser-examples \
-    qtwebengine-examples \
-"
+#QT5_DEMOS_append_k3 = " qtwebkit-examples-examples"
+#
+#QT5_DEMOS_remove_k3 = "\
+#    qtwebbrowser \
+#    qtwebbrowser-examples \
+#    qtwebengine-examples \
+#"
 
 QT_DEMOS = "\
     qt-tstat \
-- 
2.17.1


