Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 43C1552986
	for <meta-arago@arago-project.org>;
	Sat, 17 Mar 2018 16:39:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2HGceSJ001036
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521304720;
	bh=jgTUTolDOuMrAxPg2Rw+m5zXNgO1bs1h3TUR7kf35ws=;
	h=From:To:Subject:Date;
	b=Ni3eHvH8LYfEjBp6anJDlKho9vZMK7TGmVWcBIaoY09DQoT6cfB+i5ANJImlKd4s3
	pHR8F6y0dXuqqX2nxB9MfXNKdoTSzZBPIgdpVGQllFuQaBGSIqta57j1ONS2Ter9Hp
	xKVUJNtmK0StH4DWuUsh8DrBY224hVdRNYSTLEaM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2HGcefc001103
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:40 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 17 Mar 2018 11:38:39 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 17 Mar 2018 11:38:39 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2HGcd4G004442
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:39 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 17 Mar 2018 12:38:32 -0400
Message-ID: <1521304713-8408-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 1/2] matrix-gui-multimedia-demos: add video-graphics demo
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
X-List-Received-Date: Sat, 17 Mar 2018 16:39:37 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
new file mode 100644
index 0000000..2cddc90
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".tisdk0"
+
+SRCREV = "71c1049e7a73cc731766aa72fc7197a45003625d"
+
+PACKAGES_append = "matrix-multimedia-demo-video-graphics"
+
+RDEPENDS_matrix-multimedia-demo-video-graphics  = "${MULTIMEDIA_RDEPENDS}"
+
+FILES_matrix-multimedia-demo-video-graphics     = "${MATRIX_APP_DIR}/video-graphics/*"
+
-- 
1.9.1


