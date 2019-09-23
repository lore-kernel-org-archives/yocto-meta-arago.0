Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id EA8EA520E4
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 13:10:32 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8ND9NX8055500
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 08:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569244163;
	bh=2hDNwa9mBJvt+HCkUOYOovpFR8LZZ5+r/9sIVvSb6OY=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=DfVPaHgxecZBxzj92fm2k1Hii4aWrTqg/kU8qmvOsN+P5PaeavNzZAOY7n7PJOwGG
	f6v50BBo1GTrvwV8p9Qfc+G8Zak4IaJCrMs+llszxPs4ci/YJcy/lh/OUo0B7zE0jK
	gKYLzRSjJstbtKKROVRU6y3yGtRu6SG1aTQUtuek=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ND9N7h055442
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 08:09:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 08:09:17 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 08:09:17 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8ND9NJ4124679;
	Mon, 23 Sep 2019 08:09:23 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1568764660-2369-1-git-send-email-denys@ti.com>
	<58426705-1317-6c6d-4ab2-5781daa2548e@ti.com>
Message-ID: <dedb5e2c-9ead-1bfa-8fc1-4065fda80c94@ti.com>
Date: Mon, 23 Sep 2019 09:09:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <58426705-1317-6c6d-4ab2-5781daa2548e@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-sci-fw: update to 2019.08
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
X-List-Received-Date: Mon, 23 Sep 2019 13:10:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Ping.

On 9/18/2019 8:32 AM, Jacob Stiffler wrote:
> Did the checksums for the hs-enc and hs-cert images change in this 
> version?
>
>
> - Jake
>
> On 9/17/2019 7:57 PM, Denys Dmytriyenko wrote:
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   .../ti-sci-fw/{ti-sci-fw_2019.07.bb => 
>> ti-sci-fw_2019.08.bb}          | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename 
>> meta-arago-distro/recipes-bsp/ti-sci-fw/{ti-sci-fw_2019.07.bb => 
>> ti-sci-fw_2019.08.bb} (96%)
>>
>> diff --git 
>> a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb 
>> b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> similarity index 96%
>> rename from meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
>> rename to meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> index d53e926..fab4de4 100644
>> --- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.07.bb
>> +++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> @@ -14,9 +14,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
>>   TI_SECURE_DEV_PKG ?= ""
>>   export TI_SECURE_DEV_PKG
>>   -SRCREV = "3f7c97c9f923f6fbf1b96dcae1da8620a3bab0b3"
>> +SRCREV = "c75bca342d5a8579c3a459515adb6b77d640a245"
>>   BRANCH ?= "ti-linux-firmware"
>> -SRCREV_imggen = "38a82e00f84efdf381dba001fff75e8411898e99"
>> +SRCREV_imggen = "92623d82dc683e74225ceaac239b29deac437adf"
>>   SRCREV_FORMAT = "imggen"
>>     SRC_URI = " \
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

