Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3269EC77B75
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 23:46:26 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.7615.1684799184340252421
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 16:46:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6056240C37;
	Mon, 22 May 2023 23:46:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HLblTygO1Hcn; Mon, 22 May 2023 23:46:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D75740429;
	Mon, 22 May 2023 23:46:20 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 32ADD1638FB; Mon, 22 May 2023 19:45:35 -0400 (EDT)
Date: Mon, 22 May 2023 19:45:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: rs@ti.com
Cc: Andrew Davis <afd@ti.com>, reatmon@ti.com,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 1/3] all: remove all external
 toolchain stuff
Message-ID: <20230522234535.GB9226@denix.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-2-rs@ti.com>
 <039f06e5-23c3-488a-995b-711575a73814@ti.com>
 <df445046-78fa-340e-d0e5-ed96055a1121@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <df445046-78fa-340e-d0e5-ed96055a1121@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 23:46:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14443

On Mon, May 22, 2023 at 03:07:34PM -0500, Randolph Sapp via lists.yoctoproject.org wrote:
> On 5/22/23 14:31, Andrew Davis wrote:
> >On 5/22/23 1:38 PM, rs@ti.com wrote:
> >>From: Randolph Sapp <rs@ti.com>
> >>
> >>Drop all of the external toolchain stuff. We don't need it anymore now
> >>that everything can use the internal yocto compiler and multiarch has
> >>been configured properly in meta-ti.
> >>
> >
> >Another reason was for speeding builds on build farms which could avoid
> >re-builing the toolchain each time.
> >
> >These days it is probably not worth the uncertaintay around mismatched
> >build tools, but at the time this was all neato stuff:
> >
> >https://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf
> >
> >Oh well,
> >
> >Acked-by: Andrew Davis <afd@ti.com>
> 
> Cool, but excessive and a source for issues where clients are using
> build tools different from ours... Ultimately this needed to be
> culled in favor of the yocto standard anyway.
> 
> Also, speeding up builds should be a moot point. Sstate cache still
> applies to these host tools so long as the host env doesn't change
> too much, and build containers should prevent that.

Build speed wasn't the main reason for prebuilt toolchains.

It was exactly because nobody was using Yocto-built toolchains back then and 
everyone, including internal TI developers and customers, were using prebuilt 
toolchains - first from CodeSourcery, then from Linaro and then from Arm.

And the reasons were - trust, reproducibility and technical support. If you 
build your toolchain from sources, you have to support it yourself - answer 
customer's questions and fix possible bugs. And 3rd-party toolchains had that 
covered. While Yocto didn't have a track record of a stable mature toolchain, 
as I mentioned few of the shortcomings in my presentation linked above...

-- 
Denys

