Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E33B1529E0
	for <meta-arago@arago-project.org>;
	Wed,  1 Apr 2015 18:48:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t31Im5WE016364
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 13:48:05 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t31Im3me028925
	for <meta-arago@arago-project.org>; Wed, 1 Apr 2015 13:48:03 -0500
Received: from DFLE09.ent.ti.com ([fe80::7090:147d:b5eb:4c12]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0224.002; Wed, 1 Apr 2015 13:48:03 -0500
From: "Stiffler, Jacob" <j-stiffler@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH] packagegroup-arago-tisdk-matrix: Remove
	dual-camera-demo and image-gallery
Thread-Index: AQHQbJ5x8+MMNvpH6U2hHvSxXUCxKZ04f3EQ
Date: Wed, 1 Apr 2015 18:48:02 +0000
Message-ID: <4B26FB5A64EBA14C87266869E037F9581411C776@DFLE09.ent.ti.com>
References: <1427908089-16838-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1427908089-16838-1-git-send-email-j-stiffler@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH] packagegroup-arago-tisdk-matrix: Remove dual-camera-demo and image-gallery
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
X-List-Received-Date: Wed, 01 Apr 2015 18:48:06 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cancel this patch.

- Jake

-----Original Message-----
From: Stiffler, Jacob=20
Sent: Wednesday, April 01, 2015 1:08 PM
To: meta-arago@arago-project.org
Cc: Stiffler, Jacob
Subject: [PATCH] packagegroup-arago-tisdk-matrix: Remove dual-camera-demo a=
nd image-gallery

* dual-camera-demo requires some polishing before it can be presented
  in matrix.
* image-gallery is not useful without dual-camera-demo.
* Demo binaries will remain in filesystem and sources wil remain in
  SDK.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag=
o-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegro=
up-arago-tisdk-matrix.bb
index a006c52..d724f00 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
+++ sdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION =3D "Task to include Matrix v2"
 LICENSE =3D "MIT"
-PR =3D "r37"
+PR =3D "r38"
=20
 inherit packagegroup
=20
@@ -82,8 +82,6 @@ MATRIX_APPS_append_ti43x =3D "        \
     matrix-gui-pm-demos-suspend     \
     matrix-gui-clocks               \
     matrix-gui-pm-demos-governor    \
-    matrix-gui-apps-dual-camera     \
-    matrix-gui-apps-image-gallery   \
     ${@base_conditional('DISTRO_FEATURES', 'wayland', '', 'ts-calibrate-in=
it', d)} \  "
=20
--
1.7.9.5


