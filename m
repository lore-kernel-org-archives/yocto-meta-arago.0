Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id AA3C8529E6
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:44:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iTN9103174
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798269;
	bh=HttTzmHJvH54zJLLFEpsKu9zMyKtFf8QDGoAI22mE1w=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yVG6hOd2jvAfUySwRRHFBG9lUsdHzvufXZlIBQfrlSacUjTMC66pVgFHIbFAlelex
	aweg6k75b+NDFp4mjGjjpdOIQtuUddQkDieSLIcPU0T+Y3um51Uff1Z/OWl3qdwE9G
	40anq6EfDuGpanpCLSl7jayd9ZoMqycedlPzHibw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iTR3044671
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:28 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuF064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:14 -0400
Message-ID: <20190514014418.20156-2-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514014418.20156-1-e-ruei1@ti.com>
References: <20190514014418.20156-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/5] packagegroup-arago-qte: replace qtwebengine with qtwebkit
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
X-List-Received-Date: Tue, 14 May 2019 01:45:01 -0000
Content-Type: text/plain

- qtwebengine 5.11.3 does not work, replace it with qtwebkit until the
  fix is available

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-qte.bb      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
index c038a165..8cfcdfc3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-qte.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add Qt embedded related packages"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -40,18 +40,18 @@ QT5_ESSENTIALS = "\
     qtgraphicaleffects-qmlplugins \
     qtvirtualkeyboard-plugins \
     qtvirtualkeyboard-qmlplugins \
-    qtwebengine-qmlplugins \
+    qtwebkit-qmlplugins \
     liberation-fonts \
     qtconnectivity \
     qtconnectivity-qmlplugins \
 "
 
-QT5_ESSENTIALS_append_k3 = "\
-    qtwebkit-qmlplugins \
-"
-QT5_ESSENTIALS_remove_k3 = "\
-    qtwebengine-qmlplugins \
-"
+#QT5_ESSENTIALS_append_k3 = "\
+#    qtwebkit-qmlplugins \
+#"
+#QT5_ESSENTIALS_remove_k3 = "\
+#    qtwebengine-qmlplugins \
+#"
 
 RDEPENDS_${PN} = "\
     ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_ESSENTIALS}", "${QT4_ESSENTIALS}", d)} \
-- 
2.17.1


