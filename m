Return-Path: <jbergsagel@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A4A0C52A05
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 22:04:23 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72M3TxF019498
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 17:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564783409;
	bh=lMRqAhmxnr2VFtRZ5u2DFKUoELDPlinAyt9qzOGxOWY=;
	h=From:To:CC:Subject:Date;
	b=KgzRj6nbmOkIL2o5JEtVKVVwe28/DuIB6gAT89gcLNg3bnMRCQURoKSL0Rd70a5Qo
	Peb7DMy67Rbs/DqsyJAdH2e9fmiE713V9btDKXsvwnNSf4bFuMcxGq2vEqKiANUaAa
	ZRpTZFE2WL0iTd4xFiio9zjZvvvNoMtfHOf7q6mo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72M3TQO119928
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 17:03:29 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 17:03:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 17:03:28 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72M3SjH118826;
	Fri, 2 Aug 2019 17:03:28 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x72M3SZ23543; Fri, 2 Aug 2019 17:03:28 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Aug 2019 17:01:35 -0500
Message-ID: <20190802220135.26607-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>, Santosh Jha <sjha@ti.com>
Subject: [PATCH v2] packagegroup-arago-tisdk-addons: add ipc-lld-fw-am65x
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
X-List-Received-Date: Fri, 02 Aug 2019 22:04:24 -0000
Content-Type: text/plain

Added IPC echo test binaries for AM65xx

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 21aa7244ba19..f0307fe78c4e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -75,7 +75,7 @@ UTILS_append_k3 = " mmc-utils \
                     irqbalance \
 "
 
-UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
+UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss"
 UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
2.17.1


