Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F4EC433F5
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 14:57:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.6111.1652885829202783071
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 May 2022 07:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PXELmGoL;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24IEv67H103331;
	Wed, 18 May 2022 09:57:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652885826;
	bh=FWqYchK7K8W/vNOO/MPEZIQKgaJchZ3Myi1S0fp3xpk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=PXELmGoL+NzKOPF2ibwXeSVAsLe0qG/zOoPa8+RcDOdd2N/lkyMOtmP7plVGYnUYE
	 6K1d3RolOOrGhJIhYNnOhcPYzIwOx/2K6q5mRFOD8DOW49x4S5FJcjrUU91+BMhtEa
	 n6sxv2egld8bYYD73QyNL5UnaEG3N/vJKxrC3QbY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24IEv65M005117
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 May 2022 09:57:06 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 18
 May 2022 09:57:05 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 18 May 2022 09:57:05 -0500
Received: from [128.247.81.69] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24IEv5Nt037990;
	Wed, 18 May 2022 09:57:05 -0500
Message-ID: <a3ac9404-f719-6b92-d43b-d5357b0b68c7@ti.com>
Date: Wed, 18 May 2022 09:57:05 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [meta-arago] [dunfell/master][PATCH v3] meta-arago-distro: curl:
 add proxy and verbose support
To: <gadiyar@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220518145606.26833-1-gadiyar@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220518145606.26833-1-gadiyar@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 May 2022 14:57:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13868



On 5/18/2022 9:56 AM, Anand Gadiyar via lists.yoctoproject.org wrote:
> Our PACKAGECONFIG override for curl was done to prefer OpenSSL for curl
> but seems to have the side effect of overriding other build flags
> enabled in the upstream recipe, specifically the ones that enable
> verbose debug prints and proxy support.
> 
> This affects git clone while behind a proxy.
> 
> Explicitly enable these in arago.conf.
> 
> Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
> ---
> This supercedes the previous patch I sent out that was removing our
> custom PACKAGECONFIG option, as Ryan felt we would have issues with TSU
> exemptions as the comment states. So this version just enables the two
> options we care about.
> 
> A third option in the upstream recipe that is similarly affected is
> threaded_resolver but we don't currently know if it is essential. So I'm
> not touching that in this patch. Let me know if someone disagrees with
> this and I can resubmit enabling that as well.
> 
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 67468cc0..eb380c63 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -137,7 +137,7 @@ PACKAGECONFIG_append_pn-qtwayland = " examples"
>   PACKAGECONFIG_append_pn-qtwebengine = " examples"
>   
>   # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
> -PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
> +PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} proxy ssl verbose zlib"
>   
>   PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
>   

Reviewed-by: Ryan Eatmon <reatmon@ti.com>


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

