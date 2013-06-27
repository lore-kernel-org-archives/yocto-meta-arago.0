Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E3AAD52A61
	for <meta-arago@arago-project.org>;
	Thu, 27 Jun 2013 12:05:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5RC5fTX018892
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 07:05:42 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5RC5fvf026177
	for <meta-arago@arago-project.org>; Thu, 27 Jun 2013 07:05:41 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 27 Jun 2013 07:05:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([2002:9daa:aa08::9daa:aa08]) with mapi id
	14.02.0342.003; Thu, 27 Jun 2013 07:05:41 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Heroor, Siddharth" <heroor@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCHv2 oe-layersetup] configs: Update glsdk
	6.01.00	to point to GLSDK staging trees
Thread-Index: AQHOcvD4gTLJiHMdfUmoxOurjdXXT5lJd0oQ
Date: Thu, 27 Jun 2013 12:05:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015961B784@DLEE11.ent.ti.com>
References: <1372308234-6315-1-git-send-email-heroor@ti.com>
In-Reply-To: <1372308234-6315-1-git-send-email-heroor@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCHv2 oe-layersetup] configs: Update glsdk 6.01.00	to point to GLSDK staging trees
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
X-List-Received-Date: Thu, 27 Jun 2013 12:05:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Acked-by: Chase Maupin <chase.maupin@ti.com>

Thanks for changing the name.

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Heroor, Siddharth
>Sent: Wednesday, June 26, 2013 11:44 PM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCHv2 oe-layersetup] configs: Update
>glsdk 6.01.00 to point to GLSDK staging trees
>
>* Follow the AMSDK model of having staging trees to tag releases.
>* GLSDK meta-ti staging tree is hosted at
>  git://git.ti.com/glsdk/meta-ti-glsdk.git
>* GLSDK meta-arago staging tree is hosted at
>  git://git.ti.com/glsdk/meta-arago-glsdk.git
>
>Signed-off-by: Siddharth Heroor <heroor@ti.com>
>cc: Mrinmayee Hingolikar <mrinmayee@ti.com>
>---
> configs/glsdk/glsdk-06.01.00-config.txt |    4 ++--
> 1 files changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/configs/glsdk/glsdk-06.01.00-config.txt
>b/configs/glsdk/glsdk-06.01.00-config.txt
>index 6159262..47915ad 100644
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
>+meta-arago,git://git.ti.com/glsdk/meta-arago-
>glsdk.git,master,ti2013.04.02,layers=3Dmeta-arago-distro:meta-arago-
>extras
> meta-openembedded,git://git.openembedded.org/meta-
>openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers
>=3Dtoolchain-layer:meta-oe
>-meta-ti,git://arago-project.org/git/meta-
>ti.git,danny,ti2013.04.02,layers=3D
>+meta-ti,git://git.ti.com/glsdk/meta-ti-
>glsdk.git,danny,ti2013.04.02,layers=3D
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

