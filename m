Return-Path: <a0227568local@uda0227568>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id ADC01529AD
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 00:30:30 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAR0UKeb123278
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 18:30:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543278620;
	bh=1tIkmk0uqqvKQm2gq5SsYMUoCMNrIM8eZrTRmHBbSmQ=;
	h=From:To:CC:Subject:Date;
	b=magA9YhRiQnhs5CGQKDW078nkhmVo2iHRdcmLxan++E+ycFeRRq9eHt8tp4FIaRvL
	1FDmsJ+Gtq0PkBhnXcO3OrYGcR6sKpUBUYpiCH7GGGVRqvxAhx6EDsZrOWtBaWebX7
	lftssfKk5KGRhuzRBKKU8/dW1J21t6YMTv8EXtkA=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAR0UJ4x040165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 18:30:19 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 26 Nov 2018 18:30:19 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 26 Nov 2018 18:30:19 -0600
Received: from uda0227568 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAR0UJmD004584;
	Mon, 26 Nov 2018 18:30:19 -0600
Received: from a0227568local by uda0227568 with local (Exim 4.82)
	(envelope-from <a0227568local@uda0227568>)
	id 1gRRGd-0000PX-Hs; Mon, 26 Nov 2018 18:30:19 -0600
From: Krunal Bhargav <a0227568@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Nov 2018 18:29:41 -0600
Message-ID: <1543278581-1543-1-git-send-email-a0227568@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 30 Nov 2018 22:27:58 +0000
Cc: k-bhargav@ti.com
Subject: [meta-processor-sdk][PATCH v2] video-graphics-test: Bump SRCREV to latest commit
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
X-List-Received-Date: Tue, 27 Nov 2018 00:30:31 -0000
Content-Type: text/plain

Updated the recipe to use the latest git commit. The video-graphics-test
application is enhanced to demonstrate GC320 usage for scaling, rotation
and composition/overlaying features. Previously, the application only
demonstrated the rotation feature.

Signed-off-by: Krunal Bhargav <a0227568@ti.com>
---
 recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
index cbc664f..cee5c8c 100644
--- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
+++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -9,7 +9,7 @@ DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
 PR = "r2"
 
 BRANCH = "master"
-SRCREV = "54ec5ff165413d41d32bb2672e127487ee37a82b"
+SRCREV = "2db3848cd1047e688ea0a94a987e35a292bcbda9"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
1.9.1


