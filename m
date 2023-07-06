Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55EBCEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 13:02:50 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.21676.1688648559556430293
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 06:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cmHhG5IA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: j-luthra@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 366D2TWH050335;
	Thu, 6 Jul 2023 08:02:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688648549;
	bh=09rtKWCfG3lXAPW12SFpkRTqm9Lz3cRZORdOX/nqHTM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cmHhG5IAu8sIxb9WnB+lDNvTdTUJJXucRelHjjfDpTJe9XSe17yu3GUpsemtMh1db
	 wXymEGEcThUbXvbFSNKXI8S/X4lmK9YVyNeJOikLt4rs9U4WndIhSpn0NqgPvSeHiP
	 XdRfyyqjPPnGTdM7qU9FWf/plBWMP/+MSgQKm2EQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 366D2TSU000595
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jul 2023 08:02:29 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jul 2023 08:02:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jul 2023 08:02:28 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 366D2SIw112880;
	Thu, 6 Jul 2023 08:02:28 -0500
Date: Thu, 6 Jul 2023 18:32:26 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        Devarsh
 Thakkar <devarsht@ti.com>,
        <libcamera-devel@lists.libcamera.org>
Subject: Re: [master/kirkstone][PATCH v3 2/3] libcamera: Add support for TI
 CSI-RX
Message-ID: <zoiqt7wycdinrlnoedwnsqch4tkgqy5hntlnehlza5dfkmy57i@z26g773gnhjm>
References: <20230706041652.1843102-1-j-luthra@ti.com>
 <20230706041652.1843102-2-j-luthra@ti.com>
 <168863257579.780480.1385426120296814998@Monstersaurus>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7ax5hphn4iydhubf"
Content-Disposition: inline
In-Reply-To: <168863257579.780480.1385426120296814998@Monstersaurus>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 13:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14768

--7ax5hphn4iydhubf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kieran,

On Jul 06, 2023 at 09:36:15 +0100, Kieran Bingham wrote:
> Hi Jai,
>=20
> Quoting Jai Luthra (2023-07-06 05:16:51)
> > TI's CSI-RX driver is not yet upstream, so the libcamera simple pipeline
> > does not recognize it.
> >=20
>=20
> Has this driver been posted to the linux-media mailing list?
>=20
>=20
> > Apply a patch to the simple pipeline so that it can recognize the media
> > entity for TI's CSI-RX driver.
> >=20
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >=20
> > v3: Add Upstream-Status tag
> > Link to v2: https://lore.kernel.org/all/20230706035522.1817402-2-j-luth=
ra@ti.com/
> >=20
> >  .../0001-simple-Support-TI-CSI-RX.patch       | 33 +++++++++++++++++++
> >  .../libcamera/libcamera_0.0.5.bb              |  1 +
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 meta-arago-extras/recipes-multimedia/libcamera/libc=
amera/0001-simple-Support-TI-CSI-RX.patch
> >=20
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0=
001-simple-Support-TI-CSI-RX.patch b/meta-arago-extras/recipes-multimedia/l=
ibcamera/libcamera/0001-simple-Support-TI-CSI-RX.patch
> > new file mode 100644
> > index 00000000..82b02200
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera/0001-sim=
ple-Support-TI-CSI-RX.patch
> > @@ -0,0 +1,33 @@
> > +From d0e4f4f224671e9fc992d39e7beb9c486303ede1 Mon Sep 17 00:00:00 2001
> > +From: Jai Luthra <j-luthra@ti.com>
> > +Date: Thu, 23 Mar 2023 11:38:46 +0530
> > +Subject: [PATCH] simple: Support TI CSI-RX
> > +
> > +Add support for TI's CSI-RX pixel grabber device for the simple
> > +pipeline.
> > +
> > +The driver is not yet merged, but v7 is posted [1] upstream.
> > +
> > +Link: https://lore.kernel.org/all/20230314115516.667-1-vaishnav.a@ti.c=
om/ [1]
>=20
> I'll take that as a yes!
>=20
> > +Upstream-Status: Pending
> > +Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > +---
> > + src/libcamera/pipeline/simple/simple.cpp | 2 ++
> > + 1 file changed, 2 insertions(+)
> > +
> > +diff --git a/src/libcamera/pipeline/simple/simple.cpp b/src/libcamera/=
pipeline/simple/simple.cpp
> > +index e1f8b989..520405a1 100644
> > +--- a/src/libcamera/pipeline/simple/simple.cpp
> > ++++ b/src/libcamera/pipeline/simple/simple.cpp
> > +@@ -194,6 +194,8 @@ static const SimplePipelineInfo supportedDevices[]=
 =3D {
> > +       { "mxc-isi", {} },
> > +       { "qcom-camss", {} },
> > +       { "sun6i-csi", {} },
> > ++      { "j721e-csi2rx", {} },
>=20
>=20
> So this line could already be merged to libcamera directly.

Oh okay that would be great.
>=20
> Could you post this patch to the libcamera mailing list please?
> (libcamera-devel@lists.libcamera.org).
>=20
> I'm planning the next release of libcamera in the next week - and I
> believe we could get this in quite quickly.
>=20

I will post the patch to libcamera-devel@ tonight, fixing Laurent's=20
comments.

> --
> Regards
>=20
> Kieran
>=20
> > ++
> > + };
> > +=20
> > + } /* namespace */
> > +--=20
> > +2.41.0
> > +
> > diff --git a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0=
=2E0.5.bb b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.=
bb
> > index 6ad376f2..b2eb5fac 100644
> > --- a/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > +++ b/meta-arago-extras/recipes-multimedia/libcamera/libcamera_0.0.5.bb
> > @@ -10,6 +10,7 @@ LIC_FILES_CHKSUM =3D "\
> > =20
> >  SRC_URI =3D " \
> >          git://git.libcamera.org/libcamera/libcamera.git;protocol=3Dhtt=
ps;branch=3Dmaster \
> > +        file://0001-simple-Support-TI-CSI-RX.patch \
> >  "
> > =20
> >  SRCREV =3D "fb44403f1c5571549ac128c21daee9761eb9249c"
> > --=20
> > 2.41.0
> >=20
> >

