Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A502AC71153
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 14:27:49 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15311.1693232864498096106
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 07:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D89DF40CB4;
	Mon, 28 Aug 2023 14:27:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7GSNC9Euz4_Z; Mon, 28 Aug 2023 14:27:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-110-236.washdc.fios.verizon.net [100.15.110.236])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AB85040CB0;
	Mon, 28 Aug 2023 14:27:39 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id C4241163C75; Mon, 28 Aug 2023 10:27:38 -0400 (EDT)
Date: Mon, 28 Aug 2023 10:27:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: reatmon@ti.com
Cc: Praneeth Bajjuri <praneeth@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arago@lists.yoctoproject.org
Subject: Re: [meta-arago][master/kirkstone][PATCH] tensorflow-lite: Add
 SRCREV_FORMAT to fix build error
Message-ID: <20230828142738.GJ3359@denix.org>
References: <20230824195706.6675-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824195706.6675-1-reatmon@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Aug 2023 14:27:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14867

This recipe should probably be removed in favor of upstream one from a 
dedicated meta-neural-network layer:

https://github.com/nnstreamer/meta-neural-network/tree/master/recipes-tensorflow/tensorflow-lite


On Thu, Aug 24, 2023 at 02:57:06PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb     | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
> index defb6447..e4a1ec85 100644
> --- a/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
> +++ b/meta-arago-extras/recipes-support/tensorflow-lite/tensorflow-lite_1.15.bb
> @@ -24,6 +24,8 @@ SRC_URI = "git://github.com/tensorflow/tensorflow.git;branch=r${PV};rev=590d6eef
>      file://tflite-benchmark.sh \
>      file://tensorflow-lite.pc.in"
>  
> +SRCREV_FORMAT="tensorflow_gemmlowp_googletest_abseil-cpp_ARM_NEON_2_x86_SSE_farmhash_flatbuffers"
> +
>  SRC_URI[mobilenet_v1_quant.md5sum] = "36af340c00e60291931cb30ce32d4e86"
>  SRC_URI[mobilenet_v1_quant.sha256sum] = "d32432d28673a936b2d6281ab0600c71cf7226dfe4cdcef3012555f691744166"
>  
> -- 
> 2.17.1

