Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id AB40052A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:32:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KWTZG011074
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297949;
	bh=YzfRG1CFHJrofs5VxJulodlHDQ0PsDWjaviCQttsgI4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zUKglmzJ7fcO60sAh4b3j1cRd7hSpO3ILHYETs/Bm3s5rnSV1kj3fa7di06T190rB
	xgSsEJVKzam5KpV7U8qiaBAcBnlxAhoxGcMAPBK4yiFAXvjb5p0FQCiVVuBx4kG41Z
	X5ZU5pfISvEXOVWObQU+CUlf3Qz+2ZJ2MJ/RjutM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWOAj018634
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:24 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:32:24 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWOe0024675;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsc4-0006Ve-AP; Fri, 01 Sep 2017 15:32:24 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:32:19 -0500
Message-ID: <20170901203222.24972-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901203222.24972-1-manisha.agrawal@ti.com>
References: <20170901203222.24972-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 4/7] packagegroup-arago-tisdk-matrix : add hmi demos
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
X-List-Received-Date: Fri, 01 Sep 2017 20:32:40 -0000
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


