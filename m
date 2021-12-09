Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.11115.1639054181222318677
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 04:49:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yonD02X8;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9Cnddd021785;
	Thu, 9 Dec 2021 06:49:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639054179;
	bh=5oZxZL4RwlOIA9mFmPL05Xu5o4iF5jqTas8eqWeoWdw=;
	h=From:To:Subject:Date;
	b=yonD02X8ifuygFix7HbHHPAFIW1e+Wu4mTZqvLZXkBpjArZFTsIeQPEpr9t7XmCs5
	 SQtkAgPQ1M8J6ghoXb0M4vLLiBjJ30qD45sJJKFxtYNAJ74dkg156V7DBbss1zixXA
	 E6POBZm3xZ2qppqn08A8H2tr2XaAMEUfA+mB3Bmc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9CndhF044850
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 06:49:39 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 06:49:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 06:49:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9CncNe128793;
	Thu, 9 Dec 2021 06:49:38 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH] config: dunfell: fix the oe-core version to last working
Date: Thu, 9 Dec 2021 12:49:38 +0000
Message-ID: <20211209124938.25819-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The latest update in oe-core (meta) is causing build error in
dma-heap-test

Error:
CMakeFiles/dma-heap-unit-tests.dir/src/heap_test_fixture.cpp.o:
(.rodata._ZTI16HeapAllHeapsTest[_ZTI16HeapAllHeapsTest]+0x18):
undefined reference to `typeinfo for testing::Test

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 configs/arago-dunfell-config.txt      | 2 +-
 configs/arago-dunfell-next-config.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 464b835..8ae2a69 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -10,7 +10,7 @@ meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,f61fcb6e176f19f1e768ce63a693f238713c8887,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 9657a72..fdc8e83 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -10,7 +10,7 @@ meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
-- 
2.17.1

