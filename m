Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E733252985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 13:21:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85DLkeV033419
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 08:21:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536153706;
	bh=JFjIBOaAhP8Nddmw7cz+xjqTjajyh95pJloxOfRgrws=;
	h=From:To:CC:Subject:Date;
	b=MpXWrbG6VXue6RiqRjJ4rHa4MmN7/8SdY5cumc2qVkXRkbm+x99qYdlcn4fQiuRrG
	VwW5gMqZlLP+OlN6W4hfN/cbNMFsmpbzdeKbLGkUn/OZclpgIQe13G5ncxea0BLdLv
	NissdNzMmEGkqRcL4V0VTMZEMljsd3lVebaBY0vI=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85DLku1025387
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 08:21:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 08:21:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 5 Sep 2018 08:21:46 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85DLkK0001451;
	Wed, 5 Sep 2018 08:21:46 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Sep 2018 09:21:44 -0400
Message-ID: <1536153704-31603-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] packagegroup-arago-tisdk-matrix: new tidl examples added to package group
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
X-List-Received-Date: Wed, 05 Sep 2018 13:21:55 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index ea282d2..907c989 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -161,6 +161,9 @@ MATRIX_APPS_append_dra7xx += " \
     matrix-tidl-demo-staticimg \
     matrix-tidl-demo-pnexamples \
     matrix-tidl-demo-livecam \
+    matrix-tidl-demo-livecam_lg2 \
+    matrix-tidl-demo-staticimg_lg2 \
+    matrix-tidl-demo-staticimg_dsponly \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
1.9.1


