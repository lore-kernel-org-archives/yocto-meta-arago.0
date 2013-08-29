Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 78208529E4
	for <meta-arago@arago-project.org>;
	Thu, 29 Aug 2013 06:57:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7T6vQ2G022359
	for <meta-arago@arago-project.org>; Thu, 29 Aug 2013 01:57:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7T6vQXM012471
	for <meta-arago@arago-project.org>; Thu, 29 Aug 2013 01:57:26 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 29 Aug 2013 01:57:26 -0500
Received: from [172.24.157.63] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7T6vPcf019856	for
	<meta-arago@arago-project.org>; Thu, 29 Aug 2013 01:57:25 -0500
Message-ID: <521EF0D4.6000201@ti.com>
Date: Thu, 29 Aug 2013 12:27:24 +0530
From: Mrinmayee Hingolikar <mrinmayee@ti.com>
Organization: Texas Instruments
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <521EF0A9.3050608@ti.com>
In-Reply-To: <521EF0A9.3050608@ti.com>
X-Forwarded-Message-Id: <521EF0A9.3050608@ti.com>
Subject: [PATCH] configs: Lock down the GLSDK release 6.02.00.01
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
X-List-Received-Date: Thu, 29 Aug 2013 06:57:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit


Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ....01.00-config.txt => glsdk-06.02.00-config.txt} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 copy configs/glsdk/{glsdk-06.01.00-config.txt => glsdk-06.02.00-config.txt} (89%)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.02.00-config.txt
similarity index 89%
copy from configs/glsdk/glsdk-06.01.00-config.txt
copy to configs/glsdk/glsdk-06.02.00-config.txt
index 5708106..969bf55 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.00-config.txt
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








