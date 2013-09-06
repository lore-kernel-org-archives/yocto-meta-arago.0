Return-Path: <a0132163@swubn01>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5F8BD5299B
	for <meta-arago@arago-project.org>;
	Fri,  6 Sep 2013 04:23:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r864NShf014872
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 23:23:28 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r864NS3p004658
	for <meta-arago@arago-project.org>; Thu, 5 Sep 2013 23:23:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 5 Sep 2013 23:23:28 -0500
Received: from swubn01 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r864NRYg021226;
	Thu, 5 Sep 2013 23:23:28 -0500
Received: from a0132163 by swubn01 with local (Exim 4.71)	(envelope-from
	<a0132163@swubn01>)	id 1VHnZv-0003D8-If; Fri, 06 Sep 2013 09:53:27 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Sep 2013 09:53:25 +0530
Message-ID: <1378441405-12307-1-git-send-email-mrinmayee@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] configs: Lock down the GLSDK release 6.02.00.01
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
X-List-Received-Date: Fri, 06 Sep 2013 04:23:29 -0000
Content-Type: text/plain

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ....01.00-config.txt => glsdk-06.02.01-config.txt} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 copy configs/glsdk/{glsdk-06.01.00-config.txt => glsdk-06.02.01-config.txt} (89%)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.02.01-config.txt
similarity index 89%
copy from configs/glsdk/glsdk-06.01.00-config.txt
copy to configs/glsdk/glsdk-06.02.01-config.txt
index 5708106..969bf55 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.01-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
1.7.0.4


