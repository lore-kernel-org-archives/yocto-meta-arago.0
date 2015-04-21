Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C0F5552A86
	for <meta-arago@arago-project.org>;
	Tue, 21 Apr 2015 11:59:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3LBxAK1019453
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 06:59:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LBx9j1000834
	for <meta-arago@arago-project.org>; Tue, 21 Apr 2015 06:59:09 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 21 Apr 2015 06:59:09 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3LBx8h2027181;
	Tue, 21 Apr 2015 06:59:09 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YkWpY-0001JU-Kf;
	Tue, 21 Apr 2015 07:59:08 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Apr 2015 07:58:58 -0400
Message-ID: <1429617539-5015-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1429617539-5015-1-git-send-email-j-stiffler@ti.com>
References: <1429617539-5015-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH 2/2] configs: Add processor-sdk-01.00.00.00-config
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
X-List-Received-Date: Tue, 21 Apr 2015 11:59:11 -0000
Content-Type: text/plain

* This corresponds to the Processor SDK 01.00.00.00 release for the
  am335x-evm and am437x-evm platforms.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk-01.00.00.00-config.txt           |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-01.00.00.00-config.txt

diff --git a/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
new file mode 100644
index 0000000..3c2bb2e
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.24,923fc5ee0ace02cc29110bff502a2c65e6bdebf0,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,b12d5ca16701da5b723a691e4d817693ab4dd260,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,a550535f326d48fe2627d76b144368e4ec0551b0,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,daisy,3a95559c124d3ce8c076b3fae5859435977d1ac2,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,daisy,5094b8268daf8129cc6c7fad9c51a1bb845c99d1,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


