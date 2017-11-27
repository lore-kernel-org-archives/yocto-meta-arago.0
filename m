Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 8333752961
	for <meta-arago@arago-project.org>;
	Mon, 27 Nov 2017 16:14:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vARGEu5s026291
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 10:14:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511799296;
	bh=l9IAJjnqhxhVCHVCYbt/dNoND1HExMbzqJ/FrShD95c=;
	h=From:To:CC:Subject:Date;
	b=wD+C+Aj/Kh1KvXhIVkWw+E2nQEi8s9yVR8X9M732GuSkV1Ka3zd4C6tu+jRSw2T8q
	WZUuQe105XkfgAUChwyG/8Lg7sW9n/v0c6s7vXeIj8jgfEUd/WKGuaXu67VB6l5iPo
	Zh4LCU8X58+/DWZrO8WWNUAGZ+XGU5pL2wHJNW9w=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARGEupC016246
	for <meta-arago@arago-project.org>; Mon, 27 Nov 2017 10:14:56 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 27 Nov 2017 10:14:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 27 Nov 2017 10:14:55 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vARGEtJr005651;
	Mon, 27 Nov 2017 10:14:55 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Nov 2017 11:14:49 -0500
Message-ID: <1511799289-21996-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] packagegroup-arago-tisdk-matrix: add audiocapture demo for AM4 and AM5
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
X-List-Received-Date: Mon, 27 Nov 2017 16:14:57 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index 99bf97e..524aea3 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk53"
+PR_append = "-tisdk54"
 
 MATRIX_SGX_DEMOS_remove_omap-a15 = " \
     matrix-3d-demo-kmscubevideo \
@@ -11,6 +11,11 @@ MATRIX_COMMON_APPS_remove = " \
 MATRIX_APPS_append_omap-a15 = " \
     matrix-gui-apps-dual-camera \
     matrix-gui-apps-image-gallery \
+    matrix-multimedia-demo-audiocapture \
+"
+
+MATRIX_APPS_append_ti43x = " \
+    matrix-multimedia-demo-audiocapture \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
-- 
1.9.1


