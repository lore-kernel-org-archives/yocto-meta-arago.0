Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.2190.1643826393486570737
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 02 Feb 2022 10:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KSHmlZ8o;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 212IQWg6045425;
	Wed, 2 Feb 2022 12:26:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643826392;
	bh=nakM26xo+BSPyvBquG33rGlxnTSjiubOaoB5oATvqhs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KSHmlZ8oDMvakZvsVnUsb6eiEoGt1el0zJsV1AxHgOXRSee/xHh7lTDFFF5OZTTYK
	 4XsgJ//sJCWBvIWHj2WDGuI/7kBf/IfVMlnov3ZsVcErnyWQxeUx5TmHyU2XHrB8ip
	 808OIjEo7LoxGikciP0jgVT71dGrKtzmSBeBIeCg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 212IQWgh055723
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 2 Feb 2022 12:26:32 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 2
 Feb 2022 12:26:32 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 2 Feb 2022 12:26:32 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 212IQVsx117277;
	Wed, 2 Feb 2022 12:26:32 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nFKKt-0007Yl-SC; Wed, 02 Feb 2022 12:26:31 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2 11/12] ti-linux-fw: Bump up TIFS and DM to v2022.01
Date: Wed, 2 Feb 2022 12:26:29 -0600
Message-ID: <20220202182630.28943-12-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202182630.28943-1-reatmon@ti.com>
References: <20220202182630.28943-1-reatmon@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update ti-linux-firmware and k3-image-gen to
pick latest TIFS and DM v2022.01

This version also adds support to j721s2

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 9bd2d0a8..fea0c783 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -3,8 +3,8 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2021.09a"
-INC_PR = "r1"
+PV = "2022.01"
+INC_PR = "r2"
 
 # Firmware versions
 CORESDK_RTOS_VERSION = "08.01.00.02"
@@ -19,12 +19,12 @@ CADENCE_MHDP_FW_VERSION = "1.2.17"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 
-TI_LINUX_FW_SRCREV ?= "c96a734a059889e571dcf30c0638157c690a6e6e"
+TI_LINUX_FW_SRCREV ?= "6070de0ae4095d291e1f7679d1fe6e07253a2fc3"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "489c767a153ff26e9230746e04dd4b1ad0809901"
+K3_IMAGE_GEN_SRCREV ?= "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
-- 
2.17.1

