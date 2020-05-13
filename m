Return-Path: <yan-liu@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id DC4E052A05
	for <meta-arago@arago-project.org>;
	Wed, 13 May 2020 01:38:44 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04D1aJdS077010
	for <meta-arago@arago-project.org>; Tue, 12 May 2020 20:36:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589333779;
	bh=SOwpMun4MBa+EkioMW4KxoF9elr7f0KQJz4CfpdblPM=;
	h=From:To:CC:Subject:Date;
	b=kJ8pbbMeOxNeegc9CmjkPnqT0xJXmoZb7nt3ttSudBMEhezqmuRYVIB9hx8GVUbPT
	n/tvDaVfcdYbB5qQxl8P5TYE0eG6pMpKGTusneWq9Uy2Ova/xIA3rMAzoxHpruJuKz
	icRPXU3TaZVc/Kra5omadzTkqFD+KUb9RB2gcm48=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04D1aJG9011395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 12 May 2020 20:36:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 12 May 2020 20:36:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 12 May 2020 20:36:19 -0500
Received: from yan-ubuntu-1204.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04D1aG1V022341;
	Tue, 12 May 2020 20:36:17 -0500
From: <yan-liu@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 May 2020 21:35:59 -0400
Message-ID: <1589333759-16646-1-git-send-email-yan-liu@ti.com>
X-Mailer: git-send-email 1.7.9.5
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
X-List-Received-Date: Wed, 13 May 2020 01:38:45 -0000
Content-Type: text/plain

From: Yan Liu <yan-liu@ti.com>

Signed-off-by: Yan Liu <yan-liu@ti.com>
---
 .../recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb   |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
index 2488758..0808a79 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
@@ -10,10 +10,10 @@ PROVIDES += "ltp"
 DEPENDS += "alsa-lib"
 
 PE = "1"
-PR = "r1"
+PR = "r2"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "0e07446a921e84a0ad22805170938b73f1850cc3"
+SRCREV = "108cab23beb62a474b5a34fb2c6d9f6f5980b3ce"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
-- 
1.7.9.5


