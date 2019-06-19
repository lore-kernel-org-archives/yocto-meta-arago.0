Return-Path: <anandb@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 99A225297F
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 15:35:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZHTJ033027
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560958517;
	bh=JAtjzw5btFJ9t+TgXcXdY0NoGQ4gYmzaZOkDAVcy03s=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TFp/CuUmOGeCs9hRHgrJGF6aIy2OcCq9h5W30CP+JKksX9VL/oRGqZJ0v13lczdGZ
	IrbEPRp46uYr22yayRCKU6f/MTCCRdLDiJrRYdhJRNrjpRN4PHYFnOYst/WbsBjGcW
	mQW/Xt7G/Vv6ltLOqaSdEaH14zdnqlla0us6mwPA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JFZHnP001218
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:17 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 10:35:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 10:35:16 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZAZK117712; 
	Wed, 19 Jun 2019 10:35:16 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 21:05:08 +0530
Message-ID: <1560958508-141402-5-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560958508-141402-1-git-send-email-anandb@ti.com>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[thud] PATCH] omapdrmtest: enable this only for AM43x and DRA7xx
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
X-List-Received-Date: Wed, 19 Jun 2019 15:35:59 -0000
Content-Type: text/plain

This application is dependent on omapdrm display driver which is supported only
on AM43x and DRA7xx SoCs.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
index cc54c5d..8020776 100644
--- a/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
+++ b/meta-arago-extras/recipes-graphics/omapdrmtest/omapdrmtest_1.0.0.bb
@@ -5,6 +5,8 @@ LIC_FILES_CHKSUM = "file://viddec3test.c;beginline=1;endline=16;md5=c391f44e40a2
 
 DEPENDS = "ffmpeg libdce libdrm libgbm ti-sgx-ddk-um wayland"
 
+COMPATIBLE_MACHINE = "omap-a15|ti43x"
+
 inherit autotools pkgconfig
 
 PR = "r28"
-- 
1.9.1


