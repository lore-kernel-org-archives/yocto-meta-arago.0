Return-Path: <aparnab@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 7A8CC52AA8
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 18:58:40 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CIwtFd113268;
	Fri, 12 Mar 2021 12:58:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615575535;
	bh=sEJ4vnvt9En2HOU8h3YAl+q1eXI7rabtpO/37tl0gVI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=EfUmHPpK9tQfkRm/VOJxgH/Oz1idtu6T5ezk2UCSZnq/gnpdzc9VsV6QVIrn5hxoQ
	yyviE6SVw4pnu8JNrlBmEkjFVfuw30UHniWxM3qnfKuNErBU3+3iHa39xD5IBzqnrD
	2lTJspRGJv44IMxNiKgsjOlhWzBWbvX6eOuCW77U=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CIwtla007489
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Mar 2021 12:58:55 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 12:58:55 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 12:58:55 -0600
Received: from [128.247.81.129] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CIwtOo052286;
	Fri, 12 Mar 2021 12:58:55 -0600
To: Denys Dmytriyenko <denis@denix.org>
References: <20210312161817.2581-1-aparnab@ti.com>
	<20210312163956.ti7erugzz6hcvx2m@carmaker>
	<ee3daee0-c656-fc2f-bcd2-e0734af92f22@ti.com>
	<20210312185409.GZ4892@denix.org>
From: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <0d2d1004-d31f-afae-10bb-644a1089932e@ti.com>
Date: Fri, 12 Mar 2021 12:58:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210312185409.GZ4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] ltp-ddt: Update to latest
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Mar 2021 18:58:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/12/21 12:54 PM, Denys Dmytriyenko wrote:
> On Fri, Mar 12, 2021 at 12:48:29PM -0600, Aparna Balasubramanian wrote:
>> Nishanth,
>>
>> Sure, will send v2 with change information.
>>
>> I will update filename as part of 2021 lts updates.
> Have you rebased ltp-ddt against newer 2021 ltp version?
>
Denys,

Not yet.

Regards,

Aparna


