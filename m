Return-Path: <a0875592@swubn01>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 933855209B
	for <meta-arago@arago-project.org>;
	Sat, 29 Jun 2013 06:57:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5T6vMRH019508
	for <meta-arago@arago-project.org>; Sat, 29 Jun 2013 01:57:22 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5T6vME3004418
	for <meta-arago@arago-project.org>; Sat, 29 Jun 2013 01:57:22 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 29 Jun 2013 01:57:22 -0500
Received: from swubn01 (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5T6vLYI020813;
	Sat, 29 Jun 2013 01:57:22 -0500
Received: from a0875592 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0875592@swubn01>)	id 1Usp61-00080J-D8; Sat, 29 Jun 2013 12:27:21 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 29 Jun 2013 12:27:01 +0530
Message-ID: <1372489021-30635-1-git-send-email-heroor@ti.com>
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
X-List-Received-Date: Sat, 29 Jun 2013 06:57:23 -0000
Content-Type: text/plain

* Follow the AMSDK model of having staging trees to tag releases.
* GLSDK meta-ti staging tree is hosted at
  git://git.ti.com/glsdk/meta-ti-glsdk.git
* GLSDK meta-arago staging tree is hosted at
  git://git.ti.com/glsdk/meta-arago-glsdk.git

v2:

* Use staging trees on arago-project.org instead of git.ti.com.
  The GLSDK meta-ti tree is at
  git://arago-project.org/git/projects/meta-ti-glsdk.git
  and the GLSDK meta-arago tree is at
  git://arago-project.org/git/projects/meta-arago-glsdk.git

Signed-off-by: Siddharth Heroor <heroor@ti.com>
cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
index 6159262..149a8ae 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,ti2013.04.02,layers=
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,ti2013.04.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4


