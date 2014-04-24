Return-Path: <vivek.bardia@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 971B852A23
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 06:16:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3O6Gh8g003419
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:16:44 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O6GhhN006977
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:16:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 01:16:43 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O6Gguc005517	for
	<meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:16:43 -0500
From: Vivek Bardia <x0161644@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140424061642.GA26670@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Mailman-Approved-At: Thu, 05 Jun 2014 15:53:33 +0000
Subject: [PATCH] configs: Config for the GLSDK 6.03.00.01
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
Date: Thu, 24 Apr 2014 06:16:44 -0000
X-Original-Date: Thu, 24 Apr 2014 11:46:42 +0530
X-List-Received-Date: Thu, 24 Apr 2014 06:16:44 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Vivek Bardia <x0161644@ti.com>
---
 configs/glsdk/glsdk-06.03.00.01-config.txt |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/glsdk/glsdk-06.03.00.01-config.txt

diff --git a/configs/glsdk/glsdk-06.03.00.01-config.txt b/configs/glsdk/glsdk-06.03.00.01-config.txt
new file mode 100644
index 0000000..551a2e6
--- /dev/null
+++ b/configs/glsdk/glsdk-06.03.00.01-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,691ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


