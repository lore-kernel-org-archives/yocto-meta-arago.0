Return-Path: <h-gou@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 3C88C52A39
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 22:46:31 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCMiuAP033113
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576190696;
	bh=uFnjC3u3tbRP6Eb3E894yrzm2P0ZvwzGLaE2SD7+7GI=;
	h=From:To:CC:Subject:Date;
	b=wUjar4BfXqJvacj8Nw3fOmLXFI5vhfuquLsVLUmuril+osElkIT6OyWj/ugyvGXoA
	q0Y8OrhYk16YNT6CfWV3LROhZlLyDonqkXjVSqM5Lre3GdU3HyuOrT7JdSA19HWsKP
	QItfXhXm7oZJVU5lcfa/zUh5I9lehQuDunMEwwXI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCMitla011067
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 16:44:56 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 16:44:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 16:44:55 -0600
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCMitXC082626;
	Thu, 12 Dec 2019 16:44:55 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Dec 2019 17:40:13 -0500
Message-ID: <20191212224014.23027-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [master/thud/ti2019.05] [PATCH 1/2] tensorflow-lite: extends to native and nativesdk
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
X-List-Received-Date: Thu, 12 Dec 2019 22:46:31 -0000
Content-Type: text/plain

* This is required to build tidl-import-tool to support
  tensorflow-lite models (floating point only for now)

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb   | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
index 9d07b11b..b238c85e 100644
--- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
+++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
@@ -41,7 +41,7 @@ SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226d
 
 SRCREV = "590d6eef7e91a6a7392c8ffffb7b58f2e0c8bc6b"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
 
@@ -138,3 +138,5 @@ PACKAGES += "${PN}-examples"
 FILES_${PN}-examples = "${datadir}/${PN}-${PV}/examples"
 
 ALLOW_EMPTY_${PN} = "1"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


