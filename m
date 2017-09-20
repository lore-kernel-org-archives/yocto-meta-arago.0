Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C32E752A3E
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 18:04:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KI46tm032106
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505930646;
	bh=99BtW223Yl51mi7LqvXFvlD2Oi3KgOtyi0+WBjVmuaY=;
	h=Subject:From:To:References:Date:In-Reply-To;
	b=S1U7dtiIPJQPGwlYcjTT+4qCLJ6b80sWpVUaGtpYvO+H0t0PSIzhcvXxZN0G01Ypr
	6u3pBnNvq2z0WDzjWU0QK+mtZdq+YiCGcijpmOFhRvE+r/s6LlSSptpYFPuBj6Bko3
	u2C0PjffnNG1rZ/lf3A8n6eJ8iMCFXx0UQ6XYhaQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI46ct008013
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 13:04:06 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 13:04:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 13:04:06 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KI45B4031471;
	Wed, 20 Sep 2017 13:04:06 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1505854171-9145-1-git-send-email-a0271529@ti.com>
	<7c4d1d4b-3ba6-8c69-d916-79f6d2ca7e55@ti.com>
Message-ID: <3cf9d824-bd72-4777-5c4b-0f12fda85246@ti.com>
Date: Wed, 20 Sep 2017 14:04:05 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <7c4d1d4b-3ba6-8c69-d916-79f6d2ca7e55@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processsor-sdk] [PATCH] ti-pdk-build-rtos: updated the version to 1.0.0.6
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
X-List-Received-Date: Wed, 20 Sep 2017 18:04:07 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Pushed. Please follow up by upstreaming to meta-ti.


On 9/20/2017 10:01 AM, Jacob Stiffler wrote:
> Please provide the patch for meta-ti.
>
>
> On 9/19/2017 4:49 PM, Hongmei Gou wrote:
>> * Also added the pruss linker command files for linux user space
>>
>> Signed-off-by: Hongmei Gou <a0271529@ti.com>
>> ---
>>   recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb 
>> b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
>> index 0807983..b59f8ca 100644
>> --- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
>> +++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
>> @@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = 
>> "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
>>     require recipes-ti/includes/ti-paths.inc
>>   -PV = "01.00.00.05A"
>> +PV = "01.00.00.06"
>>   PR = "r0"
>>     PDK_BUILD_GIT_URI = 
>> "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
>>   PDK_BUILD_GIT_PROTOCOL = "git"
>>   PDK_BUILD_GIT_BRANCH = "master"
>>   -# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.05A"
>> -PDK_BUILD_SRCREV = "3a7a42bcd85388b24fe83401fb284ce22d7b2978"
>> +# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.06"
>> +PDK_BUILD_SRCREV = "67986fbcef0b37428587a3d50d68d81f935f0c30"
>>     BRANCH = "${PDK_BUILD_GIT_BRANCH}"
>>   SRC_URI = 
>> "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRANCH}"
>> @@ -55,6 +55,7 @@ do_install_append_ti33x() {
>>       install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU0_REV1_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV1_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>         }
>>   @@ -69,6 +70,7 @@ do_install_append_ti43x() {
>>       install -m 0755 pruss/lnk_a8_a9_a15_REV1.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU0_REV1_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV1_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>         }
>>   @@ -104,6 +106,9 @@ do_install_append_am57xx-evm() {
>>       install -m 0755 pruss/PRU0_REV2_to_C66.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV2_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV2_to_C66.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +    install -m 0755 pruss/lnk_a8_a9_a15_REV1_linux.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +
>>   }
>>     do_install_append_am57xx-hs-evm() {
>> @@ -178,6 +183,7 @@ do_install_append_k2g() {
>>       install -m 0755 pruss/PRU0_REV2_to_C66.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV2_to_ARM.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>       install -m 0755 pruss/PRU1_REV2_to_C66.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>> +    install -m 0755 pruss/lnk_a8_a9_a15_REV2_linux.cmd 
>> ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/build/pruss
>>   }
>>     FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages/*"
>


