Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442EBC38142
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 15:52:51 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.105487.1674834762572241300
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 07:52:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IpHYVwYg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RFqceI130323;
	Fri, 27 Jan 2023 09:52:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674834758;
	bh=TJoD2lH/lr+L0xD92AkBqvgD0wj2uhlxsIskil37Ulw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IpHYVwYgj84jhH27BNrMy7ePj8W+C2VlT75JFg/z2BDwCfw5KfjXtgKYUi9Xm2FzS
	 gN6qCSGjMR7IjfUsgZa1Fpb6nChitdSvAAYnSlN5angrjkY0W4hgMMSwU91LoJe0zK
	 6lWk1X1jkufa78Iu+CMXkwP9oKhZYbR+Zg/3CqrY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RFqcdO110637
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Jan 2023 09:52:38 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 09:52:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 09:52:38 -0600
Received: from [10.250.32.60] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RFqbwW045644;
	Fri, 27 Jan 2023 09:52:37 -0600
Message-ID: <46352935-21d8-680c-776b-580bdc333ce6@ti.com>
Date: Fri, 27 Jan 2023 09:52:37 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-arago] [PATCH] all: Remove excessive switches based on gpu
Content-Language: en-US
To: <rs@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: <denys@ti.com>, <reatmon@ti.com>, <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230124231733.2219206-1-rs@ti.com>
 <20230126205801.GE22689@denix.org> <D1D4PR.W8OT1AZZ313H@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <D1D4PR.W8OT1AZZ313H@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 27 Jan 2023 15:52:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14190

On 1/26/23 6:51 PM, Randolph Sapp via lists.yoctoproject.org wrote:
> On Thu, Jan 26 2023 at 03:58:01 PM -0500, Denys Dmytriyenko <denis@denix.org> wrote:
>> I'm realizing now that simply depending on "opengl" DISTRO_FEATURES won't be
>> enough, unfortunately.
>>
>> The issue is that DISTRO_FEATURES are set by the distro globally for all
>> machines, whether with accelerated graphics, display w/o acceleration or
>> completely headless. E.g. when building for J7200, "opengl" will be set, but
>> none of the graphics packages should be built or installed into the image.
>>
>> So, some sort of check for MACHINE_FEATURES or PREFERRED_PROVIDER (less
>> elegant) would still be needed in some places...
> 
> Arguably that's a package group / distro target issue. I believe when a user selects the default image with all features enabled for J721E and J721S2 the package selection should be equivalent (or at least as equivalent as possible with the stuff going on now in meta-ti) to align with the distro features selected. I believe the solution to this is to add a headless target/image that removes Qt, GTK, etc. from the selected package groups and to suggest the use of that instead if users want a truly headless distro.
> 
> 

Agree here, I believe this was the solution we came up with in
our call the other day.

I'd go as far as suggesting we drop the "default" image and try to match
Ubuntu naming here. Have 3 images: Desktop, Server, and IoT. (IoT is
a rebranded tisdk-thinlinux-image). User selects the one that matches
their usecase, no need to force them into one bucket automatically based
on their hardware.

Andrew

> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14189): https://lists.yoctoproject.org/g/meta-arago/message/14189
> Mute This Topic: https://lists.yoctoproject.org/mt/96510217/3619733
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

