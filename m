Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 8EEE252A23
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:25:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KOq3f023217
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543868692;
	bh=BstADyEoOFJOntBt3UWodFlsgvJNcLgR7LeZFBUSSwY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WUnD6D5e+y2ePMxTw4qJ/d4MhCBhctuTIRUGpS71peQeM5StCUoWr3i/UNlygOjYT
	KxvjIEWv8rhNKZKlIvC9TctK1+fYV4va363YjOIibu5lYY075Au4HSfiQesXCsJQdS
	Rt3qPxSc3o9jgNygiBoknE6hN5FmRmuR7fs+b14Q=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KOqJE026822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:24:51 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:24:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KOp1v014680;
	Mon, 3 Dec 2018 14:24:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTulv-0007Ab-OA; Mon, 03 Dec 2018 14:24:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:24:39 -0600
Message-ID: <20181203202440.27508-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181203202440.27508-1-manisha.agrawal@ti.com>
References: <20181203202440.27508-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 4/5] matrix-gui-hmi-demos : add mmwavegesture-hmi demo
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
X-List-Received-Date: Mon, 03 Dec 2018 20:25:05 -0000
Content-Type: text/plain

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb          | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index 933a002e..41e14bd1 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -15,7 +15,8 @@ HMI_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-hmi"
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 PACKAGES = "matrix-hmi-demo-evse \
-	    matrix-hmi-demo-protection-relays\
+	    matrix-hmi-demo-protection-relays \
+	    matrix-hmi-demo-mmwavegesture \
 "
 
 RDEPENDS_matrix-hmi-demo-evse = " \
@@ -30,8 +31,17 @@ RDEPENDS_matrix-hmi-demo-protection-relays = " \
     protection-relays-hmi \
 "
 
+RDEPENDS_matrix-hmi-demo-mmwavegesture = " \
+    bash \
+    ${HMI_RDEPENDS} \
+    mmwavegesture-hmi \
+"
+
 FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi_evse/*"
 FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
 
 FILES_matrix-hmi-demo-protection-relays   = "${MATRIX_APP_DIR}/hmi_protection_relays/*"
 FILES_matrix-hmi-demo-protection-relays  += "${bindir}/runHmiProtectionRelays.sh"
+
+FILES_matrix-hmi-demo-mmwavegesture    = "${MATRIX_APP_DIR}/hmi_mmwavgesture/*"
+FILES_matrix-hmi-demo-mmwavegesture  += "${bindir}/runHmiMmWave.sh"
-- 
2.13.0


