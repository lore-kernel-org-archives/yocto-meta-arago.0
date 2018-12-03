Return-Path: <manishalocal@uda0393239>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6BB47529EB
	for <meta-arago@arago-project.org>;
	Mon,  3 Dec 2018 20:25:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wB3KOq7j023215
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543868692;
	bh=xCHEoFiuvWYy11E+EmymVof68hFfvwT/51Kln0RMWT4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ge+dvDCK/lhMSgVQZwSKd6WVybBX/LgYbVJjcqzFwSFbuImOmDBohJDqDUE5EoGSi
	Lg5HOQ+DRVgC4jEC9FE3iRqg53dautnH47XEqeew0A6n3WLVWG+M0KqQU9H7G3OclF
	jiEAg9HiNN14gEbDYQmDqUFa3Aw+w/lc5nY4F8XA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wB3KOqdN098051
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 3 Dec 2018 14:24:52 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 3 Dec 2018 14:24:52 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 3 Dec 2018 14:24:52 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wB3KOqkP012844;
	Mon, 3 Dec 2018 14:24:52 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gTulv-0007Ag-SD; Mon, 03 Dec 2018 14:24:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 3 Dec 2018 14:24:40 -0600
Message-ID: <20181203202440.27508-5-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181203202440.27508-1-manisha.agrawal@ti.com>
References: <20181203202440.27508-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v1 5/5] packagegroup-arago-tisdk-matrix : add mmwavegesture-hmi demo
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
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb     | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index d3ab6ec7..b7656daa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -104,6 +104,7 @@ MATRIX_APPS_append_ti33x = "        \
                                     \
     matrix-hmi-demo-evse            \
     matrix-hmi-demo-protection-relays \
+    matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
@@ -124,6 +125,7 @@ MATRIX_APPS_append_ti43x = "        \
     matrix-gui-apps-image-gallery   \
                                     \
     matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
@@ -133,6 +135,7 @@ MATRIX_APPS_append_omap-a15 = "     \
     matrix-multimedia-demo-audiocapture \
     matrix-multimedia-demo-h265dec  \
     matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
                                     \
     ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264dec','matrix-multimedia-demo-h264dec',d)} \
     ${@bb.utils.contains('MACHINE_FEATURES','mmip','matrix-multimedia-demo-ivahdh264enc','',d)} \
@@ -155,6 +158,7 @@ MATRIX_APPS_append_k3 = "           \
     matrix-multimedia-demo-mpeg4dec \
                                     \
     matrix-hmi-demo-evse            \
+    matrix-hmi-demo-mmwavegesture   \
                                     \
     ${MATRIX_OPENCV_ARM_ONLY_APPS}  \
 "
-- 
2.13.0


