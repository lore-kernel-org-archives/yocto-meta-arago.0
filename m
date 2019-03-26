Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A8946529D3
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT4W5012259
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639344;
	bh=b0mIKKJE7j6DHw51dyVZUZ7KbMKc6D8XmMcqktQwhHM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=G2fNYFvetq58lLtIJU2zCEn1dz9RzF47X0Q79H3O5zGwXU/bbyFO2mIhRzV9AMPyp
	6UcI+Fqms5+JlOr1TgNXT//LR7ud+ti79a+Oa2kbKdwhfL58+hqpMymR8lCjRhhxta
	wI/hmTtOQKhjcUwlitMoPI2aix7CRZji5pk6eCH4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT3Ij043453
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:04 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:02 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tL116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:57 -0400
Message-ID: <1553639337-36226-8-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 7/7] sciclient-rtos: SRCREV bump to 01.00.00.02B
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/sciclient/sciclient-rtos_git.bbappend | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-bsp/sciclient/sciclient-rtos_git.bbappend b/recipes-bsp/sciclient/sciclient-rtos_git.bbappend
index f7438b1..4647e1f 100644
--- a/recipes-bsp/sciclient/sciclient-rtos_git.bbappend
+++ b/recipes-bsp/sciclient/sciclient-rtos_git.bbappend
@@ -1,5 +1,11 @@
 PR_append = ".tisdk0"
 
+# Below commit ID corresponds to "DEV.SCICLIENT.01.00.00.02B"
+SCICLIENT_SRCREV = "3b88caad398d2eeca7acf4f02c24aaa993c6b545"
+
+PV = "01.00.00.02B"
+PR = "r0"
+
 LIMSOCS_am65xx-hs-evm = "am65xx"
 LIMBOARDS_am65xx-hs-evm = "am65xx_evm"
 BOARD_PACKAGE_am65xx-hs-evm = "am65xx_evm"
-- 
1.9.1


