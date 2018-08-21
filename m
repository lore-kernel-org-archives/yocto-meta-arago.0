Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BB9D2529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:33:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMWs7b127069
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534890774;
	bh=lO6AE23MewG64zq81gPugNayikRdiVveVjWVJXK5NNE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Av4Y396hKWaOU+5Xw9YRVBPsP5Br1Nd1fNMPaZoL/dMqGozRIcafvLkOy5blRrU9v
	+UoFXtWfgvV1sG+w0vuBpg+QJrGZ/FbN/Wzg66NNCt/g2u04yGEpFGbDl54+uBWk6k
	gDLSE5Mo1bzLgwd5IVYjdYa7Sn+wv0OxFfWRcjbg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMWsiY002005
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:32:54 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:32:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:32:54 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMWrJH004423;
	Tue, 21 Aug 2018 17:32:53 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534889027-32133-2-git-send-email-j-stiffler@ti.com>
	<20180821221628.GY29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <47befd94-f091-3fc2-69e5-f7ea63330b13@ti.com>
Date: Tue, 21 Aug 2018 18:32:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180821221628.GY29422@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 22:33:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/21/2018 6:16 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 21, 2018 at 06:03:46PM -0400, Jacob Stiffler wrote:
>> * Add the secondary toolchain to the devkit
>>    if SECONDARY_TOOLCHAIN_ARCH is defined.
> SECONDARY_TARGET_ARCH?

Good catch. v3 coming up!

>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>> v2 changes:
>> * initialize SECONDARY_TOOLCHAIN_ARCH
>>
>>   .../packagegroups/packagegroup-arago-cross-canadian.bbappend   | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>> new file mode 100644
>> index 0000000..b05e493
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>> @@ -0,0 +1,10 @@
>> +PR_append = ".arago0"
>> +
>> +SECONDARY_TARGET_ARCH ?= ""
>> +
>> +SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
>> +                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
>> +
>> +RDEPENDS_${PN}_append = " \
>> +    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
>> +"
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


