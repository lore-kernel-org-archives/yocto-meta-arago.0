Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 00E3252A49
	for <meta-arago@arago-project.org>;
	Thu, 16 Aug 2018 21:21:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7GLLhcv092276
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 16:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534454503;
	bh=hAwq/EqAlWoWav2hIdSf/V5xt1Th53B+aLVeg6Hrgu0=;
	h=From:To:Subject:Date;
	b=Xa0SA6JXhJ8dFlhrO69kZXhHAfyXAVlB0wQtc+LPsxWY6njBMICHrzodoUcvHHs58
	EJKIjmQuDCv5xAMxL7HGaQybB86oELB6835RP6eqlwdh+eXRZsRFScY1V/Bts8wfQU
	1bvBxUyqs+t0v766o5+6QjwiVdMCXQf6q4uBX8bk=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GLLhm6004390
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 16:21:43 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 16 Aug 2018 16:21:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 16 Aug 2018 16:21:43 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7GLLhCH009525
	for <meta-arago@arago-project.org>; Thu, 16 Aug 2018 16:21:43 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Aug 2018 17:21:36 -0400
Message-ID: <1534454496-38903-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: (No subject)
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
X-List-Received-Date: Thu, 16 Aug 2018 21:21:53 -0000
Content-Type: text/plain

From 65652cf6c1d896796e773b90642a867ee2c6ec77 Mon Sep 17 00:00:00 2001
From: Eric Ruei <e-ruei1@ti.com>
Date: Thu, 16 Aug 2018 17:20:05 -0400
Subject: [PATCH] img-pvr-sdk: bump SRCREV to pick up the valid arm64 PVR Tools

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index 9c563d2..2fbd386 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "3e5c2fa3458a8cae4b6b8d62391fc32b708a2ed4"
+SRCREV = "7af5846a0989a1475548ca05f6984c817fb76adc"
 
-PR = "r13"
+PR = "r14"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
-- 
1.9.1


