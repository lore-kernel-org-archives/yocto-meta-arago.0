Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5550552A30
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2015 17:59:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t68HxPMJ023508
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2015 12:59:25 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t68HxPQs003778
	for <meta-arago@arago-project.org>; Wed, 8 Jul 2015 12:59:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 12:59:10 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t68HxPAQ006939;	Wed, 8 Jul 2015 12:59:25 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1ZCtcy-0000jC-NS;
	Wed, 08 Jul 2015 13:59:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 Jul 2015 13:59:17 -0400
Message-ID: <1436378357-2768-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: Add processor-sdk-01.00.00.03-config
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
X-List-Received-Date: Wed, 08 Jul 2015 17:59:26 -0000
Content-Type: text/plain

* This corresponds to the Processor SDK Linux 01.00.00.03 release.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk-01.00.00.03-config.txt           |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-01.00.00.03-config.txt

diff --git a/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
new file mode 100644
index 0000000..ffb12d1
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.26,cd92e5dce5f5d61ecb7838bf964a7812e905509a,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,05b7db4f213c0862cdbb6cc3da1fd2b63a834b28,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,daisy,d4315b423207030962c48de7cbc247abec0c0033,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,daisy,af94b54a5ee81e7ce098a20514a9cc7f88477f08,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,daisy,317cad797a77db0aa401d13b763181ed492f5462,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk.conf.sample
-- 
1.7.9.5


