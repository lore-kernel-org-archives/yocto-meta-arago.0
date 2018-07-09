Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 03373529BC
	for <meta-arago@arago-project.org>;
	Mon,  9 Jul 2018 19:11:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w69JAsYN106278
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 14:10:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531163454;
	bh=IXv90AM9Cgip0KbFyvTFt//+zku2T3Jg5oG8TQwyJ5U=;
	h=From:To:CC:Subject:Date;
	b=NcAWnVbzoYZbZpumRp0GaL/ILQ8L9pWa3FIq0SKe9sFzcoVXJrKewp2huH1rAhJOt
	wIrnmwtHipOhFW+SEveRSjjr1ovnkhIKpyqby605/mGGHi5gsfhBXuyoA5ap4g9Y2Z
	bUHPIIc+QJNhYnRlazto5WP4CLYbAKBzkP/BQerY=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69JAsc6006457
	for <meta-arago@arago-project.org>; Mon, 9 Jul 2018 14:10:54 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 9 Jul 2018 14:10:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 9 Jul 2018 14:10:53 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w69JArx8005908;
	Mon, 9 Jul 2018 14:10:53 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 9 Jul 2018 15:10:51 -0400
Message-ID: <1531163451-4172-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [ti2018.01/rocko/master] [PATCH] matrix-gui-aps-git: bump SRCREV for fixes and additions
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
X-List-Received-Date: Mon, 09 Jul 2018 19:11:01 -0000
Content-Type: text/plain

* arm_multimedia_*: script fix for am3/am4 HS EVMs and am438x EPOS EVM
* video_graphics_demo: add as a new test app

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ff90a66..210be27 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "2ef38ec90f2523f138fb54f11f9a895145d88522"
+SRCREV = "65fee8957447ae4e403ad324acf735d811b2c412"
 BRANCH = "master"
-INC_PR = "r51"
+INC_PR = "r52"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


