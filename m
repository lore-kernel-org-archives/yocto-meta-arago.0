Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1301.1646792650511904507
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 08 Mar 2022 18:24:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ipu+mNYx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2292O7YJ097179;
	Tue, 8 Mar 2022 20:24:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1646792647;
	bh=qp0cgZhUyCVK4FqKUgMDDKLGLfrlGgkxWvAMgKsUxI8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ipu+mNYxaJs38CPNc04atTkV0/udXVdzfBolMlONDE/BpdquomIfRuXzOX4Y+mz5n
	 JuNy3fApjuMANcs4Jr2kDafjkaXjE3Sz65FMiUZFalL4tb7OaGeX2IVemRKl4svpBp
	 hJ4+tEBf/qS9NoLAMD2aQJqVxXyysWQI1BFzbADw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2292O7CE119615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Mar 2022 20:24:07 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 8
 Mar 2022 20:24:07 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 8 Mar 2022 20:24:07 -0600
Received: from [10.249.37.96] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2292O7dH043691;
	Tue, 8 Mar 2022 20:24:07 -0600
Message-ID: <7250b6fb-ae55-3d16-1f2c-677ca464c502@ti.com>
Date: Tue, 8 Mar 2022 20:24:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [meta-arago] [dunfell PATCH 0/2] recipes-graphics: Update weston to fix Matrix GUI
To: Vigna Raja Priya N S <priya.ns@mistralsolutions.com>, <detheridge@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>,
        Praneeth Bajjuri <praneeth@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Priya N S
	<priya.ns@ti.com>
References: <16B1986DA8DE72E9.11657@lists.yoctoproject.org>
 <CAHFpNO9qO3N+jBQfi6GZHL_EjwW33_P=1NNAshbvjKNz2ts4Sw@mail.gmail.com>
 <16BAA88B2E614BBE.14741@lists.yoctoproject.org>
 <20220216215304.GR26229@denix.org>
 <aad23319-72e2-85ae-0501-a1424dc625e8@ti.com>
 <CAHFpNO9Dptu=xxZRnDWRLE-L9oKw-22Yt_YVWRdVvpdg_1UPMQ@mail.gmail.com>
From: "Ryan Eatmon" <reatmon@ti.com>
In-Reply-To: <CAHFpNO9Dptu=xxZRnDWRLE-L9oKw-22Yt_YVWRdVvpdg_1UPMQ@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


Those patches were merged in a few RCs ago.


On 3/8/2022 20:22, Vigna Raja Priya N S wrote:
> On Thu, Feb 17, 2022 at 3:46 AM Etheridge, Darren via
> lists.yoctoproject.org <detheridge=ti.com@lists.yoctoproject.org>
> wrote:
>>
>> Denys,
>>
>> On 2/16/2022 3:53 PM, Denys Dmytriyenko wrote:
>>> Darren, Ryan,
>>>
>>> These 2 patch have never been applied to Dunfell!
>>> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2ftopic%2f86602755%2313358&c=E,1,ZnF57xRV7nLnoZixsGg41IEPFqZvJZTeN1xrW8i8RWH_R4ZjIMnYin7x5M558qiMtuJ9QLCRWFxUsNY95SN1DxcpHCUyED4hzZyDmni1iE2ElPk,&typo=1
>>> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f13356&c=E,1,kDtAk75kjUMvvyf-C6PdVlPK5uPbqGihqWZmZHk-Yu7q3oDzY6r413wJY2X74ZgEIDL7e2o1hBx70haY6v1hzWHux3kvDz4SgNfEXr6kPYW16n_uGzi3Fs0,&typo=1
>>> https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org%2fg%2fmeta-arago%2fmessage%2f13357&c=E,1,NbQLSL4ciRz_tQQ0mnbLemNd_xkGu-FDWY9waz_Swara7ndBoUNVeEAsTsltDefE6bhQOtCs9smxjy6uNYVH-UNx0rltoMFoafvMRAs6TntGik1o0qQ,&typo=1
>>
>> Those will take care of what I am seeing.
>>
>> Thanks
>>
> Darren,
> Can you please merge the above-mentioned 2 patches into meta-arago if
> the patches are good for the merge?
> 
> Warm Regards,
> Vigna Raja Priya N S
>>>
>>>
>>> On Wed, Nov 24, 2021 at 09:18:42PM -0500, Denys Dmytriyenko wrote:
>>>> On Tue, Nov 16, 2021 at 02:53:19PM +0530, Priya N S via https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org&c=E,1,VoXbrQWkvEHvM-WF4CvBKZeZVvW70zsWX7YzDGdG4aT2lesoEuMl1lcGaP5ot_Uo_aV3cNLpU33EJaLqDlZr1bgol0bSSG-Df9IAMUdro3LRZokpU3JMzw,,&typo=1 wrote:
>>>>> Hi Denys,
>>>>>
>>>>> On Tue, Oct 26, 2021 at 7:12 PM Priya N S via https://linkprotect.cudasvc.com/url?a=https%3a%2f%2flists.yoctoproject.org&c=E,1,bWq4pmqhaYMcCeae7wjDauguMWMqnXy6jmVcIHulaYSXFlwW-My_21WyvaCuFGmHJoaJnBOr6c2CpJ6OD8QckMZl5ZOnCGKxqk_DPKp1qHlqedOUk4BWIDG0cds,&typo=1
>>>>> <priya.ns=mistralsolutions.com@lists.yoctoproject.org> wrote:
>>>>>>
>>>>>> Hi All,
>>>>>> This series of patches fix the Matrix GUI Issue,
>>>>>>
>>>>> Did you get a chance to review this patch series?
>>>>
>>>> Patches look reasonable to me. Thanks.
>>>>
>>>>
>>>>> Warm Regards,
>>>>> Vigna Raja Priya N S
>>>>>
>>>>>
>>>>>> Issue:
>>>>>> After the target board is booted, by default the Matrix GUI Demo is
>>>>>> not getting displayed on the display device connected to the target
>>>>>> board.
>>>>>> The root cause of the Matrix GUI demo issue is that there are two
>>>>>> Weston system services running in the filesystem. Below are the two
>>>>>> services,
>>>>>> 1. Weston systemd service
>>>>>> 2. Weston initscript service
>>>>>> The Matrix GUI demo runs on top of the Weston service. Since there
>>>>>> are two Weston services running, it causes the Matrix GUI demo to not
>>>>>> work properly.
>>>>>>
>>>>>> Fix:
>>>>>> Both Weston services (systemd and initscript) which has the same command
>>>>>> and does the same job. So, remove the weston systemd services from the
>>>>>> filesystem. This fix displays the Matrix GUI in the connected display
>>>>>> device.
>>>>>>
>>>>>> Priya N S (2):
>>>>>>     wayland: weston: Disable weston systemd service
>>>>>>     weston-init: Update initscript for weston-calibration
>>>>>>
>>>>>>    .../recipes-graphics/wayland/weston-init.bbappend            | 5 ++++-
>>>>>>    meta-arago-distro/recipes-graphics/wayland/weston-init/init  | 2 +-
>>>>>>    2 files changed, 5 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> --
>>>>>> 2.19.1.windows.1
>>>
>>
>>
>> 
>>
>>

-- 
Ryan Eatmon
reatmon@ti.com
