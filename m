Return-Path: <r-gunasekaran@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB93EB64DD
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 04:20:12 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.35270.1687494007659100034
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 21:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GHzIAXLA;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: r-gunasekaran@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35N4K3rJ102347;
	Thu, 22 Jun 2023 23:20:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687494003;
	bh=HcFVGIsWYsbFazIRVwY2Bls7IQxhOBhx0uIdvvrrDac=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GHzIAXLAUMovYPMo+qqlEHOgW8uHMxIVKtr+5QA3kL3e/e9lRYs25acWNco7/9MSm
	 PHOZ0P392vPpIGQ70tRWNoXR2EeIaUKuraOhdtm+7vK7czJB2o54SCQOgkJSr3s9Uj
	 GS4dITo1KKrfEuy07jTLBwkmf8HuLqEkM8KEzR8k=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35N4K3Q9111899
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 23:20:03 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 23:20:02 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 23:20:02 -0500
Received: from [10.24.69.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35N4K04t027665;
	Thu, 22 Jun 2023 23:20:01 -0500
Message-ID: <1fc72339-c170-410b-ac98-fa6d6890b29d@ti.com>
Date: Fri, 23 Jun 2023 09:49:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [master/kirkstone][PATCH v2 1/3] meta-arago-extras: sysrepo:
 Update checksum for nw-configurator
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <g-gupta@ti.com>,
        <praneeth@ti.com>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-2-r-gunasekaran@ti.com>
 <20230622155631.GN1518@denix.org>
From: Ravi Gunasekaran <r-gunasekaran@ti.com>
In-Reply-To: <20230622155631.GN1518@denix.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 23 Jun 2023 04:20:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14683



On 6/22/23 9:26 PM, Denys Dmytriyenko wrote:
> On Thu, Jun 22, 2023 at 04:04:43PM +0530, Ravi Gunasekaran wrote:
>> Update the checksum values for nw-configurator
> 
> Why?
> 
> It is always "why?" question you should answer in the commit log. Everyone 
> can see in the patch itself "what?" you are changing - license checksum - 
> and "where?" you are changing it - in nw-configurator.
> 
> Moreover, any license change when the checksum differs should be explicitly 
> explained to track any re-licensing due to legal reasons.
> 
> 
>> Signed-off-by: Ravi Gunasekaran <r-gunasekaran@ti.com>
>> ---
>>  .../recipes-sysrepo/nw-configurator/nw-configurator.bb          | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> index 5a152017..b8a93f1c 100644
>> --- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> +++ b/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
>> @@ -1,6 +1,6 @@
>>  LICENSE="GPLv2"
>>  DESCRIPTION = "Sysrepo based repo to configure EST"
>> -LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=a818a6cf4fbeeb21acc8b4e9956c08a4"
>> +LIC_FILES_CHKSUM = "file://nw-configurator.c;md5=f2ec672593c3707bb4fe68307dbf0506"
> 
> Since you are using a source file for license checksum, you might want to 
> limit it to the license text only, so code changes won't affect the checksum. 
> Use beginline=x and endline=y, e.g.:
> https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb#n4

Thanks for sharing the reference. I will update accordingly

> 
> 
>>  SRC_URI = "file://nw-configurator.c"
>>  
>> -- 
>> 2.17.1

-- 
Regards,
Ravi

