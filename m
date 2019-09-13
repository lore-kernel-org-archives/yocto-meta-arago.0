Return-Path: <d-huang@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5065B520E2
	for <meta-arago@arago-project.org>;
	Fri, 13 Sep 2019 21:23:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DLML2Y070577
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 16:22:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568409741;
	bh=r2Y3q0NCbJUpTN9sK1zraygfm53yPff9wdq7ee//wow=;
	h=From:To:CC:Subject:Date;
	b=s4Wl0c8bS4BpbMroxTr2bcHAFDmhEEN1kDHJWkEYFM19tfoqO4NpZCkHLuuSGuYPP
	r+UmjwQf7whiRWUcdtN+wpNpDfgaFnNtYp6VNY0+nWl6JDei6RoYDbJAADf2xiJYO+
	CEuFUzI2mVNsCm22l5UO5DivrEdiscPAw9q/uD8k=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8DLMLte084182
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 13 Sep 2019 16:22:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 16:22:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 16:22:20 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DLMKxb078368;
	Fri, 13 Sep 2019 16:22:20 -0500
Received: from ulb0226152.dhcp.ti.com (ulb0226152.dhcp.ti.com [128.247.77.143])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DLMJZ12552; Fri, 13 Sep 2019 16:22:19 -0500 (CDT)
From: David Huang <d-huang@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Sep 2019 16:22:10 -0500
Message-ID: <1568409730-21805-1-git-send-email-d-huang@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH] packagegroup-arago-test: Add videnc-test-app for j7-evm
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
X-List-Received-Date: Fri, 13 Sep 2019 21:23:27 -0000
Content-Type: text/plain

The videnc-test-app provides the video encoder test app
(tienc_encode) for j7-evm.

Signed-off-by: David Huang <d-huang@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index f6535e1d2e33..48ef5c029e43 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -70,6 +70,7 @@ ARAGO_TI_TEST_append_am65xx = " \
 
 ARAGO_TI_TEST_append_j7-evm = " \
     viddec-test-app \
+    videnc-test-app \
     ufs-tool \
     "
 
-- 
1.9.1


