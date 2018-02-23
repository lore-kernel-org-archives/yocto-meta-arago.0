Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 441F45298A
	for <meta-arago@arago-project.org>;
	Fri, 23 Feb 2018 16:06:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1NG5vJw004535
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 10:05:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519401957;
	bh=Gw3HioTVKQvMKD3BBf/yrgHzDaKlRzIokCBzbPUeqgU=;
	h=From:To:CC:Subject:Date;
	b=Ogio7wyLmjFZj6oDhIfhxKqy/HborgVPKXB/Njo2+dWk/aLX30Y0EgkuOZOUQCYTa
	+T0YHB1qYpb7arLk4K9pHaTvdCwQejGwOCVOt2EcbklsjOh6kuIKD6OrZ5sHc8agh8
	s0oez5z1jRdaiQwXwHcO5ma9to9Z6wpkvSTkMicw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NG5vda013240
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 10:05:57 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 10:05:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 10:05:56 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1NG5uuO017156;
	Fri, 23 Feb 2018 10:05:56 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 23 Feb 2018 11:05:55 -0500
Message-ID: <1519401955-2291-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [morty/rocko/master] [PATCH] dual-camera-demo: bump SRCREV
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
X-List-Received-Date: Fri, 23 Feb 2018 16:06:25 -0000
Content-Type: text/plain

* Support run-time selection of cmem vs. omapdrm memory

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 1d1d836..e7ff7da 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r17"
+PR = "r18"
 
 BRANCH = "master"
-SRCREV = "f52cb4354785e5f2fd63f7cf8ab02d99a2fbbea7"
+SRCREV = "3546c21b17fa5f54b6ac6259b56e9a6f23b4e8b1"
 
 SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
-- 
1.9.1


