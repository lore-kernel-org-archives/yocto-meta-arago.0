Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA6FC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 12:38:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.8976.1647607126869864898
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 05:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AnNCbRKE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22ICcimT003348;
	Fri, 18 Mar 2022 07:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647607124;
	bh=tKlQ3fLjzH9tx8ACe6OIY72FlzTpERkzUpOhz0C78Yk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AnNCbRKEJ7WOhmyq/4PXYprP8xHrbQs2alblm9QUhPgZoeT0NGoqSUhYiTQf/X8or
	 7rVSBx0aYiHWTWR5KBYAc2kp7lHCdX6yV4w4q86Bg+xpkRCDjdvz3+ik2lDWelGzfQ
	 IqVF4Do3tDwI+DSvUGOG+Aldf2CVzTjzVrfaVgco=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22ICcits101301
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 07:38:44 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 07:38:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 07:38:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22ICci7t001485;
	Fri, 18 Mar 2022 07:38:44 -0500
Date: Fri, 18 Mar 2022 07:38:44 -0500
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
Subject: Re: [meta-arago] [dunfell/master PATCH 4/6] recipes-core: images:
 Add a basic bootstrap base image
Message-ID: <20220318123844.6fohv26gtfagqqcr@implode>
References: <20220309021316.28370-1-nm@ti.com>
 <20220309021316.28370-5-nm@ti.com>
 <16DB65153852778E.24530@lists.yoctoproject.org>
 <20220311181811.GF1766@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220311181811.GF1766@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 12:38:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13634

On 13:18-20220311, Denys Dmytriyenko wrote:
[...]

> > > +
> > > +# We do not need kernel Image, dtbs and modules in the initrd
> > > +deltask do_packagedata
> > 
> > Huh? Not sure what you are trying to do here, but it certainly isn't right...
> > You are trying to partially disable generating of IPK packages for the image, 
> > but images by default have no packages to produce.
> 
> I think you stepped on this workaround, that is no longer needed:
> https://git.yoctoproject.org/meta-arago/commit/?id=a75e468a372d4f5c2c32a179d4d2219899b5190c
> 


Aaah.. Thanks. will drop and retest.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

