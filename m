Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 442455299D
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2013 19:57:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r9EJv8EX031358
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:57:08 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r9EJv881009391
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2013 14:57:08 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Mon, 14 Oct 2013 14:57:08 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [PATCH 1/3] arago-core-tisdk-image: Add AM437x DTB filter
Thread-Index: AQHOyRCVjV9hX4K/fUO5pLvP38Df6Jn0nOZg
Date: Mon, 14 Oct 2013 19:57:07 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597AE9FC@DLEE11.ent.ti.com>
References: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1381780588-15865-1-git-send-email-Chase.Maupin@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] arago-core-tisdk-image: Add AM437x DTB filter
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
X-List-Received-Date: Mon, 14 Oct 2013 19:57:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

This patch set is deprecated by the next patch set which adds a fourth patc=
h.


>-----Original Message-----
>From: Maupin, Chase
>Sent: Monday, October 14, 2013 2:56 PM
>To: meta-arago@arago-project.org
>Cc: Maupin, Chase
>Subject: [PATCH 1/3] arago-core-tisdk-image: Add AM437x DTB filter
>
>* Add the DTB_FILTER setting for am437x-evm devices
>
>Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
>---
> .../recipes-core/images/arago-core-tisdk-image.inc |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-core-
>tisdk-image.inc b/meta-arago-distro/recipes-core/images/arago-
>core-tisdk-image.inc
>index 1d00117..368fa47 100644
>--- a/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>+++ b/meta-arago-distro/recipes-core/images/arago-core-tisdk-
>image.inc
>@@ -20,6 +20,7 @@ DTB_FILTER =3D "unknown"
> DTB_FILTER_ti33x =3D "am335x"
> DTB_FILTER_omap5-evm =3D "omap5"
> DTB_FILTER_dra7xx-evm =3D "dra7"
>+DTB_FILTER_ti43x =3D "am43x"
>
> # List of target side images to build for the SDK
> TARGET_IMAGES =3D "arago-base-tisdk-image tisdk-rootfs-image"
>--
>1.7.0.4


