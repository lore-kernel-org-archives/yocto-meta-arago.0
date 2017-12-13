Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 196CE52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 15:09:29 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDF9SQp030881
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 09:09:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513177768;
	bh=BXH+pnluUE6O4CSkXEPegCJjJiZpjVTekjhggcDnHs4=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=NTAiVVKp2cWBnti3kU8lP3CCgFDc84fNqcSsPWz6zGM2lheSMC7Nh19XtWZBTP5Um
	LBZhJFt4lRlJF5sjgtgXvfNeFXRIHhV7vB4xi7EQyI9pZbecIou8gVNuhY7JhLi92X
	iqG3+Nv1wK6I8gDlMs03pbtlAuvOrEtf61QXus+g=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF9S2S012860
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 09:09:28 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 09:09:28 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 09:09:28 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDF9R7m032422;
	Wed, 13 Dec 2017 09:09:27 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>,
	<meta-arago@arago-project.org>
References: <1513120974-54884-1-git-send-email-m-radhakrishnan2@ti.com>
	<7c81d186-4f11-2279-dd6d-cbd1f7814e84@ti.com>
Message-ID: <968bb054-e1eb-d357-0fad-dde948dcfad2@ti.com>
Date: Wed, 13 Dec 2017 10:09:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <7c81d186-4f11-2279-dd6d-cbd1f7814e84@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [morty][meta-processor-sdk][PATCH] common-csl-ip: Updating to version 3.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 15:09:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 12/13/2017 10:06 AM, Jacob Stiffler wrote:
>
>
> On 12/12/2017 6:22 PM, Mahesh Radhakrsihnan wrote:
>> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>>
>> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>> ---
>>   recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc       | 8 ++++++++
>>   recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 5 +++++
>>   recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 2 ++
>>   3 files changed, 15 insertions(+)
>>   create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>>   create mode 100644 
>> recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
>>   create mode 100644 
>> recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
>>
>> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc 
>> b/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>> new file mode 100644
>> index 0000000..c745413
>> --- /dev/null
>> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>> @@ -0,0 +1,8 @@
>> +require recipes-bsp/common-csl-ip/common-csl-ip.inc
>
> Please do not include this here. It causes many warnings as it is 
> already included by the upstream bb files.
>
>> +
>> +PV = "03.03.00.09"

And it appears that there is a mismatch in versions. PV here is 3.3.0.9 
and the inc filename is 3.0.0.9. What is the correct version?

>> +INC_PR = "r0"
>> +
>> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
>> +CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
>> +
>> diff --git 
>> a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend 
>> b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
>> new file mode 100644
>> index 0000000..71c86e6
>> --- /dev/null
>> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
>> @@ -0,0 +1,5 @@
>> +require recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>> +
>> +# HTML doc link params
>> +PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
>> +
>> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend 
>> b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
>> new file mode 100644
>> index 0000000..1e42938
>> --- /dev/null
>> +++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
>> @@ -0,0 +1,2 @@
>> +require recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>> +
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


