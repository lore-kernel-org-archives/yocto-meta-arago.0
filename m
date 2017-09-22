Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 99C6352A74
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 19:34:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MJYLGd001972
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506108861;
	bh=gXNtTUW8w8gP3+OONsHwc2O3pLlqY+1DrRDXERgNvVo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=BFjP49Q8BUgcA7U7GeUn7tYUJW7ZRwKoc2aLgBOZCuMlgR+nhdQQP+fjLJFX5AkQM
	wqLOtaituqSmretFYvSoTj8MAPynP0XUQlJvYCz/6vJRtKJEG2znWJVRWQbtduqSW9
	hYV30ph4AKjH6XZVMDYX/5T7KPmw2BXHBMc0APtI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLKW023495
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 14:34:21 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYL06009865;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dvTiP-0000QY-7e; Fri, 22 Sep 2017 14:34:21 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 14:34:14 -0500
Message-ID: <20170922193417.1595-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170922193417.1595-1-manisha.agrawal@ti.com>
References: <20170922193417.1595-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 3/6] matrix-gui-hmi-demos : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 22 Sep 2017 19:34:22 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb              | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index f751f8f8..f2ea2ed4 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -15,6 +15,7 @@ HMI_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-hmi"
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 PACKAGES = "matrix-hmi-demo-evse \
+	    matrix-hmi-demo-protection-relays\
 "
 
 RDEPENDS_matrix-hmi-demo-evse = " \
@@ -22,5 +23,13 @@ RDEPENDS_matrix-hmi-demo-evse = " \
     evse-hmi \
 "
 
+RDEPENDS_matrix-hmi-demo-protection-relays = " \
+    ${HMI_RDEPENDS} \
+    protection-relays-hmi \
+"
+
 FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi_evse/*"
 FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
+
+FILES_matrix-hmi-demo-protection-relays   = "${MATRIX_APP_DIR}/hmi_protection_relays/*"
+FILES_matrix-hmi-demo-protection-relays  += "${bindir}/runHmiProtectionRelays.sh"
-- 
2.13.0


