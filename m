Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C146C433EF
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 16:46:02 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.27741.1656607553251322180
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 09:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tubreA2i;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UGjqqH122177;
	Thu, 30 Jun 2022 11:45:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656607552;
	bh=zqFbo81xJcOAFszlzzF4ZlatYLHGBINLNy1VlgJpxpo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tubreA2i//mq6ya6URbYaMcuf2dSH25W4MQ643LIsQTZHom7gV6bgPeZKnh6NqK+p
	 dRJlAJk5y/M4G4WLDo0+ISDLupfVZe+3Br8RxNda7nu8SbobzcWh8VKQzfqGj/LXK0
	 DVfjZJ7+L6Fc+EHDcR6oOzXO+hntSUEIpqP25uaM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UGjqpB057927
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 11:45:52 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 11:45:51 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 11:45:51 -0500
Received: from [10.250.232.118] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UGjlBq038548;
	Thu, 30 Jun 2022 11:45:49 -0500
Message-ID: <e3e9fca1-0647-c99b-9c8f-0b2421c7f0d5@ti.com>
Date: Thu, 30 Jun 2022 22:15:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [meta-arago][oe-layersetup][PATCH] processor-sdk-linux: Add
 08.02.01.00 release config
Content-Language: en-US
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>,
        "Limaye, Aniket"
	<a-limaye@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Lucas Weaver <l-weaver@ti.com>,
        Yogesh Siraswar <yogeshs@ti.com>, <reatmon@ti.com>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20220628160413.22705-1-a-limaye@ti.com>
 <CAEd-yTQPQRD59dVtPOF26yjXsDuce92=R+015wK+c1=V4oDatA@mail.gmail.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: 
 <CAEd-yTQPQRD59dVtPOF26yjXsDuce92=R+015wK+c1=V4oDatA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 30 Jun 2022 16:46:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13926



On 6/30/2022 9:12 PM, Sinthu Raja M wrote:
> Hi Praneeth/Yogesh,
> Please review this patch and provide your feedback.

Maintainer for this repository is Ryan Eatmon. FYI.


> 
> 
> On Tue, Jun 28, 2022 at 9:34 PM a-limaye via lists.yoctoproject.org
> <a-limaye=ti.com@lists.yoctoproject.org> wrote:
>>
>> From: Sinthu Raja <sinthu.raja@ti.com>
>>
>> Add config file for processor-sdk-linux 08.02.01.00 release
>>
>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>> ---
>>   .../processor-sdk-linux-08_02_01_00.txt          | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>   create mode 100644 configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
>>
>> diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
>> new file mode 100644
>> index 0000000..806181a
>> --- /dev/null
>> +++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
>> @@ -0,0 +1,16 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
>> +
>> +bitbake,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.openembedded.org%2fbitbake%2c1.46%2cd22cc1e587c650fd5f90cda32f5720f8a3105aac&c=E,1,CJPqQp9cz9VRPISa2BpJOS7CDeYD3Q31ngK3Rom8LyYfOFenL_da1e0a9Ir499-SPau-X-7JiELoWBxHfVMYaGLuJKvjKFM8r1h-8_GP134mod4,&typo=1
>> +meta-arago,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-arago%2cdunfell%2c08.02.00.006%2clayers%3dmeta-arago-distro%3ameta-arago-extras&c=E,1,ViGQuIK_xgcYaT5ii8ZqIrPmK926-PV7NXMBmxsE9NtQ9oaSOoWUEzoKxF3ergRPwQ2jUMuc5FoMs05Q5ACj0IrDMLXFnnDnNnjJT6IlfJ_dlqb1&typo=1

This urls are wrong. Have you actually tested this configuration.

Please check similar patch in configs/processor-sdk-linux and resubmit 
it correctly.


same issues with urls below .


>> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>> +meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
>> +meta-virtualization,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-virtualization%2cdunfell%2cc5f61e547b90aa8058cf816f00902afed9c96f72%2clayers%3d&c=E,1,UM6T3tFuP8jlzJo1NBFxNNGbGD1xEnZTtK1CEdsWu5bj2t__kYHSMZ7ohBse0HwgfpuXcS_YWm54jxrrrGZyTHeaRNo45eYWhIH6_Fi_XbCb&typo=1
>> +meta-openembedded,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.openembedded.org%2fmeta-openembedded%2cdunfell%2c0722ff6f021df91542b5efa1ff5b5f6269f66add%2clayers%3dmeta-networking%3ameta-python%3ameta-oe%3ameta-gnome%3ameta-filesystems&c=E,1,-9as3qwbla2lLyeO4D2tcSDd5TCtdQcNnAViHHZ-vSOufXT6CtItfvmGs8zHAcsxxyrx_p34Mhy7pnZeTUaVCdmS8Dwm9g3xsY3jw9wGsYI2&typo=1
>> +meta-ti,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-ti%2cdunfell%2c08.02.00.006%2clayers%3d&c=E,1,c7DDPy_qIawYP4wKM2lEtyQQrsRLncwy1HxL4nYwdS9CtlL8DYEmSkLyd1mH39b119yhZAlovdW8Glc5TK688P-OpgvKAfpWLbEL0ZVmUymrQQayUhPy0w,,&typo=1
>> +meta-arm,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.yoctoproject.org%2fmeta-arm%2cHEAD%2cc4f04f3fb66f8f4365b08b553af8206372e90a63%2clayers%3dmeta-arm%3ameta-arm-toolchain&c=E,1,FAdWN5EBmyGUIknnuKG13MEuFRNp1V5UVBzZNA3IjfBb8WaQBNX3bvPaMXD-b8ZouN3xUfQjaEgebO5w586IvhWxmlvRzgh5DbE9-xcCow0fEVMj7swB&typo=1
>> +oe-core,https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fgit%3a%2f%2fgit.openembedded.org%2fopenembedded-core%2cdunfell%2c51844f2d60d77fb8cb46ffe460402f76ae216ca5%2clayers%3dmeta&c=E,1,wl6vIv0IhcxHZif-eK1JOtEXpHxkztPr3czaq2eOW_cpsoeNv5bqyDxMhQZTc3YhUn_fXLJiDc0JkScseJ0YCthZyaPV1AHF956CFEvFaPU0DVBE5TBn7Q,,&typo=1
>> +meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
>> +
>> --
>> 2.17.1
>>
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#13920): https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f13920&c=E,1,3t8YhtFMHdQ5ETFZSsvBnS5t1I86yh5fXkOlD8kJi6Y3TcE5pQrI64C7CK7lUhhsdSdZ7JhykpSDDvfiff5wHn-yi9wtqOOWQUIToQ4hBQvyLELxSf7PbcX28zhC&typo=1
>> Mute This Topic: https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fmt%2f92047026%2f6034914&c=E,1,P_zXeLOTVWou7dtD8gm7ItgGAi3Ky2GQiorA6h9bGiCIJW5pONYk4vf3TvwpFQftIRmgb9CAq2l3jy9d0iJKIjAO6zhcS0_pHc_K_XayrKHgvQbRktMWSfqu&typo=1
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe: https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2funsub&c=E,1,MsOv63smjRpXf9RGZ20pGpYlC4KPBLmuW-zAIdE6dIlnQhyQIjFyYy1D8zWCLrJmu-pWuyGAWNV7t77_eNPX1arik_3CPhodsq8DA3Q_bDHv&typo=1 [sinthu.raja@mistralsolutions.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
>>
> 
> 

