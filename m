Return-Path: <a0866189@uda0866189>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 704BA529A4
	for <meta-arago@arago-project.org>;
	Thu, 20 Jun 2019 19:52:16 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5KJpY55043123
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561060294;
	bh=8BWjCVX8AL/rd/SwH4UGxfXvwTaa/5HHLMkXbOYS3UM=;
	h=From:To:CC:Subject:Date;
	b=H5zz/BdRvxGqtV04aeiO+v8cV6A3kMjzm5V2rZQV1C4vUI3XNO0oBfr3kfvpY6rRi
	K9XmvdHXmiCF/AsvBvrwf2VA8dAluQW6cel1GRhMzC8OhpwQDtXkQTGda16kgK0+h1
	EbLYQzaQ9AwHLAlDPrWqYcWfItWplt/Ue5a1Xdk0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5KJpYah012561
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 20 Jun 2019 14:51:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 20 Jun 2019 14:51:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 20 Jun 2019 14:51:34 -0500
Received: from uda0866189 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5KJpYsd083493;
	Thu, 20 Jun 2019 14:51:34 -0500
Received: from a0866189 by uda0866189 with local (Exim 4.82)
	(envelope-from <a0866189@uda0866189>)
	id 1he35q-0004p5-2X; Thu, 20 Jun 2019 14:51:34 -0500
From: <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Jun 2019 14:51:14 -0500
Message-ID: <1561060275-18482-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-huang@ti.com, sunitan@ti.com
Subject: [thud][PATCH 1/2] packagegroup-arago-test: Add viddec-test-app for j7-evm
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
X-List-Received-Date: Thu, 20 Jun 2019 19:52:16 -0000
Content-Type: text/plain

From: Angela Stegmaier <angelabaker@ti.com>

The viddec-test-app provides the video decoder test app
(tidec_decode) for j7-evm.

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-test.bb             | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
index 9c95670..67de045 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-test.bb
@@ -66,6 +66,10 @@ ARAGO_TI_TEST_append_am65xx = " \
     ti-ipc-test \
     "
 
+ARAGO_TI_TEST_append_j7-evm = " \
+    viddec-test-app \
+    "
+
 ARAGO_TI_TEST_append_keystone = " \
     ti-ipc-test \
     "
-- 
1.9.1


