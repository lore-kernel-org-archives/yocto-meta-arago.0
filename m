Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 38B81529B2
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 21:06:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DL6Evl074002
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 16:06:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531515974;
	bh=fuM61XHMIgY3d7/Mpl0qIYYUMT3kwUA6OyagBJLaNdE=;
	h=From:To:Subject:Date;
	b=cDjZHMVjzzWXlO8FySsQB7Kz4YRIUpBEW5qGCizsHPP5Xp7r+Dvriy+1awoawBpMU
	sughYsC7fecwX/i/BaSn2z+clVxOr/DU+o+exmGidMaZC/tGgbsxrOYBj574uxNYw3
	YwpDICT1gActjnV+AmacpzIrboe2P+VE6G9MSTe0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DL6E91027162
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 16:06:14 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 16:06:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 16:06:14 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DL6Eff005921
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 16:06:14 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jul 2018 17:06:11 -0400
Message-ID: <1531515971-12324-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] dual-camera-demo: bump SRCREV to pick up the workaround for LTS2018
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
X-List-Received-Date: Fri, 13 Jul 2018 21:06:21 -0000
Content-Type: text/plain

This patch picks up the dual-camera-demo workaround due to the DSS
changes at LTS2018.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 15a71af..50a2a38 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm cmem"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "master"
-SRCREV = "3546c21b17fa5f54b6ac6259b56e9a6f23b4e8b1"
+SRCREV = "b335bdf26b00f6294bcf4807e9022c2c435855b7"
 
 SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
-- 
1.9.1


