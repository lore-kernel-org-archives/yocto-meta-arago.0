Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id DA6CA529D0
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 22:36:14 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMa8OE005958
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:36:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607639768;
	bh=QKNTuaNbkABOqDk84qUzZx8rK2aEFT7TCYluUCo4bcI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=jOb8TGO7yJCergxm15TajOPRfXZp5q5kgkYNdWTHzPWrx3eyuNzlh403aGQXxr6jN
	vnucU65BBvJPQeH4FZWbrE9ooFK4H/S+FfitP15+KAqG3HpdQm6ULjwxEtBMcLGuDi
	n14tXt/XbFopBMDcssb+3FXUf7clmCXn8nk6IRnY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAMa8rM093796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:36:08 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 10 Dec 2020 16:36:08 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 10 Dec 2020 16:36:08 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMa8dN097156;
	Thu, 10 Dec 2020 16:36:08 -0600
To: Dan Murphy <dmurphy@ti.com>
References: <20201210223235.12724-1-praneeth@ti.com>
	<d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <ea15b5a1-4326-8dce-6c8c-f14bfb27ba8f@ti.com>
Date: Thu, 10 Dec 2020 16:36:08 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] optee-os: update SRCREV to pick latest
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
X-List-Received-Date: Thu, 10 Dec 2020 22:36:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 12/10/2020 4:33 PM, Dan Murphy wrote:
> Praneeth
> 
> On 12/10/20 4:32 PM, praneeth@ti.com wrote:
>> From: Praneeth Bajjuri <praneeth@ti.com>
>>
>> updating SRCREV to pick the latest commit on
>> repo: ti-optee-os.git
>> branch: ti-optee-os
>>
>> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
>> ---
>>   .../recipes-security/optee/optee-os_git.bbappend            | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git 
>> a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend 
>> b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> index 677c6dd0..28b9b6c5 100644
>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
>> @@ -1,7 +1,9 @@
>>   PR_append = ".arago0"
>>   SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
>> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
>> +       file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \
> 
> Why is this 0006? What are the other 5 patches?

As per this , 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-arm/commit/meta-arm/recipes-security/optee/optee-os/0006-allow-setting-sysroot-for-libgcc-lookup.patch?id=715c9f8f98534655c3a368c50ceaf7a1f12da084

that patch has been updated for 3.10+ recipe update.

> 
> Dan
> 

