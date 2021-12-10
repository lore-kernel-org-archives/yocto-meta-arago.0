Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.13584.1639171556308901313
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 13:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Pl3vOdIr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BALPqbW062687;
	Fri, 10 Dec 2021 15:25:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639171552;
	bh=k0Y8Cxj/HRBQBIZ1uqnuD2PU3i45EozzG9etIAXq5Lw=;
	h=From:To:Subject:Date;
	b=Pl3vOdIrNj7sRRUOc+/sDm7lNo7iyMU2m8jsptIM1LAuRn8oW8mcHXMRNXH3kggFC
	 VmRIsUBRb1Tvjc2ZTKiHbmf6FDj+aJAjeWW4DTZckpheLAj0jdBHWAFg3KvZkaQ0P2
	 wBvsEKLELVLxzpL2a7Gk889DoiQ91Wm3qA2OFcx0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BALPqsE087112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Dec 2021 15:25:52 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 10
 Dec 2021 15:25:52 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 10 Dec 2021 15:25:52 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BALPqCI034771;
	Fri, 10 Dec 2021 15:25:52 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1mvnOq-00084P-D0; Fri, 10 Dec 2021 15:25:52 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH] coresdk-08.01.00.006-config: add config for CoreSDK 08.01.00.006 release
Date: Fri, 10 Dec 2021 15:25:52 -0600
Message-ID: <20211210212552.30982-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

add config for CoreSDK 08.01.00.006 release

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/coresdk/coresdk-08.01.00.006-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-08.01.00.006-config.txt

diff --git a/configs/coresdk/coresdk-08.01.00.006-config.txt b/configs/coresdk/coresdk-08.01.00.006-config.txt
new file mode 100644
index 0000000..78d8bf7
--- /dev/null
+++ b/configs/coresdk/coresdk-08.01.00.006-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1

