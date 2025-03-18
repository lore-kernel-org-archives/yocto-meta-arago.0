Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A17C28B2F
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:34:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.2822.1742322868017026476
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 11:34:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TPV10mni;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IIYRPE2706247
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Mar 2025 13:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742322867;
	bh=qvoQa4cObyKqSDQBxqfGwwMoz2oAxO+BUFw4l3QAJHQ=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=TPV10mniqEGyvZnx0v4G/w1TA3XiXy5pS74I1I24HTuIMTLmclql0aG9zgGozNGTs
	 1wdHObnGqCFSf4N5SRylKBpf4RJBEA7wi+Wn+Hhwfz1FAUG3/Ra45XTcdBQevAuIlw
	 3Aw74qFK/9gTsSFoxiepCmZwEHDEvY3mGoRaTgdA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52IIYRdh024719
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Mar 2025 13:34:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 13:34:26 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 13:34:26 -0500
Received: from [128.247.81.69] (dtmxl9433pnr.dhcp.ti.com [128.247.81.69])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IIYQb0092167;
	Tue, 18 Mar 2025 13:34:26 -0500
Message-ID: <7f976849-16d0-4708-900e-f5f28457ac45@ti.com>
Date: Tue, 18 Mar 2025 13:34:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] nw-configurator: Do not
 inherit autotools
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <182DF8F80924F64A.26536@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <182DF8F80924F64A.26536@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 18:34:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16088


This does not apply to scarthgap.. another patch incoming for that.


On 3/18/2025 1:26 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
> This recipe does not use autotools at all and it is now an error to
> inherit autotools and not have a configure script. [1]
> 
> [1] https://git.openembedded.org/openembedded-core/commit/?id=6d327a39befae44a88a812bdf4acde800dcee57b
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
> index 50debb36..5f9d53e7 100644
> --- a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
> +++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
> @@ -10,7 +10,7 @@ UNPACKDIR = "${S}"
>   
>   DEPENDS = "sysrepo"
>   
> -inherit autotools pkgconfig
> +inherit pkgconfig
>   
>   do_compile() {
>   	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR} ${S}/nw-configurator.c -o nw-configurator -lsysrepo

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

