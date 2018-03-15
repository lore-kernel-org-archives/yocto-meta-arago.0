Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2E99C529D7
	for <meta-arago@arago-project.org>;
	Thu, 15 Mar 2018 21:25:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2FLOShd001994
	for <meta-arago@arago-project.org>; Thu, 15 Mar 2018 16:24:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521149068;
	bh=12WAJROVxXxEhLn4VcTdFOwGpm8dzN76LQvEB/Vnmqc=;
	h=From:To:Subject:Date;
	b=jszzoUsleVcsRMu5H+bjephO0YQmthm5EvuMkBfV3svo1Fo5rYrXo/0HrKnSdK5jY
	tSSw+7T03qWLvNdQ0/JGKZJW5NTDMMCmxWJvZyAO7rNKD1ZnQOLQeLjh+MaOMFXdl4
	I+xkytcp33Y3NPxRVRWEGL6Bo4P4h67ep3UnUb3w=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2FLOSta015330
	for <meta-arago@arago-project.org>; Thu, 15 Mar 2018 16:24:28 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 15 Mar 2018 16:24:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 15 Mar 2018 16:24:28 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2FLOSoK030619
	for <meta-arago@arago-project.org>; Thu, 15 Mar 2018 16:24:28 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Mar 2018 17:24:24 -0400
Message-ID: <1521149064-13850-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v3] video-graphics-test: bump SRCREV to pick up the latest version
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
X-List-Received-Date: Thu, 15 Mar 2018 21:25:25 -0000
Content-Type: text/plain

- include gc320
- QPA interface changes
- dual-screen support
- add more dependencies

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
index c19af16..30805a5 100644
--- a/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
+++ b/recipes-multimedia/video-graphics-test/video-graphics-test_1.0.bb
@@ -4,12 +4,12 @@ SECTION = "multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
-DEPENDS += "libdrm"
+DEPENDS += "libdrm ti-gc320-libs cmem qtdeclarative"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
-SRCREV = "3b3007680845d39784146396a2dd2a68aa1a2283"
+SRCREV = "bdfbc4179d8d176feec1df148728b1882fca7416"
 
 SRC_URI = "git://git.ti.com/sitara-linux/video-graphics-test.git;protocol=git;branch=${BRANCH} \
 "
-- 
1.9.1


