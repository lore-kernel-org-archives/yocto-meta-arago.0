Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 512B1529F8
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 16:40:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w26GdZbm032664
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:39:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520354375;
	bh=KhCMdMJCIYGns1HIhwJZrMB2xK4q6iGVoZM2KgZtgRs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=d2BOmoSIQJnWC/vmLatHuZEcV9xB4rOkwj8dNbQHJRlrm3RfkcHuTLAxU3Wus/RTk
	k25TMlDkGKp3VPgfJhhE1q/qYQS4gjvV6F3BxW5F760+X49JGTl/tt9DB4pl0u+Yn9
	V0Y2OptReCfT87IdpPQhdMN1/Yuwv10BsLExGoB8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GdZjS014522
	for <meta-arago@arago-project.org>; Tue, 6 Mar 2018 10:39:35 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 6 Mar 2018 10:39:35 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 6 Mar 2018 10:39:35 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w26GdYdF031235;
	Tue, 6 Mar 2018 10:39:35 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1519932329-26946-1-git-send-email-j-stiffler@ti.com>
	<356933e6-5334-3661-bb5f-2f892fcb13a7@ti.com>
	<20180306162145.GM29482@edge> <20180306162554.GN29482@edge>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <73b9c7d2-a649-368f-e89a-0b8f1b82127f@ti.com>
Date: Tue, 6 Mar 2018 11:39:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306162554.GN29482@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty/rocko/master][PATCH v2 1/2] ti-llvm3.6: add dependency on groff-native
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
X-List-Received-Date: Tue, 06 Mar 2018 16:40:17 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/6/2018 11:25 AM, Denys Dmytriyenko wrote:
> On Tue, Mar 06, 2018 at 11:21:46AM -0500, Denys Dmytriyenko wrote:
>> That's what I was just asking Eric last night...
> Sorry, disregard this - I confused this for qt-tstat.
>
>
>> On Tue, Mar 06, 2018 at 08:28:29AM -0500, Jacob Stiffler wrote:
>>> I see that this was accepted into rocko/master, but can this also be
>>> accepted into morty?
> Why do you need it in morty? It would use host groff just fine...

I ran into this while building a different distro within a docker 
container. The default container did not have groff, so it does not seem 
safe to assume that all hosts will have groff.

>
>>> On 3/1/2018 2:25 PM, Jacob Stiffler wrote:
>>>> * groff is used to generate documentaion during the install task
>>>>
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>> * No change for this patch, but an additional patch is added to the set.
>>>>
>>>>   meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>> index 4f36310..91d3cea 100644
>>>> --- a/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>> +++ b/meta-arago-extras/recipes-core/llvm/ti-llvm3.6_3.6.bb
>>>> @@ -17,7 +17,7 @@ require recipes-core/llvm/llvm.inc
>>>>   LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=47e311aa9caedd1b3abf098bd7814d1d"
>>>> -DEPENDS += "libxml2"
>>>> +DEPENDS += "libxml2 groff-native"
>>>>   DEPENDS_append_class-target = " valgrind"
>>>>   LLVM_DIR = "ti-llvm${PV}"
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


