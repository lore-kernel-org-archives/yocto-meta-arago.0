Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8F6C38A02
	for <webhook@archiver.kernel.org>; Fri,  8 Apr 2022 17:09:36 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2324.1649393398397585016
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Apr 2022 21:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=O1ca06AS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2384ntmS060849;
	Thu, 7 Apr 2022 23:49:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649393395;
	bh=dXJ2rqTyrP8ByKKFexyfC93Jl1VmJUYk9YH2k4LJRzI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=O1ca06AS7ZzafrQyx1Ejp4qw4pZqF5B4NJu/MUYolJbqLy3LovOq3QsDKIiVLX2uD
	 VRwJjmDzcHp2IhlY4tO0DxujRd0aT85sAoMXRS1SBXTKF4Jfp89sCcc7K7FnCC65wN
	 lEZgxB+OdwhKnf7+8jihNNKGTvpkbtSJZhPWqyss=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2384ntAB024507
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Apr 2022 23:49:55 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Apr 2022 23:49:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Apr 2022 23:49:55 -0500
Received: from [10.250.33.210] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2384nsPr010841;
	Thu, 7 Apr 2022 23:49:55 -0500
Message-ID: <32c4da56-625f-b744-f4ce-563bbc2bb3b5@ti.com>
Date: Thu, 7 Apr 2022 23:49:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][dunfell][PATCH v4 2/2] packagegroup-*-graphics: add
 virtual provider for AM62x GPU driver v2
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220407131109.7488-1-reatmon@ti.com>
 <20220407131109.7488-3-reatmon@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220407131109.7488-3-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 08 Apr 2022 17:09:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13777

On 4/7/22 8:11 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Krunal Bhargav <k-bhargav@ti.com>
> 
> Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index a356c76c..f9fab020 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -21,6 +21,13 @@ PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
>   PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
>   
> +# am62xx has a Rogue GPU core


Uses the "Rogue" umlibs (we should fix that naming), but this is not a Rogue GPU
core, to avoid public confusion I'd just drop this comment. (or specify the GPU
by name not family code).

Andrew


> +PREFERRED_PROVIDER_virtual/egl_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles1_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles2_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgbm_am62xx = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/gpudriver_am62xx = "ti-img-rogue-driver"
> +
>   # This is required when using keystone devices with graphical support
>   # such as Qt5
>   PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"

