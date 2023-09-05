Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1845ACA101C
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 22:03:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.35737.1693951421021961781
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 15:03:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VBC6oCVf;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 385M3bLq123912;
	Tue, 5 Sep 2023 17:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693951417;
	bh=QdczWc5sM3ezk5BYAxgxRznFYgBEpqLRlJxm559hMnI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VBC6oCVfDEPIJ89gY8TsgC+TFIeKafBmUz2+cjIc8D5Wt+6yOnNrJP+670kdE/tDO
	 ZgtU3cz1JZs6LLuevJoi2JFv4eyNGyLGCq+TspfMbeZkvYMXMYbnf1X9RzoA0vEHZ2
	 QmHxPQHBY/QwCHW5pXxoWgtfMxo6lzuqZBznIKRk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 385M3b7U058221
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Sep 2023 17:03:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Sep 2023 17:03:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Sep 2023 17:03:36 -0500
Received: from [128.247.81.144] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 385M3Zxb120750;
	Tue, 5 Sep 2023 17:03:35 -0500
Message-ID: <68c38f83-4740-4476-be4d-ecaffd4e7ab0@ti.com>
Date: Tue, 5 Sep 2023 17:03:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][kirkstone][PATCH v2]
 meta-arago-distro: add meta-clang dependency and llvmpipe
To: Denys Dmytriyenko <denis@denix.org>
CC: <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>, <k-bhargav@ti.com>
References: <20230905201852.4056578-2-rs@ti.com>
 <20230905215628.GX3359@denix.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <20230905215628.GX3359@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Sep 2023 22:03:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14886

On 9/5/23 16:56, Denys Dmytriyenko wrote:
> On Tue, Sep 05, 2023 at 03:18:53PM -0500, rs@ti.com wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Devices that must use software rendering should use llvmpipe over the
>> default softpipe. There are significant performance improvements
>> associated with this change for devices like AM62A which lack a GPU.
>>
>> This, unfortunately is only available on armv6+ devices so we'll
>> conditionally drop this for the omapl138 device. (I'd switch this
>> directly based on platform architecture but this doesn't appear to work
>> correctly for PACKAGECONFIG strings in the distro.conf)
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/arago.conf | 7 +++++++
>>   meta-arago-distro/conf/layer.conf        | 1 +
>>   2 files changed, 8 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index 48f053bb..b029360b 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -102,6 +102,13 @@ PACKAGECONFIG:append:pn-piglit = " \
>>   PACKAGECONFIG:pn-opengl-es-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>>   PACKAGECONFIG:pn-vulkan-cts = "${@bb.utils.contains("DISTRO_FEATURES", "wayland", "wayland", "surfaceless", d)}"
>>   
>> +# Use llvmpipe for better performance with software rendering
>> +# Only available for armv6+ devices
>> +PACKAGECONFIG:append:pn-mesa = " gallium-llvm"
>> +PACKAGECONFIG:remove:pn-mesa:omapl138 = " gallium-llvm"
>> +PACKAGECONFIG:append:pn-mesa-pvr = " gallium-llvm"
>> +PACKAGECONFIG:remove:pn-mesa-pvr:omapl138 = " gallium-llvm"
> 
> While :remove happens last, it's not recommended to rely on it, especially
> when you have nested overrides - there's no guaranteed order of processing
> overrides. A better option would be:
> 
> GALLIUM_LLVM = " gallium-llvm"
> GALLIUM_LLVM:omapl138 = ""
> PACKAGECONFIG:append:pn-mesa = "${GALLIUM_LLVM}"
> PACKAGECONFIG:append:pn-mesa-pvr = "${GALLIUM_LLVM}"

Fair enough. This seems cleaner anyway. V3 inbound.


