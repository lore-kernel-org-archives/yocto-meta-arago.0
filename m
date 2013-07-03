Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id ABDF9529F7
	for <meta-arago@arago-project.org>;
	Wed,  3 Jul 2013 05:31:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r635VIvj024964
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2013 00:31:18 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r635VIX5010526
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2013 00:31:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 3 Jul 2013 00:31:18 -0500
Received: from ti.com (swubn01.india.ti.com [172.24.162.214])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with SMTP id r635VGQN007511;
	Wed, 3 Jul 2013 00:31:17 -0500
Date: Wed, 3 Jul 2013 11:01:16 +0530
From: Siddharth Heroor <heroor@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20130703053116.GA8021@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH oe-layersetup] configs: Lock down the GLSDK release 6.01.00.01
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
X-List-Received-Date: Wed, 03 Jul 2013 05:31:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
index 149a8ae..5708106 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,ti2013.04.02,layers=
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4


