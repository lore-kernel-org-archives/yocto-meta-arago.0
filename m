Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 0AC5D529E8
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2019 01:44:59 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iTxO040528
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557798269;
	bh=75llv31KSCMcFDoN4UuhqMhvNme8E/HjtaGq3C+oPZo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=YLAiUKJ6pCoNgC6666Gw4lOP9Ep3PzLZ1Ec9frc0icnflhtFHk3tO/BZD9KqnoWDa
	EYgtNlogOidnEE3wmuR6aFj3nQzc3EWZUWAGVnx9P8mNHS3CPiY8+o58Z8RhpWekfX
	tgFeqNFShFTgXqPtnlve7vctQlyYTevfdcdtdy6o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4E1iTUG044683
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:29 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 13 May 2019 20:44:29 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 13 May 2019 20:44:29 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4E1iSuG064750
	for <meta-arago@arago-project.org>; Mon, 13 May 2019 20:44:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 May 2019 21:44:15 -0400
Message-ID: <20190514014418.20156-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514014418.20156-1-e-ruei1@ti.com>
References: <20190514014418.20156-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/5] ackagegroup-arago-qte-toolchain-target: replace qtwebengine with qtwebkit
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
 ...packagegroup-arago-qte-toolchain-target.bb | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index 2afc9746..4802acd7 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 
-PR = "r13"
+PR = "r14"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -61,21 +61,21 @@ QT5_DEV = " \
         qtsensors-dev \
         qtsvg-dev \
         qtxmlpatterns-dev \
-        qtwebengine-mkspecs \
-        qtwebengine-dev \
-        qtserialport-mkspecs \
-        qtserialport-dev  \
-"
-
-QT5_DEV_append_k3 = " \
         qtwebkit-mkspecs \
         qtwebkit-dev \
+        qtserialport-mkspecs \
+        qtserialport-dev  \
 "
 
-QT5_DEV_remove_k3 = " \
-        qtwebengine-mkspecs \
-        qtwebengine-dev \
-"
+#QT5_DEV_append_k3 = " \
+#        qtwebkit-mkspecs \
+#        qtwebkit-dev \
+#"
+#
+#QT5_DEV_remove_k3 = " \
+#        qtwebengine-mkspecs \
+#        qtwebengine-dev \
+#"
 
 RDEPENDS_${PN} += " \
         ${@oe.utils.conditional('QT_PROVIDER', 'qt5', "${QT5_DEV}", "${QT4_DEV}", d)} \
-- 
2.17.1


