Return-Path: <jbergsagel@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id C08B752A36
	for <meta-arago@arago-project.org>;
	Fri,  2 Aug 2019 17:39:48 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x72Hcsrq091326
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564767534;
	bh=NBYLDBVUMv0NENxjpBUlunetZnXt2p3iiLn6Kqmbz50=;
	h=From:To:CC:Subject:Date;
	b=dk8SCgwWkzmVhjjmf69pER9cO1lHDXH3qD4AIWW8MucTQD4mOqofdJyOqvAcPfDLB
	dgp5UIZBdGXWx4qu9gTPFYWPPrBvnwyq4Lb+FErBDMza2ZlL55ZcXuFt2f2f4On9nC
	v5CkvJkgQSRfDd2F2cX2MxLtN9jPlhAGjTMyK13U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x72HcscM124240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 2 Aug 2019 12:38:54 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 2 Aug 2019 12:38:54 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 2 Aug 2019 12:38:54 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x72HcsPU010262;
	Fri, 2 Aug 2019 12:38:54 -0500
Received: from localhost (udc0211050.dhcp.ti.com [128.247.77.185])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x72HcrZ24231; Fri, 2 Aug 2019 12:38:53 -0500 (CDT)
From: Jonathan Bergsagel <jbergsagel@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 2 Aug 2019 12:36:53 -0500
Message-ID: <20190802173653.23961-1-jbergsagel@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>
Subject: [PATCH] packagegroup-arago-tisdk-addons: add ipc-lld-fw-am65x
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
X-List-Received-Date: Fri, 02 Aug 2019 17:39:49 -0000
Content-Type: text/plain

Added IPC echo test binaries for AM65xx

Signed-off-by: Jonathan Bergsagel <jbergsagel@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 21aa7244ba19..a3e9667a2a63 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -75,7 +75,7 @@ UTILS_append_k3 = " mmc-utils \
                     irqbalance \
 "
 
-UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
+UTILS_append_am65xx = " ipc-lld-fw-am65x ti-ipc-rtos-fw pru-icss"
 UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
2.17.1