--=20
Thanks,
Jai

GPG Fingerprint: 4DE0 D818 E5D5 75E8 D45A AFC5 43DE 91F9 249A 7145

--7ax5hphn4iydhubf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmSmu18ACgkQQ96R+SSa
cUWn1BAAgFjVfCrq2Rk8Ll11z65yOyK1kXN9XY1bVFRq/j9BFwEsjA7lqKGd+zL1
VKPi5EyEGKbiqWTNxm7Nf7O2xz8dH2s8abdk4fmK+eUNhZLYlXJyZgyaVtkkviKp
5NP72xSu1NxyehVbV3fb1nxxpqBt4cmCk/KNR5mC3YmAYUSfw93e7WaDgSHCueiI
jI25p6lbLB85Z+4Y178LINskKPJkdb+fMcH23l+GhDpz4Ap061V+Lzze0BPzqofa
5pFGcOy83WGqLOlTUGwrURyte4Y5y6Vkprj6S8weib97nubYHxDE7Amd0/ZOeuLm
wjgMAgw1GYUT2Hdj0TBGnG+K3bUePl7MMjVfp1y8Rp57UPCb5p52puT0+hS3G0Z0
o3GEC5Ct9DV5Gj5EGkdPvIa+gk+pp+RSEXIuA5nkKZNHUjX7vOMufjHwU1+Os52J
UVK4pLusOtyzwTNgCmZKX7a35kC+DEyNUVvCmyKKdrQ3Z74yB7wgj/werrlhZ+sQ
3OPZlz/j97DKtuNeU2crJUmkSPdFqjwjj7kugd1pLKxOzj9mSNo44vd+e6d4mSHf
bb4xM6PKTg1TV2aENtYuO7Ilc8QSvStCuZDu4gJ00gI9yfrYTrRIRWxUJrLYhvWP
insOvGHWr00ZBh8sgrIflpS7qEgXi2+YCFeSjcfIq7WXMwJvSjg=
=rrl6
-----END PGP SIGNATURE-----

--7ax5hphn4iydhubf--

