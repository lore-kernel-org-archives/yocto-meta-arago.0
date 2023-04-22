Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE813C7618E
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 16:46:39 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.11426.1682181998441498364
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 22 Apr 2023 09:46:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tgZ4Uzdm;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33MGkZuo124996;
	Sat, 22 Apr 2023 11:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682181995;
	bh=A8iiQuVQKhone7VNx1lOoZc6o+gVT+zjk5RRWqB5eAs=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=tgZ4UzdmpuJ5eAOt06IFdnjLjbB/+w8yiqhAQR0Ysek9/Gi56JW2rek24FL9HP3H1
	 x4lF9ZCrvCb8M5yUZyYSJ+DKhYbCNhh9CZCQcW/dRHVmuiEz++XFlV/+Oo6WleAyIG
	 wi+jhgNhEAOh+1kGbpqb0k1ciUvbZIaPBORkT64w=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33MGkZU5013111
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 22 Apr 2023 11:46:35 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Sat, 22
 Apr 2023 11:46:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Sat, 22 Apr 2023 11:46:35 -0500
Received: from [10.249.32.24] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33MGkZX6109141;
	Sat, 22 Apr 2023 11:46:35 -0500
Message-ID: <f5048837-193e-5e66-3df1-a1710b00ff20@ti.com>
Date: Sat, 22 Apr 2023 11:46:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] ltp-ddt_20230127: Add
 rpmsg_rpc.h to SRC_URI
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230421193806.903-1-reatmon@ti.com>
 <17580A64E3215176.29498@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <17580A64E3215176.29498@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 22 Apr 2023 16:46:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14326


I just remembered that I was going to rework the ltp-ddt_20230127 
patchset and split the ltp change out into it's own patch.  When I 
rework that I will include this patch change in the new ltp_ddt recipe 
without the need for a patch.


On 4/21/2023 14:38, Ryan Eatmon via lists.yoctoproject.org wrote:
> Rather than rely on the TI kernel custom headers that are needed for
> compilation, directly pull in the needed header from the ti-linux-kernel
> repo on git.ti.com.
> 
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb             | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> index b7c695f3..52e2f611 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
> @@ -20,11 +20,14 @@ BRANCH ?= "master"
>   SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
>   SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
>   
> +SRC_URI:append = "https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
> +SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
> +
>   export prefix = "/opt/ltp"
>   export exec_prefix = "/opt/ltp"
>   
>   EXTRA_OEMAKE:append = " \
> -    KERNEL_USR_INC=${STAGING_INCDIR} \
> +    KERNEL_USR_INC=${WORKDIR} \
>       ALSA_INCPATH=${STAGING_INCDIR} \
>       ALSA_LIBPATH=${STAGING_LIBDIR} \
>   "

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

