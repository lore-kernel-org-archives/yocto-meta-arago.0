Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5D7B052962
	for <meta-arago@arago-project.org>;
	Tue,  5 Jan 2021 16:04:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 105G43ww033999;
	Tue, 5 Jan 2021 10:04:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1609862643;
	bh=dskQNx+poPoGfqjiD1IEGAy7fn8tJcisFgM/wMpxdlo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=l1CI6Zec2DA/M6IpGbx57p/f7VLaTcUy1g++Fmukt8pocr0hmnDLlQTm3y+9Jr6eX
	zxNtxEtsZOWZWZMZRWd+w2KnjTYzYijiiY7aykYk/2adnYh4iehIExvkaSikn4eLrF
	mnMJkTQam8+4GFqWCW7hjT7sLq47tPxdqDzsQ9XU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 105G43qE091386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Jan 2021 10:04:03 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 5 Jan 2021 10:04:03 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 5 Jan 2021 10:04:03 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 105G43FO097755;
	Tue, 5 Jan 2021 10:04:03 -0600
To: Denys Dmytriyenko <denis@denix.org>
References: <1608241346-15755-1-git-send-email-denis@denix.org>
	<814f721d-cc9c-a1c9-b88a-dcc08fa54a7d@ti.com>
	<20201221235902.GF24670@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <3fcd6f7b-7ef4-aed8-4e88-ec6084d383ca@ti.com>
Date: Tue, 5 Jan 2021 10:04:03 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201221235902.GF24670@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH] optee-os: as meta-ti now has upstream 3.11, drop local fork
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
X-List-Received-Date: Tue, 05 Jan 2021 16:04:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/21/2020 5:59 PM, Denys Dmytriyenko wrote:
> On Thu, Dec 17, 2020 at 05:31:23PM -0600, Bajjuri, Praneeth wrote:
>>
>>
>> On 12/17/2020 3:42 PM, Denys Dmytriyenko wrote:
>>> There's no need for ti-optee-os fork any more, as it's exactly the same as upstream
>>
>> Thanks Denys for the fix.
>>
>> This along with the meta-ti patch helped in building 3.11 on sdk builds.
>>
>> One question though, While there is no difference today between TI
>> and upstream optee, Any reason why we cannot use the forked project?
>> Similar to how we are doing with ATF today ?
> 
> Praneeth,
> 
>  From the community perspective, it's a bad practice to fork an upstream
> project "just in case", when there are no real differences...

Thanks for the explanation, makes sense.
We should be doing the same way for ATF too.

> 
> Denys
> 
> 
>>> Signed-off-by: Denys Dmytriyenko <denis@denix.org>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

>>> ---
>>>   meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 7 -------
>>>   1 file changed, 7 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>>
>>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> deleted file mode 100644
>>> index 677c6dd..0000000
>>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>>> +++ /dev/null
>>> @@ -1,7 +0,0 @@
>>> -PR_append = ".arago0"
>>> -
>>> -SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>>> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>>> -"
>>> -BRANCH = "ti-optee-os"
>>> -SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
>>>

