Return-Path: <mrinmayee@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C490152A1B
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 06:04:44 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6J64hCP007911
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:04:43 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6J64fYD031908
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:04:41 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 14:04:40 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH-oe-layersetup 2/2] configs : Override OECORELOCALCONF
	to use the glsdk.conf.sample.
Thread-Index: AQHOe8e+09WYEfgsSEeOk4avdpUTa5lrlBOQ
Date: Fri, 19 Jul 2013 06:04:41 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D544075F@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCH-oe-layersetup 2/2] configs : Override OECORELOCALCONF to use the glsdk.conf.sample.
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
X-List-Received-Date: Fri, 19 Jul 2013 06:04:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

 * The OECORELOCALCONF variable specifies the conf.sample file to be used
   to generate local.conf.
 * Overriding it to the GLSDK conf.sample that contains the GLSDK branding.

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
---
 configs/glsdk/glsdk-06.01.00-config.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-=
06.01.00-config.txt
index 051740c..53b05c8 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -8,4 +8,4 @@ meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.=
git,danny,af963268939
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558f=
a4304592622423582f8b464e1c22cfe6f1,layers=3D
 oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34c=
acf5cb349949a15e27084efbf,layers=3Dmeta
 OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
-OECORELOCALCONF=3D./sample-files/local-arago.conf.sample
+OECORELOCALCONF=3D./sample-files/local-glsdk.conf.sample
--=20
1.7.0.4


