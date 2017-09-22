Return-Path: <jjhiblot@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2173C529B8
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 07:08:50 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8M78oO4006810
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 02:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506064130;
	bh=cpTmcadyn9esIgmHYjhAqIWsX/cKNJnB+kEfrlL9KOs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=BUI37men3XwiPUSDWuY4jVuOsYxVqv3GO6bUBAivgLcOdh6TKIn5e3oE3Fnshhray
	vIrGsX2CbOZ5d2+YA8PU87OEz2Yvckx//8LUIgNfobLV96yU8N6JgElFAUyxZnMPpa
	OFzJbHKnt7ABGSwjuWzwyfb+ZrtaFO2+cRiNnx3M=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8M78n4r001771
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 02:08:49 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 02:08:49 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 02:08:49 -0500
Received: from [172.22.141.200] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8M78muB016858;
	Fri, 22 Sep 2017 02:08:49 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1506000653-15572-1-git-send-email-jjhiblot@ti.com>
	<20170921191841.GH26843@edge>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <6ca9bce3-53fa-baa8-bdca-1b98269e606f@ti.com>
Date: Fri, 22 Sep 2017 09:08:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170921191841.GH26843@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Fri, 22 Sep 2017 07:08:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,


On 21/09/2017 21:18, Denys Dmytriyenko wrote:
> JJ,
>
> Thanks. Do you need this in morty or krogoth? I believe this is specific to
> krogoth, as morty already has this fix. I can merge to krogoth, if you agree.
Yes. That would be good.

Thanks,
Jean-Jacques
>
>
> On Thu, Sep 21, 2017 at 03:30:53PM +0200, Jean-Jacques Hiblot wrote:
>> Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
>> ---
>>   .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
>> index 7d0537d..c1d8fd1 100644
>> --- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
>> +++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
>> @@ -1,7 +1,7 @@
>> -PR_append = ".arago0"
>> +PR_append = ".arago1"
>>   
>>   BRANCH = "ti-lsk-linux-4.4.y"
>> -SRCREV = "6580f85400b48d55d06f11d6b75c056399123a72"
>> +SRCREV = "2612ef5805db717f9818f06786e863d3b1a7f87e"
>>   
>>   KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
>>   KERNEL_GIT_PROTOCOL = "git"
>> -- 
>> 1.9.1
>>


