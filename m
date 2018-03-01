Return-Path: <d-senicic1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EB8F452976
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 17:13:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21HDB5D006781
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 11:13:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519924391;
	bh=w5oOPOFtAlotLTznAvuOxec6/qo9rm4jZjii4wFzXwQ=;
	h=From:To:CC:Subject:Date;
	b=odHniN/yUKuP3e6KoHgVec7qpbdqXYtfyOf/R6ekF6Ac3+2ZAf1yojBHzStgQfZJ5
	aX0tNpkzltNi8ouvdKRZ8cg5PtPtyspuMbgFs7PkgV7YQ0Ryrl2usmfSXsjFG+QeTI
	Hc5mIzSKOYKww+1Lw2O9n0v1bcSCinLuTFxIfMbM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21HDAp6003333
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 11:13:11 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 11:13:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 11:13:10 -0600
Received: from UDA0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21HDAU0031613;
	Thu, 1 Mar 2018 11:13:10 -0600
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Mar 2018 12:12:53 -0500
Message-ID: <1519924373-4999-1-git-send-email-x0157990@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com, Djordje Senicic <x0157990@ti.com>
Subject: [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Thu, 01 Mar 2018 17:13:47 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 recipes-ti/tiovx/tiovx-sys.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
index fc24947..43c4e1d 100644
--- a/recipes-ti/tiovx/tiovx-sys.inc
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -1,5 +1,5 @@
 PV = "01.00.00.00"
 
 BRANCH="master"
-SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
+SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
 SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
1.9.1


