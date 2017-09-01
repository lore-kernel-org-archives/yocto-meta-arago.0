Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 76FCA52A05
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:32:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KWO5W014006
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504297944;
	bh=VU441oajZSTiYKtT/JjhbDAoVLPbuF0v7Lb+D4VDKAc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TwugTBeeqkvmWOpsvUBPcZ22l5CQuqavbwQpDi83ts01diX3GcC4qe8QYBHDrKFFv
	wcKwEVKa5+m0CvE5J/zAbHuwyTx5w0pXKTFOuqclm1ClGS7KZLy3bCyz8m1/1buplk
	VzUCcD/CSpuCfE3mG8edJArSRpbEKNA+vxlJuq5E=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWO2T018628
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:32:24 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:32:24 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KWOYP028269;
	Fri, 1 Sep 2017 15:32:24 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsc4-0006VU-2H; Fri, 01 Sep 2017 15:32:24 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:32:17 -0500
Message-ID: <20170901203222.24972-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901203222.24972-1-manisha.agrawal@ti.com>
References: <20170901203222.24972-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 2/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Fri, 01 Sep 2017 20:32:25 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/matrix/matrix-gui-submenus.bbappend | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend

diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend b/recipes-core/matrix/matrix-gui-submenus.bbappend
new file mode 100644
index 0000000..e30848a
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
@@ -0,0 +1,14 @@
+PR_append = ".tisdk2"
+
+SUBMENUS_append = " \
+    hmi_submenu \
+"
+
+PACKAGES_append = " \
+    ${PN}-hmi \
+"
+
+FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"   
+
+
+
-- 
2.13.0


