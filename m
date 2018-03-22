Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 88163529A2
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 19:07:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2MJ7vRJ011097
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 14:07:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521745677;
	bh=ssx6zIt2pn8PoptZHKG0R73ItVLcO5VYcK8PNCvkRDQ=;
	h=From:To:Subject:Date;
	b=alR+E9Ax9cdPMewXmwDivfaaO+JgkYOumCgOobmnU/3S/U8wAmz5yhd0cUX2PscoC
	n18HPyf/ZPJCWJavFWCQ9A2WFnNT052by+ldNPEqfd0t9gofU80owPY3aAqhTp/AL6
	oxuGjgNbS3K9eRvwDPU5gdXnbOuhCVGPzRriDWt0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2MJ7vGc009063
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 14:07:57 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 22 Mar 2018 14:07:56 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 22 Mar 2018 14:07:56 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2MJ7um2026122
	for <meta-arago@arago-project.org>; Thu, 22 Mar 2018 14:07:56 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 15:07:55 -0400
Message-ID: <1521745675-12724-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] starterware: SRCREV bump to 02.01.01.05C
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
X-List-Received-Date: Thu, 22 Mar 2018 19:07:58 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/starterware/starterware-02.01.01.06.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/starterware/starterware-02.01.01.06.inc b/recipes-bsp/starterware/starterware-02.01.01.06.inc
index b5a1b4c..ce478e2 100644
--- a/recipes-bsp/starterware/starterware-02.01.01.06.inc
+++ b/recipes-bsp/starterware/starterware-02.01.01.06.inc
@@ -1,5 +1,5 @@
-# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06B"
-STARTERWARE_SRCREV = "ba2396ef6e533c6d6bccea0b8e2dd37406e6eebc"
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.06C"
+STARTERWARE_SRCREV = "c8bbba0b37303529307be608ecca5fee66099973"
 
-PV = "02.01.01.06B"
+PV = "02.01.01.06C"
 INC_PR = "r0"
-- 
1.9.1


