Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 55AB252980
	for <meta-arago@arago-project.org>;
	Tue, 23 Jul 2019 21:33:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6NLWcLL106207
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563917558;
	bh=bYGeykdg4yeDdZlxtTUzBVQ9iMFXVyHqVh9wvp2DK/k=;
	h=From:To:CC:Subject:Date;
	b=CTxSBrjC68Edn+DeDTfK+5KKk/YB8ccCjivkH1ldjTCNDuiEoXBKgpPnaDwhEqOmy
	GYPqQN1mt5eALTr0lY5NLRvQaWFlFTh/HRGk15pNA9jEhcm+bSk5mPuoxiBZ4xsU8+
	w9rYLiFe968tDFqKPEv/hqX65dYdWu/AZwPv2aVQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6NLWc4B030213
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Jul 2019 16:32:38 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Jul 2019 16:32:38 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Jul 2019 16:32:38 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6NLWcwR115410;
	Tue, 23 Jul 2019 16:32:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 23 Jul 2019 21:19:18 +0000
Message-ID: <20190723211918.7142-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] coresdk-2019.02: add config for ti2019.02 release
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
X-List-Received-Date: Tue, 23 Jul 2019 21:33:30 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2019.02-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2019.02-config.txt

diff --git a/configs/coresdk/coresdk-2019.02-config.txt b/configs/coresdk/coresdk-2019.02-config.txt
new file mode 100644
index 0000000..07eaaf7
--- /dev/null
+++ b/configs/coresdk/coresdk-2019.02-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
+meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.02,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.02,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


