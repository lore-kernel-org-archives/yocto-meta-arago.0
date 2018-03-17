Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 44ACF52994
	for <meta-arago@arago-project.org>;
	Sat, 17 Mar 2018 16:39:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2HGce7N009238
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521304720;
	bh=MQGhJ3MvEIVZn78khvDAKBmhfXQRzGDnpqbLbNPEJPM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=k5qC+UsLH0qDndEku+gh5O5AJj5YnYc6opI6rvMIaALe+0dMLNq8G/NLMwUg4gUve
	AsQ0VzCS81FQHPIkATg9XZIgKxRuU7rynDCeQwGWJvTTW+yJiHXJYv40Hwr2UibXg2
	g0XEihvy4OrPXAG59yZb3edTxXtm3Gqz+/CkPEKE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2HGcedJ001109
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:40 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Sat, 17 Mar 2018 11:38:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Sat, 17 Mar 2018 11:38:40 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2HGcd4H004442
	for <meta-arago@arago-project.org>; Sat, 17 Mar 2018 11:38:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 17 Mar 2018 12:38:33 -0400
Message-ID: <1521304713-8408-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521304713-8408-1-git-send-email-e-ruei1@ti.com>
References: <1521304713-8408-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 2/2] packagegroup-arago-tisdk-matrix: add video-graphics test
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
 recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index 67241fa..cf86727 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -11,6 +11,7 @@ MATRIX_COMMON_APPS_remove = " \
 MATRIX_APPS_append_omap-a15 = " \
     matrix-gui-apps-dual-camera \
     matrix-gui-apps-image-gallery \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'sgx', 'matrix-multimedia-demo-video-graphics', '', d)} \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
-- 
1.9.1


