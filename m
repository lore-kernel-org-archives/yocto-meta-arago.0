Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E238EB64D7
	for <webhook@archiver.kernel.org>; Wed, 21 Jun 2023 14:17:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.11818.1687357052633107195
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 21 Jun 2023 07:17:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iAWxYN2t;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35LEHS3t101755;
	Wed, 21 Jun 2023 09:17:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687357048;
	bh=q+YPe2XxcbCyuKIlRnPSy1EMda5gk4Ady7QRlitJUZM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iAWxYN2t/a/9Uxvqulni+MDoVaK4mXwA4lGAjYIGUgN1MNg2Xcx1GC3PpZ0YFkC+6
	 l3v2C7sVCYrL++iQ4POCjiAmCr/9eiuvt2Y0GffNrUyJ9Q2py82ZQbV56ZpLf9qgMV
	 KgGqNUh1KB17VpDFRZcjz9vxioOi2+J8W2XWk1xI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35LEHSdd019264
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 21 Jun 2023 09:17:28 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 21
 Jun 2023 09:17:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 21 Jun 2023 09:17:28 -0500
Received: from [10.249.34.224] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35LEHS0N017150;
	Wed, 21 Jun 2023 09:17:28 -0500
Message-ID: <63518fde-1ae1-e3ed-1af1-848b59d7930f@ti.com>
Date: Wed, 21 Jun 2023 09:17:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [master/kirkstone 3/3] tisdk-default-image: Add packages to
 support NETCONF/YANG
Content-Language: en-US
To: Ravi Gunasekaran <r-gunasekaran@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <g-gupta@ti.com>
References: <20230621091801.14944-1-r-gunasekaran@ti.com>
 <20230621091801.14944-4-r-gunasekaran@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230621091801.14944-4-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 21 Jun 2023 14:17:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14672



On 6/21/2023 4:18 AM, Ravi Gunasekaran wrote:
> Add sysrepo, netopeer2-server, nw-configurator packages
> 
> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
> ---
>   .../recipes-core/images/tisdk-default-image.bb             | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> index bb825e09..8239e0ce 100644
> --- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> +++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
> @@ -5,7 +5,12 @@ DESCRIPTION = "Complete Arago TI SDK filesystem image containing complete\
>   
>   require arago-image.inc
>   
> -ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
> +ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= "\
> +    sysrepo \
> +    netopeer2-server \
> +    nw-configurator \
> +    tsn-yang-models \
> +"

NAK.  This variable is there to allow for the user to add packages from 
the local.conf.  Putting anything in there by default creates the risk 
that the users will lose these packages if they set the variable.

If these packages are needed, then they should be included in a 
packagegroup.  Feel free to create a new package group for sysrepo 
support.  (ie. packagegroup-arago-tisdk-sysrepo)


>   IMAGE_INSTALL += "\
>       packagegroup-arago-base \

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

