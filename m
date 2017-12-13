Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 6422C52093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 16:30:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDGUchM001835
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:30:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513182638;
	bh=goQPdoBL9Sf0UaN56bBkj9lxMBSGohEuYhnPrTOvFPk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MkCduIcSxXpPe57pvL+wjSz2ezTdJaP2KlKzPcCCHdl1ca7TmK+wJxFuh6eoaze0Z
	62oExXLpNSi4fcBspZCUB27W9oPozxWcB/rQEfQwIUoFHOmfoxLwkLcbByAWLnuXHn
	rgQm2URM+qru+RsB8X121YNcjU2wOZIfCiYaZMes=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDGUcoX012273
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 10:30:38 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 10:30:38 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 10:30:38 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDGUb0M005510;
	Wed, 13 Dec 2017 10:30:38 -0600
To: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1513120974-54884-1-git-send-email-m-radhakrishnan2@ti.com>
	<7c81d186-4f11-2279-dd6d-cbd1f7814e84@ti.com>
	<59a9e78677f0428b8ebcfbe5f92d12bc@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <92d3cfb9-04e0-33e5-38d8-95ebcc46722d@ti.com>
Date: Wed, 13 Dec 2017 11:30:37 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <59a9e78677f0428b8ebcfbe5f92d12bc@ti.com>
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
X-List-Received-Date: Wed, 13 Dec 2017 16:30:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 12/13/2017 11:28 AM, Radhakrishnan, Mahesh wrote:
> HI Jake,
>   Regarding the warning you mentioned about
>
>> +require recipes-bsp/common-csl-ip/common-csl-ip.inc
> How else would this file be included?

This is already included in the upstream bb files.

>
>
> Regards
> Machu.
> -----Original Message-----
> From: Stiffler, Jacob
> Sent: Wednesday, December 13, 2017 10:06 AM
> To: Radhakrishnan, Mahesh; meta-arago@arago-project.org
> Subject: Re: [EXTERNAL] [meta-arago] [morty][meta-processor-sdk][PATCH] common-csl-ip: Updating to version 3.0.0.9
>
>
>
> On 12/12/2017 6:22 PM, Mahesh Radhakrsihnan wrote:
>> From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>>
>> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
>> ---
>>    recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc       | 8 ++++++++
>>    recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 5 +++++
>>    recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 2 ++
>>    3 files changed, 15 insertions(+)
>>    create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.0.0.9.inc
>>    create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
>>    create mode 100644
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
> Please do not include this here. It causes many warnings as it is already included by the upstream bb files.
>
>> +
>> +PV = "03.03.00.09"
>> +INC_PR = "r0"
>> +
>> +# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
>> +CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
>> +
>> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
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


