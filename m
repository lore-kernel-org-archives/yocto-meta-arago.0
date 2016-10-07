Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5103352A15
	for <meta-arago@arago-project.org>;
	Fri,  7 Oct 2016 11:56:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u97BuE6I018072
	for <meta-arago@arago-project.org>; Fri, 7 Oct 2016 06:56:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u97BuDRv023513
	for <meta-arago@arago-project.org>; Fri, 7 Oct 2016 06:56:13 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 7 Oct 2016 06:56:13 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u97BuDMa001577;
	Fri, 7 Oct 2016 06:56:13 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bsTl6-0002hq-Rv; Fri, 07 Oct 2016 07:56:12 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 7 Oct 2016 07:56:06 -0400
Message-ID: <1475841366-10370-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: add processor-sdk-03.01.00.06-config
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
X-List-Received-Date: Fri, 07 Oct 2016 11:56:15 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-03.01.00.06-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-03.01.00.06-config.txt

diff --git a/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
new file mode 100644
index 0000000..0ab5543
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,bee144eeed6c08ec2829533e82f94405058ce453,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,6b3984287c3c15fde80dcc5a0999fb85c6a8a6c6,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,b6fea965af0129f552d45e9c7d85937e6076f645,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,008497c611bc381014d310678e7dd39668959fea,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,8bbfe9bd229e3f795577eb5df1cd5104651e2ba2,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


