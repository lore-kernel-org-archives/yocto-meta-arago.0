Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0C6D852A3E
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 16:36:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LGafJB028448
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 11:36:41 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LGafms004898
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 11:36:41 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Wed, 21 May 2014 11:36:40 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Zhang, Hao" <hzhang@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [Re-submit: v3] keystone: tisdk-image: change
	TARGET_IMAGES from keystone-evm to k2hk-evm
Thread-Index: AQHPdP3zx8przMWbs0q2DujvBhbg5JtLO59g
Date: Wed, 21 May 2014 16:36:40 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D039853@DLEE11.ent.ti.com>
References: <1400681214-9143-1-git-send-email-hzhang@ti.com>
In-Reply-To: <1400681214-9143-1-git-send-email-hzhang@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [Re-submit: v3] keystone: tisdk-image: change	TARGET_IMAGES from keystone-evm to k2hk-evm
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
X-List-Received-Date: Wed, 21 May 2014 16:36:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Zhang, Hao
>Sent: Wednesday, May 21, 2014 9:07 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [Re-submit: v3] keystone: tisdk-image:
>change TARGET_IMAGES from keystone-evm to k2hk-evm
>
>From: Hao Zhang <hzhang@ti.com>
>
>Keystone II SoC family has multiple devices and EVM's: k2hk, k2l
>and k2e.
>All the EVM's share the same core tisdk image. The TARGET_IMAGES
>should
>be set to keystone SoC family rather than a keystone EVM machine
>config.

Looks good to me

>
>Signed-off-by: Hao Zhang <hzhang@ti.com>
>---
> .../recipes-core/images/arago-core-tisdk-image.inc |    2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-core-
>tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-
>core-tisdk-image.inc
>index f25db51..1dd9d6d 100644
>--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>@@ -27,7 +27,7 @@ DTB_FILTER_keystone =3D "k2hk"
> TARGET_IMAGES =3D "arago-base-tisdk-image tisdk-rootfs-image"
>
> # Some devices do not support display and use a server image
>instead
>-TARGET_IMAGES_keystone-evm =3D "arago-base-tisdk-image tisdk-
>server-rootfs-image"
>+TARGET_IMAGES_keystone =3D "arago-base-tisdk-image tisdk-server-
>rootfs-image"
>
> TISDK_TOOLCHAIN =3D "meta-toolchain-arago-tisdk"
>
>--
>1.7.9.5
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

