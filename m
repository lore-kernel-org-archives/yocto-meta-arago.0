Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DB45E52AFD
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 18:43:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LIhcDe047051
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534877018;
	bh=GqdYl18vALJ0c6Am3ancfxtl9Avld7avBYQXLyg01fc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=p/mmjGvvZ9LhRAwo0HeBu7LFuKloLPjRfsD1nHxOs9WLopI2slkg6jDUj2xNQIsaK
	Azk3N6v6NtsPTyUUxYXn2QwAfTnCnTETIhe2uI/MicTs9LeFuiji9BJmkSFeNKWnhB
	8woM5kSb9bt1WmhhJPV0YMHFFFelsBl0X/jaNtR4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIhcx8028226
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:43:38 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 13:43:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 13:43:38 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIhbHp007911;
	Tue, 21 Aug 2018 13:43:37 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
	<1534515953-32644-4-git-send-email-j-stiffler@ti.com>
	<20180820202541.GF29422@beryl>
	<f745de70-b831-7c20-fa3c-7f91ad285958@ti.com>
	<20180821182808.GN29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <70b4f3c6-c3c7-f996-eac4-4001876347fe@ti.com>
Date: Tue, 21 Aug 2018 14:43:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180821182808.GN29422@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC 3/3] arago-prefs: enable SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 18:43:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/21/2018 2:28 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 21, 2018 at 02:19:52PM -0400, Jacob Stiffler wrote:
>>
>> On 8/20/2018 4:25 PM, Denys Dmytriyenko wrote:
>>> On Fri, Aug 17, 2018 at 10:25:53AM -0400, Jacob Stiffler wrote:
>>>> * disable SECONDARY_TOOLCHAIN by default
>>>> * For k3, configure the secondary toolchain as armv7a for the R5
>>>>    cores.
>>>>
>>>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>>>> ---
>>>>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
>>>>   1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> index c839c9a..4e3e221 100644
>>>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>>>> @@ -1,6 +1,9 @@
>>>>   # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
>>>>   include conf/distro/include/qt5-versions.inc
>>>> +SECONDARY_TARGET_ARCH = ""
>>>> +SECONDARY_TARGET_ARCH_k3 = "armv7a"
>>> Just a tiny comment here - this should probably go to arago.conf
>>>
>>> I reserve arago-prefs.inc for all the PREFERRED_PROVIDER/VERSION settings.
>> While making that change, I realized that this patch set focuses on the
>> external linaro toolchain.
>>
>> Would this method work with the internal GCC toolchain? Do I need to disable
>> this if not using the external linaro toolchain?
> Yeah, internal toolchain would be a problem. That would require building it
> twice, which doesn't work out of box. That's why I put all that knowledge
> inside toolchain-linaro.inc:
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=2adff429c23bc46b828e3f5f5c3017b4cb5780ce
>
> That's probably the best place for your setting to, as well as limiting it to
> meta-arago-distro.

Thank you! That's a lot simpler than the nested base_conditionals that I 
was imagining.

>
>>>>   # Use the latest version of ltp-ddt for kernel versions 3.8+
>>>>   PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>>>> -- 
>>>> 2.7.4
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


