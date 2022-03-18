Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB0EC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 19:26:20 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14132.1647631579660269223
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 12:26:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=C9ZxsO7B;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IJQG6q097502;
	Fri, 18 Mar 2022 14:26:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647631576;
	bh=50kh6ys+S4yBKCWWMwJhs554coC6dD2ic9bXeYt/sVw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=C9ZxsO7BQGn/NvnUA7UmmzKVRnsE2dRJhCkXyPEAHS5hlcBrGmxz/O4nGDLeqyWyj
	 qedbCKy3LZDhdcZc8DL/4q3YTLH5IQsEVeIi/aM0L9/t11idubJLuhKXeciqN2Mhyd
	 N4ZUbHvA4dzl51a5N9M+AC2uZNlx9E55A09Z59MY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IJQGUn015078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 14:26:16 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 14:26:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 14:26:15 -0500
Received: from [10.249.37.177] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IJQFAv026681;
	Fri, 18 Mar 2022 14:26:15 -0500
Message-ID: <2beb24fb-4c96-ffc6-4497-2283dd7066b6@ti.com>
Date: Fri, 18 Mar 2022 14:26:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [oe-layersetup PATCH] configs: Switch github repos from git to
 https
Content-Language: en-US
To: Nishanth Menon <nm@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
References: <20220318172714.17656-1-nm@ti.com>
 <0ef8a8f1-cfd3-7e60-8922-fd271ae255b0@ti.com>
 <20220318174817.uosngm5oo2ppbyau@quotable>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20220318174817.uosngm5oo2ppbyau@quotable>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 19:26:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13673


I have applied this patch, but I think we need to consider editing the 
other configs.


On 3/18/2022 12:48, Nishanth Menon wrote:
> On 12:37-20220318, Ryan Eatmon wrote:
>>
>> What about all of the other configs?
> 
> Did'nt want to touch the baseline configs. I am assuming folks will
> probably need to do the following in ~/.gitconfig
> 
> [url "https://github.com"]
>          insteadOf = git://github.com
> 

-- 
Ryan Eatmon
reatmon@ti.com

