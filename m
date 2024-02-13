Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7C1C48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 19:17:36 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22414.1707851850127166937
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 11:17:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HxblRbCQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41DJHQRD064009;
	Tue, 13 Feb 2024 13:17:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707851846;
	bh=2gQ6Hw2QfPpr+WGZkN4VO314dSjBNMcqoX5azjlAcjs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HxblRbCQnja9QaqSKtM7ePVJU339O/m3D3gsVC3Ep0T+TJxHkM8KTPigvmM1NIyRE
	 j7Ndixoxr7upbDNhKQwXtp56vd7pzYNdDhS64Lv3turw6NUq8xu/rvqs5jnX6yBkFo
	 wDg8LUG81kqKdJs5vGfLEwvMsacF38EzkCJn6YHU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41DJHQNQ051750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 13:17:26 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 13:17:26 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 13:17:26 -0600
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41DJHPVu108466;
	Tue, 13 Feb 2024 13:17:25 -0600
Message-ID: <819a7cd2-2f3f-4ade-8e00-0dc6bd40ce1d@ti.com>
Date: Tue, 13 Feb 2024 13:17:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCHv2 2/4] meta-arago: distro: add a
 bbappend to patch the chromium browser
Content-Language: en-US, en-US-large
To: Denys Dmytriyenko <denis@denix.org>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
References: <20240209185635.32675-1-detheridge@ti.com>
 <20240209185635.32675-3-detheridge@ti.com> <20240213185921.GM15614@denix.org>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20240213185921.GM15614@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 19:17:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15180

On 2/13/24 12:59, Denys Dmytriyenko wrote:
> On Fri, Feb 09, 2024 at 12:56:33PM -0600, Etheridge, Darren via lists.yoctoproject.org wrote:
>> From: Darren Etheridge <detheridge@ti.com>
>>
>> This applies a patch for meta-browser/chromium-ozone-wayland to make the
>> sandboxing work with the Imagination GPU components without the need for
>> the --no-sandbox flag.
>>
>> GPU acceleration in Chromium is dependant on IMG DDK 23.3.  It works
>> across AXE/BXS/8XE GPU's.   No acceleration is expected for SGX.
>>
>> Also add an upstream patch to stop Chromium from segfaulting when it is
>> run with no input devices connected to the board.
>> Patch was retrieved from:
>> https://chromium.googlesource.com/chromium/src/+/323077958301bc321d840a2c2b983ab469934753
>>
>> Signed-off-by: Darren Etheridge <detheridge@ti.com>
>> ---
>>
>> v2 Fixed typo on bbappend in subject
>>
>>   meta-arago-distro/conf/layer.conf             |  2 +
>>   ...omium-ozone-wayland_111.0.5563.64.bbappend |  8 ++
>>   ...dbox-allow-access-to-PowerVR-GPU-fro.patch | 74 +++++++++++++++++++
>>   ...-chromium-32307795-fix-nullprt-deref.patch | 52 +++++++++++++
>>   4 files changed, 136 insertions(+)
[snip]
> 
 > Both chromium patches are missing Upstream-Status: tag - I guess 
first should
 > be "Inappropriate [TI RGX specific]" and the second "Backport" if 
it's already
 > merged upstream:
 > 
https://docs.yoctoproject.org/contributor-guide/recipe-style-guide.html#patch-upstream-status
 >

One for these patches is directly from upstream Chromium. Only one is 
RGX specific, but thanks for linking the naming reference so we can make 
this clear.

