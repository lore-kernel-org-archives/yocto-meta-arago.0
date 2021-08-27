Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id C5D0A529A8
	for <meta-arago@arago-project.org>;
	Fri, 27 Aug 2021 19:31:24 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17RJVoiU105357;
	Fri, 27 Aug 2021 14:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1630092710;
	bh=jeUhxqVLB+1HEAEl6lOYLS6t0yIYYboO+SvU2afy/uk=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=n7vU2rjGVmaKSI+AWxCOe+1WyTiJqE5YILln+uD2bWWMHfAK4NQFbmLrbZ9aCeiIl
	MhAE2+1TwrzrJPV9Xxc7oScke7zEoH9BF2HJobDYEG8FEVMWlLnf0SGZYt/6aKIeU4
	sJ4Ry/tieaLEcKw+Gcb4Xe8/on/nR+ZjGs3h1HqA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17RJVoqk117907
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Aug 2021 14:31:50 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Fri, 27 Aug 2021 14:31:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Fri, 27 Aug 2021 14:31:50 -0500
Received: from [10.250.69.185] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17RJVnKW072904;
	Fri, 27 Aug 2021 14:31:50 -0500
To: "Bajjuri, Praneeth" <praneeth@ti.com>, Vigna Raja Priya N S
	<priya.ns@mistralsolutions.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>
References: <20210826103155.72744-1-priya.ns@ti.com>
	<286a52f6-7554-c817-903e-cb412e427567@ti.com>
	<CAHFpNO838+BTYFQgAcR-RjDL+GPCTR7DDgZ81jZCESnBGdJJmQ@mail.gmail.com>
	<49584733-c850-2fb3-a9b1-c6d157226791@ti.com>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <06142705-2bf9-c11a-ec78-78f5427e5dcd@ti.com>
Date: Fri, 27 Aug 2021 14:31:49 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <49584733-c850-2fb3-a9b1-c6d157226791@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "N S,
	Priya" <priya.ns@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v3] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Fri, 27 Aug 2021 19:31:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 8/27/2021 1:45 PM, Bajjuri, Praneeth wrote:
> 
> 
> On 8/27/2021 5:54 AM, Vigna Raja Priya N S wrote:
>> On Fri, Aug 27, 2021 at 1:42 AM Praneeth Bajjuri <praneeth@ti.com> wrote:
>>>
>>>
>>>
>>> On 8/26/21 5:31 AM, Priya N S wrote:
>>>> Signed-off-by: Priya N S <priya.ns@ti.com>
>>>> ---
>>>>
>>>> Hi All,
>>>>
>>>> This patch adds the processor-sdk-07.03.00.005-config for the AM335x
>>>> and AM437x 07.03 release.
>>>>
>>>> Changes made in the V3 patch:
>>>> * This corresponds to the 07.03 release for the am335x-evm and
>>>>     am437x-evm platforms.
>>>> * The meta-linaro meta-layer is removed because the meta-optee needed
>>>>     for the build is moved to meta-arm from the dunfell.
>>>
>>> any version change log should be below
>>> ---
>>>
>>> please correct the commit message about "Changes made in the V3 patch:"
>>>
>>>
>>>>
>>>>    .../processor-sdk-07.03.00.005-config.txt          | 14 
>>>> ++++++++++++++
>>>>    1 file changed, 14 insertions(+)
>>>>    create mode 100644 
>>>> configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
>>>>
>>>> diff --git 
>>>> a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt 
>>>> b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
>>>> new file mode 100644
>>>> index 0000000..548e759
>>>> --- /dev/null
>>>> +++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
>>>> @@ -0,0 +1,14 @@
>>>> +# This file takes repo entries in the format
>>>> +# repo name,repo uri,repo branch,repo 
>>>> commit[,layers=layer1:layer2...:layern]
>>>> +
>>>> +bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551 
>>>>
>>>> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers= 
>>>>
>>>
>>> this doesnt seems to be latest commit from
>>> https://git.ti.com/cgit/processor-sdk/meta-processor-sdk/log/?h=dunfell
>>> it looks atleast 27 patches behind. Please provide the reason for this
>>> difference.
>> The release config file added in this patch is for the AM335x and
>> AM437x GP EVM 07.03.00.005 release that has
>> already happened on 24th May 2021 and 02nd July 2021. The config file
>> was missed to add in the oe-layersetup
>> repository after the release.
>> The 27 patches mentioned were added after the release of AM335x and
>> AM437x GP EVM. So, this is the reason
>> for seeing the differences in the commit Ids.
>>
>>>
>>> Can you also start using tags for meta-processor-sdk.
>>>
>> Since 07.03 release has already happened, 
> 
> Yes, but you can still tag the right commitID eventhough its not on the 
> top and update the oelayersup patch to point to tagname instead.
> 
> We will loose history and dont have a read point later to demystify why 
> we are using a older commit for the snapshot config patch after a month.

Good point. How-ever this is for older release and for latest 8.0 also 
commit id is being used. So if they need to make this change they will 
need to update 8.0 config for continuity. So I am fine with leaving this 
as-is and start following this for new 8.x releases.

> 
> 
> we will consider using the
>> tags in meta-processor-sdk for the
>> upcoming releases.
>> Please suggest.
>>
>>>> +meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras 
>>>>
>>>> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers= 
>>>>
>>>> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers= 
>>>>
>>>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems 
>>>>
>>>> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers= 
>>>>
>>>> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain 
>>>>
>>>> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta 
>>>>
>>>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>>> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
>>>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

