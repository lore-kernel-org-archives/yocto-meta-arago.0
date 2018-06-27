Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0B72452A00
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 17:23:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RHNEG9069753
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530120194;
	bh=ekVh+SfEyxx07yUonp2iTs1QcpX5UFSOlNRT5KRD2ts=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=yAjWWYDdwUbQl01Y4k27coJRhXBIBf9NJy/hPtn4RtCHq95doKY2mZ9hZdSs05+WE
	WlLS5IibfHRoVqZLoU7qSBaPY4Bo42Uzg7YJDsyCd/AcL/ITJl/zK/JIOlKG2Z+kFB
	eGSmrbEkzMeu4DcKZOGzzNAfbPjUEzqcTN90EdWw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHNECW029024
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 12:23:14 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 12:23:13 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 12:23:13 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RHNDF7012629;
	Wed, 27 Jun 2018 12:23:13 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 27 Jun 2018 13:11:51 -0400
Message-ID: <1530119512-30012-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1530119512-30012-1-git-send-email-j-stiffler@ti.com>
References: <1530119512-30012-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/3] arago-core-tisdk-image: am65xx-evm: pull in R5 SPL image
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
X-List-Received-Date: Wed, 27 Jun 2018 17:23:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
index d55b709..bcab334 100644
--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-image.bb
@@ -6,7 +6,7 @@ DEPLOY_SPL_NAME_k2l = ""
 DEPLOY_SPL_NAME_k2e = ""
 # Only unset it for HS device, as k2g GP does provide MLO/SPL
 DEPLOY_SPL_NAME_k2g-hs-evm = ""
-DEPLOY_SPL_NAME_k3 = "tispl.bin"
+DEPLOY_SPL_NAME_k3 = "tispl.bin tiboot3.bin"
 
 ARAGO_TISDK_IMAGE ?= "arago-core-tisdk-image"
 export IMAGE_BASENAME = "${ARAGO_TISDK_IMAGE}"
-- 
2.7.4


