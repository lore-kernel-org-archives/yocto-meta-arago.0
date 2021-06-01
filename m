Return-Path: <lucas@lucas-xps-8930>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 2E46052C55
	for <meta-arago@arago-project.org>;
	Tue,  1 Jun 2021 17:52:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 151HrLYF092888
	for <meta-arago@arago-project.org>; Tue, 1 Jun 2021 12:53:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622570001;
	bh=f6eDge1EvueBosifvw0qUBycpcxkTQ5JDMLyAXkqifE=;
	h=From:To:CC:Subject:Date;
	b=wZer0w9uvD4v4E3T+liGcma8Em8Dr5rRIYtJXlZ2u5pGiVXRYMXnojBUbI7JPOUh7
	rt7pKWE1WxKFuFBLQLmFC9eoWE3TvhhwH3uWB3N7glTP0ISSpETLHCuayrhABt6xow
	+z4BmYPS4l3/JvMUd83bnkKT6/CdBAKKUFmA/Hx0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 151HrL5g104049
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 1 Jun 2021 12:53:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 1 Jun 2021 12:53:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 1 Jun 2021 12:53:18 -0500
Received: from lucas-XPS-8930 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 151HrIjM034512;
	Tue, 1 Jun 2021 12:53:18 -0500
Received: from lucas by lucas-XPS-8930 with local (Exim 4.90_1)
	(envelope-from <lucas@lucas-xps-8930>)
	id 1lo8Zp-0004nZ-EA; Tue, 01 Jun 2021 12:53:17 -0500
From: <l-weaver@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Jun 2021 12:53:00 -0500
Message-ID: <20210601175300.18366-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk-linux-07_03_00: add config for ProcSDK AM65XX 07_03_00 release
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
X-List-Received-Date: Tue, 01 Jun 2021 17:52:42 -0000
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

Signed-off-by: Lucas Weaver <l-weaver@ti.com>
---
 .../processor-sdk-linux-07_03_00.txt             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
new file mode 100644
index 0000000..e0cef55
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+meta-psdkla,git://arago-project.org/git/projects/meta-psdkla.git,master,41ac7fa732f1f030577885a0d06ab2976014d750,layers=
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,80f6984673aca586e83a8f913ddf7ebc89f3586a,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


