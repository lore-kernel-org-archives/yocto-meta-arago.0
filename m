Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 87A9652990
	for <meta-arago@arago-project.org>;
	Mon,  1 Jul 2013 17:52:33 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r61HqW6N017554;
	Mon, 1 Jul 2013 12:52:32 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r61HqWpi012801;
	Mon, 1 Jul 2013 12:52:32 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Mon, 1 Jul 2013 12:52:32 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 2/2] arago-test-image: fixes for RAMDISK
	usage
Thread-Index: AQHOdnhi1g4Fq/brb02n9549i+WDg5lQGn4Q
Date: Mon, 1 Jul 2013 17:52:32 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015962C5BA@DLEE11.ent.ti.com>
References: <1372696212-29133-1-git-send-email-denis@denix.org>
	<1372696212-29133-2-git-send-email-denis@denix.org>
In-Reply-To: <1372696212-29133-2-git-send-email-denis@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] arago-test-image: fixes for RAMDISK usage
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
X-List-Received-Date: Mon, 01 Jul 2013 17:52:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
>Sent: Monday, July 01, 2013 11:30 AM
>To: meta-arago@arago-project.org
>Subject: [meta-arago] [PATCH 2/2] arago-test-image: fixes for
>RAMDISK usage
>
>From: Denys Dmytriyenko <denys@ti.com>
>
>* Build tar.gz and ext2.gz - good for RAMDISK/SD/NFS
>* Relax compatibility list to be generic
>* Remove large multimedia packagegroup to better fit into RAM
>

Why not squash this with the previous patch?

>Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>Cc: Carlos Hernandez <ceh@ti.com>
>---
> meta-arago-distro/recipes-core/images/arago-test-image.bb | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-test-
>image.bb b/meta-arago-distro/recipes-core/images/arago-test-
>image.bb
>index 49e5a8d..403041f 100644
>--- a/meta-arago-distro/recipes-core/images/arago-test-image.bb
>+++ b/meta-arago-distro/recipes-core/images/arago-test-image.bb
>@@ -5,14 +5,13 @@ LIC_FILES_CHKSUM =3D
>"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3
>
> require arago-image.inc
>
>-COMPATIBLE_MACHINE =3D
>"omap3|dm365|omapl138|ti813x|ti814x|ti816x|omap4|ti33x"
>+IMAGE_FSTYPES =3D "tar.gz ext2.gz"
>
> IMAGE_INSTALL +=3D "\
>     packagegroup-arago-base \
>     packagegroup-arago-console \
>     packagegroup-arago-base-tisdk \
>     packagegroup-arago-tisdk-crypto \
>-    packagegroup-arago-tisdk-multimedia \
>     packagegroup-arago-tisdk-addons \
>     packagegroup-arago-test \
>     packagegroup-arago-test-addons \
>--
>1.8.2.1
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

