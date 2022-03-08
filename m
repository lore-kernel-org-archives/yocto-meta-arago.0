Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.10770.1646760844911039451
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 09:34:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6656640C76;
	Tue,  8 Mar 2022 17:34:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lMWN3JVasoXb; Tue,  8 Mar 2022 17:34:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4FFF0407E5;
	Tue,  8 Mar 2022 17:34:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8D236169C33; Tue,  8 Mar 2022 12:34:01 -0500 (EST)
Date: Tue, 8 Mar 2022 12:34:01 -0500
From: "Denys Dmytriyenko" <denis@denix.org>
To: j-humphreys@ti.com
Cc: meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago] [dunfell/master PATCH] recipes-core: images: Add tisdk-thinlinux-image
Message-ID: <20220308173401.GW1766@denix.org>
References: <20220308144637.19732-1-nm@ti.com>
 <8158.1646759842608715128@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <8158.1646759842608715128@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2022 at 09:17:22AM -0800, Jonathan Humphreys via lists.yo=
ctoproject.org wrote:
> >=20
> > +# Allow users to tack on additional packages as interesting.
> >=20
>=20
> >=20
> > +ARAGO_THIN_IMAGE_EXTRA_INSTALL ?=3D ""
> >=20
>=20
> Is this standard practice?=A0 I would have thought that a user would cr=
eate a=20
> bbappend from their layer.

It's one of the supported ways. E.g. OE-Core has CORE_IMAGE_EXTRA_INSTALL=
 for=20
core images to support this (see section 7.2.1):

https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#us=
ingpoky-extend-customimage

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
