Return-Path: <jjhiblot@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 39B6A52A9D
	for <meta-arago@arago-project.org>;
	Thu, 21 Sep 2017 13:29:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8LDT9C6015664
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 08:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506000549;
	bh=vupsyj142SYpymN6i8W18yrkETGHQJnNIZlVe8yFDu4=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=WweplIZ1k36kM/A1+K8uRt8vE1uk9I7CuvMrt+JgfYIi5rTSuFWihro+AQZSVd+pY
	issIECuX5YgnjKHCtqNpAzMS/Wb988/0czKAH0A+bqkftiUKcmPeGpu1UXewVuBZGK
	yaKqCmWqYTKtMrJhOmY6VA6s8+KLh6L9kAK8yL9s=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LDT9O2029932
	for <meta-arago@arago-project.org>; Thu, 21 Sep 2017 08:29:09 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 21 Sep 2017 08:29:08 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 21 Sep 2017 08:29:08 -0500
Received: from [172.22.133.193] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8LDT7nN029899;
	Thu, 21 Sep 2017 08:29:08 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1505935326-14390-1-git-send-email-jjhiblot@ti.com>
	<20170920195042.GX26843@edge>
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <f62e39e3-7001-b79f-891e-5e7052dd54d9@ti.com>
Date: Thu, 21 Sep 2017 15:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170920195042.GX26843@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-processor-sdk] [PATCH] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Thu, 21 Sep 2017 13:29:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 20/09/2017 21:50, Denys Dmytriyenko wrote:
> Is there 4.4 based processor-sdk? I'm guessing the wrong header is used here...
I'll resend the patch with the corrected header.
Thanks,
Jean-Jacques
>
>
> On Wed, Sep 20, 2017 at 09:22:06PM +0200, Jean-Jacques Hiblot wrote:
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


