Return-Path: <y-hegde@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B067CCAC59A
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 04:27:43 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5036.1758688060636757664
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 21:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Iac5urPO;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: y-hegde@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58O4Rb9l1132057;
	Tue, 23 Sep 2025 23:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758688057;
	bh=Slekx6EnPLGtqA946USV3wxo/IOAU0zVAN8gtIDyKMs=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Iac5urPOA/+MJIM+pFQYBa9AIzG8EvxRwDt/hdgDJRnVqOCCoBQbFn59mew6LXyOS
	 /PuLVvm6wDGXydURdcI2yYvGslm4Ih+fjmajvGzFwn9K90v7K9TWCHq/NUQIvkiA60
	 h4PnGKU2AKK00wf05RtZ6MUodD66LOv2qWlL6vhQ=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58O4RbSJ2164983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 23 Sep 2025 23:27:37 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 23
 Sep 2025 23:27:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 23 Sep 2025 23:27:37 -0500
Received: from localhost (yogi-work-pc.dhcp.ti.com [172.24.233.158])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58O4RZMn1389059;
	Tue, 23 Sep 2025 23:27:36 -0500
Date: Wed, 24 Sep 2025 09:57:35 +0530
From: Yogesh Hegde <y-hegde@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denis@denix.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi Veeramachaneni <prudhvi@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] bt-ti: Restrict bt-ti
 packages to legacy platforms only
Message-ID: <20250924042735.vqvpaaqliadpkcuo@yogi-work-pc>
References: <20250923121539.i7bx4zt7krbzmc7v@yogi-work-pc>
 <1867EEE526850244.23856@lists.yoctoproject.org>
 <1867EEF6EB68CB9F.18262@lists.yoctoproject.org>
 <b1bdfc24-3498-45dd-9b06-0164d7f1e180@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
In-Reply-To: <b1bdfc24-3498-45dd-9b06-0164d7f1e180@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 58O4Rb9l1132057
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Sep 2025 04:27:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16618

On 09:19-20250923, Ryan Eatmon wrote:
>=20
>=20
> On 9/23/2025 9:15 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> >=20
> >=20
> > On 9/23/2025 9:14 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> > >=20
> > > The subject should be:
> > >=20
> > > packagegroup-arago-tisdk-connectivity: Restrict bt-ti to legacy pla=
tforms
> >=20
> >=20
> > Or even better:
> >=20
> > packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platf=
orms
> >=20
> >=20
> > >=20
> > > On 9/23/2025 7:15 AM, Yogesh Hegde wrote:
> > > > The bt-enable and bt-fw packages are only applicable for AM33X,
> > > > AM43X and AM57XX
> > > > legacy platforms, but was being included for all machines. While =
the
> > > > bt-enable script performs noop for unsupported machines, it still=
 adds
> > > > unnecessary overhead to boot time and generates log noise.
> > > >=20
> > > > Restrict the bt-enable and bt-fw packages to only be included for=
 the
> > > > specific machine overrides (ti33x, ti43x, am57xx) that actually r=
equire
> > > > Bluetooth support.
> > > >=20
> > > > Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> > > > ---
> > > > =A0 .../packagegroup-arago-tisdk-connectivity.bb=A0=A0=A0=A0=A0=A0=
 | 14 +++++++++++++-
> > > > =A0 1 file changed, 13 insertions(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta-arago-distro/recipes-core/packagegroups/package=
group-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packag=
egroups/packagegroup-arago-tisdk-connectivity.bb
> > > > index 5a91357b..5eeeaa01 100644
> > > > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-connectivity.bb
> > > > +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-a=
rago-tisdk-connectivity.bb
> > > > @@ -49,7 +49,19 @@ BT_COMMON =3D "\
> > > > =A0=A0=A0=A0=A0 linux-firmware-ibt-18 \
> > > > =A0 "
> > > > -BT_TI =3D "\
> > > > +BT_TI =3D ""
> > > > +
> > > > +BT_TI:append:ti33x =3D "\
> > > > +=A0=A0=A0 bt-enable \
> > > > +=A0=A0=A0 bt-fw \
> > > > +"
> > > > +
> > > > +BT_TI:append:ti43x =3D "\
> > > > +=A0=A0=A0 bt-enable \
> > > > +=A0=A0=A0 bt-fw \
> > > > +"
> > > > +
> > > > +BT_TI:append:am57xx =3D "\
> > > > =A0=A0=A0=A0=A0 bt-enable \
> > > > =A0=A0=A0=A0=A0 bt-fw \
> > > > =A0 "
> > >=20
>=20
> I really should stop replying so quickly...
>=20
> In thinking about it a little longer, I think this change is a little t=
oo
> wordy.  A better change would be:
>=20
> CONNECTIVITY_RDEPENDS =3D " \
>     htop \
>     iptables \
>     iproute2 \
>     iproute2-tc \
>     iproute2-devlink \
>     ${WLAN_COMMON} \
>     ${WLAN_TI} \
>     ${BT_COMMON} \
> "
>=20
> CONNECTIVITY_RDEPENDS:append:ti33x =3D " ${BT_TI}"
> CONNECTIVITY_RDEPENDS:append:ti43x =3D " ${BT_TI}"
> CONNECTIVITY_RDEPENDS:append:am57xx =3D " ${BT_TI}"
>=20
> That way we still have a single variable to list the packages, just use=
 the
> override to add the variable to the big list.  We won't be repeating th=
e
> package list over and over.

I will send a v2 patch with the suggested changes.=20
I was wondering, since this is a machine-specific (read  BSP) change,
shouldn't this be in meta-ti instead of meta-arago?

Thanks,
-- Yogesh=20

