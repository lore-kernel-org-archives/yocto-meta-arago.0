Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C0EC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:10:39 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web09.8923.1648041037234492093
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=dHJEmDqB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NDAWNv032424;
	Wed, 23 Mar 2022 08:10:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648041032;
	bh=kD2xWywlscA3DO+XXXRd8hRSo9mYxQ8AzrmGxEhww8U=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=dHJEmDqBV/Z35OwbFfbrSPFurewhtbsz3WZmodHtoKExT6HZ49uERNE7EV6ZjqvJ6
	 lIaivtSaA/ZsKtm+bTGJ7xjailwI4Rkc5kZuJ+aAsay/+qMjoseKvHpf61jCp970Fd
	 MmdCjKKrUGXrbu0CCyZgaWM7qwLiYJM666k0YWJ8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NDAWVL068427
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 08:10:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 08:10:32 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 08:10:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NDAWs5116823;
	Wed, 23 Mar 2022 08:10:32 -0500
Date: Wed, 23 Mar 2022 08:10:32 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <d-gerlach@ti.com>, <j-humphreys@ti.com>,
        <khilman@ti.com>, <meta-arago@lists.yoctoproject.org>, <minas@ti.com>,
        <nikhil.nd@ti.com>, <praneeth@ti.com>, <spatton@ti.com>
Subject: Re: [master/dunfell PATCH V5 10/12] recipes-bsp: Create a
 bootstrap-initrd package
Message-ID: <20220323131032.rqjrmzvqxox3ekyx@expenses>
References: <20220322174808.16341-1-nm@ti.com>
 <20220322174808.16341-11-nm@ti.com>
 <20220322222154.GU23554@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322222154.GU23554@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13724

On 18:21-20220322, Denys Dmytriyenko wrote:
> On Tue, Mar 22, 2022 at 12:48:06PM -0500, Nishanth Menon wrote:
> > Lets create an bootstrap-initrd package that installs the cpio
> > generated in the correct locations.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > Changes since V4: None
> > 
> > V4: https://lore.kernel.org/yocto-meta-arago/20220319123310.8546-11-nm@ti.com/
> > 
> >  .../bootstrap-initrd/bootstrap-initrd_1.0.bb  | 22 +++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >  create mode 100644 meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> > 
> > diff --git a/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> > new file mode 100644
> > index 000000000000..2a53efcd9062
> > --- /dev/null
> > +++ b/meta-arago-distro/recipes-bsp/bootstrap-initrd/bootstrap-initrd_1.0.bb
> > @@ -0,0 +1,22 @@
> > +SUMMARY = "Prebuilt initramfs with apps for bootstraping new board"
> > +
> > +LICENSE = "GPLv2"
> 
> I was wondering about the same question I raised in another thread about the 
> license[1]:
> 
> Default license for OpenEmbedded metadata is MIT, not GPLv2. Any specific 
> reason for the change?
> 
> [1] https://patchwork.yoctoproject.org/project/ti/patch/20220322162528.15298-7-reatmon@ti.com/

Aaah.. Thanks for pointing it out.. no specific reason why I picked
GPLV2 other than that as a kernel dev, that is what comes to mind as
default ;)..

It should follow the standard convention of MIT.

Let me know if I need to send a V6 with the fixup, I am guessing
switching it over to LICENSE = "MIT" should do the job.. (I'd rather be
explicit).

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

