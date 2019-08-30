Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 205A452987
	for <meta-arago@arago-project.org>;
	Fri, 30 Aug 2019 16:51:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7UGohEt081695
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 11:50:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1567183843;
	bh=Q13eRtWEpi5hAddQ61csyIQyt7olF7Qb2K9BSeu2Veg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x5p3p+cz6YrFi9jPCZ5bE+/Y6E6tBLRGwEM7lyBUwph9lKe+1z7ii1lcSzGeXeSnt
	WfUSmW5jfeamqnLSMzbcroaXdHT9H8W98OC8bOm7/LNJWdCrpi5u8m681vC5AvkPEl
	jbZjMng6X17H6zV9RseoR1ThG6M1tApAf2WGKHS8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7UGohNq116889
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 30 Aug 2019 11:50:43 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 30 Aug 2019 11:50:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 30 Aug 2019 11:50:43 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7UGog6x119149;
	Fri, 30 Aug 2019 11:50:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Aug 2019 16:36:09 +0000
Message-ID: <20190830163609.4140-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190830163609.4140-1-denys@ti.com>
References: <20190830163609.4140-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 2/2] ti-sci-fw: update imggen to ti2019.03-rc4 tag
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
X-List-Received-Date: Fri, 30 Aug 2019 16:51:46 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
index df911a02..d53e9264 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
@@ -16,7 +16,7 @@ export TI_SECURE_DEV_PKG
 
 SRCREV = "3f7c97c9f923f6fbf1b96dcae1da8620a3bab0b3"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "1ee2d5d8476bcab79edf04778d5ae5db4ef291e3"
+SRCREV_imggen = "38a82e00f84efdf381dba001fff75e8411898e99"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.17.1


