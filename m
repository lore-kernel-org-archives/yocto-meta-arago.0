Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C3B8B52988
	for <meta-arago@arago-project.org>;
	Thu, 20 Feb 2020 19:18:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01KJGAIi129870
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582226170;
	bh=lD3bNwzX+lAq9svfKq8hKsLLfhFCnskj8aiX5b9PC28=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=zBJA4ca7BomOtZO45vxCWijH1t0OlseAwvXkbgLYj4I8ntsM7NshNYs5B+UAzcRbV
	SKnyRjVpl13nyHO1bBGcH8s8/FETPFwjj71NHiC2BupdVsKZST0nXCoxoVdry1+V1w
	EdaNIZfERk7AMYhHMeBBEvAEgpcG1HQ7xt4Txq/c=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG9sd117860
	for <meta-arago@arago-project.org>; Thu, 20 Feb 2020 13:16:10 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 20 Feb 2020 13:16:09 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 20 Feb 2020 13:16:09 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01KJG7pi017983;
	Thu, 20 Feb 2020 13:16:09 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Feb 2020 18:54:56 +0000
Message-ID: <20200220185458.26926-7-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220185458.26926-1-denys@ti.com>
References: <20200220185458.26926-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH 7/9] arago-core-tisdk-bundle: add missing deployment of J7 SYSFW binary
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
X-List-Received-Date: Thu, 20 Feb 2020 19:18:11 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/images/arago-core-tisdk-bundle.bb             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
index 8b8740b9..2fffe1ac 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-bundle.bb
@@ -10,6 +10,7 @@ DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
 DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
 DEPLOY_IMAGES_NAME_append_am65xx-evm = " ti-sci-firmware-am65x-gp.bin"
+DEPLOY_IMAGES_NAME_append_j7-evm = " ti-sci-firmware-j721e-gp.bin"
 
-ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
+ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-bundle"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


