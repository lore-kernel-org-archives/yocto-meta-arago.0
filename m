Return-Path: <s-anna@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7E3C152999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 02:51:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09R2mRQN097798
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:48:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603766907;
	bh=cAm0Lv0iHQc6kdT3yPPQUFLULr6wh4ggNE01hdI+aL0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RT6SjGu5tGpHDAkEPO/5zVOdGXcCa+GtSOHnWKbiM11byqQR6TGINOZDFdVaJdSdW
	XtlYqoAT7O1ugSwpYgtPqqdVMn17iIP0erLYOlpcTBZRY2BWn9JtBzxvgVZs8VJdFQ
	rseYWitP2ypenXd1FKO6pYiLmWh1IOte/pqj98pQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09R2mRoa086774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 26 Oct 2020 21:48:27 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 26 Oct 2020 21:48:27 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 26 Oct 2020 21:48:27 -0500
Received: from [10.250.64.251] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09R2mQDj023386;
	Mon, 26 Oct 2020 21:48:26 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20201027024112.5330-1-s-anna@ti.com>
	<20201027024533.GR19741@beryl>
From: Suman Anna <s-anna@ti.com>
Message-ID: <21098998-f191-b9f0-79af-26b1045c6a54@ti.com>
Date: Mon, 26 Oct 2020 21:48:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027024533.GR19741@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add ti-rpmsg-char dev packages
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
X-List-Received-Date: Tue, 27 Oct 2020 02:51:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/26/20 9:45 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 26, 2020 at 09:41:12PM -0500, Suman Anna wrote:
>> Add the ti-rpmsg-char dev packages to make the public headers available in
>> the target fileystem so that applications can be compiled natively on the
>> target.
> 
> -sdk-target is not for the target filesystem!
> It is for the target sysroot in the devkit.

Hmm, is this supposed to go into a different file or my patch description needs
correcting?

regards
Suman

> 
> 
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>>  .../packagegroup-arago-tisdk-addons-sdk-target.bb         | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> index e372dd67744e..b55c79a4d4df 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
>> @@ -1,6 +1,6 @@
>>  DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
>>  LICENSE = "MIT"
>> -PR = "r43"
>> +PR = "r44"
>>  
>>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>>  
>> @@ -143,7 +143,11 @@ UTILS_append_dra7xx = " can-utils-dev \
>>                          elfutils-staticdev \
>>  "
>>  UTILS_append_k2g = " can-utils-dev"
>> -UTILS_append_k3 = " can-utils-dev"
>> +UTILS_append_k3 = "\
>> +	can-utils-dev \
>> +	ti-rpmsg-char-dev \
>> +	ti-rpmsg-char-staticdev \
>> +"
>>  
>>  EXTRA_LIBS = ""
>>  EXTRA_LIBS_append_ti43x = "\
>> -- 
>> 2.28.0
>>


