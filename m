Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E21DFC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 19:22:24 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.958.1684783336872095319
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 12:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Mllfa2sG;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MJMG68128320
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 14:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684783336;
	bh=q8NkuSNSYxYL5QVuXR/xnYtUyynTvQDr46/BdpX7pYY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Mllfa2sGjtR3vMImuQZDrRfoPqRZP+5vftN7fXZsKjGrlhzsCh9hqQ305LG8g36v4
	 ZnTTXM9GZRjnRER1IhLIVj28H/VUbZ0RBEkP9EJBbXz0UiwAeDnY7LhE4yVu+mLZYn
	 ADNbBrmi576tkfL0uRTyVmHAMVgrNhoIN/9t5EEc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MJMGDl008559
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 14:22:16 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 14:22:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 14:22:15 -0500
Received: from [10.250.32.56] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MJMF5c012707;
	Mon, 22 May 2023 14:22:15 -0500
Message-ID: <1d72f6df-5f49-669d-1a50-d395c7b1c544@ti.com>
Date: Mon, 22 May 2023 14:22:15 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/kirkstone][PATCH] receipes-multimedia:
 gstreamer: Add kmssink support
Content-Language: en-US
To: <b-brnich@ti.com>, Darren Etheridge <detheridge@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Devarsh Thakkar <devarsht@ti.com>
References: <20230522175821.510236-1-b-brnich@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230522175821.510236-1-b-brnich@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 19:22:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14434

On 5/22/23 12:58 PM, Brandon Brnich via lists.yoctoproject.org wrote:
> Remove the old bbapend files that dealt with old gstreamer version. These files
> applied patches to hack gstreamer to work with our devices. We are no longer carrying
> these patches into kirkstone. Our devices should work with the kirkstone packaged
> gstreamer.
> 

The important part of these patches was GST DRM Allocator support, quick check
I see it used by:

gstreamer1.0-plugins-vpe
gstreamer1.0-plugins-ducati

Would be nice to keep multimedia acceleration working on all the non-K3 platforms..

I'm guessing these could be converted without too much effort to one of these[0]
and if so do you have any timelines for that?

[0] https://gstreamer.freedesktop.org/documentation/allocators/index.html?gi-language=c

Andrew

