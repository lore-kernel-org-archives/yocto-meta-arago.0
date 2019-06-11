Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 75F99529B1
	for <meta-arago@arago-project.org>;
	Tue, 11 Jun 2019 16:23:30 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BGMo4X063718
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 11:22:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560270170;
	bh=JAqwZl4vD62nAwd0MKCrQMxE+VY2Cj8BHPEHFjt93kQ=;
	h=From:To:CC:Subject:Date;
	b=UM5UaKlsFTmPRVXvqgpDzbpnJDIVgADPLOgg/CVq9PjuBBTlBuI31aHC4OkRgP1C+
	PSSoV8YKsJwNnz8M3Z+ieUnHSgE3wBSYxGTWeNF0HhmXGwgV64UesmqN+6zVr8Q1KU
	wNVwh+EwuTnL91bsGO2JUO/7ANAo9YIw7yzEj39o=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BGMoL8130170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 11:22:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 11 Jun 2019 11:22:50 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 11 Jun 2019 11:22:50 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BGMo19091888;
	Tue, 11 Jun 2019 11:22:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Jun 2019 12:06:49 -0400
Message-ID: <1560269210-18241-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 1/2] point-cloud-viewer: skip file-rdeps check
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
X-List-Received-Date: Tue, 11 Jun 2019 16:23:33 -0000
Content-Type: text/plain

* point-cloud-viewer is a pre-built binary, so skip file-rdeps.
* Drop RDEPENDS on libstdc++ as it was not sufficient.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
index e477448..da4aeef 100644
--- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
+++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
@@ -17,7 +17,7 @@ PV = "2.0"
 
 S = "${WORKDIR}/git"
 
-RDEPENDS_${PN} = "glfw opencv libstdc++"
+RDEPENDS_${PN} = "glfw opencv"
 
 do_install() {
     install -d ${D}${bindir}
@@ -31,4 +31,4 @@ FILES_${PN} += "\
     ${datadir}/ti/pointclouds \
 "
 
-INSANE_SKIP_${PN} = "already-stripped"
+INSANE_SKIP_${PN} = "already-stripped file-rdeps"
-- 
2.7.4


