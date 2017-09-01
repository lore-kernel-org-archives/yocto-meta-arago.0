Return-Path: <manishalocal@uda0393239>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id CF84E52978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:51:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KpENY012492
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504299074;
	bh=23OarDOLJKXr7dODvLePaBc6UCE8veQ9qOD2IQK0+ds=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ETWp/sFYC0ieLIVTuf0LXlfPsuhKCPVGH6Wh31Irdbhd5E5XKG4WUFwAHk8tn5ca8
	4paL+BTTGsO4k2Ty3mjZt+E+oz81RCN5Y1AcLL3m+TfZ56FX6VMcVYyJSTM/7vl3ra
	DFTEOUQ/YdX75KjmkNC3OxS7utGABgZq82DdtQ+Y=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kp96E030742
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:51:09 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:51:09 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81Kp9Tq014144;
	Fri, 1 Sep 2017 15:51:09 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dnsuD-0006dT-Fy; Fri, 01 Sep 2017 15:51:09 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 1 Sep 2017 15:51:04 -0500
Message-ID: <20170901205107.25462-3-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170901205107.25462-1-manisha.agrawal@ti.com>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v1 3/6] matrix-gui-hmi-demos : add protection-relays-hmi demo
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
X-List-Received-Date: Fri, 01 Sep 2017 20:51:25 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb              | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index f751f8f8..f2ea2ed4 100755
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


