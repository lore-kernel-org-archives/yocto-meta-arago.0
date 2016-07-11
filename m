Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id DB4E052A50
	for <meta-arago@arago-project.org>;
	Mon, 11 Jul 2016 15:55:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6BFthPM025059
	for <meta-arago@arago-project.org>; Mon, 11 Jul 2016 10:55:43 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6BFthEX029527
	for <meta-arago@arago-project.org>; Mon, 11 Jul 2016 10:55:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 11 Jul 2016 10:55:43 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6BFthJK021927;
	Mon, 11 Jul 2016 10:55:43 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bMdYc-0006Jf-U4; Mon, 11 Jul 2016 11:55:42 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 11 Jul 2016 11:55:40 -0400
Message-ID: <1468252540-24245-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: Add processor-sdk-03.00.00.04-config
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
X-List-Received-Date: Mon, 11 Jul 2016 15:55:44 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-03.00.00.04-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-03.00.00.04-config.txt

diff --git a/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
new file mode 100644
index 0000000..f20825a
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,1686d851985872f34ca3a2c30d4a0726a20a5c99,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,ti2016.01,36598b78a6d9fbe442f93111f64d3413c04418a8,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,1ae0cadb1200d0007a779958e852a48379d42c26,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,b0b91490e4ede61a302eb547da2cc65aa7da87ff,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


