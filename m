Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id B30EA529AE
	for <meta-arago@arago-project.org>;
	Wed, 25 Jul 2018 12:05:21 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6PC5F5e056532
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532520315;
	bh=HDC2tti/++bAu/GXKwA1rUcuUXX6A2pVk8ueOQNYZSQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SPkkj7P9m76VUC2nuO6EqX/bh+5rLBvvCNyTEVvBh61MVk8aaV7DHsveO8YvBrKL0
	8Upkwdf09ipyL+nDJg/rYgEqU4xsqRUi8yfkVDxwb/UKgk0SlAlZ9iT3e/067zi4GZ
	yjKP8mPQqtB3pXwiZDXDzBhZJBj36gLvuj0rN7ow=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC5Fkw027244
	for <meta-arago@arago-project.org>; Wed, 25 Jul 2018 07:05:15 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 25 Jul 2018 07:05:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 25 Jul 2018 07:05:14 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6PC59Gt024647;
	Wed, 25 Jul 2018 07:05:14 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Jul 2018 07:53:07 -0400
Message-ID: <1532519588-17585-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
References: <1532519588-17585-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk][PATCH 2/3] packagegroup-arago-tisdk-addons: add pruss-lld-apps
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
X-List-Received-Date: Wed, 25 Jul 2018 12:05:22 -0000
Content-Type: text/plain

Cc: Hongmei Gou <a0271529@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend       | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index 2a9bdf8..77986d5 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk46"
+PR_append = "-tisdk47"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -7,7 +7,12 @@ EXTRA_PACKAGES_append_keystone = " opencv"
 EXTRA_PACKAGES_remove_k2hk-hs-evm = "opencv"
 
 
-EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples jailhouse-examples-rtos"
+EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
+EXTRA_PACKAGES_append_am57xx-evm = " jailhouse-examples \
+                                     jailhouse-examples-rtos \
+                                     pruss-lld-apps"
 
 EXTRA_PACKAGES_append_omapl138 = " ccief-basic"
 
-- 
2.7.4


