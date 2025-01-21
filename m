Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B730C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 16:19:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.19602.1737476356126595259
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 08:19:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dBV+l5u2;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LGJDGh835174
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jan 2025 10:19:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737476353;
	bh=bAYLl70tvlm1G70KR9P7glljocJgihJJ5Uo/aZ9tb5I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dBV+l5u2sIWF2GcgLug+rjGIAzAGsbMMSo0glZWtugoU+DRCZyg9gVKeisqey7Vwa
	 spcmfMTdl7k2/ExveCgBwczRI1Gwx93OVg03BQH9JwJQdN4kt/Iqzz/RhvNJfJbOcW
	 w2vd5BaiXlQcEdQx+/Pu5UA7v66fU7MqV2lbzBd0=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50LGJDIF075201
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jan 2025 10:19:13 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 10:19:13 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 10:19:13 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LGJCj6115363;
	Tue, 21 Jan 2025 10:19:13 -0600
Message-ID: <08a38912-3515-4f3b-9f15-e8ffc575992e@ti.com>
Date: Tue, 21 Jan 2025 10:19:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 4/5] opencv: Remove OpenCV
 customization and DISTRO_FEATURE
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117211951.698377-1-afd@ti.com>
 <20250117211951.698377-4-afd@ti.com> <20250120212940.GM21836@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250120212940.GM21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 16:19:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15719

On 1/20/25 3:29 PM, Denys Dmytriyenko wrote:
> On Fri, Jan 17, 2025 at 03:19:50PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> These customizations are leftover from when we had DSP acceleration
>> for OpenCV.
> 
>> Also "opencv" is not a DISTRO_FEATURE
> 
> Do you mean it is not a DISTRO_FEATURE already defined in OE-Core? True.
> 
> Do you mean it cannot be used as a DISTRO_FEATURE? False.
> 
> Either way, in this context "opencv" *is* a DISTRO_FEATURE and is being used
> as such.
> 
> Any Distro is free to define its own set of additional DISTRO_FEATURES to be
> used locally or downstream, which was the case here.
> 

I was meaning the first, trying to point out it is not used by oe-core or
anywhere else, and after this change is not used by Arago either. I'll
re-word that to be more clear here.

> Moreover, please note that "openmp" is another example of a locally-defined
> DISTRO_FEATURE here.
> 

Ah that reminds me, this DISTRO_FEATURE is also now not used after dropping
the openmpacc recipes, we should be able to drop it too.

Andrew

> In other words - I'm fine with the changes, but not fine with the reasoning
> behind them...
> 
> 
>> , it is a regular
>> library, if you need OpenCV for a package you should just DEPEND on it.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../point-cloud-viewer/point-cloud-viewer_git.bb             | 4 ----
>>   meta-arago-distro/conf/distro/arago.conf                     | 5 ++---
>>   .../recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh     | 3 ---
>>   .../recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh     | 3 ---
>>   .../recipes-support/opencv/opencv/keystone/setupEnv.sh       | 3 ---
>>   meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh  | 2 --
>>   meta-arago-distro/recipes-support/opencv/opencv_%.bbappend   | 3 ---
>>   7 files changed, 2 insertions(+), 21 deletions(-)
>>   delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
>>   delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
>>   delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
>>   delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
>>   delete mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
>>
>> diff --git a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
>> index 0388a2e0..d08e0f6b 100644
>> --- a/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
>> +++ b/meta-arago-demos/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
>> @@ -3,10 +3,6 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
>>   LICENSE = "TI-TSPA"
>>   LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
>>   
>> -inherit features_check
>> -
>> -REQUIRED_DISTRO_FEATURES = "opencv"
>> -
>>   PR = "r2"
>>   
>>   COMPATIBLE_MACHINE = "dra7xx"
>> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
>> index f1948523..baa526a9 100644
>> --- a/meta-arago-distro/conf/distro/arago.conf
>> +++ b/meta-arago-distro/conf/distro/arago.conf
>> @@ -50,13 +50,12 @@ DISTRO_FEATURES:append = " pam wayland opengl"
>>   DISTRO_FEATURES:remove = "x11"
>>   #DISTRO_FEATURES:append = " opencl"
>>   DISTRO_FEATURES:append = " vulkan"
>> -DISTRO_FEATURES:append = " opencv"
>>   DISTRO_FEATURES:append = " openmp"
>>   
>>   # Normally target distro features will not be applied to native builds:
>>   # Native distro features on this list will use the target feature value
>> -DISTRO_FEATURES_FILTER_NATIVE:append = " opencl opencv openmp"
>> -DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl opencv openmp"
>> +DISTRO_FEATURES_FILTER_NATIVE:append = " opencl openmp"
>> +DISTRO_FEATURES_FILTER_NATIVESDK:append = " opencl openmp"
>>   
>>   # Set global runtime providers for major components
>>   ARAGO_SYSVINIT ??= "0"
>> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
>> deleted file mode 100644
>> index 3ad25601..00000000
>> --- a/meta-arago-distro/recipes-support/opencv/opencv/am57xx-evm/setupEnv.sh
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
>> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
>> -export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
>> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
>> deleted file mode 100644
>> index 3ad25601..00000000
>> --- a/meta-arago-distro/recipes-support/opencv/opencv/dra7xx-evm/setupEnv.sh
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
>> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
>> -export OPENCV_OPENCL_DEVICE='TI AM57:ACCELERATOR:TI Multicore C66 DSP'
>> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
>> deleted file mode 100644
>> index 5b6bdb78..00000000
>> --- a/meta-arago-distro/recipes-support/opencv/opencv/keystone/setupEnv.sh
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
>> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
>> -export OPENCV_OPENCL_DEVICE='TI KeyStone II:ACCELERATOR:TI Multicore C66 DSP'
>> diff --git a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh b/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
>> deleted file mode 100644
>> index 5bf7afd3..00000000
>> --- a/meta-arago-distro/recipes-support/opencv/opencv/setupEnv.sh
>> +++ /dev/null
>> @@ -1,2 +0,0 @@
>> -export OPENCV_BUILDDIR=/usr/share/OpenCV/samples
>> -export OPENCV_TEST_DATA_PATH=/usr/share/OpenCV/testdata
>> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
>> deleted file mode 100644
>> index 2ee6bff7..00000000
>> --- a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
>> +++ /dev/null
>> @@ -1,3 +0,0 @@
>> -inherit features_check
>> -
>> -REQUIRED_DISTRO_FEATURES = "opencv"
>> -- 
>> 2.39.2

