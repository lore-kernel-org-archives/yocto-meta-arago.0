Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 775A3529F0
	for <meta-arago@arago-project.org>;
	Tue, 17 Aug 2021 13:27:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HDRX9T127555;
	Tue, 17 Aug 2021 08:27:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629206853;
	bh=KgvvjZEuX0U6/ZrAnRA7H1ORTcY5rSnULZqAiEjCDkI=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=cjEQ+mgoGj9VvGzATzVNsMpd5SkGEv/9wULjPKX6twv0UP8pgl35S44Ki5PTjn3ad
	RS4N7zVg4znIoJKdRgVDTwPpGrAJ/e8q+M0qiQXOWB9Df2skIL992qQ2ptPik3/EKw
	eoGPIsX7obMwCWLHX9LdixtUOu/uJn0tRcXaa26Y=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HDRXGm042194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Aug 2021 08:27:33 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 17 Aug 2021 08:27:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 17 Aug 2021 08:27:33 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HDRXKV083658;
	Tue, 17 Aug 2021 08:27:33 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>,
	<praneeth@ti.com>
References: <20210809182107.6899-1-nikhil.nd@ti.com>
	<059ef067-18fa-7ed7-2a2e-eab17fe4090a@ti.com>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <727f2fd8-a44e-4106-9254-342d38f808dc@ti.com>
Date: Tue, 17 Aug 2021 08:27:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <059ef067-18fa-7ed7-2a2e-eab17fe4090a@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: nsekhar@ti.com
Subject: Re: [oe-layersetup PATCH] processor-sdk: Add 08.00.00.21 release config
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
X-List-Received-Date: Tue, 17 Aug 2021 13:27:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Mirror issue with git.ti.com is resolved.
The config file is synced now.

On 8/13/2021 12:03 PM, Nikhil Devshatwar wrote:
> 
> Praneeth,
> 
> On 09/08/21 11:51 pm, Nikhil Devshatwar wrote:
>> Add config file for processor-sdk 08.00.00.21 release
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> 
> ping on this
> 
> Please merge this soon.
> AM64 release is out and people will start doing builds.
> 
> Regards,
> Nikhil D
> 
> 
> 
>> ---
>>   .../processor-sdk-08.00.00.21-config.txt           | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>   create mode 100644 
>> configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
>>
>> diff --git 
>> a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt 
>> b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
>> new file mode 100644
>> index 0000000..78a921c
>> --- /dev/null
>> +++ b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
>> @@ -0,0 +1,14 @@
>> +# This file takes repo entries in the format
>> +# repo name,repo uri,repo branch,repo 
>> commit[,layers=layer1:layer2...:layern]
>> +
>> +bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4 
>>
>> +meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers= 
>>
>> +meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras 
>>
>> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers= 
>>
>> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers= 
>>
>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems 
>>
>> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
>> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain 
>>
>> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta 
>>
>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>> +OECORELOCALCONF=./sample-files/local-arago64.conf.sample
>>

