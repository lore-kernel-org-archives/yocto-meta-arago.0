Return-Path: <afd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 73467529FF
	for <meta-arago@arago-project.org>;
	Thu, 21 May 2020 00:46:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04L0hi84048132
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 19:43:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590021824;
	bh=5/cccA/feLTpwtd5CdOzbmMSBRtiewtD3+PEVvAYREc=;
	h=From:To:CC:Subject:Date;
	b=iWjmwu7+hPtqxwyS+20rFgquES2rzOJlvpvL2VEWHH6UfRLwjBcgiRTVYz055NCut
	SmD5wTXf3ZRAJuK0JDRZBGuzAOMeRV6sizjYO1qzJgi7YavEjV13Xt617oY/tNvIvl
	7hIihbt/6RdYOLhAHLTFpQJ0SVSRc/JrxdPk2pDQ=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04L0higd099495
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 20 May 2020 19:43:44 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 20 May 2020 19:43:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 20 May 2020 19:43:44 -0500
Received: from ula0226330.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04L0hiij065449;
	Wed, 20 May 2020 19:43:44 -0500
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Date: Wed, 20 May 2020 20:43:44 -0400
Message-ID: <20200521004344.2593-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [dunfell/master][PATCH] ti-test: add dma-heap-tests to default tests
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
X-List-Received-Date: Thu, 21 May 2020 00:46:12 -0000
Content-Type: text/plain

DMA-Heaps are available on all platforms, this tool allows for automated
testing of the framework and the exposed heaps.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index c3517748..1a0121dd 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -15,6 +15,7 @@ ARAGO_TEST = "\
     bc \
     memtester \
     libdrm-tests \
+    dma-heap-tests \
     powertop \
     stress \
     stress-ng \
-- 
2.17.1


