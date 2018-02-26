Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 330CA529CE
	for <meta-arago@arago-project.org>;
	Mon, 26 Feb 2018 20:17:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1QKHM3w021219
	for <meta-arago@arago-project.org>; Mon, 26 Feb 2018 14:17:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519676242;
	bh=DNYitAHubDmGvp6ojls8gg8Og5UYIc0oRrRqntFycPI=;
	h=From:To:CC:Subject:Date;
	b=eZIB5YKt0PMyeSxsnxkV59HhIyH6/x+WrZZn0cuk0NgG0DepPWcfTpoaZgfjdXnHV
	KTEBtYKcevM6FiWIt3t0t5scwWZK7QFIlj+c5eqAAuAmwGNVY2gl1QOkCMNugrcIlu
	Ho0KbZCVGy8TCFfFMIph9/h/d3k1h7LSLv6/in78=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1QKHMWd018339
	for <meta-arago@arago-project.org>; Mon, 26 Feb 2018 14:17:22 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 26 Feb 2018 14:17:20 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 26 Feb 2018 14:17:21 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1QKHKiE018909;
	Mon, 26 Feb 2018 14:17:20 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 26 Feb 2018 15:17:19 -0500
Message-ID: <1519676239-31976-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [morty/rocko/master] [PATCH v2] dual-camera-demo: bump SRCREV and update dependency
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
X-List-Received-Date: Mon, 26 Feb 2018 20:17:54 -0000
Content-Type: text/plain

* Support run-time selection of cmem vs. omapdrm memory
* Add dependency on cmem

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
V2 change:
* Add dependency on cmem

 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 1d1d836..15a71af 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -4,13 +4,13 @@ SECTION = "multimedia"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 
-DEPENDS += "libdrm"
+DEPENDS += "libdrm cmem"
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


