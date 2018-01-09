Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C4D85529BB
	for <meta-arago@arago-project.org>;
	Tue,  9 Jan 2018 21:48:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w09Lml2X009344
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515534527;
	bh=FauuL06g7wiAnCUGgn20txzS7dM02G6JK2lrxiDXEJk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=IEFg/0aaEXE89H/PaTJkx0ozpf8kCdiLUIX4ISGM1Axr7gp6+7cRn0G3SHCSAql4G
	EpD6Q6141RGcmjBe6LUwxhAdPC7NI2AyGyid7qtYr4Hns9zK7PpLeAFTceHCAU9PU5
	QnDiokLvo/rh8q3mELG3IX2Se3P4P8cswdTr6qjM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09Lmlos027154
	for <meta-arago@arago-project.org>; Tue, 9 Jan 2018 15:48:47 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 9 Jan 2018 15:48:47 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 9 Jan 2018 15:48:47 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w09LmkRY011305;
	Tue, 9 Jan 2018 15:48:47 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Jan 2018 16:48:41 -0500
Message-ID: <1515534524-21325-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1515534524-21325-1-git-send-email-a0271529@ti.com>
References: <1515534524-21325-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/5] packagegroup-arago-tisdk-matrix: remove audiocapture demo for AM4 and AM5
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
X-List-Received-Date: Tue, 09 Jan 2018 21:48:55 -0000
Content-Type: text/plain

* This has been upstreamed to meta-arago

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index 524aea3..67241fa 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk54"
+PR_append = "-tisdk55"
 
 MATRIX_SGX_DEMOS_remove_omap-a15 = " \
     matrix-3d-demo-kmscubevideo \
@@ -11,11 +11,6 @@ MATRIX_COMMON_APPS_remove = " \
 MATRIX_APPS_append_omap-a15 = " \
     matrix-gui-apps-dual-camera \
     matrix-gui-apps-image-gallery \
-    matrix-multimedia-demo-audiocapture \
-"
-
-MATRIX_APPS_append_ti43x = " \
-    matrix-multimedia-demo-audiocapture \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
-- 
1.9.1


