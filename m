Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 737A352A31
	for <meta-arago@arago-project.org>;
	Tue, 29 Oct 2019 13:55:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrxWV098276
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1572357239;
	bh=dvBAtAUPDr1AM7OQG17ccNbBiiBA+WCzmIx14Xim0sQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Q5MIcAQZJm39JcVi2IdfhQ1n9+QxjeAKYp7yE/GYay98fvGp20pD2lrMOGVLcswNW
	zZ5ZiZTykIrTM2imXoYRxDtqIQfUmRZszo5XtWzM+w9LL1XIie4J79cmJ1r+cg1b9/
	74qm0raSom1LVdTqNVSbGDmP55+wFaxGNZSHkVTY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9TDrxpA097880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:59 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 29 Oct 2019 08:53:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 29 Oct 2019 08:53:47 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9TDrvle002718
	for <meta-arago@arago-project.org>; Tue, 29 Oct 2019 08:53:59 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Oct 2019 09:53:49 -0400
Message-ID: <20191029135349.31792-8-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029135349.31792-1-e-ruei1@ti.com>
References: <20191029135349.31792-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 7/7] HACK: matrix-gui-machinevision-demos: disable point-cloud-viewer
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
X-List-Received-Date: Tue, 29 Oct 2019 13:55:23 -0000
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


