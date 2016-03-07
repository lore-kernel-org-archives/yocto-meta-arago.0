Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A260052A26
	for <meta-arago@arago-project.org>;
	Mon,  7 Mar 2016 23:41:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u27Nf8jn009368;
	Mon, 7 Mar 2016 17:41:08 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u27Nf8Cx001471;
	Mon, 7 Mar 2016 17:41:08 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0224.002; Mon, 7 Mar 2016 17:41:08 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only add
	multimedia when alsa is enabled
Thread-Index: AQHReLb5iF+Loi5mdE6CYAzqrxE3z59OkawwgABnPYD//6nrIA==
Date: Mon, 7 Mar 2016 23:41:07 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926B90C50@DLEE08.ent.ti.com>
References: <1457385534-2153-1-git-send-email-denis@denix.org>
	<2E957F12D11D904590FA9AF86D366BD926B90A8B@DLEE08.ent.ti.com>
	<20160307224417.GI14393@edge>
In-Reply-To: <20160307224417.GI14393@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tisdk-server-extra-rootfs-image: only add multimedia when alsa is enabled
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
X-List-Received-Date: Mon, 07 Mar 2016 23:41:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

In the current recipes, packagegroup-arago-tisdk-multimedia is equivalent t=
o packagegroup-*-gst for keystone. We used packagegroup-arago-tisdk-multime=
dia to allow additions in the future for keystone, e.g., testing clips. For=
 dsp66 gst plugins, we are planning some demos from file to file, or using =
Ethernet as the input/output source.

Thanks,
Hongmei

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Monday, March 07, 2016 5:44 PM
> To: Gou, Hongmei
> Cc: Denys Dmytriyenko; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only a=
dd
> multimedia when alsa is enabled
>=20
> Hongmei,
>=20
> So, why not include packagegroup-*-gst instead if you only need gstreamer=
?
> What kind of multimedia there is for Keystone?
>=20
> --
> Denys
>=20
>=20
> On Mon, Mar 07, 2016 at 10:40:43PM +0000, Gou, Hongmei wrote:
> > Hi Denys,
> >
> > Multimedia/gstreamer packagegroup is needed for all K2 platforms due to
> the reasons below:
> >
> > 1. OpenCV is intended for all K2 platforms, which has dependency on
> gstreamer
> > 2. The dsp66 GST plugin (a new feature in the coming Processor SDK 2.0.=
2
> release) is intended for all K2 platforms, which needs gstreamer also
> >
> > Thanks,
> > Hongmei
> >
> > > -----Original Message-----
> > > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > > Sent: Monday, March 07, 2016 4:19 PM
> > > To: meta-arago@arago-project.org
> > > Subject: [meta-arago] [PATCH] tisdk-server-extra-rootfs-image: only a=
dd
> > > multimedia when alsa is enabled
> > >
> > > From: Denys Dmytriyenko <denys@ti.com>
> > >
> > > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > > ---
> > >  .../recipes-core/images/tisdk-server-extra-rootfs-image.bb          =
    | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra=
-
> rootfs-
> > > image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-
> > > rootfs-image.bb
> > > index 432f421..51237cb 100644
> > > --- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs=
-
> > > image.bb
> > > +++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs=
-
> > > image.bb
> > > @@ -3,7 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-
> image.bb
> > >  IMAGE_INSTALL +=3D "\
> > >      packagegroup-arago-test-addons \
> > >      packagegroup-arago-tisdk-addons-extra \
> > > -    packagegroup-arago-tisdk-multimedia \
> > > +    ${@base_contains('MACHINE_FEATURES', 'alsa', 'packagegroup-
> arago-
> > > tisdk-multimedia', '',d)} \
> > >  "
> > >
> > >  export IMAGE_BASENAME =3D "tisdk-server-extra-rootfs-image"
> > > --
> > > 2.2.0
> > >
> > > _______________________________________________
> > > meta-arago mailing list
> > > meta-arago@arago-project.org
> > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

