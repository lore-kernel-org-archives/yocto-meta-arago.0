Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 2A0CE5296D
	for <meta-arago@arago-project.org>;
	Thu,  7 Jan 2021 19:33:08 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 107JX9pG004899
	for <meta-arago@arago-project.org>; Thu, 7 Jan 2021 13:33:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1610047989;
	bh=D95Ho+FfA9rOHE11yQNhNsqYW9evkfko9xrmJA0bxD8=;
	h=From:To:CC:Subject:Date;
	b=qr07mARCmLQIVeOhKfjVVLb8kswD7pl5KczV8uXL7mR5+9s0dKdZzsFFoWoJ6eeSJ
	qcMoe5cp/SDjsKllTv9cawpPbwthOMv8kgaDWCAmU5rX/yLS0VcrBEl/6wrjroRPtF
	UaOyrBIC1N5r1dEZjpPOxSmViRTZkCN5kTwweRiw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 107JX9Rs042311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 7 Jan 2021 13:33:09 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 7 Jan 2021 13:33:08 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 7 Jan 2021 13:33:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 107JX8Re013890;
	Thu, 7 Jan 2021 13:33:09 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 7 Jan 2021 13:32:58 -0600
Message-ID: <20210107193258.25447-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master] [PATCH] branding-bleeding: optee-os: Stop auto rev of optee-os
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
X-List-Received-Date: Thu, 07 Jan 2021 19:33:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Current mainline optee-os has the patches applied and the bleeding
build fails to apply the patches as they already exist on the current HEAD.
So optee-os should be pinned to 3.11 with the patches needed to build successfully.

Long term may need a recipe to build mainline HEAD exclusively and for
non-bleeding builds pin OPTEE-os to a specific version.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-bleeding.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
index a536f777ad59..8b0811db2c87 100644
--- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
+++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
@@ -9,7 +9,7 @@ SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
 SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
 SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
 SRCREV_pn-ltp-ddt = "${AUTOREV}"
-SRCREV_pn-optee-os = "${AUTOREV}"
+#SRCREV_pn-optee-os = "${AUTOREV}"
 #SRCREV_pn-optee-client = "${AUTOREV}"
 #SRCREV_pn-optee-test = "${AUTOREV}"
 SRCREV_pn-arm-trusted-firmware = "${AUTOREV}"
-- 
2.29.2


