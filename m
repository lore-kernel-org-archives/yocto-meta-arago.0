Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7375D529BC
	for <meta-arago@arago-project.org>;
	Mon,  4 Jun 2018 20:11:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w54KBJdn024691
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 15:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1528143079;
	bh=6j36l63fZIvmqN/PlEgcgE8eI9eqvd13UcLH/ovjzpE=;
	h=From:To:Subject:Date;
	b=cq1iguJ/KGtuMEIiTco+Xql5J3A0NxbbJ/o4TVsmEi9HI1559O5wPbbBkJM+PrQgY
	EL+d/L+T4YchpkkZE9UIQUv2CSYVrGpLH+y85SZ8mRtBvmEjHIsm8vS3hAftLox/cm
	h8j02ZCljT7GYE2RHcPsVfGy6XMm8FQFJyEEvmS4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54KBJAw030132
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 15:11:19 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 4 Jun 2018 15:11:18 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 4 Jun 2018 15:11:18 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w54KBIvU018812
	for <meta-arago@arago-project.org>; Mon, 4 Jun 2018 15:11:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 4 Jun 2018 16:10:48 -0400
Message-ID: <1528143049-57521-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH 1/2] video-graphics-test: bump SRCREV to pick up the latest makefile change
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
X-List-Received-Date: Mon, 04 Jun 2018 20:11:24 -0000
Content-Type: text/plain

video-graphics-test.pro: replace platformsupport-private with gui-private

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
index 30805a5..cbc664f 100644
--- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
+++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
 DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "master"
-SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
+SRCREV = "54ec5ff165413d41d32bb2672e127487ee37a82b"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
1.9.1


