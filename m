Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0C4AA52968
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:16:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEFLrc025565
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521468921;
	bh=gjbtcGwXDdG2Yw13xS1LsOSHteMGeW/qZ2pbFJprQZc=;
	h=From:To:Subject:Date;
	b=WHlcN+oGZYUJfjIsHjlO6tIS1KjVBfGCJV28Thf4uKdkBmmecEnqRWvOP8YnDBd9Q
	hgpOi6aOdW+VPwAXV1gRajKS0ukgCAfTIruh07PiiUCBTwUAveh7hDI1Glh88upljd
	A9cE3FJNQ+PMCYyrTZy06H/fZHpS7etafJcvRe60=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEFLcO010494
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:15:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:15:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEFLVA027802
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:15:15 -0400
Message-ID: <1521468916-27703-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2 1/2] matrix-gui-multimedia-demos: add video-graphics demo
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
X-List-Received-Date: Mon, 19 Mar 2018 14:16:20 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
new file mode 100644
index 0000000..1e246db
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-multimedia-demos_2.0.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".tisdk0"
+
+SRCREV = "71c1049e7a73cc731766aa72fc7197a45003625d"
+
+PACKAGES_append = " matrix-multimedia-demo-video-graphics"
+
+RDEPENDS_matrix-multimedia-demo-video-graphics  = "${MULTIMEDIA_RDEPENDS}"
+
+FILES_matrix-multimedia-demo-video-graphics     = "${MATRIX_APP_DIR}/video_graphics/*"
+
-- 
1.9.1


