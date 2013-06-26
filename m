Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B246C52992
	for <meta-arago@arago-project.org>;
	Wed, 26 Jun 2013 12:56:30 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5QCuTI9032643
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 07:56:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5QCuTIr004292
	for <meta-arago@arago-project.org>; Wed, 26 Jun 2013 07:56:29 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Wed, 26 Jun 2013 07:56:29 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH oe-layersetup] configs: Update glsdk
	6.01.00 to	point to GLSDK staging trees
Thread-Index: AQHOcl05YMeQcLYQw0aS6y2oFpeYVplH87xQ
Date: Wed, 26 Jun 2013 12:56:29 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED10159617484@DLEE11.ent.ti.com>
References: <1372244789-11835-1-git-send-email-heroor@ti.com>
In-Reply-To: <1372244789-11835-1-git-send-email-heroor@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH oe-layersetup] configs: Update glsdk 6.01.00 to	point to GLSDK staging trees
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
X-List-Received-Date: Wed, 26 Jun 2013 12:56:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, June 26, 2013 6:06 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH oe-layersetup] configs: Update glsdk
>6.01.00 to point to GLSDK staging trees
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>b/configs/glsdk/glsdk-06.01.00-config.txt
>index 6159262..a4ada4c 100644
>--- a/configs/glsdk/glsdk-06.01.00-config.txt
>+++ b/configs/glsdk/glsdk-06.01.00-config.txt
>@@ -2,9 +2,9 @@
> # repo name,repo uri,repo branch,repo
>commit[,layers=3Dlayer1:layer2...:layern]
>
> bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=3D
>-meta-arago,git://arago-project.org/git/meta-
>arago.git,master,ti2013.04.02,layers=3Dmeta-arago-distro:meta-arago-
>extras
>+meta-arago,git://git.ti.com/glsdk/meta-
>arago.git,master,ti2013.04.02,layers=3Dmeta-arago-distro:meta-arago-
>extras

I have some concern if you are already starting to branch to your own tree.=
  I hope we won't see a large divergence here.

Also, maybe a nitpick but is there a reason you named your repo meta-arago =
and meta-ti on git.ti.com?  I worry that this will cause confusion with the=
 true meta-arago and meta-ti on arago-project.org, particularly since you a=
re using the same tag name too.  Can you rename these like the AMSDK did?

> meta-openembedded,git://git.openembedded.org/meta-
>openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
>=3Dtoolchain-layer:meta-oe
>-meta-ti,git://arago-project.org/git/meta-
>ti.git,danny,ti2013.04.02,layers=3D
>+meta-ti,git://git.ti.com/glsdk/meta-
>ti.git,danny,ti2013.04.02,layers=3D
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

