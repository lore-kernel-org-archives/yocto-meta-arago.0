Return-Path: <yan-liu@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 3A659529B0
	for <meta-arago@arago-project.org>;
	Wed,  3 Jun 2020 16:15:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 053GCwnx038847
	for <meta-arago@arago-project.org>; Wed, 3 Jun 2020 11:12:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1591200778;
	bh=nbWyfKNtdWdkeCGICgjNe3IgcmJ2E2Bpn8Mzyb2FfE4=;
	h=From:To:CC:Subject:Date;
	b=wgFxbijDSKemje9flpz+6P1poP1LqAS9bPGBAgqplVsCP2elWA/UoetJtej+1u0+g
	4yjF+SXZzDK/50KSOF/jud1yO9ONC7rTeA7DW+K99vAdxUuM8SYkJTr4gLcLn1bKAM
	GJgtKF2xUCOMwR6+3pTdPspqxNp3lm3lcm5X9GlY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 053GCwpo050835
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Jun 2020 11:12:58 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 3 Jun 2020 11:12:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 3 Jun 2020 11:12:57 -0500
Received: from yan--Ubuntu-16.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053GCvOp094446;
	Wed, 3 Jun 2020 11:12:57 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Jun 2020 12:12:55 -0400
Message-ID: <1591200775-46433-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1] ltp-ddt: Update to latest
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
X-List-Received-Date: Wed, 03 Jun 2020 16:15:29 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index b0ee737..ca8e82d 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -10,10 +10,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "f14aa69318414140e4165b8f87469c106a436b0a"
+SRCREV = "9d8d90a7cba25bb1e61b41075ec4eab9bfc19d3d"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
2.7.4


