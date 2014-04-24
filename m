Return-Path: <mrinmayee@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8D33C52A23
	for <meta-arago@arago-project.org>;
	Thu, 24 Apr 2014 06:20:48 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s3O6KkGJ001048
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 01:20:47 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s3O6KiFo007103
	for <meta-arago@arago-project.org>; Thu, 24 Apr 2014 11:50:45 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Thu, 24 Apr 2014 11:50:43 +0530
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] configs: Config for the GLSDK 6.03.00.01
Thread-Index: AQHPX4UrpMa2x1DuukaFUkDCANC7r5sgS3kA
Date: Thu, 24 Apr 2014 06:20:43 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D54BA317@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 24 Apr 2014 06:20:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Vivek Bardia <x0161644@ti.com>
---
 configs/glsdk/glsdk-06.03.00.01-config.txt |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/glsdk/glsdk-06.03.00.01-config.txt

diff --git a/configs/glsdk/glsdk-06.03.00.01-config.txt b/configs/glsdk/gls=
dk-06.03.00.01-config.txt
new file mode 100644
index 0000000..551a2e6
--- /dev/null
+++ b/configs/glsdk/glsdk-06.03.00.01-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format # repo name,repo uri,repo=20
+branch,repo commit[,layers=3Dlayer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87
+379bf629066f6662458,layers=3D=20
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,ma
+ster,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=3Dmeta-arago-distro:
+meta-arago-extras=20
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea20
+3c78003cccd2547075fd720f,layers=3D=20
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44
+754206632dd5b0725aeb43e99e4ff9e0245dca,layers=3Dtoolchain-layer:meta-netw
+orking:meta-ruby:meta-oe=20
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,69
+1ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=3D
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f
+78d6eff14ada3f2bc960e81883b27a10afecc,layers=3Dmeta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b9
+7c19610bfb38f02174c4e8aeeb15,layers=3Dmeta
+OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
+OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
--
1.7.9.5


