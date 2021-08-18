Return-Path: <lucas@lucas-xps-8930>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 7D08952A2D
	for <meta-arago@arago-project.org>;
	Wed, 18 Aug 2021 20:36:27 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17IKanfg052254
	for <meta-arago@arago-project.org>; Wed, 18 Aug 2021 15:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629319009;
	bh=Wz7yUHi4yGARMziop4MLjmL6SrsAuQKazMlyUrIcK4o=;
	h=From:To:CC:Subject:Date;
	b=LxKwAe/TOF8wkqosOK/BfZ+U0QFEKypF5VPey7p+vX4PYCvGzEm3G40YwC8HcwpQo
	3hxBEibzgl6qb5D6RApUk0l0ohMtdewYjrAY90FqV73+50zp7VsHIrQDEMc9C2WcQN
	M6s+XEN26Bmb5cwDtRwhHXjl8+bVrmAY37OsLYro=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17IKanEG010227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 18 Aug 2021 15:36:49 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 18 Aug 2021 15:36:49 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 18 Aug 2021 15:36:49 -0500
Received: from lucas-XPS-8930 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17IKanFq065043;
	Wed, 18 Aug 2021 15:36:49 -0500
Received: from lucas by lucas-XPS-8930 with local (Exim 4.90_1)
	(envelope-from <lucas@lucas-xps-8930>)
	id 1mGSIq-0001hL-Ez; Wed, 18 Aug 2021 15:36:48 -0500
From: <l-weaver@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 18 Aug 2021 15:36:37 -0500
Message-ID: <20210818203637.6441-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk-linux: Add 08.00.00 release config
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
X-List-Received-Date: Wed, 18 Aug 2021 20:36:27 -0000
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

Add config file for processor-sdk-linux 08.00.00 release

Signed-off-by: Lucas Weaver <l-weaver@ti.com>
---
 .../processor-sdk-linux-08_00_00.txt            | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
new file mode 100644
index 0000000..f46184a
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,3d772074ef93ac47a1a752e22021b0c32207f54b,layers=
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,d3df90635fca4d8267b547dab568058c554014b1,layers=
+meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


