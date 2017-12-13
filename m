Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 7374D52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 20:17:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDKGq73030281
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:16:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513196212;
	bh=2dcwr/kBThI3hyVaBZurNlBq7scfe+dLek2gKqhOA+s=;
	h=From:To:Subject:Date;
	b=K+9QCtJjiu6ZN7XCiGgdp3zBOe4a+o3czZZyKCZYDj2Ti17w/17iYBtdm22YYbZIy
	oiZFirWcpMyZ637PDV5nUjgY3FWN62XdZ8NBci9v+Uc0AYrKmvUPqMUuzfHzBRRSFn
	NMNDy5lyDh4O6niJcsZukVFJ1wwAzsudcv7nkv3s=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKGl82028216
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:16:47 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:16:47 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:16:47 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKGl9c028507
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:16:47 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 15:16:45 -0500
Message-ID: <1513196205-15126-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] icss-emac-lld: Updating to 1.0.0.10A
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
X-List-Received-Date: Wed, 13 Dec 2017 20:17:03 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
index 621219b..37ff6e0 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
@@ -9,14 +9,14 @@ ICSS_EMAC_LLD_GIT_PROTOCOL = "git"
 ICSS_EMAC_LLD_GIT_BRANCH = "master"
 ICSS_EMAC_LLD_GIT_DESTSUFFIX = "git/ti/drv/icss_emac"
 
-# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.08"
-ICSS_EMAC_LLD_SRCREV = "e689df18417236110590f7b290525a610d63f574"
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.10A"
+ICSS_EMAC_LLD_SRCREV = "91f70af3714a823df4f71bde3c4d954728e07856"
 
 BRANCH = "${ICSS_EMAC_LLD_GIT_BRANCH}"
 SRC_URI = "${ICSS_EMAC_LLD_GIT_URI};destsuffix=${ICSS_EMAC_LLD_GIT_DESTSUFFIX};protocol=${ICSS_EMAC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${ICSS_EMAC_LLD_SRCREV}"
-PV = "01.00.00.08"
+PV = "01.00.00.10A"
 INC_PR = "r0"
 
 S = "${WORKDIR}/${ICSS_EMAC_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


