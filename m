Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DF29F52987
	for <meta-arago@arago-project.org>;
	Wed, 18 Jul 2018 20:09:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6IK939M056772
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 15:09:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531944543;
	bh=wZXcVpCt58fkpPx0qtxpXIXUaSmMR42j0KPHAMRtqF8=;
	h=From:To:Subject:Date;
	b=GPMeaMeuaHwkAOs3VIq+JwQGwCI1fsnjW4HG6O0NSSQF1/18m0bJVdjYuMNocDHXB
	ITq+pWpgivtdPGs6m5FZLLbnNrUwmUKA0sBnBjSqVzz4ytVRobXOq6sUL4nBH52qu6
	hXgtkeVYD50rYgD3mUZz/MdipO2CHEN5QW+9hrFU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IK927F010387
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 15:09:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 18 Jul 2018 15:09:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 18 Jul 2018 15:09:02 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6IK92et030877
	for <meta-arago@arago-project.org>; Wed, 18 Jul 2018 15:09:02 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Jul 2018 16:08:58 -0400
Message-ID: <1531944538-20615-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] img-pvr-sdk: bump SRCREV to pick up latest fixes
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
X-List-Received-Date: Wed, 18 Jul 2018 20:09:10 -0000
Content-Type: text/plain

- Use libGLESv2.so.2 instead of libGLESv2.so.1
- Updates scripts for PVRTrace for latest SDK


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 131239c..15cf41f 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "d19016b30d99973135e03c48978a0b88983b4b0d"
+SRCREV = "f09e59b2467cb0a5b88b6329fe35527cf65ed6e9"
 
-PR = "r10"
+PR = "r11"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x"
 
-- 
1.9.1


