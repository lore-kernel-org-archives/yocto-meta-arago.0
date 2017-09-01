Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9064852A40
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:28:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KScSH010680
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297718;
	bh=YzfRG1CFHJrofs5VxJulodlHDQ0PsDWjaviCQttsgI4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tfMzPx9AiC+19s8m5ganD5oKCwMMZjsh59dxFx/1+/Ae2XVokGw9zNvtHKnO512Tb
	tibqXUkTwFmNF034MW+wuoZYQ6egl2QWpA9qD8byHqGkunDTcubqHHV1Z8UtrUtXvN
	KfkBiapA27jI2CAAHipHphnhPRytNFRxbungSbq8=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXDQ028838
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:28:33 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:28:33 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KSXgI010210;
	Fri, 1 Sep 2017 15:28:33 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsYL-0006U6-5f; Fri, 01 Sep 2017 15:28:33 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:28:27 -0500
Message-ID: <20170901202830.24876-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901202830.24876-1-manisha.agrawal@ti.com>
References: <20170901202830.24876-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1 4/7] packagegroup-arago-tisdk-matrix : add hmi demos
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
X-List-Received-Date: Fri, 01 Sep 2017 20:28:49 -0000
Content-Type: text/plain

Add evse-hmi and protection-relays-hmi demo

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend         | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index b7c6816..abef996 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -7,15 +7,22 @@ MATRIX_SGX_DEMOS_remove_omap-a15 = " \
 MATRIX_COMMON_APPS_remove = " \
     matrix-gui-oprofile-demos \
 "
+MATRIX_APPS_append_ti33x += " \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-protection-relays \
+"
+
 
 MATRIX_APPS_append_omap-a15 += " \
     matrix-gui-apps-dual-camera \
     matrix-gui-apps-image-gallery \
     matrix-multimedia-demo-audiocapture \
+    matrix-hmi-demo-evse            \
 "
 
 MATRIX_APPS_append_ti43x = " \
     matrix-multimedia-demo-audiocapture \
+    matrix-hmi-demo-evse            \
 "
 
 MATRIX_TOUCH_APPS_keystone = ""
-- 
2.13.0


