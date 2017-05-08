Return-Path: <sam.nelson@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6CCF852A35
	for <meta-arago@arago-project.org>;
	Mon,  8 May 2017 14:08:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v48E8hrd024187
	for <meta-arago@arago-project.org>; Mon, 8 May 2017 09:08:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494252523;
	bh=25A4AsA2zXrH962ZvWS5efu0iqKDNIvh4LQdJ+e2q+4=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yU46HP8RDYCln+ijxiY2bGShY81AXDkRclQ8VIYQ2dQwqlH5GKu+BxtfOECmfc5yx
	guJeincJFZj7t2T2OtN0XJL5VriKdk1j4pdjgxROGbzEUcVmriMaHx2f+Ru8x4wEJ5
	cAB4D3SruE5QJIE5qSLWJEA94XKjDGtwp24nkUZg=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v48E8gQC005184
	for <meta-arago@arago-project.org>; Mon, 8 May 2017 09:08:43 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 8 May 2017 09:08:42 -0500
From: "Nelson, Sam" <sam.nelson@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/master][PATCH v2 1/2]
	arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package for k2
	and omapl138
Thread-Index: AQHSxgU4RproExjkLUGJP/w6JKgGLaHqfDiA
Date: Mon, 8 May 2017 14:08:41 +0000
Message-ID: <4F9216F96E5DF9428610502835A9F490585D7CD1@DLEE11.ent.ti.com>
References: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
	<20170506010806.GN20769@edge>
In-Reply-To: <20170506010806.GN20769@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/master][PATCH v2 1/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package for k2 and omapl138
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
X-List-Received-Date: Mon, 08 May 2017 14:08:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for looking into this and providing a fix.
One solution, moving forward, I am thinking is to rename the packagegroup-a=
rago-base-tisdk-server-extra--> packagegroup-arago-base-tisdk-server.
Let me know if this makes sense.
With regards,
Sam

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Friday, May 05, 2017 9:08 PM
> To: Nelson, Sam
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/master][PATCH v2 1/2] arago-base-tisdk-
> server-extra: Add ti-ipc-examples-linux package for k2 and omapl138
>=20
> Sam,
>=20
> Sorry for misleading you - I was under the impression that server-extra
> packagegroup is the one responsible for server-extra image... Apparently =
it is
> not and server-extra packagegroup goes directly into the main server imag=
e.
>=20
> Once it failed again for the same reason, I finally looked into it closer=
 and the
> way to feed into server-extra image is through EXTRA_PACKAGES variable
> inside the tisdk-addons packagegroup. I sent a reworked patch after testi=
ng it
> locally. Sorry again for the confusion.
>=20
> BTW, we need to fix this going forward, as it's not very intuitive...
>=20
> --
> Denys
>=20
>=20
> On Thu, May 04, 2017 at 11:02:25PM -0400, Sam Nelson wrote:
> > ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
> > examples
> >
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >
> > ---
> > Updated PR
> > ---
> > ---
> >  .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       =
| 4
> +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
> > index 784c5b4..d9b3391 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk-server-extra.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> base-tisdk-server-extra.bb
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION =3D "Additional packages beyond console packages shared by=
 TI
> SDKs"
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D
> "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de
> 20420"
> > -PR =3D "r16"
> > +PR =3D "r17"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -106,6 +106,7 @@ ARAGO_TI_KEYSTONE_PKGS =3D "\
> >      ipsecmgr-mod \
> >      k2-initramfs \
> >      parse-ip \
> > +    ti-ipc-examples-linux \
> >      "
> >
> >  # The following packages are not yet ready for k2g-evm
> > @@ -116,6 +117,7 @@ ARAGO_TI_KEYSTONE_PKGS =3D "\
> >
> >  ARAGO_TI_PKGS =3D ""
> >  ARAGO_TI_PKGS_append_keystone =3D " ${ARAGO_TI_KEYSTONE_PKGS}"
> > +ARAGO_TI_PKGS_append_omapl138 =3D " ti-ipc-examples-linux"
> >
> >  # Disable netapi due to libnl and xfrm conflict
> >  #    netapi
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

