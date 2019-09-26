Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A3D61520E2
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 12:27:13 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QCQ3cm039164
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 07:26:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569500763;
	bh=CEqPPGrqj55uuwMUDzxHlo4VYR6Kh4PCMxw/+MtR4m4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=V7QUZHCB3o2EQ7LbpVnYrdwM+CktCVRXfD9XrrPBVujk+KwBVnFiykJcJvCPdHX4D
	uaPivHY4boeRwNaUY4nPhCqoFTaFYq9/84/lpCTLqJqr2oqjP0xn9nEYRtqJ+WV5GB
	GNIQaJKR0pVvitzi7CafYj6JDkB8FckmtHBr2M0A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8QCQ2L4024180
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 07:26:03 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 07:25:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 07:26:02 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QCQ0Nt106988;
	Thu, 26 Sep 2019 07:26:00 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1569428332-25738-1-git-send-email-nikhil.nd@ti.com>
	<20190925170600.GC4163@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <dbc26e54-8791-3e53-9c00-7c59502ef140@ti.com>
Date: Thu, 26 Sep 2019 17:55:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190925170600.GC4163@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] recipes-bsp: ti-sci-fw: Enable traces for j7-evm
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
X-List-Received-Date: Thu, 26 Sep 2019 12:27:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 25/09/19 10:36 PM, Denys Dmytriyenko wrote:
> Why only J7? Do we want it enabled on AM65x as well?
I was told that AM6x has some requirement for faster boot.
That's why I am keeping it status quo for AM6.

For J7, we were carrying a patch in meta-psdkla to enable traces. Now it can be added easily in the recipe.

Regards,
Nikhil D
>
>
> On Wed, Sep 25, 2019 at 09:48:52PM +0530, Nikhil Devshatwar wrote:
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> index fab4de4..e7cf1a8 100644
>> --- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> +++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.08.bb
>> @@ -72,6 +72,9 @@ EXTRA_OEMAKE_append_am65xx-hs-evm = " \
>>       HS=1 SYSFW_HS_PATH="${WORKDIR}/${SYSFW_BASE}-enc.bin" SYSFW_HS_INNER_CERT_PATH="${WORKDIR}/${SYSFW_BASE}-cert.bin" \
>>   "
>>   
>> +EXTRA_OEMAKE_append_j7-evm = " \
>> +    ENABLE_TRACE=1 \
>> +"
>>   do_compile() {
>>   	cd ${WORKDIR}/imggen/
>>   	oe_runmake
>> -- 
>> 1.9.1
>>


