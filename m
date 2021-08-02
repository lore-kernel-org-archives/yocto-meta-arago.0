Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id B665852A58
	for <meta-arago@arago-project.org>;
	Mon,  2 Aug 2021 18:13:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 172IDSOR076495;
	Mon, 2 Aug 2021 13:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1627928008;
	bh=o2I6rNwud42B7ZJIEmWKBC+P/eRH3o3wov+n7RNA1rQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=xZGtw2oWU/C8XUFkdaD3KlMts6ZCKeiadfz7QS8L5AhqKq1KzaeY1oE+sut2Dl8YO
	8bFsc04J7HiAXxHDxp8duu/4QvYvUoBExahhL9ryfxXceShsnTWbFDIrYmGtJ0QxlA
	+Bz5scdquih/W2FLXt0ix9BDmLLVFs/25khwN1Nw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 172IDSM1059086
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Aug 2021 13:13:28 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 2 Aug 2021 13:13:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 2 Aug 2021 13:13:28 -0500
Received: from [10.250.69.185] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 172IDRL8058167;
	Mon, 2 Aug 2021 13:13:27 -0500
To: "Weaver, Lucas" <l-weaver@ti.com>, Priya N S
	<priya.ns@mistralsolutions.com>, <meta-arago@arago-project.org>
References: <20210729125011.9120-1-priya.ns@ti.com>
	<61e6c90f-2c6b-5879-66f6-4d6f8b4c9854@ti.com>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <653f3b06-276c-d923-0d0f-70c52ee421d2@ti.com>
Date: Mon, 2 Aug 2021 13:13:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <61e6c90f-2c6b-5879-66f6-4d6f8b4c9854@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [EXTERNAL] [tisdk-setup-scripts] [master] [PATCH-V4 0/4] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Mon, 02 Aug 2021 18:13:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Thanks. Applied series to master.


On 8/2/2021 12:55 PM, Weaver, Lucas wrote:
> 
> 
> On 7/29/2021 7:50 AM, Priya N S wrote:
>> Hi All,
>>
>> This series of patches fix the issues observed in the create-sdcard
>> script.
>>
>> Changes in V4:
>> The patch #4 is new in the series. This patch increases the boot
>> partition size to 128 MB in order to sync with WIC image boot
>> partition size.
>>
>> v3:
>> http://arago-project.org/pipermail/meta-arago/2021-July/013245.html
>> v2:
>> http://arago-project.org/pipermail/meta-arago/2021-June/013218.html
>> v1:
>> http://arago-project.org/pipermail/meta-arago/2021-June/013197.html
>>
>>
>> Priya N S (4):
>>    create-sdcard.sh: fix regex used for rootfs tarball
>>    create-sdcard: Fix wrong rootfs tarball selection
>>    create-sdcard.sh: Stop using cylinder as unit for partition size
>>    create-sdcard: Increase boot partition size to 128 MB
>>
>>   create-sdcard.sh | 76 ++++++++++++++++++++++++++++++++++++------------
>>   1 file changed, 58 insertions(+), 18 deletions(-)
>>

> Reviewed-by: Lucas Weaver <l-weaver@ti.com>

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

