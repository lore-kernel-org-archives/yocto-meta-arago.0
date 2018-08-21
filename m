Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1E7BB52AFF
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 20:39:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LKdMMR062058
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 15:39:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534883962;
	bh=GswJ/+iOYpOptFkV/lErUhkiamqGKoUkEzl9PHbC1sQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=iEXY2qDDz6dshPeveouhdDUIUh7WdjkdaP3sf+drs7TaVQEEVR3Bj0zNXt8y3Vuk8
	sq3CMPgjVS/LNoWsPhW/1Rtw3X9EgiUhFncuoW4UFCPxGvOZGnsjUEkwUFod/7WX6n
	Sxpkxorl32azvHacEK/9LubLrtHu/WN3f8CGSJeM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LKdMHx003594
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 15:39:22 -0500
Received: from [158.218.113.148] (158.218.113.148) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 15:39:22 -0500
To: Denys Dmytriyenko <denys@ti.com>, Eric Ruei <e-ruei1@ti.com>
References: <1534879768-59124-1-git-send-email-e-ruei1@ti.com>
	<1534879768-59124-4-git-send-email-e-ruei1@ti.com>
	<20180821194957.GR29422@beryl>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <743f6e26-8d08-1239-f466-9f3b25d0a753@ti.com>
Date: Tue, 21 Aug 2018 16:39:22 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <20180821194957.GR29422@beryl>
X-Originating-IP: [158.218.113.148]
X-ClientProxiedBy: DLEE100.ent.ti.com (157.170.170.30) To DLEE113.ent.ti.com
	(157.170.170.24)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 3/4] tisdk-roofs-image: add the GTK packagegroup
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
X-List-Received-Date: Tue, 21 Aug 2018 20:39:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/21/2018 3:49 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 21, 2018 at 03:29:27PM -0400, Eric Ruei wrote:
>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
>> index e40dc1f..a86691d 100644
>> --- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
>> +++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
>> @@ -9,6 +9,7 @@ IMAGE_INSTALL += "\
>>       packagegroup-arago-test \
>>       packagegroup-arago-test-addons \
>>       ${@bb.utils.contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
>> +    packagegroup-arago-tisdk-gtk \
> 
> Since you made gtk+ dependent on egl, you probably also need to check sgx flag?
> 
Yes, you are right. I shall add the condition at V2.

> 
>>       packagegroup-arago-tisdk-qte \
>>       ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl','',d)} \
>>       ${@bb.utils.contains('MACHINE_FEATURES','dsp','packagegroup-arago-tisdk-opencl-extra','',d)} \
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


