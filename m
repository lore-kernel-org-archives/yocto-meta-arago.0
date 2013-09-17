Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 261DA529CB
	for <meta-arago@arago-project.org>;
	Tue, 17 Sep 2013 19:52:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8HJqOWE029532
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 14:52:24 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8HJqNIT021074
	for <meta-arago@arago-project.org>; Tue, 17 Sep 2013 14:52:24 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.02.0342.003; Tue, 17 Sep 2013 14:52:23 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base
	file	system image
Thread-Index: AQHOs9RYa6f2a+hGwUyg4R1GelO0A5nKVWOw
Date: Tue, 17 Sep 2013 19:52:23 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE72E8A07BE@DLEE08.ent.ti.com>
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
X-List-Received-Date: Tue, 17 Sep 2013 19:52:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

What was the initial reason to start naming rootfs images with tisdk-rootfs=
- prefix? I remember it was something forced by the SDK setup...


-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org] On Behalf Of Cooper Jr., Franklin
Sent: Tuesday, September 17, 2013 3:13 PM
To: meta-arago@arago-project.org
Cc: Cooper Jr., Franklin
Subject: [meta-arago] [PATCH 1/2] tisdk-rootfs-base-image: Rename base file=
 system image

* People are frequently confused by the difference in naming between the mi=
nimal
  file system and the larger file system.
* Rename the minimal file system to mimic the naming convention of the larg=
er
  file system.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...e-tisdk-image.bb =3D> tisdk-rootfs-base-image.bb} |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)  rename meta-arago-distro=
/recipes-core/images/{arago-base-tisdk-image.bb =3D> tisdk-rootfs-base-imag=
e.bb} (87%)

diff --git a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.b=
b b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
similarity index 87%
rename from meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
rename to meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
index 2c0e217..a3a9123 100644
--- a/meta-arago-distro/recipes-core/images/arago-base-tisdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-base-image.bb
@@ -12,4 +12,4 @@ IMAGE_INSTALL +=3D "\
     packagegroup-arago-base-tisdk \
     "
=20
-export IMAGE_BASENAME =3D "arago-base-tisdk-image"
+export IMAGE_BASENAME =3D "tisdk-rootfs-base-image"
--
1.7.0.4

_______________________________________________
meta-arago mailing list
meta-arago@arago-project.org
http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

