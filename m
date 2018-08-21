Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BB8D452B00
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 18:20:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LIJr2O028116
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:19:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534875594;
	bh=ka0Of/cuTeyu/+69U/s9gyTCDy+r6MyFEuJh3a+PXx8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=c56FrtQK+sZ+eE+KpqEXNWYiPLVpCxVX/BHTL2Ffu0cotj1Py2I5EZssiclK0GgA7
	LG1jHT/9fnr5ACZg95wOU8IxMZb4gVfsJVnzw+/Jl5ZFUkqkc8pBCSTdARcBdEeX9U
	vz5bx1Ty05Q6Fq1q+WlppS8soDCyNYj4MEMPviSo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIJrSg001299
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 13:19:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 13:19:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 13:19:53 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LIJraL010438;
	Tue, 21 Aug 2018 13:19:53 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1534515953-32644-1-git-send-email-j-stiffler@ti.com>
	<1534515953-32644-4-git-send-email-j-stiffler@ti.com>
	<20180820202541.GF29422@beryl>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f745de70-b831-7c20-fa3c-7f91ad285958@ti.com>
Date: Tue, 21 Aug 2018 14:19:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180820202541.GF29422@beryl>
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
X-List-Received-Date: Tue, 21 Aug 2018 18:20:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 8/20/2018 4:25 PM, Denys Dmytriyenko wrote:
> On Fri, Aug 17, 2018 at 10:25:53AM -0400, Jacob Stiffler wrote:
>> * disable SECONDARY_TOOLCHAIN by default
>> * For k3, configure the secondary toolchain as armv7a for the R5
>>    cores.
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/conf/distro/include/arago-prefs.inc | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> index c839c9a..4e3e221 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
>> @@ -1,6 +1,9 @@
>>   # Set preferred Qt5 versions. Different namespace from Qt4, so no conflict
>>   include conf/distro/include/qt5-versions.inc
>>   
>> +SECONDARY_TARGET_ARCH = ""
>> +SECONDARY_TARGET_ARCH_k3 = "armv7a"
> Just a tiny comment here - this should probably go to arago.conf
>
> I reserve arago-prefs.inc for all the PREFERRED_PROVIDER/VERSION settings.

While making that change, I realized that this patch set focuses on the 
external linaro toolchain.

Would this method work with the internal GCC toolchain? Do I need to 
disable this if not using the external linaro toolchain?

>
>>   # Use the latest version of ltp-ddt for kernel versions 3.8+
>>   PREFERRED_PROVIDER_ltp-ddt = "ltp-ddt"
>>   
>> -- 
>> 2.7.4
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


