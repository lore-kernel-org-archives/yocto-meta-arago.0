Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F168552A16
	for <meta-arago@arago-project.org>;
	Tue, 12 Apr 2016 19:12:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u3CJCl1H032755
	for <meta-arago@arago-project.org>; Tue, 12 Apr 2016 14:12:47 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3CJClx0014392
	for <meta-arago@arago-project.org>; Tue, 12 Apr 2016 14:12:47 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 12 Apr 2016 14:12:47 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u3CJClHC002284;
	Tue, 12 Apr 2016 14:12:47 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1aq3jy-0001Vj-Q1; Tue, 12 Apr 2016 15:12:46 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 12 Apr 2016 15:12:45 -0400
Message-ID: <1460488365-5773-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] configs: Add processor-sdk-02.00.02.11-config
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
X-List-Received-Date: Tue, 12 Apr 2016 19:12:48 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-02.00.02.11-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-02.00.02.11-config.txt

diff --git a/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
new file mode 100644
index 0000000..5b30303
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,80feff781e2a6c3b50a72655a627ca7d629c72ab,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,fido,e6bb433b399c1ad32e596b9c46571fbfe384a86e,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,fido,c93678aa08bc0df0f1f36a84afe48723406de58e,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


