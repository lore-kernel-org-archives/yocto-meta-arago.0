Return-Path: <manisha.agrawal@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 7B66352ABB
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 21:17:46 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TLHkCg025204
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 16:17:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504041466;
	bh=WI1hcpN+jnTCG6HZ7LJVqYI7dpYvnnNz/L8Dyd9bDh0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=jBuWje+zNtapGAOx+I7DcQ60GpJvAsxqni9eR7NSFQUTxkIqHgFpO/V/vkBcb+FU8
	bdeAEZxlJ+Pxiprxh5toxHTbAa9eJMksW1WoKo3k0FdRgysB+vq80zIEVzgNnuXOLK
	T3IOVbLJJxb+Ti5r7tRyrrBMbC3icH5GeifmGjjE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TLHksM026555
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 16:17:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 16:17:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 16:17:46 -0500
Received: from [128.247.59.105] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TLHjBV005836;
	Tue, 29 Aug 2017 16:17:46 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-4-manisha.agrawal@ti.com>
	<20170829171659.GE8304@edge> <20170829195556.GL8304@edge>
	<42fe38bb-8c83-1013-4047-3d957411cb19@ti.com>
	<20170829210535.GQ8304@edge>
From: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <d34d7535-6398-76d9-ab6d-1de150af105c@ti.com>
Date: Tue, 29 Aug 2017 16:17:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170829210535.GQ8304@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 4/6] recipes-core : packagegroups: hmi
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
X-List-Received-Date: Tue, 29 Aug 2017 21:17:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/29/2017 04:05 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 29, 2017 at 03:56:56PM -0500, Manisha Agrawal wrote:
>>
>> On 08/29/2017 02:55 PM, Denys Dmytriyenko wrote:
>>> On Tue, Aug 29, 2017 at 01:16:59PM -0400, Denys Dmytriyenko wrote:
>>>> Manisha,
>>>>
>>>> From this:
>>>>
>>>>> recipes-core : packagegroups: hmi
>>>> To this:
>>>>
>>>>> packagegroup-*-hmi: add hmi specific packagegroups
>>>> On Tue, Aug 29, 2017 at 11:38:24AM -0500, Manisha Agrawal wrote:
>>>>> Create packagegroup for HMI related demos. HMI is one of the focus
>>>>> growth area for Sitara platform and demos planned for individual target end
>>>>> equipments. Add evse-hmi demo to the packagegroup.
>>>>>
>>>>> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
>>>>> ---
>>>>>  .../packagegroup-arago-tisdk-hmi-sdk-host.bb       | 26 +++++++++++++++++++++
>>>>>  .../packagegroups/packagegroup-arago-tisdk-hmi.bb  | 27 ++++++++++++++++++++++
>>>>>  2 files changed, 53 insertions(+)
>>>>>  create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
>>>>>  create mode 100755 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
>>>>>
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
>>>>> new file mode 100755
>>>>> index 0000000..d58536c
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
>>>>> @@ -0,0 +1,26 @@
>>>>> +DESCRIPTION = "Task to add HMI related sources into the SDK"
>>>> SUMMARY is missing.
>> I see either SUMMARY or DESCRIPTION in other packagefroup files. Do you
>> want me to rename the DESCRIPTION as SUMMARY or you want to see more
>> information as part of SUMMARY. If yes, what additional information
>> should I add there.
> Please see my comment for patch #1 with the link.
>
>

Sorry missed seeing that earlier. I am keeping SUMMARY and removing
DESCRIPTION as DESCRIPTION defaults to SUMMARY and nothing much to
describe there.


>>>>> +LICENSE = "BSD-3-Clause"
>>>> By default all OE metadata is licensed under MIT. Unless you have a very 
>>>> specific need to license packagegroup under BSD, I'd suggest leaving it as is. 
>>>> BTW since MIT is default, LICENSE can be omitted when inheriting packagegroup.
>> This was suggested by Vivek. His comment was "Any user-space demo
>> applications that we develop should be in TI BSD-3-clause license, as
>> that's the most friendliest and can be used by others (RTOS, VxWorks,
>> etc.)."
> A packagegroup is not a user-space demo application, hence my comment above.
>

Got it. Thanks.


>>>>> +PR = "r1"
>>>> Not critical, but PR can also be omitted for new recipes.
>> I am keeping it for now else in future I will forget to add the
>> revision. If I keep it, would you suggest it to be "r0" or "r1".
> Doesn't matter, but it defaults to "r0".
>
>
>>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>> +
>>>>> +inherit packagegroup
>>>>> +
>>>>> +HMI = ""
>>>>> +
>>>>> +HMI_append_ti43x = " \
>>>>> +    evse-hmi-src \
>>>>> +"
>>>>> +
>>>>> +HMI_append_ti33x = " \
>>>>> +    evse-hmi-src \
>>>>> +"
>>>>> +
>>>>> +
>>>>> +HMI_append_omap-a15 = " \
>>>>> +    evse-hmi-src \
>>>>> +"
>>>>> +
>>>>> +RDEPENDS_${PN} = "\
>>>>> +    ${HMI} \
>>>>> +"
>>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
>>>>> new file mode 100755
>>>>> index 0000000..9066c72
>>>>> --- /dev/null
>>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi.bb
>>>>> @@ -0,0 +1,27 @@
>>>> Same comments here.
>>>>
>>>>
>>>>> +DESCRIPTION = "Task to add HMI related packages"
>>>>> +LICENSE = "BSD-3-Clause"
>>>>> +PR = "r1"
>>>>> +
>>>>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
>>>>> +
>>>>> +inherit packagegroup
>>>>> +
>>>>> +HMI = " \
>>>>> +"
>>>>> +
>>>>> +
>>>>> +HMI_append_ti33x = " \
>>>>> +    evse-hmi \
>>>>> +"
>>>>> +
>>>>> +HMI_append_ti43x = " \
>>>>> +    evse-hmi \
>>>>> +"
>>>>> +
>>>>> +HMI_append_omap-a15 = " \
>>>>> +    evse-hmi \
>>>>> +"
>>>>> +
>>>>> +
>>>>> +RDEPENDS_${PN} = "\
>>>>> +"
>>> Also, you seem to be missing to add anything in RDEPENDS...
>>>
>>>
>>>>> -- 
>>>>> 2.13.0
>>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


