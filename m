Return-Path: <j-luthra@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB10C77B75
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 13:19:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.22068.1684847943830001536
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 May 2023 06:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KIRlSS8E;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: j-luthra@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34NDJ2jE103138;
	Tue, 23 May 2023 08:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684847942;
	bh=ArF/gzOrZNWPSdoZImPTd05PNgMfZ2+DW3zPmFhtfqk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=KIRlSS8ESAYTgM2xwHXYRkZdS5T36wwxUI7Ws1Agnt6DoOfBGblzRggIc9f24+oZL
	 bEL+qNjBnjuUiNgfxwIrDoTDpDa6Y91r9X7yUyUokVwRaU880vDPkmrOYt3cYz0u3P
	 ly3wXTgtYkr+brimQ5eY+dZlrlnLd7xXUycN7cFI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34NDJ2x9003800
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 23 May 2023 08:19:02 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 May 2023 08:19:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 May 2023 08:19:02 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34NDJ1BG120070;
	Tue, 23 May 2023 08:19:01 -0500
Date: Tue, 23 May 2023 18:48:58 +0530
From: Jai Luthra <j-luthra@ti.com>
To: Devarsh Thakkar <devarsht@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Gyan Gupta <g-gupta@ti.com>,
        Sai Sree
 Kartheek Adivi <s-adivi@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, "Bajjuri,
 Praneeth" <praneeth@ti.com>,
        "Raghavendra, Vignesh" <vigneshr@ti.com>,
        "Bhatia, Aradhya" <a-bhatia1@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>
Subject: Re: [master/kirkstone][RESEND PATCH 1/2] v4l-utils: Add recipe for
 v1.23.0
Message-ID: <2r6t4wth4jin5dizz4z3gt2shaobtj5eg74u5axirsztkdgzlv@5dw6m2omaixu>
References: <20230523094422.1633390-1-j-luthra@ti.com>
 <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5xuuy4277uldkfqe"
Content-Disposition: inline
In-Reply-To: <80f116aa-3863-2990-f582-40f5d7a5b9b4@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 May 2023 13:19:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14449

--5xuuy4277uldkfqe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Devarsh,

Thanks for the review,

On May 23, 2023 at 17:18:39 +0530, Devarsh Thakkar wrote:
> Hi Jai,
>=20
> Thanks for the patch.
>=20
> On 23/05/23 15:14, Jai Luthra wrote:
> > An older recipe (v1.22.0) is present in the meta-openembedded/meta-oe
> > layer for kirkstone.
> >=20
> > TI's 6.1 based kernel has backported multistream routing APIs [1] from
> > upstream kernel, which requires a few patches to v4l-utils [2] that only
> > apply cleanly on top of v1.23.0.
> >=20
> > Thus we override the recipe in this layer to the latest (v1.23.0) found
> > from meta-oe master.
> >=20
> > Link: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?h=3D=
ca55d70b41e [1]
> > Link: https://lore.kernel.org/all/20230210115546.199809-1-tomi.valkeine=
n@ideasonboard.com/ [2]
> > Signed-off-by: Jai Luthra <j-luthra@ti.com>
> > ---
> >  ...-Don-t-install-libmediactl-and-libv4.patch | 44 ++++++++++
> >  ...02-original-patch-mediactl-pkgconfig.patch | 21 +++++
> >  ...iginal-patch-export-mediactl-headers.patch | 24 +++++
> >  .../v4l-utils/0004-Do-not-use-getsubopt.patch | 60 +++++++++++++
> >  .../v4l-utils/v4l-utils_1.23.0.bb             | 87 +++++++++++++++++++
>=20
> As per my opinion, not a good idea to bump up package version than default
> package version shipped by kirkstone i.e. 1.22.1
> (meta-oe/recipes-multimedia/v4l2apps/v4l-utils_1.22.1.bb)
>=20
> As a general rule of thumb, there could be other layers (for e.g. added by
> vendors) having bbappends assuming shipped package version same as in
> kirkstone and also build time and runtime dependencies w.r.t other packag=
es
> are guaranted if all packages stay with same version as shipped by kirkst=
one
> and with this new recipe I believe we are kind of deviating from that
> protection and so my suggestion is to rebase on top of existing package
> version i.e. 1.22.1

