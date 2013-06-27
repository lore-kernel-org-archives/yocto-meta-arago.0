Return-Path: <a0875592@swubn01>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 642F052990
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 04:44:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5R4i6Xt017320
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 23:44:06 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5R4i6II012775
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 23:44:06 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 26 Jun 2013 23:44:05 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5R4i5dH004988;
	Wed, 26 Jun 2013 23:44:05 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1Us43w-0001eT-Mw; Thu, 27 Jun 2013 10:14:04 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jun 2013 10:13:54 +0530
Message-ID: <1372308234-6315-1-git-send-email-heroor@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2 oe-layersetup] configs: Update glsdk 6.01.00 to point to GLSDK staging trees
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
X-List-Received-Date: Thu, 27 Jun 2013 04:44:07 -0000
Content-Type: text/plain

* Follow the AMSDK model of having staging trees to tag releases.
* GLSDK meta-ti staging tree is hosted at
  git://git.ti.com/glsdk/meta-ti-glsdk.git
* GLSDK meta-arago staging tree is hosted at
  git://git.ti.com/glsdk/meta-arago-glsdk.git

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
index 6159262..47915ad 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.ti.com/glsdk/meta-arago-glsdk.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,ti2013.04.02,layers=
+meta-ti,git://git.ti.com/glsdk/meta-ti-glsdk.git,danny,ti2013.04.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4


