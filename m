Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2228.1645049505401433568
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 16 Feb 2022 14:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JCPzKkq+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: detheridge@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21GMBeNm116300;
	Wed, 16 Feb 2022 16:11:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645049500;
	bh=TBOdX7r/cChkoJsnReHH+9ohvQEyK25yhDnEIagCBmg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JCPzKkq+iEoShZpZDeM4P3AQiJf2ZB+B8dOEeBVLhMlhEIyhppWOxHZj8cBAyLQYO
	 AzxK6AjJKTgRykSWu+7AP3HPJyI4kx/SqBiuMrLtUzaZ19ASYRUbdqAY986keVvs1G
	 SFVxNEvKgfb3BsHa83FCg6kS4o8nxlSnDb5DnI3Y=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21GMBeg4024060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 16 Feb 2022 16:11:40 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 16
 Feb 2022 16:11:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 16 Feb 2022 16:11:40 -0600
Received: from [128.247.81.152] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21GMBejJ079616;
	Wed, 16 Feb 2022 16:11:40 -0600
Message-ID: <aad23319-72e2-85ae-0501-a1424dc625e8@ti.com>
Date: Wed, 16 Feb 2022 16:11:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Praneeth Bajjuri <praneeth@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, Priya N S <priya.ns@ti.com>
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
 <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
 <16BAA88B2E614BBE.14741@lists.yoctoproject.org>
 <20220216215304.GR26229@denix.org>
From: "Etheridge, Darren" <detheridge@ti.com>
In-Reply-To: <20220216215304.GR26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

On 2/16/2022 3:53 PM, Denys Dmytriyenko wrote:
> Darren, Ryan,
> 
> These 2 patch have never been applied to Dunfell!
> https://lists.yoctoproject.org/g/meta-arago/topic/86602755#13358
> https://lists.yoctoproject.org/g/meta-arago/message/13356
> https://lists.yoctoproject.org/g/meta-arago/message/13357

Those will take care of what I am seeing.

Thanks

> 
> 
> On Wed, Nov 24, 2021 at 09:18:42PM -0500, Denys Dmytriyenko wrote:
>> On Tue, Nov 16, 2021 at 02:53:19PM +0530, Priya N S via lists.yoctoproject.org wrote:
>>> Hi Denys,
>>>
>>> On Tue, Oct 26, 2021 at 7:12 PM Priya N S via lists.yoctoproject.org
>>> <priya.ns=mistralsolutions.com@lists.yoctoproject.org> wrote:
>>>>
>>>> Hi All,
>>>> This series of patches fix the Matrix GUI Issue,
>>>>
>>> Did you get a chance to review this patch series?
>>
>> Patches look reasonable to me. Thanks.
>>
>>
>>> Warm Regards,
>>> Vigna Raja Priya N S
>>>
>>>
>>>> Issue:
>>>> After the target board is booted, by default the Matrix GUI Demo is
>>>> not getting displayed on the display device connected to the target
>>>> board.
>>>> The root cause of the Matrix GUI demo issue is that there are two
>>>> Weston system services running in the filesystem. Below are the two
>>>> services,
>>>> 1. Weston systemd service
>>>> 2. Weston initscript service
>>>> The Matrix GUI demo runs on top of the Weston service. Since there
>>>> are two Weston services running, it causes the Matrix GUI demo to not
>>>> work properly.
>>>>
>>>> Fix:
>>>> Both Weston services (systemd and initscript) which has the same command
>>>> and does the same job. So, remove the weston systemd services from the
>>>> filesystem. This fix displays the Matrix GUI in the connected display
>>>> device.
>>>>
>>>> Priya N S (2):
>>>>    wayland: weston: Disable weston systemd service
>>>>    weston-init: Update initscript for weston-calibration
>>>>
>>>>   .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
>>>>   meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
>>>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> --
>>>> 2.19.1.windows.1
> 
