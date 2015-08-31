Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 58E4252979
	for <meta-arago@arago-project.org>;
	Mon, 31 Aug 2015 14:11:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7VEB0te030386
	for <meta-arago@arago-project.org>; Mon, 31 Aug 2015 09:11:00 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7VEB0bX012951
	for <meta-arago@arago-project.org>; Mon, 31 Aug 2015 09:11:00 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Mon, 31 Aug 2015 09:11:00 -0500
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 3/5] packagegroup-arago-tisdk-graphics*:
	use libgbm, SGX kernel module and user module,
	and img-pvr-sdk for AM3 and AM4
Thread-Index: AQHQ4fIxPGu3AlJ8Vk6D4PPRqmp85p4mJv1g
Date: Mon, 31 Aug 2015 14:10:59 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926AACCBA@DLEE08.ent.ti.com>
References: <1440734514-16165-1-git-send-email-h-gou@ti.com>
	<1440734514-16165-4-git-send-email-h-gou@ti.com>
	<20150829001928.GO26662@edge> <20150829003215.GQ26662@edge>
In-Reply-To: <20150829003215.GQ26662@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/5] packagegroup-arago-tisdk-graphics*: use libgbm, SGX kernel module and user module, and img-pvr-sdk for AM3 and AM4
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
X-List-Received-Date: Mon, 31 Aug 2015 14:11:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Please see below inline.

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Friday, August 28, 2015 8:32 PM
To: Gou, Hongmei
Cc: meta-arago@arago-project.org
Subject: Re: [meta-arago] [PATCH 3/5] packagegroup-arago-tisdk-graphics*: u=
se libgbm, SGX kernel module and user module, and img-pvr-sdk for AM3 and A=
M4

On Fri, Aug 28, 2015 at 08:19:28PM -0400, Denys Dmytriyenko wrote:
> On Fri, Aug 28, 2015 at 12:01:52AM -0400, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-graphics-sdk-host.bb         |  7 +++----
> >  .../packagegroup-arago-tisdk-graphics-sdk-target.bb       | 13 +++++++=
+-----
> >  .../packagegroups/packagegroup-arago-tisdk-graphics.bb    | 15 +++++++=
+++++---
> >  3 files changed, 23 insertions(+), 12 deletions(-)
> >=20
> > diff --git=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-host.bb=20
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-host.bb
> > index a0cbc5c..b601495 100644
> > ---=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-host.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag
> > +++ o-tisdk-graphics-sdk-host.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install graphics sources in SDK"
> >  LICENSE =3D "MIT"
> > -PR =3D "r2"
> > +PR =3D "r3"
> > =20
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > =20
> > @@ -8,9 +8,8 @@ inherit packagegroup
> > =20
> >  GRAPHICS_RDEPENDS =3D ""
> > =20
> > -# SGX modules fail against 4.1
> > -#GRAPHICS_RDEPENDS_append_ti33x =3D " omap3-sgx-modules-src"
> > -#GRAPHICS_RDEPENDS_append_ti43x =3D " omap3-sgx-modules-src"
> > +GRAPHICS_RDEPENDS_append_ti33x =3D " omapdrm-pvr-src"
> > +GRAPHICS_RDEPENDS_append_ti43x =3D " omapdrm-pvr-src"
> > =20
> >  RDEPENDS_${PN} =3D "\
> >      ${GRAPHICS_RDEPENDS} \
> > diff --git=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-target.bb=20
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-target.bb
> > index d36da7e..2cb4ec2 100644
> > ---=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag
> > +++ o-tisdk-graphics-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install graphics binaries on sdk target"
> >  LICENSE =3D "MIT"
> > -PR =3D "r5"
> > +PR =3D "r6"
> > =20
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > =20
> > @@ -9,15 +9,18 @@ inherit packagegroup  GRAPHICS_RDEPENDS =3D ""
> > =20
> >  GRAPHICS_RDEPENDS_ti33x =3D "\
> > -    libgles-omap3-dev \
> > -"
> > +    libgbm-dev \
> > +    omap5-sgx-ddk-um-linux-dev \
> > +    "
> > +
> >  GRAPHICS_RDEPENDS_omap3 =3D "\
> >      libgles-omap3-dev \
> >  "
> > =20
> >  GRAPHICS_RDEPENDS_ti43x =3D "\
> > -    libgles-omap3-dev \
> > -"
> > +    libgbm-dev \
> > +    omap5-sgx-ddk-um-linux-dev \
> > +    "
> > =20
> >  GRAPHICS_RDEPENDS_omap-a15 =3D "\
> >      libgbm-dev \
> > diff --git=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics.bb=20
> > b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics.bb
> > index 8419cde..91bd548 100644
> > ---=20
> > a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> > sdk-graphics.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arag
> > +++ o-tisdk-graphics.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to install graphics binaries"
> >  LICENSE =3D "MIT"
> > -PR =3D "r11"
> > +PR =3D "r12"
> > =20
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> > =20
> > @@ -23,12 +23,21 @@ GRAPHICS_SDK =3D "\  "
> > =20
> >  GRAPHICS_RDEPENDS =3D ""
> > +
> >  GRAPHICS_RDEPENDS_ti33x =3D "\
> > -    ${GRAPHICS_SDK} \
> > +    libgbm \
> > +    omap5-sgx-ddk-um-linux-dev \
>=20
> Why -dev package listed here?
[Hongmei] This is a workaround to get the .so files (e.g., libEGL.so, libGL=
ES_CM.so) copied to the target file system. AM3/AM4 imagination demo binari=
es are prebuilt and they have dependency on .so files instead of .so.[1 dig=
it] files. Without the .so files on the target file system, we cannot run t=
he pre-built imagination demo binaries on AM3/AM4.

>=20
>=20
> > +    omap5-sgx-ddk-um-linux \
> > +    omapdrm-pvr \
> > +    img-pvr-sdk \

Moreover, img-pvr-sdk (3D demos) are already pulled by corresponding Matrix=
 demos. Any specific reason for the redundancy?
[Hongmei] Agree, no need to have the redundancy here.

> >  "
> > =20
> >  GRAPHICS_RDEPENDS_ti43x =3D "\
> > -    ${GRAPHICS_SDK} \
> > +    libgbm \
> > +    omap5-sgx-ddk-um-linux-dev \
>=20
> And here?
[Hongmei] The same reason as above.

>=20
>=20
> > +    omap5-sgx-ddk-um-linux \
> > +    omapdrm-pvr \
> > +    img-pvr-sdk \
> >  "
> > =20
> >  GRAPHICS_RDEPENDS_omap3 =3D "\
> > --=20
> > 1.9.1
> >=20
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

