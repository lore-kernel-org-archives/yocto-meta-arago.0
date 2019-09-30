Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9F069520DE
	for <meta-arago@arago-project.org>;
	Mon, 30 Sep 2019 08:38:12 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8U8b11f060543
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569832621;
	bh=DsArE5xXVBFT6awx1l69seXDCOSNlHAcJU0PlSscPVk=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=MCvdLjtu2AFjtz6I7qH0LGIrmKzt5TrH6ZLM50wH1QFYnKmGtZsvuxJ8SZVSj7SX/
	ALyG7hnt6ZD2E6EYphiYE4qJEBIgIWTkURhhnRtmdT3qVR2e1ldCtZFh6GXo6lI4VN
	kbUMWdyDUv33wnXwLDynVCHdBBrZP07HwVNrqwKU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8U8b1KA043607
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 30 Sep 2019 03:37:01 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 30 Sep 2019 03:36:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 30 Sep 2019 03:37:01 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8U8axNA105616;
	Mon, 30 Sep 2019 03:37:00 -0500
To: Jacob Stiffler <j-stiffler@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>, 
	<meta-arago@arago-project.org>
References: <1569577478-68202-1-git-send-email-nikhil.nd@ti.com>
	<d9caa716-c26f-3fee-028c-2b25f56ede4d@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <35af5bb8-f980-ba68-0047-7eceb36dbf90@ti.com>
Date: Mon, 30 Sep 2019 14:06:58 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <d9caa716-c26f-3fee-028c-2b25f56ede4d@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master PATCH v1] tisdk-readme: Add separate README for k3 platforms
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
X-List-Received-Date: Mon, 30 Sep 2019 08:38:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 27/09/19 6:06 PM, Jacob Stiffler wrote:
>
> On 9/27/2019 5:44 AM, Nikhil Devshatwar wrote:
>> For machines with k3 platforms, install the README_k3 as README
>> It describes all the new files needed for booting k3 devices.
>>
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   .../recipes-tisdk/tisdk-readme/tisdk-readme.bb     |  8 +++++--
>>   .../tisdk-readme/tisdk-readme/README_k3            | 26 ++++++++++++++++++++++
>>   2 files changed, 32 insertions(+), 2 deletions(-)
>>   create mode 100644 meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
>
>
> If you add this file to "meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/k3/README", you will not need the other changes to the recipe.
Thanks for the suggestion, will send a v2 with that change
Nikhil D
>
>
>> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
>> index 6fdcaff..18f8c04 100644
>> --- a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme.bb
>> @@ -4,19 +4,23 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
>>     SRC_URI = "\
>>       file://README \
>> +    file://README_k3 \
>>   "
>>   -PR = "r0"
>> +PR = "r1"
>>   PV = "1.0"
>>     PACKAGE_ARCH = "${MACHINE_ARCH}"
>>     S = "${WORKDIR}"
>>   +README_FILE = "README"
>> +README_FILE_k3 = "README_k3"
>> +
>>   do_install () {
>>       install -d ${D}/board-support/prebuilt-images
>>   -    install -m 0644 ${S}/README ${D}/board-support/prebuilt-images/
>> +    install -m 0644 ${S}/${README_FILE} ${D}/board-support/prebuilt-images/README
>>   }
>>     FILES_${PN} += "board-support/*"
>> diff --git a/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3 b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
>> new file mode 100644
>> index 0000000..0eb6dd3
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-tisdk/tisdk-readme/tisdk-readme/README_k3
>> @@ -0,0 +1,26 @@
>> +The files contained in this directory represent the images that were built
>> +as part of the original SDK build and packaging process.  They are meant
>> +to serve as a restore and starting point for your development. In order
>> +to use these images with an SD card they should be placed in the appropriate
>> +locations.
>> +
>> +By default these locations are:
>> +
>> ++-------------+-----------------------------------------+
>> +|    File     |                Location                 |
>> ++-------------+-----------------------------------------+
>> +| tiboot3.bin | boot partition                          |
>> +| tispl.bin   | boot partition                          |
>> +| u-boot.img  | boot partition                          |
>> +| sysfw.itb   | boot partition                          |
>> +| uEnv.txt    | boot partition                          |
>> ++-------------+-----------------------------------------+
>> +| Image       | /boot directory of the rootfs partition |
>> +| *.dtb       | /boot directory of the rootfs partition |
>> +| *.dtbo      | /boot directory of the rootfs partition |
>> ++-------------+-----------------------------------------+
>> +
>> +By default the boot loaders are read from the first FAT partition, which is
>> +usually called the "boot" partition.  Then the bootloader will look for the
>> +Image and .dtb .dtbo files in the /boot directory of the ext4 partition, which is
>> +usually called the "rootfs" partition.


