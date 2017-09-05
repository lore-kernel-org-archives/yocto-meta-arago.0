Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 004F852AA2
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 17:09:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85H9XOH018945
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504631373;
	bh=wNyRWsmI+Dvj+OIt6GTzvgbd4IfWBjQbjsQtXaBGu8w=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yShXFy3z8fRon88+EEE94mz1s02JRgBnqmwFdX1dgQocfYAbV8jbtJQQTCiFbqffm
	QoPWMRX+Ew0BcvrT6f05qvgGaYuJO8ipasrQifppxXdT+04NMbte9wzFD4B3x8q5dk
	wuvzqW4WMA5ik5ueRioDt2vMTOVUnGK9mnrrsfos=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9SRw031149
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 12:09:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 12:09:28 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85H9Skp016180;
	Tue, 5 Sep 2017 12:09:28 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dpHLs-0003Xi-Dy; Tue, 05 Sep 2017 12:09:28 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 5 Sep 2017 12:09:21 -0500
Message-ID: <20170905170926.13566-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170905170926.13566-1-manisha.agrawal@ti.com>
References: <20170905170926.13566-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v4 3/8] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Tue, 05 Sep 2017 17:09:44 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-core/matrix/matrix-gui-submenus_2.0.bbappend | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-core/matrix/matrix-gui-submenus_2.0.bbappend

diff --git a/recipes-core/matrix/matrix-gui-submenus_2.0.bbappend b/recipes-core/matrix/matrix-gui-submenus_2.0.bbappend
new file mode 100644
index 0000000..169b225
--- /dev/null
+++ b/recipes-core/matrix/matrix-gui-submenus_2.0.bbappend
@@ -0,0 +1,13 @@
+PR_append = ".tisdk2"
+
+SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"
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
-- 
2.13.0


