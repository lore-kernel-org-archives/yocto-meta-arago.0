Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 5CE95529F0
	for <meta-arago@arago-project.org>;
	Tue, 17 Aug 2021 13:31:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17HDVTpV129790;
	Tue, 17 Aug 2021 08:31:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629207089;
	bh=IJvvfLu0Pt+7aOi2LcswsYYABcBZZuVnjMC58DdcDW8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=st1sbKjeEBqEd3Xsbk/f5mPE6uMyZW5wsPET/H5vape7t/MfhWyDRDU3SVz8tQGVS
	0cHzQSd+R/AoVU4GwrCZ0h3eCH9AwHgH2SArendaW2oeuXojZ2Tfw+IbuMSce/PEss
	3rW0EwmM+0EqZX76ejvwmYRj+V1/Ng4Bk6qrMd7w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17HDVS1N112155
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 Aug 2021 08:31:29 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 17 Aug 2021 08:30:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 17 Aug 2021 08:30:35 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17HDUYYH089982;
	Tue, 17 Aug 2021 08:30:34 -0500
To: Denys Dmytriyenko <denis@denix.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20210806114852.60704-1-priya.ns@ti.com>
	<37141086-c8fc-919a-8a7e-73e7edd96926@ti.com>
	<20210809181731.c4wnpmmwz7n27b42@NiksLab>
	<20210809182404.GF1528@denix.org>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <d95e304d-c716-c89f-909f-5eefb3524211@ti.com>
Date: Tue, 17 Aug 2021 08:30:34 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210809182404.GF1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [oe-layersetup PATCH v2] processor-sdk: Add 07.03.00.005 release config
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
X-List-Received-Date: Tue, 17 Aug 2021 13:31:08 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 8/9/2021 1:24 PM, Denys Dmytriyenko wrote:
> On Mon, Aug 09, 2021 at 11:47:31PM +0530, Nikhil Devshatwar wrote:
>> On 11:50-20210806, Bajjuri, Praneeth wrote:
>>>> +#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
>>>> +meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
>>>> +meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
>>>> +meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
>>>> +meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
>>>> +meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dunfell,HEAD,layers=meta-optee

Please close the open item with HEAD being used instead of commit ID for 
this patch to be accepted.

>>>
>>> By the way, why do you even need meta-linaro layer for psdkl builds?
> 
> Looks like it is added for meta-optee, but it has since Dunfell been moved to
> meta-arm...
> 
> 
>>>> +meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
>>>> +oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
>>>> +OECORELAYERCONF=./sample-files/bblayers.conf.sample
>>>> +OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
>>>>
>>
> 

