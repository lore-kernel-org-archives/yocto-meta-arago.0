Return-Path: <lucas@lucas-xps-8930>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 097AA529C8
	for <meta-arago@arago-project.org>;
	Mon,  7 Dec 2020 18:38:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B3LMaW2101231
	for <meta-arago@arago-project.org>; Thu, 3 Dec 2020 15:22:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607030556;
	bh=X6BHAxvKwWB/jlROS0nOrS3UIc06WnkcoGGtxihhP84=;
	h=From:To:CC:Subject:Date;
	b=CwoPDWhCXtW/xc75/oT0uB48eVysIkRXxo6X6m+defgXvhDNWCn+TgEb6IJZCfVOb
	mpSgX+hDMh2AFYi6/Gsjr4qIVmZyqyf49/4pXT4YIMRq9+MdfkLJj85yipjjI79PU6
	0leNafet3HOYWf66rUaLp4sTOUeUPQhKvClAsoYE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B3LMa3X058240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 3 Dec 2020 15:22:36 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 3 Dec 2020 15:22:35 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 3 Dec 2020 15:22:35 -0600
Received: from lucas-XPS-8930 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B3LMZxQ066271;
	Thu, 3 Dec 2020 15:22:35 -0600
Received: from lucas by lucas-XPS-8930 with local (Exim 4.90_1)
	(envelope-from <lucas@lucas-xps-8930>)
	id 1kkw3e-0005Ej-QX; Thu, 03 Dec 2020 15:22:34 -0600
From: <l-weaver@ti.com>
To: <dmurphy@ti.com>
Date: Thu, 3 Dec 2020 15:21:51 -0600
Message-ID: <20201203212152.20003-1-l-weaver@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, jesse.villarreal@ti.com
Subject: [oe-layersetup][PATCH] oe-layersetup: AM65XX 07.01.00 release config
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
X-List-Received-Date: Mon, 07 Dec 2020 18:38:36 -0000
Content-Type: text/plain

From: Lucas Weaver <l-weaver@ti.com>

---
 .../processor-sdk-linux-07_01_00.txt             | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt

diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
new file mode 100644
index 0000000..4c699bc
--- /dev/null
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
+meta-psdkla,git://arago-project.org/git/projects/meta-psdkla.git,master,f98f6409bd79f26969be064e8cc70d350b51ab7f,layers=
+meta-aws,https://github.com/aws/meta-aws.git,dunfell,960306c6472ac7fadb9f02af2a045f34cde46f8d,layers=
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


