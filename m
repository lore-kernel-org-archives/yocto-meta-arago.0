Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 5269C520DE
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2019 22:54:01 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JMqr0h102252
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 17:52:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568933573;
	bh=uQWxHdTbXi1yHE4eKO8Z8kbQtyPJBR5L1sfviqHfjJI=;
	h=From:To:CC:Subject:Date;
	b=kdYaXWc7Bf7Of9b3z1oFSAxt/uSEoC4nWYHxX9TfWLEkgdR9ye8ncuzgQ7/XAqZsp
	uusQMRxyRFwoiPFAiBVwbjgXNXNuqPsCmM6E7Xadi8MxkGNtZYR1Bq6BbAHNhq/eTN
	B7Tv1vZ0nDqtxPg80GRSGDhb5qlvQbAYoyAt/7pc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JMqrd5035804
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 17:52:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 19 Sep 2019 17:52:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 17:52:52 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JMqq3R070484;
	Thu, 19 Sep 2019 17:52:52 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 19 Sep 2019 18:51:38 -0400
Message-ID: <20190919225138.31752-1-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] tiovx-app-host: bump SRCREV to add printf in tiovx-opticalflow example
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
X-List-Received-Date: Thu, 19 Sep 2019 22:54:01 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-app-host.bb | 2 +-
 recipes-ti/tiovx/tiovx-sys.inc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index 1097dc56..32f7125c 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -18,7 +18,7 @@ require tiovx-sys.inc
 DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem opencv udev"
 RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
 
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
index 6f5f4c19..becf0cc1 100644
--- a/recipes-ti/tiovx/tiovx-sys.inc
+++ b/recipes-ti/tiovx/tiovx-sys.inc
@@ -1,5 +1,5 @@
 PV = "01.00.01.00"
 
 BRANCH="master"
-SRCREV = "79f4db254eeffff7e0479cf4daa38ea22a389e34"
+SRCREV = "5be60aee8d013907a4d8a6cc8af35a517a33b49e"
 SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
-- 
2.17.1


