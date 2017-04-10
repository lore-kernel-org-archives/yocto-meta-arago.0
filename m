Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id DCDD052A3E
	for <meta-arago@arago-project.org>;
	Mon, 10 Apr 2017 17:20:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3AHKwks011537
	for <meta-arago@arago-project.org>; Mon, 10 Apr 2017 12:20:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491844858;
	bh=uaT1G2SBGU8zzR1vZ1qaYohcuEc5JLbrIm25HQHxQBU=;
	h=From:To:CC:Subject:Date;
	b=Ruw/MG/vQJ+g6R8+x8BWaXAdb/g8zpbi8DmkjySfVDBZYgOUVq3XI0LVsqC1y71d4
	mT4njRob3oYYzn8G0ZBVbaBz2LdmWQa/RMbw28tCDgEMw3GpOdkcxrB96grmvBnzDw
	BLparPa6bJ3E3Q8l2ngoPpajVl6YaHvjbY3cng8Q=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3AHKv3b017465
	for <meta-arago@arago-project.org>; Mon, 10 Apr 2017 12:20:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Apr 2017 12:20:56 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3AHKv3Z002359;
	Mon, 10 Apr 2017 12:20:57 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cxczo-0006fS-QH; Mon, 10 Apr 2017 13:20:56 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Apr 2017 13:20:51 -0400
Message-ID: <1491844851-25598-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: add processor-sdk-03.03.00.04-config
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
X-List-Received-Date: Mon, 10 Apr 2017 17:21:01 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-03.03.00.04-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-03.03.00.04-config.txt

diff --git a/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
new file mode 100644
index 0000000..6e7e8b0
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,70283e8e915126b57e30cc7fcf5286a9435c3829,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,c0e32cc7615f7483ae3a674221dd633205b28ee3,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,ed06c3bb58493a40b6fe584251a94f067fc9bdf7,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,ff8c8859434e56894accc5a63980c1b8904eb935,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


