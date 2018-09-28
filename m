Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id CBDAC52A23
	for <meta-arago@arago-project.org>;
	Fri, 28 Sep 2018 21:01:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SL1FpX007523
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538168475;
	bh=rQDM8WUJSe0jjtlSZB+1IZj5DZP0ZLdj/w97W3WUfMw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=EYPk60rFNqthV10ZcvkejKVsinBkW+rUaRETK42buXfVnempavPysqPgZqStY0DTu
	LnHNnnj/jSKUCXInmL9onAFtxQ78edNBIjgHWoiciqQL7sozaNFQUgTm4zO77cN/Fi
	kwL0tRakxJ9CGlbky2ZG+vPmY13YClv1Z0Awi4EA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1FrI006673
	for <meta-arago@arago-project.org>; Fri, 28 Sep 2018 16:01:15 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 16:01:15 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 16:01:15 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SL1DZj013264;
	Fri, 28 Sep 2018 16:01:14 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Sep 2018 20:57:03 +0000
Message-ID: <20180928205703.28562-4-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180928205703.28562-1-denys@ti.com>
References: <20180928205703.28562-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCHv2 4/4] arago-core-tisdk-image: deploy sysfw.itb instead of sysfw.bin
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
X-List-Received-Date: Fri, 28 Sep 2018 21:01:24 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index 1f0ef1c4..eacf31bd 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -8,7 +8,7 @@ DEPLOY_SPL_NAME_k2e = ""
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
 DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
-DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.bin"
+DEPLOY_IMAGES_NAME_k3 = "bl31.bin bl32.bin sysfw.itb"
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.17.1


