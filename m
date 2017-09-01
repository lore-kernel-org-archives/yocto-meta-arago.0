Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id CA22052A7A
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 21:17:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81LHjTx030626
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504300665;
	bh=YzfRG1CFHJrofs5VxJulodlHDQ0PsDWjaviCQttsgI4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SSxKAAcsBxmXCbh9eUSiOhd8qeVMeIxUviIzpqWaizD04HKEXHfFiRXg4Vz4NMJJ+
	VKt4WXlGNEjkUvBpVG/lHwyumJuG6pWCB++wucL5rv+7SPjGmpLCwyEgopEeqdOGO3
	ijCVikoQwSrSwwWUP+e2vLkZrt1ulAlgvlfqCpWg=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHj56021210
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 16:17:45 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 16:17:45 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81LHjYj004665;
	Fri, 1 Sep 2017 16:17:45 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dntJx-0006ta-Ae; Fri, 01 Sep 2017 16:17:45 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 16:17:39 -0500
Message-ID: <20170901211741.26451-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901211741.26451-1-manisha.agrawal@ti.com>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v3 5/7] packagegroup-arago-tisdk-matrix : add hmi demos
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
X-List-Received-Date: Fri, 01 Sep 2017 21:17:46 -0000
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


