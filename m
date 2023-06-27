Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 146F2EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:48:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.7845.1687852081591512063
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 27 Jun 2023 00:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=puF6LHG+;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35R7lwGQ044712;
	Tue, 27 Jun 2023 02:47:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687852078;
	bh=5z5KxRUP4hdjWG+xCZhRCEVTj96jiT0BpgT7nVWHt7Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=puF6LHG+mDm2gz0/w3f15adk3OrZ35ky7Ar1VjM1fPV9UTXFW5K/l6eJMa/II/TAg
	 1ySXElI5F6pPnQ5AZY+WpckZbhIRdxz8ZfjNOQcNC5gCqOKBApBXXTHCKVn2Fwp0g1
	 6rra72XaIIlblnaYD8reU/WZ9hkH9Fe474bGi58Y=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35R7lwLr019628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 27 Jun 2023 02:47:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 27
 Jun 2023 02:47:57 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 27 Jun 2023 02:47:57 -0500
Received: from [10.24.69.76] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35R7ltiQ044419;
	Tue, 27 Jun 2023 02:47:56 -0500
Message-ID: <b186b6d5-82ef-70ae-78e2-46da670f1013@ti.com>
Date: Tue, 27 Jun 2023 13:17:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: gstreamer1.0-plugins-good: Add patches for raw10/12/16 bit and IR
 support
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <devarsht@ti.com>, <j-luthra@ti.com>,
        <a-limaye@ti.com>, Ryan Eatmon <reatmon@ti.com>, <denys@ti.com>
References: <20230626190800.5604-1-r-ravikumar@ti.com>
 <20230626194610.GR1518@denix.org>
Content-Language: en-US
From: Rahul T R <r-ravikumar@ti.com>
In-Reply-To: <20230626194610.GR1518@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 27 Jun 2023 07:48:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14694

Hi Denys,

On 27/06/23 01:16, Denys Dmytriyenko wrote:
>> receipes-multimedia: gstreamer: gstreamer1.0-plugins-good: Add patches for raw10/12/16 bit and IR support
> ^^^ please drop first 2 parts in there - "receipes-multimedia: gstreamer:"
> And try to keep short log line under 70 characters...
Thanks for the review !
Have sent v2 with the fixes

https://lists.yoctoproject.org/g/meta-arago/message/14693

Regards
Rahul T R

>
> On Tue, Jun 27, 2023 at 12:38:00AM +0530, Rahul T R via lists.yoctoproject.org wrote:
>> Add patches to support 10/12/16 bayer formats and bayer formats with IR
>> components. This are required to support capture from imx390 and ov2312
>> cameras using gstreamer v4l2src
>>
>> Signed-off-by: Rahul T R <r-ravikumar@ti.com>

