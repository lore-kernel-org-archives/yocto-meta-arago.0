Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE980EB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 15:01:47 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.13682.1687446103253372956
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 22 Jun 2023 08:01:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e1SHZcDA;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35MF1c42042737;
	Thu, 22 Jun 2023 10:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1687446098;
	bh=kD8Qi2Uh94jLoTuH1VLj6wU9Lc7QjxvaN64xGn+gYJ4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=e1SHZcDA4Iqu/cXx/x+pfKy3qqoz8B5TgTdCHI3A/5GV8UhgmhmS1o7Zkt4Cu7tbb
	 6WVNpgsZSNUC00JlK6BXBfAqxW8DgYcukTjAlAHIAELHNlnMQnrnkTgP8uY5qL8YOX
	 XOl4HHEVllhXv0wZ3tUHP+p1CkkiiRXbKvY8i/YE=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35MF1c2o075269
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 22 Jun 2023 10:01:38 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 22
 Jun 2023 10:01:38 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 22 Jun 2023 10:01:38 -0500
Received: from [10.250.37.10] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35MF1bek050213;
	Thu, 22 Jun 2023 10:01:37 -0500
Message-ID: <50665164-7ac5-18c9-24af-0b92b6186e13@ti.com>
Date: Thu, 22 Jun 2023 10:01:37 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH v2 2/3] meta-arago-extras:
 sysrepo: Add meta-sysrepo recipes
To: <r-gunasekaran@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: <denis@denix.org>, <reatmon@ti.com>, <g-gupta@ti.com>, <praneeth@ti.com>
References: <20230622103445.31114-1-r-gunasekaran@ti.com>
 <20230622103445.31114-3-r-gunasekaran@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230622103445.31114-3-r-gunasekaran@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 22 Jun 2023 15:01:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14678

On 6/22/23 5:34 AM, Ravi Gunasekaran via lists.yoctoproject.org wrote:
> meta-sysrepo recipes are hosted at [1]. But the layer seems to
> be inactive. So add the recipes to meta-arago-extras.
> 

Add these recipes one at a time, with their own patch explaining why
it is needed. Several of these recipes have issues and it is hard to
review large series.

Andrew

