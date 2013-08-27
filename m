Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4EB6952090
	for <meta-arago@arago-project.org>;
	Tue, 27 Aug 2013 08:11:21 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7R8BGK3002788
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 03:11:17 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7R8BEGQ023783
	for <meta-arago@arago-project.org>; Tue, 27 Aug 2013 03:11:15 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Tue, 27 Aug 2013 16:11:14 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] configs: Lock down the GLSDK release 6.02.00.01
Thread-Index: AQHOouYHEM3qvG2HmkmAqtj5JBnrVZmos9Fw
Date: Tue, 27 Aug 2013 08:11:13 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D54454A4@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
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
X-List-Received-Date: Tue, 27 Aug 2013 08:11:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 ....01.00-config.txt =3D> glsdk-06.02.00-config.txt} |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)  copy configs/glsdk/{glsd=
k-06.01.00-config.txt =3D> glsdk-06.02.00-config.txt} (89%)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-=
06.02.00-config.txt
similarity index 89%
copy from configs/glsdk/glsdk-06.01.00-config.txt
copy to configs/glsdk/glsdk-06.02.00-config.txt
index 5708106..969bf55 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.00-config.txt
@@ -2,9 +2,9 @@
 # repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2...:la=
yern]
=20
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=3D
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny=
,DEV_SDK_06_01_00_01,layers=3Dmeta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,da
+nny,DEV_SDK_06_02_00_01,layers=3Dmeta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f0002=
8caf257e386c0f3ae46bd4b3ba53dd0729d,layers=3Dtoolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_S=
DK_06_01_00_01,layers=3D
+meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DE
+V_SDK_06_02_00_01,layers=3D
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558f=
a4304592622423582f8b464e1c22cfe6f1,layers=3D
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34c=
acf5cb349949a15e27084efbf,layers=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
--
1.7.0.4


