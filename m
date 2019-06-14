Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 96134520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 14:00:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EDxPC6082177
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 08:59:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560520765;
	bh=IUq7Ijp/3zdpqpqErBG3ThZJUqVN11X08FSkDc1t8ss=;
	h=From:To:CC:Subject:Date;
	b=bPrv+ZqgEk82kD+BjYSRRhYoKp+41/LjmLWCEXsnOqQu/vhmDTwVu/tQhDSgsXex8
	HC6qm8lV/7bUDule5F2DO+9pxrH1mycuDCp+y9R075zfisxl1NKHUbjgUxWXtT485W
	g1Vr9RVwtxfcD2WprlyKbvnY6UQ1+sAJH6A2PN98=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EDxPTt039928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 08:59:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 08:59:24 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 08:59:24 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EDxOdi088456;
	Fri, 14 Jun 2019 08:59:24 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Jun 2019 09:39:45 -0400
Message-ID: <1560519585-14850-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud/ti2019.01][PATCH] point-cloud-viewer: remove glfw from RDEPENDS
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
X-List-Received-Date: Fri, 14 Jun 2019 14:00:09 -0000
Content-Type: text/plain

The glfw package does not exist as the glfw recipe only provides a
static library and headers. And because it is a static library that is
provided, there is no run-time dependency.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index 067ead9..c448f50 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -17,7 +17,7 @@ PV = "2.1"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "glfw opencv libxkbcommon"
+RDEPENDS_${PN} = "opencv libxkbcommon"
 
 do_install() {
     install -d ${D}${bindir}
-- 
2.7.4


