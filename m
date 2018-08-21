Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E16CE529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:10:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMACBn079947
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:10:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534889412;
	bh=t8ZaDRjzThGaFqeS2s1u5UUAQqfSsbxQNqPMMSToO2o=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CxoD7EIYEJnyygv3WNchnRv+QFus+D9utg+kAJDCiJH9TAvpjbUERJ0SN3ShGjngO
	7mRp6CsxgJBW7Fbhq1pr2rvaskMA8mQnrw6vd5Ur4VRR4Y/d2GuJwCdVB3TERbI5R1
	9oFG0IQe9Sj9esLm1pcYIKwG2PW0LoytufmhNWqY=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMACnF025209
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:10:12 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:10:11 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:10:12 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMABxA013401;
	Tue, 21 Aug 2018 17:10:11 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
	<1534878837-20469-3-git-send-email-j-stiffler@ti.com>
	<20180821214044.GW29422@beryl> <20180821214410.GX29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <aa477f2b-b70d-5156-6f05-804f56d367bc@ti.com>
Date: Tue, 21 Aug 2018 18:10:11 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180821214410.GX29422@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 22:10:20 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/21/2018 5:44 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 21, 2018 at 05:40:44PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Aug 21, 2018 at 03:13:56PM -0400, Jacob Stiffler wrote:
>>> * Add the secondary toolchain to the devkit
>>>   if SECONDARY_TOOLCHAIN_ARCH is defined.
>>>
>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>> ---
>>>   .../packagegroups/packagegroup-arago-cross-canadian.bbappend      | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>   create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>>>
>>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>>> new file mode 100644
>>> index 0000000..f02dfd9
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
>>> @@ -0,0 +1,8 @@
>>> +PR_append = ".arago0"
>>> +
>>> +SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
>>> +                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
>> Since this is a bbappend, it will come into play for internal toolchain as
>> well, but in that case SECONDARY_TARGET_ARCH won't be set.

I forgot how uninitialized variables are not "empty".

>> You might want to do something like this:
>> http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-distro/recipes-devtools/gcc/gcc_%25.bbappend;hb=HEAD
> Or you can simply set it empty here if not already set.
>
> SECONDADRY_TARGET_ARCH ?= ""

I think I will go with this to make is somewhat easier to read.

>
>>> +RDEPENDS_${PN}_append = " \
>>> +    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
>>> +"
>>> -- 
>>> 2.7.4
>>>
>>> _______________________________________________
>>> meta-arago mailing list
>>> meta-arago@arago-project.org
>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


