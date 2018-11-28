Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id D6BC852A52
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2018 20:37:00 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wASKanDu089515
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543437409;
	bh=CtWqdEC+8P9SKFgO/1D1ES1zE3S7xd9CbU2RtEIXhec=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=B10eaQg2rTQibVyaHz9W2JMrqPkhb7EsYZ6HJ/aE/Gbs1OrhJZE03bzzQbLVKYFdB
	VN77awPBZ8Xux8Y0wSPkLBYDBOBKYFCVIN9uvPARMAjyH3Ouv08pBadheX+QiVt4Mm
	3WxhRsJa7Aw4gSEh0E7aStPLp0xjosnZdaum+ML4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wASKan7X015354
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 14:36:49 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 28 Nov 2018 14:36:49 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 28 Nov 2018 14:36:49 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wASKagms014881;
	Wed, 28 Nov 2018 14:36:48 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Nov 2018 15:24:05 -0500
Message-ID: <1543436645-4503-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1543436645-4503-1-git-send-email-j-stiffler@ti.com>
References: <1543436645-4503-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH 3/3] nativesdk-packagegroup-arago-sdk-host: add open62541 examples
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
X-List-Received-Date: Wed, 28 Nov 2018 20:37:02 -0000
Content-Type: text/plain

* The examples can be used to test remote OPC/UA connections between
  target platform and SDK host.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 4f8e62b..54466b7 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 SUMMARY = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r16"
+PR = "r17"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -11,6 +11,8 @@ EXTRA_TI_TOOLS = " \
     nativesdk-ti-cgt-pru \
     nativesdk-clocl \
     nativesdk-clacc \
+    nativesdk-open62541-examples \
+    nativesdk-open62541-tests \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.7.4


