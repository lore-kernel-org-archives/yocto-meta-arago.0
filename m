Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F1AC3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 21:48:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2973.1747777719219878268
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 20 May 2025 14:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E9D5340C81;
	Tue, 20 May 2025 21:48:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9xLodhdxWd78; Tue, 20 May 2025 21:48:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AC9D140C16;
	Tue, 20 May 2025 21:48:34 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5C6031689B2; Tue, 20 May 2025 17:48:34 -0400 (EDT)
Date: Tue, 20 May 2025 17:48:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master][PATCH 5/9]
 nativesdk-buildtools-perl-dummy: Wrap the bbappend in a compliant manner
Message-ID: <20250520214834.GB18383@denix.org>
References: <20250519170055.22364-1-reatmon@ti.com>
 <20250519170055.22364-6-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250519170055.22364-6-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 20 May 2025 21:48:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16232

Since this has been taken upstream, it can be dropped from master altogether. 
Let me know if you need a spearate patch for this.

https://git.openembedded.org/openembedded-core/commit/?id=2b1ec442cf8c0d5753376e52bca5f8da5350848c


On Mon, May 19, 2025 at 12:00:51PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Wrap the bbappend in a yocto-check-layer compliant manner so that only
> if you are building this recipe under meta-arago-distro with the arago
> DISTRO_OVERRIDE would the bbappend apply.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  ...pend => nativesdk-buildtools-perl-dummy-arago.inc} |  0
>  .../meta/nativesdk-buildtools-perl-dummy.bbappend     | 11 ++++-------
>  2 files changed, 4 insertions(+), 7 deletions(-)
>  copy meta-arago-extras/recipes-core/meta/{nativesdk-buildtools-perl-dummy.bbappend => nativesdk-buildtools-perl-dummy-arago.inc} (100%)
> 
> diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
> similarity index 100%
> copy from meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
> copy to meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy-arago.inc
> diff --git a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
> index b9d40d6e..f88196f5 100644
> --- a/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
> +++ b/meta-arago-extras/recipes-core/meta/nativesdk-buildtools-perl-dummy.bbappend
> @@ -1,7 +1,4 @@
> -DUMMYPROVIDES += "\
> -    nativesdk-perl-dev \
> -    nativesdk-perl-module-feature \
> -    nativesdk-perl-module-file-spec-unix \
> -    nativesdk-perl-module-integer \
> -    nativesdk-perl-module-symbol \
> -"
> +NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO = ""
> +NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO:arago = "nativesdk-buildtools-perl-dummy-arago.inc"
> +
> +require ${NATIVESDK_BUILDTOOLS_PERL_DUMMY_ARAGO}
> -- 
> 2.17.1

