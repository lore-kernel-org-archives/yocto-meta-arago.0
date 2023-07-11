Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F14CEC001DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 17:21:37 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2055.1689096095909101720
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Jul 2023 10:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 88BF640C90;
	Tue, 11 Jul 2023 17:21:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A0ARd4Ru0dX2; Tue, 11 Jul 2023 17:21:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CA6540C47;
	Tue, 11 Jul 2023 17:21:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 808EC163C01; Tue, 11 Jul 2023 13:21:27 -0400 (EDT)
Date: Tue, 11 Jul 2023 13:21:27 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Aniket Limaye <a-limaye@ti.com>
Cc: meta-arago@lists.yoctoproject.org,
	Denys Dmytriyenko <denys@konsulko.com>, s-adivi@ti.com,
	c-shilwant@ti.com, g-gupta@ti.com,
	Rahul Ravikumar <r-ravikumar@ti.com>
Subject: Re: [EXTERNAL] [meta-arago] [kirkstone][PATCH 1/6] recipe-data:
 deprecate
Message-ID: <20230711172127.GL1518@denix.org>
References: <20230706212335.1893675-1-denis@denix.org>
 <20230706212335.1893675-2-denis@denix.org>
 <558037f0-680c-491b-c5a1-82448da9062d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <558037f0-680c-491b-c5a1-82448da9062d@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Jul 2023 17:21:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14795

On Mon, Jul 10, 2023 at 05:41:19PM +0530, Aniket Limaye wrote:
> 
> On 07/07/23 02:53, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Deprecate custom recipe-data class. It was added when Bitbake started
> >sanitizing "source" field of generated binary packages due to a CVE
> >security vulnerability that could potentially leak local resource
> >passwords. This class would bypass the sanitizing step by preserving
> >source URLs from recipes to be used in TISDK bundle manifest.
> >
> >Even with a valid use case, this approach was still questionable and
> >now it complicates latest TISDK bundle changes necessary for adding
> >a proper secondary toolchain support. Plus bundle manifests don't seem
> >to be used that much lately, so deprecate this class.
> 
> Hi Denys, Ryan,
> 
> I was a little concerned with the last statement here. At SDK level
> we do use the manifest .txt files that to upload on the release
> page.
> 
> I am not sure yet about how this patch affects the manifest txt
> file. Does this change the structure at all or just the Source field
> for each recipe?

Yes, this change only affects the source field of each recipe/package listed 
in the manifest.


> If the change really is significant, I will be creating a build with
> this patch and get back to you if i have concerns.

Please let us know if this is a showstopper.

-- 
Denys

