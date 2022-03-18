Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CB7C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:37:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.8964.1647607021319043542
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:37:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zI0/Xc1Y;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICawwx076157;
	Fri, 18 Mar 2022 07:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647607018;
	bh=NisjtGnHIrhY6jYKM3Igw1ja/UuQoFXU6DfrdVI+M90=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zI0/Xc1YQeabx/1T7QuyYUCpyZZO+XQeQ5cQF+ZafiP0B6pLyiC9d4WaCX5dtRjdq
	 Qs5Htw31Xu66jTcFQKdEpZ17hHrp0ABGDg5hs8g7ft/h/31f1FHDiYLrO0dcC+ysmn
	 OxO496RdbhbujPiAPLvKDDz0V5foND59p9TGIWjg=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICawbV127043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:36:58 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:36:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:36:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICawgQ025974;
	Fri, 18 Mar 2022 07:36:58 -0500
Date: Fri, 18 Mar 2022 07:36:58 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys,
 Jonathan" <j-humphreys@ti.com>, <praneeth@ti.com>,
        <minas@ti.com>, "Hilman,
 Kevin" <khilman@ti.com>,
        "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar,
 Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [dunfell/master PATCH 4/6] recipes-core: images: Add a basic
 bootstrap base image
Message-ID: <20220318123658.ewwkec35qlfj2n5x@bundle>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-5-nm@ti.com>
 <20220311175338.GD1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311175338.GD1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:37:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13632

On 12:53-20220311, Denys Dmytriyenko wrote:
> On Tue, Mar 08, 2022 at 08:13:14PM -0600, Nishanth Menon wrote:
> > Since we do not wish to modify the tiny-image from anything but really
> > tiny, lets use that infrastructure and add the bootstrap package group
> > to create initramfs (not exactly a completely usable system) which can
> > be used for basic board bringup.
> > 
> > This generates cpio around 36-40MB which should be usually fine for
> > even smaller systems (Ofcourse, this is much larger than tiny-image
> > which is around 6MB size). The packages are organized per size to
> > allow easier customization if desired.
> > 
> > This image follows the Bring Your Own Kernel model from
> > tisdk-tiny-image.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> >  .../images/tisdk-bootstrap-base-image.bb      | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> > 
> > diff --git a/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> > new file mode 100644
> > index 000000000000..a18f39602286
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-core/images/tisdk-bootstrap-base-image.bb
> > @@ -0,0 +1,20 @@
> > +# Arago TI SDK bootstrap base image for initramfs
> > +# This will not get a completely usable image since kernel will be missing
> 
> Same comment as for earlier patch.
> 

Will update.

> 
> > +# intent for this image is to build as basic a system with enough basic
> > +# Board bringup utilities that can then be used for additions as needed.
> > +
> > +require arago-tiny-image.inc
> > +
> > +IMAGE_FSTYPES += "cpio cpio.xz"
> > +
> > +ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL ?= ""
> > +
> > +IMAGE_INSTALL += " \
> > +	packagegroup-arago-bootstrap \
> > +	${ARAGO_BOOTSTRAP_IMAGE_EXTRA_INSTALL} \
> > +"
> > +
> > +# We do not need kernel Image, dtbs and modules in the initrd
> > +deltask do_packagedata
> 
> Huh? Not sure what you are trying to do here, but it certainly isn't right...
> You are trying to partially disable generating of IPK packages for the image, 
> but images by default have no packages to produce.
> 

I assumed this was part of the magic stuff we do for tiny-image. I will
try dropping the same - both here and tiny image.


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

