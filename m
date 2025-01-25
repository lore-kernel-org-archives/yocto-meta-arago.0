Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70126C02181
	for <webhook@archiver.kernel.org>; Sat, 25 Jan 2025 00:10:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.1439.1737763819624140446
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 24 Jan 2025 16:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RKInh33+;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50P0AGJf630246
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 24 Jan 2025 18:10:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737763816;
	bh=oJFPUnV4F9r3hJZyH8ihvVqGgfQGwWdSoQhIykgYoeM=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=RKInh33+lB6Pkn5A2aGCsNtivbHZP5X5ZlJNq8MvI4qwcXpXwzkx9Wzjc3xm00lpZ
	 jHY+j6/Y98pvWiCTboDIiYcrjzAeQfAa0tvHXVMpYlf7yj+dK7XWqj4ehrwF8Ytpn9
	 z8sgSbeSeavAbbRyz9ZlR1hRVr5lHlzZ603g7z08=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50P0AG0Y038262;
	Fri, 24 Jan 2025 18:10:16 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 Jan 2025 18:10:16 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 Jan 2025 18:10:16 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50P0AGpI090961;
	Fri, 24 Jan 2025 18:10:16 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 24 Jan 2025 18:10:16 -0600
Message-ID: <D7APV09NOYRH.3EYRUX431XYFH@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][discussion] Qt package groups and config
 locations
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>,
        <c-shilwant@ti.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D7AMZ4EPPP5M.2NTHC4Y4JP2H7@ti.com>
 <155132d0-4953-448e-a42b-c8d52211d1c5@ti.com>
In-Reply-To: <155132d0-4953-448e-a42b-c8d52211d1c5@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 25 Jan 2025 00:10:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15764

On Fri Jan 24, 2025 at 5:14 PM CST, Ryan Eatmon wrote:
> On 1/24/2025 3:54 PM, Randolph Sapp wrote:
> > Hey,
> >=20
> > Asking for some general advice before I submit the next series. Cleanin=
g up
> > meta-qt* package groups and everything there is a bit of a logistical a=
rgument
> > to be made.
> >=20
> > We now have an official requirement tracking Qt6 enablement which means=
 more
> > automated testing. At the same time I do not think meta-arago should be
> > inherently dependent on a layer as heavy as meta-qt*. I'm planning on m=
aking a
> > series of isolated package groups and configs that can be toggled throu=
gh a
> > distro feature.
> >=20
> > Where do we think this should belong? The distro layer or the extras la=
yer? I'm
> > leaning toward the distro layer as these are ultimately distro specific=
 configs,
> > but I can understand that some may believe this is inherently "extra" c=
ontent.
> > Regardless, the test layer will need to be updated to point to this.
> >=20
> > Maybe it should be a generic "software" layer? I don't like splitting t=
hings
> > unnecessarily, but this is a weird example where we need certain featur=
es
> > enabled for both testing and release, but it doesn't really make sense =
to
> > duplicate it. No clue. Any opinions?
>
> Could it be argued that these are demos?  And maybe should be in=20
> meta-arago-demos?
>
> What all software are we talking about being dependent on qt6?

These are applications provided as recipes directly from meta-qt*. The only
thing being carried here will be packagegroups for testing and configs for =
the
distro if meta-qt6 is enabled.

Which I guess means that the packagegroups should be listed in meta-arago-t=
est
and the configs should be in meta-arago-distro?

A specific example would be hellogles which is shipped as part of
qtbase-examples. Ideally for testing we'll want to execute that with the eg=
lfs
and wayland backend, which will require enabling the packageconfig "kms gbm
gles2 eglfs examples" on the qtbase package.

