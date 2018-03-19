Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 108C152970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:16:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEFLI7010193
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521468921;
	bh=MQGhJ3MvEIVZn78khvDAKBmhfXQRzGDnpqbLbNPEJPM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=RgAEl/X4qfY+oOoRKVbv+eT0+xrTtylZRg6WUpqkyggXHD69DHLqze2SydeWVdV08
	CRW2R0L/uCsOhQ3egL3RkFSh5eXfqAikTYai88fJP/gr7qHQ5usN79L8TzFxfdtN5a
	XH6o3LIJLt+K01XtpPI+hV7ohODF0r+uekYdZJ1w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEFLL6020690
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:15:21 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:15:21 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEFLVB027802
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:15:21 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:15:16 -0400
Message-ID: <1521468916-27703-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521468916-27703-1-git-send-email-e-ruei1@ti.com>
References: <1521468916-27703-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2 2/2] packagegroup-arago-tisdk-matrix: add video-graphics test
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


