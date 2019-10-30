Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 05132529F3
	for <meta-arago@arago-project.org>;
	Wed, 30 Oct 2019 19:57:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtwKu126922
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572465358;
	bh=dvBAtAUPDr1AM7OQG17ccNbBiiBA+WCzmIx14Xim0sQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=r2kovriaec00zlR+V4kDDXrEwJ46VoIejgxldJ7OhKzAwm6qPCE5D5XEpmrvr5hjC
	EHc/bXvpsFBhV2KGVLKne7rybI3rFSTGX3MtBG75L/kJd91ew3oQ6RPcIi9PFn2+sn
	vFHT0dpBmLNamK8a5CD0ykODSYKPuaNXlBY2yhgA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UJtwNJ026259
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 30 Oct 2019 14:55:45 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 30 Oct 2019 14:55:58 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UJtuws112935
	for <meta-arago@arago-project.org>; Wed, 30 Oct 2019 14:55:58 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 30 Oct 2019 15:55:50 -0400
Message-ID: <20191030195550.17767-8-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191030195550.17767-1-e-ruei1@ti.com>
References: <20191030195550.17767-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH v2 7/7] HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer
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
X-List-Received-Date: Wed, 30 Oct 2019 19:57:23 -0000
Content-Type: text/plain

Disable RDEPENDS point-cloud-viewer tentatively until the updated binary
built against the MESA-based EGL is available

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../matrix/matrix-gui-machinevision-demos_2.0.bb            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
index cadfefac..4337ae9d 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-machinevision-demos_2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
 
 require recipes-core/matrix/matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.4"
+PR = "${INC_PR}.5"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -25,9 +25,11 @@ RDEPENDS_matrix-machinevision-demo-dlp3dscanner = " \
 "
 
 RDEPENDS_matrix-machinevision-demo-dlp3dscanner_append_dra7xx = " \
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
 "
 
+#    ${@bb.utils.contains('MACHINE_FEATURES','gpu','point-cloud-viewer','',d)} \
+#
+
 RDEPENDS_matrix-machinevision-demo-barcoderoi = " \
     ${MACHINEVISION_RDEPENDS} \
     barcode-roi \
-- 
2.17.1


