Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 93696529A7
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 22:30:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HMUU1i023084
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 17:30:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HMUU9F005543
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 17:30:30 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.02.0342.003; Tue, 17 Sep 2013 17:30:30 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
	file	system image
Thread-Index: AQHOs9RYbYw2lIu++ki1pvSn43bTPZnKgyCA
Date: Tue, 17 Sep 2013 22:30:30 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101597332E5@DLEE11.ent.ti.com>
References: <1379445202-31364-1-git-send-email-fcooper@ti.com>
In-Reply-To: <1379445202-31364-1-git-send-email-fcooper@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] tisdk-rootfs-base-image: Rename base file	system image
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
X-List-Received-Date: Tue, 17 Sep 2013 22:30:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

You will need to update the setup script as well right?  Because I think th=
is would also match the expression used to find the rootfs used for the NFS=
 setup

>-----Original Message-----
>From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
>bounces@arago-project.org] On Behalf Of Cooper Jr., Franklin
>Sent: Tuesday, September 17, 2013 3:13 PM
>To: meta-arago@arago-project.org
>Cc: Cooper Jr., Franklin
>Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename
>base file system image
>
>* People are frequently confused by the difference in naming
>between the minimal
>  file system and the larger file system.
>* Rename the minimal file system to mimic the naming convention of
>the larger
>  file system.
>
>Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>---
> ...e-tisdk-image.bb =3D> tisdk-rootfs-base-image.bb} |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
> rename meta-arago-distro/recipes-core/images/{arago-base-tisdk-
>image.bb =3D> tisdk-rootfs-base-image.bb} (87%)
>
>diff --git a/meta-arago-distro/recipes-core/images/arago-base-
>tisdk-image.bb b/meta-arago-distro/recipes-core/images/tisdk-
>rootfs-base-image.bb
>similarity index 87%
>rename from meta-arago-distro/recipes-core/images/arago-base-
>tisdk-image.bb
>rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
>image.bb
>index 2c0e217..a3a9123 100644
>--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-
>image.bb
>+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-
>image.bb
>@@ -12,4 +12,4 @@ IMAGE_INSTALL +=3D "\
>     packagegroup-arago-base-tisdk \
>     "
>
>-export IMAGE_BASENAME =3D "arago-base-tisdk-image"
>+export IMAGE_BASENAME =3D "tisdk-rootfs-base-image"
>--
>1.7.0.4
>
>_______________________________________________
>meta-arago mailing list
>meta-arago@arago-project.org
>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

