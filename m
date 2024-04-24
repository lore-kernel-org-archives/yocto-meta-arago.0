Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED0CC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 14:43:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.18215.1713969810308177746
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 07:43:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hQzjpai0;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43OEhTcp048907;
	Wed, 24 Apr 2024 09:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713969809;
	bh=RzQ568Sc4gBw8qzdf9dzdh0k/KiS/q5IJo8mvaZob3o=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=hQzjpai0X62C6Rh5U/BBDR4KIOOMxWmhrLdXzPV8mVlbbtGosvMBdGXoa0nfTEBAj
	 ifn5HW5oQTp0+fxritMBdG6zGzdVdk2yyEgCZ/iyJtERnw3WCBN5bELereU27tMlXu
	 xohWJac5NHV33L18QyRgqh/YgROQ0KHAuciCNe9c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43OEhTbq020372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Apr 2024 09:43:29 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Apr 2024 09:43:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Apr 2024 09:43:28 -0500
Received: from [10.249.35.173] ([10.249.35.173])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43OEhSkj019743;
	Wed, 24 Apr 2024 09:43:28 -0500
Message-ID: <dac8aa07-0b98-493d-ad04-f5385242beaa@ti.com>
Date: Wed, 24 Apr 2024 09:43:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] TMDSSK3358 am335x-pru0-fw firmware load failure
To: <charles.cc.zhang@gmail.com>, <meta-arago@lists.yoctoproject.org>
References: <M6Km.1713957686485366841.d3N4@lists.yoctoproject.org>
 <Groupsio.1.M6Km.1713957686485366841.d3N4@lists.yoctoproject.org>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <Groupsio.1.M6Km.1713957686485366841.d3N4@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 24 Apr 2024 14:43:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15307



On 4/24/2024 8:55 AM, charles.cc.zhang@gmail.com wrote:
> [Edited Message Follows]
> 
> Hi,
> I am trying out the Arago build for TI AM335x Starter Kit (TMDSSK3358).
> I built the image with:
>> git clone https://git.ti.com/git/arago-project/oe-layersetup.git tisdk
>> cd tisdk/
>> ./oe-layertool-setup.sh -f configs/processor-sdk/processor-sdk-kirkstone-09.02.01.09-config.txt
>> cd build/
>> . conf/setenv
>> MACHINE=am335x-evm ARAGO_RT_ENABLE=1 bitbake -k tisdk-base-image
> 
> Then I boot the image and try to load the firmware with the following error:
>> root@am335x-evm:~# dmesg | grep pru
>> [   29.717917] remoteproc remoteproc0: 4a334000.pru is available
>> [   29.739480] remoteproc remoteproc1: 4a338000.pru is available
>> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc0/firmware
>> am335x-pru0-fw
>> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc0/state
>> offline
>> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc1/firmware
>> am335x-pru1-fw
>> root@am335x-evm:~# cat /sys/class/remoteproc/remoteproc1/state
>> offline
>> root@am335x-evm:~# echo 'start' > /sys/class/remoteproc/remoteproc0/state
>> [  119.827705] remoteproc remoteproc0: powering up 4a334000.pru
>> [  119.827895] remoteproc remoteproc0: Direct firmware load for am335x-pru0-fw failed with error -2
>> -sh: echo: write error: No such file or directory[  119.827921] remoteproc remoteproc0: request_firmware failed: -2
>>
>> [  119.827930] remoteproc remoteproc0: Boot failed: -2
>> root@am335x-evm:~# dmesg | grep pru
>> [   29.717917] remoteproc remoteproc0: 4a334000.pru is available
>> [   29.739480] remoteproc remoteproc1: 4a338000.pru is available
>> [  119.827705] remoteproc remoteproc0: powering up 4a334000.pru
>> [  119.827895] remoteproc remoteproc0: Direct firmware load for am335x-pru0-fw failed with error -2
> 
> If I look at the firmware folder:
>> root@am335x-evm:~# ls /lib/firmware/ti-pruss/
>> am335x-pru0-prueth-fw.elf  am335x-pru0-pruprp-fw.elf  am335x-pru1-pruhsr-fw.elf
>> am335x-pru0-pruhsr-fw.elf  am335x-pru1-prueth-fw.elf  am335x-pru1-pruprp-fw.elf
> 
> I also tried:
>> echo 'am335x-pru0-prueth-fw' > /sys/class/remoteproc/remoteproc0/firmware
>> root@am335x-evm:~# echo 'start' > /sys/class/remoteproc/remoteproc0/state
>> -sh: echo: write error: No such file or directory
>> [  458.718686] remoteproc remoteproc0: powering up 4a334000.pru  th error -2
>> [  458.718819] remoteproc remoteproc0: request_firmware failed: -2irmware load for am335x-pru0-prueth-fw failed wit
>> [  458.718828] remoteproc remoteproc0: Boot failed: -2
> 
> Could you please help me on this issue? Thanks in advance!

This mailing list is mainly meant for patch submissions and reviews for 
the meta-arago repository.  You will better served to visit 
https://e2e.ti.com/ for support with the TI SDK.



> Best regards,
> Charles
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15304): https://lists.yoctoproject.org/g/meta-arago/message/15304
> Mute This Topic: https://lists.yoctoproject.org/mt/105707853/6551054
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-arago/unsub [reatmon@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

