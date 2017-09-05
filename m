Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 40AE6529CC
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9T3B014155
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631369;
	bh=oOp8b5GmV10/1tNbIT54a2tRhseHGJ2e76sWngij4eU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EpMIgAoz8NOynfk+fIvBzdESxs3K8fLw5/A3auxfNABopaFWHaSEbU8NP/H5u/h31
	cjSodCoYRta5X2fLFw2O/xZ3izanVGdT+258SR+UPD4JCUmGTs2in4SgbpOhqbg3zJ
	CzpFJf6N6HvdOeWy//p0hIhXLJkAf/CzUDl2lZBs=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9Tkd010544
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:29 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9Sti003582;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003Xs-Ln; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:23 -0500
Message-ID: <20170905170926.13566-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 5/8] packagegroup-arago-tisdk-matrix : add hmi demos
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
X-List-Received-Date: Tue, 05 Sep 2017 17:09:29 -0000
Content-Type: text/plain

Add evse-hmi and protection-relays-hmi demo

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-matrix.bbappend       | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
index b7c6816..3b4e7aa 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bbappend
@@ -7,15 +7,22 @@ MATRIX_SGX_DEMOS_remove_omap-a15 = " \
 MATRIX_COMMON_APPS_remove = " \
     matrix-gui-oprofile-demos \
 "
+MATRIX_APPS_append_ti33x = " \
+    matrix-hmi-demo-evse            \
+    matrix-hmi-demo-protection-relays \
+"
+
 
-MATRIX_APPS_append_omap-a15 += " \
+MATRIX_APPS_append_omap-a15 = " \
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


