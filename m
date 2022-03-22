Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 165D0C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 20:49:59 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.859.1647982198082105278
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 22 Mar 2022 13:49:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IqmUQUzr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MKnuBt008705;
	Tue, 22 Mar 2022 15:49:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647982196;
	bh=p6g1zU+nr34oyw+Bww2xHNcs3ZToIyL3J+sWDB8mgmM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IqmUQUzrYUNcVfjfTAUV/o198VwGnEQpGrB1co6RzlO7vqsM/dlyOjPaYCnEAJ99z
	 VRZIgKb7tw7ArtaqFU3bj6sL8AhZiOmb1eBOcARwudiKVyk6vgUETsXuvfws8l9jzx
	 sFozYforV8Y59E0eisDRT/CD9IjjFVsCYtpdmw6k=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MKnubH054578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 15:49:56 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 15:49:55 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 22 Mar 2022 15:49:55 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22MKntQb042673;
	Tue, 22 Mar 2022 15:49:55 -0500
Date: Tue, 22 Mar 2022 15:49:55 -0500
From: Nishanth Menon <nm@ti.com>
To: <reatmon@ti.com>
CC: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][dunfell][PATCH 2/3] packagegroup-*-graphics: add
 virtual provider for AM62x GPU driver v2
Message-ID: <20220322204955.kj74x5e6lx4qtghr@borrowing>
References: <20220322193554.24404-1-reatmon@ti.com>
 <20220322193554.24404-3-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220322193554.24404-3-reatmon@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 22 Mar 2022 20:49:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13715

On 14:35-20220322, Ryan Eatmon via lists.yoctoproject.org wrote:
> From: Krunal Bhargav <k-bhargav@ti.com>
> 
> Signed-off-by: Krunal Bhargav <k-bhargav@ti.com>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../conf/distro/include/arago-prefs.inc              | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index a356c76c..7bc2ba52 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -14,12 +14,12 @@ PREFERRED_PROVIDER_virtual/libgles2 = "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/libgbm = "ti-sgx-ddk-um"
>  PREFERRED_PROVIDER_virtual/gpudriver = "ti-sgx-ddk-km"
>  
> -# J7 has a Rogue GPU core
> -PREFERRED_PROVIDER_virtual/egl_j7 = "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles1_j7 = "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgles2_j7 = "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/libgbm_j7 = "ti-img-rogue-umlibs"
> -PREFERRED_PROVIDER_virtual/gpudriver_j7 = "ti-img-rogue-driver"
> +# K3 TI Platforms has a Rogue GPU core
> +PREFERRED_PROVIDER_virtual/egl = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles1 = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles2 = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgbm = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/gpudriver = "ti-img-rogue-driver"

How does this apply to k3 and leave non-k3 alone? Also, am65x for example is
sgx.

>  
>  # This is required when using keystone devices with graphical support
>  # such as Qt5
> -- 
> 2.17.1
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#13711): https://lists.yoctoproject.org/g/meta-arago/message/13711
> Mute This Topic: https://lists.yoctoproject.org/mt/89960456/5513541
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [nm@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

