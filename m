Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id B8FC552A5E
	for <meta-arago@arago-project.org>;
	Mon,  8 Jul 2013 16:37:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r68GbnFW010386
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2013 11:37:49 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r68GbnQt027601
	for <meta-arago@arago-project.org>; Mon, 8 Jul 2013 11:37:49 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 8 Jul 2013 11:37:49 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH oe-layersetup] configs: Lock down the
	GLSDK	release 6.01.00.01
Thread-Index: AQHOd669Clkt7dmEqUCtPAYfebn0qJlbA4AQ
Date: Mon, 8 Jul 2013 16:37:48 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015963DBBB@DLEE11.ent.ti.com>
References: <20130703053116.GA8021@ti.com>
In-Reply-To: <20130703053116.GA8021@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH oe-layersetup] configs: Lock down the GLSDK	release 6.01.00.01
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
X-List-Received-Date: Mon, 08 Jul 2013 16:37:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, July 03, 2013 12:31 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH oe-layersetup] configs: Lock down the
>GLSDK release 6.01.00.01
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>---
> configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>b/configs/glsdk/glsdk-06.01.00-config.txt
>index 149a8ae..5708106 100644
>--- a/configs/glsdk/glsdk-06.01.00-config.txt
>+++ b/configs/glsdk/glsdk-06.01.00-config.txt
>@@ -2,9 +2,9 @@
> # repo name,repo uri,repo branch,repo
>commit[,layers=3Dlayer1:layer2...:layern]
>
> bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=3D
>-meta-arago,git://arago-project.org/git/projects/meta-arago-
>glsdk.git,master,ti2013.04.02,layers=3Dmeta-arago-distro:meta-arago-
>extras
>+meta-arago,git://arago-project.org/git/projects/meta-arago-
>glsdk.git,danny,DEV_SDK_06_01_00_01,layers=3Dmeta-arago-distro:meta-
>arago-extras
> meta-openembedded,git://git.openembedded.org/meta-
>openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
>=3Dtoolchain-layer:meta-oe
>-meta-ti,git://arago-project.org/git/projects/meta-ti-
>glsdk.git,danny,ti2013.04.02,layers=3D
>+meta-ti,git://arago-project.org/git/projects/meta-ti-
>glsdk.git,danny,DEV_SDK_06_01_00_01,layers=3D
> meta-linaro,git://git.linaro.org/openembedded/meta-
>linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=3D
> oe-core,git://git.openembedded.org/openembedded-
>core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=3Dmeta
> OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

