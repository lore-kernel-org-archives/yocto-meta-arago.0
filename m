Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 4F8CA52997
	for <meta-arago@arago-project.org>;
	Wed,  5 Jun 2019 21:27:03 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x55LQPk4029842
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2019 16:26:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559769985;
	bh=Qq/kEH7DhFnaip7RFq5txf927K7sziVRU/HYEyiA9gA=;
	h=From:To:Subject:Date;
	b=Jld6z4IulBBb3qpZ2Ylp8PK8x0h76X1hZopr6SN74JnMZtYAGk61E6Ch+NvN6yNLG
	hHzYzx+mRJE0DskH+cdtnPApTt5TnmEetSD7tPPMtjaOWNSn2Kd19wqC843lRLbnkZ
	ZyQacJbh6CNEfpfIF/SW9nAqYHtOLBYTB4syeaSA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x55LQPOD039382
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2019 16:26:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 5 Jun 2019 16:26:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 5 Jun 2019 16:26:24 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x55LQOUS092757
	for <meta-arago@arago-project.org>; Wed, 5 Jun 2019 16:26:24 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Jun 2019 17:26:09 -0400
Message-ID: <20190605212609.54773-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] packagegroup-arago-tisdk-addons: add watchdog for k3
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
X-List-Received-Date: Wed, 05 Jun 2019 21:27:04 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bbappend     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
index e3b2fd6..7f26e6f 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bbappend
@@ -1,4 +1,4 @@
-PR_append = "-tisdk51"
+PR_append = "-tisdk52"
 
 EXTRA_PACKAGES_append_ti33x = " opencv"
 EXTRA_PACKAGES_append_ti43x = " opencv"
@@ -11,6 +11,7 @@ EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps pru-adc"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_k2g-evm  = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps"
+EXTRA_PACKAGES_append_k3 = " watchdog"
 # FIXME: disable for now
 # jailhouse-examples
 # jailhouse-examples-rtos
-- 
2.17.1


