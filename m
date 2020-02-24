Return-Path: <angelabaker@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7E23552994
	for <meta-arago@arago-project.org>;
	Mon, 24 Feb 2020 14:57:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01OEtlU9056869
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2020 08:55:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582556147;
	bh=xfqOzZxeKaHbQ9VVYzVxuawCmSq+MT6/3xObKUAB2iE=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=oERP7aVizG/XScYSJX3io/dyVTw1pOG7W0kSPJrT8UjsVvHiid7QNSs/P2FNzwzhy
	ossZ7AyJ02trUPgXtmfzjNbzM8i2tu5dO69NnBCXDeBhjPo0XtmaJeRLEXOcHURAcq
	gtvJA7S+xz1j17s+LTmEeEJYonwL8OWI+3ui8pGs=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OEtlsQ011570
	for <meta-arago@arago-project.org>; Mon, 24 Feb 2020 08:55:47 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 24 Feb 2020 08:55:47 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 24 Feb 2020 08:55:47 -0600
Received: from [128.247.77.48] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01OEtlnP130360;
	Mon, 24 Feb 2020 08:55:47 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
	<20200211043348.GA20281@beryl>
	<36253987-2d6b-ac50-199d-343cd9db96af@ti.com>
	<20200211193637.GH20281@beryl>
From: Angela Stegmaier <a0866189@ti.com>
Message-ID: <9a022aaa-0028-ae25-d1ff-c2949373dcac@ti.com>
Date: Mon, 24 Feb 2020 08:55:47 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200211193637.GH20281@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Mon, 24 Feb 2020 14:57:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/11/20 1:36 PM, Denys Dmytriyenko wrote:
> On Tue, Feb 11, 2020 at 01:34:45PM -0600, Angela Stegmaier wrote:
>>
>>
>> On 2/10/20 10:33 PM, Denys Dmytriyenko wrote:
>>> Have you tried building it?
>>>
>>
>> I did, but... looks like my setup had older pdk-fetch recipe in meta-ti.
>> After updating all to latest I am seeing a build failure in board-rtos.
> 
> I also saw failures in pm-lld-rtos on am65.
> 

My recent patch series to meta-ti addresses these build issues for 
ipc-lld-examples-rtos recipe for j7-evm and am65xx-evm.

Thanks,
Angela

> 
>> Thanks,
>> Angela
>>
>>>
>>> On Mon, Feb 10, 2020 at 10:25:18AM -0600, Angela Stegmaier wrote:
>>>> From: Santosh Jha <sjha@ti.com>
>>>>
>>>> Replacing ipc-lld-fw with ipc-lld-examples-rtos to
>>>> build from source.
>>>>
>>>> Signed-off-by: Santosh Jha <sjha@ti.com>
>>>> Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
>>>> ---
>>>>   .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> index a1b55ee..1612322 100644
>>>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
>>>> @@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
>>>>                       jailhouse \
>>>>   "
>>>> -UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss pru-pwm-fw"
>>>> -UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>>>> +UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
>>>> +UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
>>>>   UTILS_append_omapl138 = " ti-ipc-rtos-fw"
>>>> -- 
>>>> 1.9.1
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

