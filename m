Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id EADA352ACE
	for <meta-arago@arago-project.org>;
	Mon, 19 Dec 2016 16:06:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBJG6QgW008175
	for <meta-arago@arago-project.org>; Mon, 19 Dec 2016 10:06:26 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJG6QEP031783
	for <meta-arago@arago-project.org>; Mon, 19 Dec 2016 10:06:26 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Dec 2016 10:06:26 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBJG6QtV018091;
	Mon, 19 Dec 2016 10:06:26 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cJ0SH-0004bc-NM; Mon, 19 Dec 2016 11:06:25 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Dec 2016 11:06:23 -0500
Message-ID: <1482163583-17671-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH v2] configs: add processor-sdk-03.02.00.05-config
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
X-List-Received-Date: Mon, 19 Dec 2016 16:06:27 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* remove internal layer

 configs/processor-sdk/processor-sdk-03.02.00.05-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-03.02.00.05-config.txt

diff --git a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
new file mode 100644
index 0000000..1ae5a96
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,3678d672c9c47a646897286281d4260ac4ace960,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,76381bbc10b93ffc6c014154814872b170b93796,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,d8aa76970a0ba48762c631dfd79dbed49222373b,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


