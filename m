Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 24990529AE
	for <meta-arago@arago-project.org>;
	Tue, 24 Jul 2018 20:55:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6OKtcIm029271
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 15:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532465738;
	bh=UFRreQoBZV7beHy3ReBkcm2bUz0B/+OsfV/xUPQNgfw=;
	h=From:To:CC:Subject:Date;
	b=J2lCJZySBuBM2wehPcGEyHqsnMyqEmzx6yRZv/Z6W/w0AJDFYMYMYWF/3WxidenIU
	cA4mTytDMABiGpR7zf0/n6jRRgY3ojDAl/5PzCI5wfcskZok5g9KOjC07oymDrTtf5
	taw/lkNHnW6ib5NC9ORkqnR++CRY2wm4QwsDj8EI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OKtcNV024383
	for <meta-arago@arago-project.org>; Tue, 24 Jul 2018 15:55:38 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 24 Jul 2018 15:55:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 24 Jul 2018 15:55:37 -0500
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6OKtbAu025629;
	Tue, 24 Jul 2018 15:55:37 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 24 Jul 2018 16:55:35 -0400
Message-ID: <1532465735-3184-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
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
X-List-Received-Date: Tue, 24 Jul 2018 20:55:45 -0000
Content-Type: text/plain

Subject: [meta-arago][rocko/master][PATCH] tidl-api: Update test video clip

* Use real-life video clip and list of classes

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
index d2b570d..f1a34eb 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-api.inc
@@ -8,4 +8,4 @@ GIT_PROTOCOL = "git"
 BRANCH = "master"
 
 SRC_URI = "${GIT_URI};protocol=${GIT_PROTOCOL};branch=${BRANCH}"
-SRCREV = "8bad8d86fd89fd8c482aa10ab89f3049337a9ca2"
+SRCREV = "06585057d0f47bb930647123557bc5a1506dabda"
-- 
1.9.1


