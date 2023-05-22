Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D04CC77B73
	for <webhook@archiver.kernel.org>; Mon, 22 May 2023 20:07:45 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2201.1684786063999808574
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 May 2023 13:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Qhw1YmQE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34MK7ZA5050176;
	Mon, 22 May 2023 15:07:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684786055;
	bh=06AAS0o377Kr1NPT06YanC0A3Bx7E5VptiFI5j78QrM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Qhw1YmQEdUUaVdd0QR2jxKJ7AvKtbx88FS/0h3+uHQvKLusWY6EloN6lN15k2VKVT
	 ZVVN7D0UvXqgmtkqR+W+XHO/3IJMtV5VBfbNty6jLpUrYAkrKzDxkuBR7xJN4ObZtA
	 wr+h4XFzqAoiPr/Z7tu/X4JGN5uHlicjgWJ4/e0M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34MK7Ytp091364
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 22 May 2023 15:07:35 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 22
 May 2023 15:07:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 22 May 2023 15:07:34 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34MK7YTU114847;
	Mon, 22 May 2023 15:07:34 -0500
Message-ID: <df445046-78fa-340e-d0e5-ed96055a1121@ti.com>
Date: Mon, 22 May 2023 15:07:34 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master][PATCH 1/3] all: remove all external
 toolchain stuff
Content-Language: en-US, en-US-large
To: Andrew Davis <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230522183847.3663294-1-rs@ti.com>
 <20230522183847.3663294-2-rs@ti.com>
 <039f06e5-23c3-488a-995b-711575a73814@ti.com>
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <039f06e5-23c3-488a-995b-711575a73814@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 May 2023 20:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14439

On 5/22/23 14:31, Andrew Davis wrote:
> On 5/22/23 1:38 PM, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Drop all of the external toolchain stuff. We don't need it anymore now
>> that everything can use the internal yocto compiler and multiarch has
>> been configured properly in meta-ti.
>>
> 
> Another reason was for speeding builds on build farms which could avoid
> re-builing the toolchain each time.
> 
> These days it is probably not worth the uncertaintay around mismatched
> build tools, but at the time this was all neato stuff:
> 
> https://elinux.org/images/c/c8/ExternalToolchainsInYocto.pdf
> 
> Oh well,
> 
> Acked-by: Andrew Davis <afd@ti.com>

Cool, but excessive and a source for issues where clients are using 
build tools different from ours... Ultimately this needed to be culled 
in favor of the yocto standard anyway.

Also, speeding up builds should be a moot point. Sstate cache still 
applies to these host tools so long as the host env doesn't change too 
much, and build containers should prevent that.

