Return-Path: <d-senicic1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1AF8152A15
	for <meta-arago@arago-project.org>;
	Tue, 11 Sep 2018 13:16:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8BDGGlx020043
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 08:16:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536671776;
	bh=R8pcPtDqrqRxQshH0jRZNK5FjuBma5f0LU7423JHgyQ=;
	h=From:To:CC:Subject:Date;
	b=E+P8qGGQAGNXfc7+dPFlIxOLo3NwYv5gnQIua359d8cxa60GexLMh4OpVsmQfcKAY
	UCYWE8UURkluZwBuB+MfgZ0iHG565xYqYDsmq9ImKWeRwPHji0KFMHJGJtiSARch5w
	syceICZwfR9CqsvRzPmYaAbmfviTBY2dlIHYWDig=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BDGGUW017274
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 08:16:16 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 11 Sep 2018 08:16:17 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 11 Sep 2018 08:16:16 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BDGGu8031140;
	Tue, 11 Sep 2018 08:16:16 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Sep 2018 09:16:13 -0400
Message-ID: <1536671773-7234-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [rocko][PATCH v2] packagegroup-arago-tisdk-matrix: new tidl examples added to package group
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
X-List-Received-Date: Tue, 11 Sep 2018 13:16:25 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index ea282d2..919bd41 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -161,6 +161,9 @@ MATRIX_APPS_append_dra7xx += " \
     matrix-tidl-demo-staticimg \
     matrix-tidl-demo-pnexamples \
     matrix-tidl-demo-livecam \
+    matrix-tidl-demo-livecam-lg2 \
+    matrix-tidl-demo-staticimg-lg2 \
+    matrix-tidl-demo-staticimg-dsponly \
 "
 
 MATRIX_APPS_append_keystone = " \
-- 
1.9.1


