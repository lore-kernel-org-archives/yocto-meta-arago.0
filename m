Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B45F2529A6
	for <meta-arago@arago-project.org>;
	Tue, 11 Dec 2018 19:38:41 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBBJcTCE121618
	for <meta-arago@arago-project.org>; Tue, 11 Dec 2018 13:38:29 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBBJcTNO021347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Dec 2018 13:38:29 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 11 Dec 2018 13:38:29 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 11 Dec 2018 13:38:29 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBBJcS1S026540;
	Tue, 11 Dec 2018 13:38:28 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Dec 2018 14:26:06 -0500
Message-ID: <1544556367-5429-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 1/2] point-cloud-viewer: fetch from git
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
X-List-Received-Date: Tue, 11 Dec 2018 19:38:43 -0000
Content-Type: text/plain

* Fetch from git as previous hosting location has been shutdown.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 ...oint-cloud-viewer_2.0.bb => point-cloud-viewer_git.bb} | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-arago-extras/recipes-apps/point-cloud-viewer/{point-cloud-viewer_2.0.bb => point-cloud-viewer_git.bb} (62%)

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
similarity index 62%
rename from meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
rename to meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index 9d3b99e..ff2e706 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_2.0.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -1,18 +1,21 @@
 DESCRIPTION = "Point cloud viewer"
-HOMEPAGE = "https://gforge.ti.com/gf/project/am_multimedia"
+HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
-SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/1304/7978/${PN}-${PV}.tar.gz"
+BRANCH = "master"
 
-SRC_URI[md5sum] = "b4a49f1998397efb7c33299a7aeec386"
-SRC_URI[sha256sum] = "7b25a185122ed739eab040b77f101f866d33f77c4f64cae95d60213787228f17"
+SRC_URI = "git://git.ti.com/processor-sdk/point-cloud-viewer.git;protocol=git;branch=${BRANCH}"
 
-S = "${WORKDIR}/${PN}-${PV}"
+SRCREV = "ac8f7a8334b6458676810349ab84f718ecd16975"
+
+PV = "2.0"
+
+S = "${WORKDIR}/git"
 
 RDEPENDS_${PN} = "glfw3 opencv"
 
-- 
2.7.4


