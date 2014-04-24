Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5CE4852974
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 06:09:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3O69gJO032403
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:09:42 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O69f9q001478
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:09:42 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 24 Apr 2014 01:09:41 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O69eKu000497	for
	<meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:09:41 -0500
Date: Thu, 24 Apr 2014 11:39:40 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140424060940.GA26533@ti.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: [PATCH] configs: Lock down the configs for 06.02.01.02
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
X-List-Received-Date: Thu, 24 Apr 2014 06:09:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.02.01.02-config.txt |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 configs/glsdk/glsdk-06.02.01.02-config.txt

diff --git a/configs/glsdk/glsdk-06.02.01.02-config.txt b/configs/glsdk/glsdk-06.02.01.02-config.txt
new file mode 100644
index 0000000..52a4229
--- /dev/null
+++ b/configs/glsdk/glsdk-06.02.01.02-config.txt
@@ -0,0 +1,11 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
-- 
1.7.0.4


