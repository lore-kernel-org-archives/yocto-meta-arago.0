Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C39D852A4F
	for <meta-arago@arago-project.org>;
	Mon, 13 Jan 2020 14:44:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00DEgpCs015736
	for <meta-arago@arago-project.org>; Mon, 13 Jan 2020 08:42:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578926571;
	bh=mMQ9SdxgZqe1fZnamyND9N4PT1Nt0sqPtGI1qtj/XzM=;
	h=From:To:CC:Subject:Date;
	b=YJu1Jt85rAVKviv1c663lXgIFU98y1BnGC0LFvseCJq8cuBsaxI21ZHct+XrMwxq7
	bV/OH2NfdTHYPxLbZGhUUtI+IBQ9gQrd8BSgr2Gwy74pM78h3Lc8NYHef4eQENfBjw
	p6jN0+KIoS3xTZ2mEBdukNcU6DlId11tqdolq1aI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00DEgpkm084006
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 13 Jan 2020 08:42:51 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 13 Jan 2020 08:42:51 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 13 Jan 2020 08:42:51 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00DEgpZs022252;
	Mon, 13 Jan 2020 08:42:51 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1ir0va-00016Y-SK; Mon, 13 Jan 2020 09:42:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 13 Jan 2020 09:42:48 -0500
Message-ID: <1578926568-4213-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 6.2.0.81 release config
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
X-List-Received-Date: Mon, 13 Jan 2020 14:44:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-06.02.00.81-config.txt  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-06.02.00.81-config.txt

diff --git a/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
new file mode 100644
index 0000000..41d4a34
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,6a0a2b1a8e6cbbb1bdeb133e6acc6f37eccb3169,layers=
+meta-aws,https://github.com/aws/meta-aws.git,master,b5191c92f6e124f7baaec3513d1338a47fe0caa8,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.05,d2e8f25e059630f6447c8e41d1c20625f10cdb9d,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,e5da84ec50a46ca73c2efbdaa376d30183562986,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


