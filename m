Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id DFA89529DE
	for <meta-arago@arago-project.org>;
	Wed,  6 Nov 2019 19:51:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA6JoMxS081619
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:50:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573069822;
	bh=Zuz2S9h1mqvy96tiGNAFoAPDJzSrI+dh8CNTACtZ9kg=;
	h=From:To:Subject:Date;
	b=WKHSSHh+Ke2pE/nPnodvlcWdaluifyQ861gVQDstCLIX/2FVikvAP0yEAEYiwB57t
	rpC3eWzMXNcIKIujfSkefHmxb9nK8JmI+amOJWPaV6Nhq7boXUDMLKQ5+UsU6uBz55
	lQGYBKA2eOTpJiohKL0rCg2iwtp56gLe/xijx2Bk=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA6JoMN8071347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:50:22 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 6 Nov 2019 13:50:06 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 6 Nov 2019 13:50:06 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA6JoLka019469
	for <meta-arago@arago-project.org>; Wed, 6 Nov 2019 13:50:21 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 6 Nov 2019 14:50:14 -0500
Message-ID: <20191106195014.6159-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] Revert "HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer"
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
X-List-Received-Date: Wed, 06 Nov 2019 19:51:45 -0000
Content-Type: text/plain

This reverts commit 44345f6d02f1e5ff416d2991125e7574eeb39461 which is
no longer needed because the point_cloud_viewer rebuilt against
Mesa-EGL is available now.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../matrix/matrix-gui-machinevision-demos_2.0.bb            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index 4337ae9d..cadfefac 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.5"
+PR = "${INC_PR}.4"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,11 +25,9 @@ RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
 "
 
 RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
 "
 
-#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
-#
-
 RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
     ${MACHINEVISION_RDEPENDS} \
     barcode-roi \
-- 
2.17.1


