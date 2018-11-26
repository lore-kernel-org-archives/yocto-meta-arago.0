Return-Path: <a0227568local@uda0227568>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8F24E529A8
	for <meta-arago@arago-project.org>;
	Mon, 26 Nov 2018 17:19:09 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAQHIwJp071047
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 11:18:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543252739;
	bh=v604yCar69nFV6/ObNzVLcyQ8Y24B+P7QUkc2l3lkI4=;
	h=From:To:CC:Subject:Date;
	b=GVC7zDkwl+ikGX0tNs4uOoqfx3U34k4YTub7Bxk0zhoPVFqJMyB8PvD53CtEsmvEZ
	7t/bfHUZhbCWawjR4G0bgjyg/x+/OikyhB4bl4dw2xkcpiJtIZEej8Nk+M8yPUbvb3
	2tH5pPZQ3v8uTf/9X/B8KNOt8OdbX1f7vdLpSuwc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAQHIweH097319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Nov 2018 11:18:58 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 26 Nov 2018 11:18:58 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 26 Nov 2018 11:18:58 -0600
Received: from uda0227568 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAQHIw2k020320;
	Mon, 26 Nov 2018 11:18:58 -0600
Received: from a0227568local by uda0227568 with local (Exim 4.82)
	(envelope-from <a0227568local@uda0227568>)
	id 1gRKXC-0007Kz-Gb; Mon, 26 Nov 2018 11:18:58 -0600
From: Krunal Bhargav <a0227568@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Nov 2018 11:17:59 -0600
Message-ID: <1543252679-28171-1-git-send-email-a0227568@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Fri, 30 Nov 2018 22:27:58 +0000
Cc: k-bhargav@ti.com
Subject: [meta-processor-sdk][PATCH] Commit ID update for the video-graphics-test
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
X-List-Received-Date: Mon, 26 Nov 2018 17:19:09 -0000
Content-Type: text/plain

video-graphics-test application is enhanced to demonstrate GC320 usage
for scaling, rotation and composition/overlaying feature. Updated the
recipe to pick the new commit id.

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


