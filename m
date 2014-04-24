Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9ECCA52974
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 06:14:39 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3O6EcvW000376
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:14:38 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O6Ec8U029367
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:14:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 01:14:38 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O6EbWS022640	for
	<meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:14:38 -0500
Date: Thu, 24 Apr 2014 11:44:37 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140424061437.GA26632@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] configs: Config for the GLSDK 6.04.00.02
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
X-List-Received-Date: Thu, 24 Apr 2014 06:14:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.04.00.02-config.txt |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 configs/glsdk/glsdk-06.04.00.02-config.txt

diff --git a/configs/glsdk/glsdk-06.04.00.02-config.txt b/configs/glsdk/glsdk-06.04.00.02-config.txt
new file mode 100644
index 0000000..07fb9c3
--- /dev/null
+++ b/configs/glsdk/glsdk-06.04.00.02-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,283813dffe8633af04c87faedb4c601518fa3a9c,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,96fae48172519a621bb38c875a0b0e89a198868c,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.0.4


