Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 3244D52ABD
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:33:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LXZTr028100
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:33:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489095215;
	bh=wg4C/P5xLTnPCI3iV7nLa+1ClZYqo6X6WYXyO4Afqlg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=YbIAJKVk/xuxTCg7RQvAcmtxO2Ick0NwL5sdliUSHf0WnxXJlj4fRLeqJtjrrAsYM
	/TAcOWKuGtJjLfSJ18Vlw3f8vuLJIj344CYBhMSsUKkfAaFU3u3my96za5BgQTghZH
	rG/jFHchzL3eF4P7Iqo4N7CzvFsV3OCUCXpjP44g=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LXUjC028873
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:33:30 -0600
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Thu, 9 Mar 2017 15:33:30 -0600
From: "Gou, Hongmei" <h-gou@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [morty/krogoth][PATCH]
	packagegroup-arago-tisdk-multimedia*: add hevc-arm-decoder for keystone
Thread-Index: AQHSmPqsRAxPkyN58UePCCPG3B7s2aGNBugQ
Date: Thu, 9 Mar 2017 21:33:30 +0000
Message-ID: <2E957F12D11D904590FA9AF86D366BD926CEE8FD@DLEE08.ent.ti.com>
References: <1488904376-21769-1-git-send-email-h-gou@ti.com>
	<20170309172914.GH578@edge>
In-Reply-To: <20170309172914.GH578@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/krogoth][PATCH] packagegroup-arago-tisdk-multimedia*: add hevc-arm-decoder for keystone
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
X-List-Received-Date: Thu, 09 Mar 2017 21:33:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Dmytriyenko, Denys
> Sent: Thursday, March 09, 2017 12:29 PM
> To: Gou, Hongmei
> Cc: meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/krogoth][PATCH] packagegroup-arago-
> tisdk-multimedia*: add hevc-arm-decoder for keystone
>=20
> On Tue, Mar 07, 2017 at 11:32:56AM -0500, Hongmei Gou wrote:
> > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > ---
> >  .../packagegroup-arago-tisdk-multimedia-sdk-target.bb             | 8 =
++++++--
> >  .../packagegroups/packagegroup-arago-tisdk-multimedia.bb          | 6 =
++++-
> -
> >  2 files changed, 10 insertions(+), 4 deletions(-)
> >
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia-sdk-target.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia-sdk-target.bb
> > index 3c72bf0..6f3b559 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia-sdk-target.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia-sdk-target.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to build and install header and libs into sdk"
> >  LICENSE =3D "MIT"
> > -PR =3D "r10"
> > +PR =3D "r11"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -18,7 +18,11 @@ MULTIMEDIA_append_ti33x =3D " barcode-roi-dev"
> >  MULTIMEDIA_append_ti43x =3D " barcode-roi-dev"
> >  MULTIMEDIA_append_omap-a15 =3D " barcode-roi-dev"
> >
> > -MULTIMEDIA_append_keystone =3D " barcode-roi-dev"
> > +MULTIMEDIA_append_keystone =3D " \
> > +    hevc-arm-decoder-dev \
> > +    hevc-arm-decoder-staticdev \
> > +    barcode-roi-dev \
> > +"
> >
> >  RDEPENDS_${PN} =3D "\
> >      ${MULTIMEDIA} \
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-
> core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
> > index cb143b8..d850e0f 100644
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> tisdk-multimedia.bb
> > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> arago-tisdk-multimedia.bb
> > @@ -1,6 +1,6 @@
> >  DESCRIPTION =3D "Task to add multimedia related packages"
> >  LICENSE =3D "MIT"
> > -PR =3D "r20"
> > +PR =3D "r21"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > @@ -10,7 +10,9 @@ MULTIMEDIA =3D " \
> >      amsdk-av-files \
> >  "
> >
> > -MULTIMEDIA_keystone =3D ""
> > +MULTIMEDIA_append_keystone =3D " \
>=20
> This would also pull amsdk-av-files from above - is it expected?

Yes, this is expected since running hevc-arm-decoder on keystone needs the =
input video file from "amsdk-av-files".

>=20
>=20
> > +    hevc-arm-decoder \
> > +"
> >
> >  MULTIMEDIA_append_ti43x =3D " \
> >      dual-camera-demo \
> > --
> > 1.9.1
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

