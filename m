Return-Path: <subhajit_paul@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9C967520E0
	for <meta-arago@arago-project.org>;
	Tue,  2 Jul 2019 17:41:20 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62HeZqV004271
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562089235;
	bh=ATQZzEaGprqWP3YpP0tI8E29IHWG1i/9rvYC7YWpbB4=;
	h=From:To:CC:Subject:Date;
	b=n7UcUpzxLrVlCZxXFPj8xRpzSZSvGG+JqQZVPNCg1zIbZVtgdgdCKSrqFUh4qIDgz
	M9hLqXwrXq2AzmpFlb8u0Z+ifJMgN77yV2YZ6/0NlVxmsEzx7bOfmuiACs3FUGU4Ig
	N2AOcoE5HLLomW5zcSiT5GSVQrZTeomQmtg5RlB8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62HeZWj037511
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 2 Jul 2019 12:40:35 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 2 Jul 2019 12:40:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 2 Jul 2019 12:40:34 -0500
Received: from uda0132170-dell.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62HeWxu037118;
	Tue, 2 Jul 2019 12:40:33 -0500
From: Subhajit Paul <subhajit_paul@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Jul 2019 23:10:11 +0530
Message-ID: <1562089211-27689-1-git-send-email-subhajit_paul@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup-arago-test: add display-sharing firmware
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
X-List-Received-Date: Tue, 02 Jul 2019 17:41:21 -0000
Content-Type: text/plain

Signed-off-by: Subhajit Paul <subhajit_paul@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 67de045..0b4dcfa 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -68,6 +68,7 @@ ARAGO_TI_TEST_append_am65xx = " \
 
 ARAGO_TI_TEST_append_j7-evm = " \
     viddec-test-app \
+    ti-display-sharing-firmware \
     "
 
 ARAGO_TI_TEST_append_keystone = " \
-- 
2.7.4


