Return-Path: <devarsht@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E462C0219B
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 13:26:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.12083.1739280392001695117
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 05:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RzRAhlTp;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: devarsht@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51BDQVUY3608164
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 07:26:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739280391;
	bh=vI8rNdPro2NYOka6uMZmDT+YOQaOkZvYVrQ5MKAsb5Y=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=RzRAhlTpdGSaY+tHyCeMz9buCRPF5hWizv1PW1pgr1rRcQFdPFwYNylzb9YzYwQ5Q
	 kbs0/ccX9NzYWZql8gGPsD4IDNPv/UYpWn77JOWdf278PGQINQ83qzaBf815Fj00oQ
	 HMAAB+f/1UbnZDLPw8VnK86uwB8bLZE0kejm5dak=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51BDQUlE007664
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 07:26:30 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Feb 2025 07:26:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Feb 2025 07:26:30 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be forged))
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51BDQRpq034768;
	Tue, 11 Feb 2025 07:26:28 -0600
Message-ID: <ab9c781b-4d61-d664-798d-27a910856396@ti.com>
Date: Tue, 11 Feb 2025 18:56:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago][master/scarthgap][PATCH] meta-arago-extras:
 v4l-utils: Add recipe for v1.28.1
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <vaishnav.a@ti.com>, <u-kumar1@ti.com>,
        <r-donadkar@ti.com>, <a-limaye@ti.com>
References: <20250211075813.970579-1-y-abhilashchandra@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250211075813.970579-1-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Feb 2025 13:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15836

Hi Abhilash,

Thanks for the patch.
On 11/02/25 13:28, Yemike Abhilash Chandra wrote:
> An older recipe of v4l-utils (v1.26.1) is present in the meta-oe layer
> for scarthgap.
> 
> TI's 6.12 based kernel has backported multistream routing APIs from
> upstream kernel, which requires v4l-utils to be the latest released
> version (v1.28.1).
> 
> Thus we override the recipe in this layer to the latest release of
> v4l-utils.
> 
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
> Single camera setup logs: http://serenity.dal.design.ti.com:7777/ohidowecig.yaml
> Multi camera setup logs: http://serenity.dal.design.ti.com:7777/oqowimumeh.yaml

The above links are not public. You may use gist.github.com for hosting test
logs and maybe mention those in commit message itself as done here [1]. But
otherwise, the patch looks good to me, feel free to add :

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

[1]: https://lore.kernel.org/all/20240607132806.3550564-1-devarsht@ti.com/

Regards
Devarsh

