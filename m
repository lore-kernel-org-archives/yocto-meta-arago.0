Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id E21CA52987
	for <meta-arago@arago-project.org>;
	Fri, 10 May 2019 20:35:04 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4AKYZ9S073409
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1557520475;
	bh=npy6vu37hukxn3yA6pDLf5Y28pkeyE0q/1M15oiqJL0=;
	h=From:To:Subject:Date;
	b=Nm6MYQOAn3GXuy7oUun//w/8+DuCp4avsyI8ddYrf5d0Ir7mHRS/S4KaX64o3ssJY
	flrXYP5MbciIRRlTxg9bv4wQE9d3mWWsxbuEwskMIk++K85WevlsOv7WNCGzKm8Hqn
	IeIp3KIs2cbZoEBaKIRm8ziXDwsJNbTD95ROYvpA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4AKYZtd122535
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 10 May 2019 15:34:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 10 May 2019 15:34:35 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4AKYYem045482
	for <meta-arago@arago-project.org>; Fri, 10 May 2019 15:34:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 10 May 2019 16:34:22 -0400
Message-ID: <20190510203423.35367-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] qtwebbrowser: update the example src path to be consistent with qt5
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
X-List-Received-Date: Fri, 10 May 2019 20:35:05 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
index 907dfefe..c32ec22c 100644
--- a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
+++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS += "qtwebengine"
 PACKAGES += "${PN}-examples"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "dev"
 SRCREV = "023733af5523a5ad84359926224fa106001215f4"
@@ -25,10 +25,10 @@ inherit qt-provider
 # Install qtwebbrowser under /usr/bin
 do_install() {
     install -d ${D}${bindir}
-    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
+    install -d ${D}${datadir}/examples/webengine/webbrowser/src
     install -m 0755 src/qtwebbrowser ${D}${bindir}/qtwebbrowser
-    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
+    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/examples/webengine/webbrowser/.
 }
 
 FILES_${PN} +=  "${bindir}/qtwebbrowser"
-FILES_${PN}-examples +=  "${datadir}/qt5/examples/webengine/webbrowser/*"
+FILES_${PN}-examples +=  "${datadir}/examples/webengine/webbrowser/*"
-- 
2.17.1


