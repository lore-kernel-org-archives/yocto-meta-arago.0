Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D834F52978
	for <meta-arago@arago-project.org>;
	Wed, 13 Mar 2019 14:12:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2DECmHD118273
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 09:12:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552486368;
	bh=RbqKF5VW/cU+/FsoMAAovG6f1+k2h9bNziBYaRUhidQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=uoJj8Y1vhnVVGqq1LLdxIYry/0rQZn+b3nBMfGJaEj9+sk2DVIyDll0CRjXAZoHwS
	ULdlEFuVTQhTTS/6EP75S5KXft5Y9yNFQFWPT/TFIUZLE7HrEvVqsNPeRD5Mfa82XD
	3qw4CD4dkK6QnaWUwUqCV+aeXuB6eUMKJIezyu0w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2DECm5b018329
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 13 Mar 2019 09:12:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 13 Mar 2019 09:12:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 13 Mar 2019 09:12:47 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2DEClI2019670;
	Wed, 13 Mar 2019 09:12:47 -0500
To: "Gou, Hongmei" <h-gou@ti.com>, "Dmytriyenko, Denys" <denys@ti.com>
References: <1551895171-20664-1-git-send-email-a0271529@ti.com>
	<20190308232659.GF26510@beryl>
	<20333d3a8ffb43c7af5c66feda6e651b@ti.com>
	<579d032b3cb24af68753d4f5675647ee@ti.com>
	<4c8c8f7e7cdd4881a2ed11c5534eaca6@ti.com>
	<20190312232702.GI28041@beryl>
	<77fd577864a64d528df691d3ac4bc6fb@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <dadca70e-2b97-2804-b351-c49c185ae68f@ti.com>
Date: Wed, 13 Mar 2019 10:12:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <77fd577864a64d528df691d3ac4bc6fb@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] Re: [rocko/master] [PATCH 1/2] acontis-atemsys: build the kernel module for acontis EtherCAT master
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
X-List-Received-Date: Wed, 13 Mar 2019 14:12:58 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 3/13/2019 10:06 AM, Gou, Hongmei wrote:
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Tuesday, March 12, 2019 7:27 PM
>> To: Gou, Hongmei
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys: build
>> the kernel module for acontis EtherCAT master
>>
>> On Mon, Mar 11, 2019 at 01:32:32PM -0400, Gou, Hongmei wrote:
>>>> -----Original Message-----
>>>> From: Dmytriyenko, Denys
>>>> Sent: Monday, March 11, 2019 1:30 PM
>>>> To: Gou, Hongmei
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
>> build
>>>> the kernel module for acontis EtherCAT master
>>>>
>>>>> acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
>>>> Any derivatives of those?
>>> No as far as I know.
>> Ok, thanks for verifying.
>>
>> Is it needed on rocko?
> Yes, this is needed for rocko, as specified in the subject.


Denys, please apply to rocko as well.


>>
>>>> -----Original Message-----
>>>> From: Gou, Hongmei
>>>> Sent: Monday, March 11, 2019 12:30 PM
>>>> To: Dmytriyenko, Denys
>>>> Cc: meta-arago@arago-project.org
>>>> Subject: RE: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
>> build
>>>> the kernel module for acontis EtherCAT master
>>>>
>>>>> -----Original Message-----
>>>>> From: Dmytriyenko, Denys
>>>>> Sent: Friday, March 08, 2019 6:27 PM
>>>>> To: Gou, Hongmei
>>>>> Cc: meta-arago@arago-project.org
>>>>> Subject: Re: [meta-arago] [rocko/master] [PATCH 1/2] acontis-atemsys:
>>>> build
>>>>> the kernel module for acontis EtherCAT master
>>>>>
>>>>> On Wed, Mar 06, 2019 at 12:59:30PM -0500, Hongmei Gou wrote:
>>>>>> Signed-off-by: Hongmei Gou <a0271529@ti.com>
>>>>>> ---
>>>>>>   .../acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb  | 18
>>>>> ++++++++++++++++++
>>>>>>   1 file changed, 18 insertions(+)
>>>>>>   create mode 100644 meta-arago-extras/recipes-apps/acontis-
>> ethercat-
>>>>> demo/acontis-atemsys_3.0.1.28.bb
>>>>>> diff --git a/meta-arago-extras/recipes-apps/acontis-ethercat-
>>>>> demo/acontis-atemsys_3.0.1.28.bb b/meta-arago-extras/recipes-
>>>>> apps/acontis-ethercat-demo/acontis-atemsys_3.0.1.28.bb
>>>>>> new file mode 100644
>>>>>> index 0000000..94e0c56
>>>>>> --- /dev/null
>>>>>> +++ b/meta-arago-extras/recipes-apps/acontis-ethercat-
>> demo/acontis-
>>>>> atemsys_3.0.1.28.bb
>>>>>> @@ -0,0 +1,18 @@
>>>>>> +SUMMARY = "acontis atemsys kernel module for EtherCAT master"
>>>>>> +HOMEPAGE = "https://www.acontis.com/en/ethercat-for-ti-
>>>>> processors.html"
>>>>>> +LICENSE = "GPLv2"
>>>>>> +LIC_FILES_CHKSUM =
>>>>> "file://COPYING;md5=65dd37ccb3e888dc57e47d925b80b38a"
>>>>>> +
>>>>>> +SRC_URI = "https://www.acontis.com/files/support/ethercat/EC-
>>>> Master-
>>>>> Atemsys-V${PV}-Linux.tar.gz;subdir=${P}"
>>>>>> +SRC_URI[md5sum] = "d8d92ae671c5cf78ae22bc5386d7f44f"
>>>>>> +SRC_URI[sha256sum] =
>> "dd3d83eb984b17b8378e0a5e5dfae8c77e25c5428a26319f59f44f805aff9e89"
>>>>>> +
>>>>>> +COMPATIBLE_MACHINE = "am335x-evm|am57xx-evm"
>>>>> Why is it so strict? Can it be used on non-EVM devices in AM335x and
>>>> AM57x
>>>>> families?
>>>> acontis EtherCAT is supported for am335 icev2 and am57xx IDKs only.
>>>>
>>>>>> +PR = "r0"
>>>>>> +
>>>>>> +S = "${WORKDIR}/${P}/yocto/meta-acontis/recipes-
>>>> kernel/atemsys/files"
>>>>>> +
>>>>>> +inherit module
>>>>>> +
>>>>>> +EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
>>>>>> --
>>>>>> 1.9.1
>>>>>>
>>>>>> _______________________________________________
>>>>>> meta-arago mailing list
>>>>>> meta-arago@arago-project.org
>>>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