I agree that it makes sense to keep packages pinned to a version for a=20
particular release (dunfell/kirkstone) for stability and compatibility=20
with other dependencies.

The only issue here is multi-stream support requires a large chunk of=20
changes to v4l2 userspace APIs, affecting the most commonly used tools=20
for setting up the camera pipeline (media-ctl) and capturing frames=20
(v4l2-ctl).

While these changes are merged in linux upstream and backported to TI's=20
6.1 branch, the corresponding v4l-utils changes are still under review=20
upstream.

There are two options I see here:


    1. We bump up the v4l-utils recipe in our distribution to a=20
    relatively recent git commit (v1.23.0-9431e4b26b) which is in sync=20
    with TI baseline kernel, and apply only the patches for the extra=20
    features TI uses on top.

    We also ensure it works well with the dependencies (mainly libc)=20
    provided by rest of the kirkstone layers (so far no issues seen in=20
    my tests)


    2. We backport these patches to v1.22.1, which was tagged almost=20
    **two years ago** in Oct 2021; while the kernel is on 6.1 (Jan 2023)=20
    and using multistream APIs from 6.3/6.4/still-under-review.

    We will also have to sync with the latest kernel headers and=20
    extensively test that we don't break some ioctl or are missing=20
    bugfixes to v4l-utils from the past two years, as the kernel=20
    developer(s) for the newer features would not have tested against=20
    the old release.


That's why I chose option 1 in the current series as an exception to the=20
thumb rule. Let me know if it is a complete no-go to override a recipe=20
here.

>=20
> Regards
> Devarsh

Thanks,
Jai

--5xuuy4277uldkfqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEETeDYGOXVdejUWq/FQ96R+SSacUUFAmRsvT8ACgkQQ96R+SSa
cUVc5hAAi03f3n/PTZfgYuYy8ymo/vN3N/QjoFSfa+W9FzBOyKikSgdqhm1+E1rg
Mx0zIivsGhFBzhcgitoSrstNOMwhrRIktGHiWx4j46rxG8EAl23qMTBaIoWWSb4Y
WIBYrzqPTTJgSMw8pj/h8LyMGb8V1AK9lj//sQVGj5qMYyt1H48cFPwaqLWNThPX
Yvm2WvIO/Yn9EsW1WSy2g71WQss2uCV807yn/hrLS8aIIzkBRNOfHHDF7C3sxC6o
3Vr/WKVYAkUF3+vcnt5XNyH2IXCyorR9coZwEGjAsc+TJO/aJREPW3GJvIpGZMUR
7yebPqtf2IvsgyEDmnjD1vWeRmfbhDow737kDGr56FJfYprEfNXF3dgACQ03H9oD
8WOsYFUB63YpTzZlRGjlrqHpBkF6bGhQB7wHl+advtnZnbY7Vz3bygMiERu8SLgG
vQHhdRZvimlkZYnJYmi1DdNNetYLituBsTxsK/MbqHIfpbEqb1xMzDmdz5aRSC/M
JyCen3I61Pb/jcmImAC6kcftwl+EZXeRckwWJ2jXFWPIiWP3F3rsFOJwQ28WyBr8
8oHkAB/oCOw19iCKfxVyU9XL73w0IZCDcZpy9kDOPWEzIsWiL5OtfnoXbTGEOCPI
9ptXs0892pI7I9Fas4RY9ECdZE7QKS9EvvqE0jX48DH/iTJVoRc=
=gsRt
-----END PGP SIGNATURE-----

--5xuuy4277uldkfqe--

