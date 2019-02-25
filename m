Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AD825529A0
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2019 18:46:57 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x1PIkrU3077663
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 12:46:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551120413;
	bh=PDyk3yNJPMCb3zMxdU49elPb+OP39gUn3wFl32Ikzd8=;
	h=From:To:CC:Subject:Date;
	b=MmhmRKsRUUlackcJNH/Ggy8vSqE9dyL4clua4Aqn65Ap9Zgyi0T2Y/uuzgqaKObZj
	VBMbV8AqTsMM5V2HMJuN08JMBiuNu44YI5ZXp85McpK0csSmNRtoKMqpu9MnOXlT+k
	4DKhSKZvgbCdHbgy2E9NgZ9wo3eLtUo+0h21VkKY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x1PIkr1u080749
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 25 Feb 2019 12:46:53 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Mon, 25 Feb 2019 12:46:53 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Mon, 25 Feb 2019 12:46:53 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x1PIkrnf019480;
	Mon, 25 Feb 2019 12:46:53 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 25 Feb 2019 13:34:38 -0500
Message-ID: <1551119678-4484-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH] nativesdk-packagegroup-arago-tisdk-host: add nativesdk-gcc-arm-none-eabi
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
X-List-Received-Date: Mon, 25 Feb 2019 18:46:58 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
index cb34591..c63a04f 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb
@@ -14,6 +14,7 @@ EXTRA_TI_TOOLS = " \
     nativesdk-open62541-examples \
     nativesdk-open62541-tests \
     nativesdk-tidl-import \
+    nativesdk-gcc-arm-none-eabi \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


