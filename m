Return-Path: <xuj@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 665C1520EA
	for <meta-arago@arago-project.org>;
	Thu, 14 Mar 2019 16:42:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EGgXiu129369
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552581753;
	bh=Fheo1QdrbkVQNo9SjmLfrDsVl36udpJaCpSSIf7HbHE=;
	h=From:To:CC:Subject:Date;
	b=T2updCIs2PT4itqmyEJPB/hBs2myyS2zzAoyWJah8sUIFa5ZLDJDObFEBANzip1LJ
	HbGEyOIgHj59rGJG43yfPsoVxUjB4OpA1bOca0SoSjN+ZVzLsyi2/VC8V/Yo/6s2dl
	ZxVnd4CnDt+DVIGM/AsiIGsuU2TPZB57nEkPvLrQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EGgW9D129953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 14 Mar 2019 11:42:33 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 11:42:32 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 14 Mar 2019 11:42:32 -0500
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EGgWwv004359;
	Thu, 14 Mar 2019 11:42:32 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Mar 2019 12:42:30 -0400
Message-ID: <1552581750-39313-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] nativesdk-packagegroup-arago-tisdk-host: add tidl-utils and tidl-viewer
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
X-List-Received-Date: Thu, 14 Mar 2019 16:42:43 -0000
Content-Type: text/plain

Move tidl-utils and tidl-viewer from meta-processor-sdk/recipes-core/packagegroups/
nativesdk-packagegroup-arago-sdk-host.bbappend to here.

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb            | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index c63a04f..ef54253 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -14,6 +14,8 @@ EXTRA_TI_TOOLS = " \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
     nativesdk-tidl-import \
+    nativesdk-tidl-viewer \
+    nativesdk-tidl-utils \
     nativesdk-gcc-arm-none-eabi \
 "
 
-- 
1.9.1


