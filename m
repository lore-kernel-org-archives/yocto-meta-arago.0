Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 86E3B520DE
	for <meta-arago@arago-project.org>;
	Thu, 19 Sep 2019 17:21:49 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8JHKfcH070883
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 12:20:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568913641;
	bh=YtRVEAzZdhoXpxSnU2qsbilZKI68WfNEuhUWBLZOTag=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ndrnS1nfVtM962Cl3y/TVMyHhof5QYCRbBp/J2A1wp9vvjmMM90N6ka2HHG9etE4F
	x4SoKd6CWITPUR1LZqU9TOtJOenAuaKJjXowY+lsMuyDV5ZmgTu5jJznWYMTNZYgGc
	89sC5xpG3goOFxjQrs7Wg8OoWqQako5JYWG5kJ4o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8JHKfg3019713
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 19 Sep 2019 12:20:41 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 19 Sep 2019 12:20:36 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 19 Sep 2019 12:20:40 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8JHKc3d125305;
	Thu, 19 Sep 2019 12:20:39 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1568887469-57690-1-git-send-email-nikhil.nd@ti.com>
	<20190919163934.GD5351@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <c648c263-1040-5713-8ab3-2ff693556c75@ti.com>
Date: Thu, 19 Sep 2019 22:50:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190919163934.GD5351@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Thu, 19 Sep 2019 17:21:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 19/09/19 10:09 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 19, 2019 at 03:34:29PM +0530, Nikhil Devshatwar wrote:
>> Add source packages for ATF and external kernel modules
>> Also define the src package proprties for these
>> ---
>>   meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 14 ++++++++++++++
>>   .../packagegroup-arago-tisdk-addons-sdk-host.bb            |  7 +++++++
>>   2 files changed, 21 insertions(+)
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> index 6e56c77..970e3e2 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> @@ -142,6 +142,10 @@ SRCIPK_PRESERVE_GIT_pn-u-boot-keystone = "true"
>>   CREATE_SRCIPK_pn-u-boot-dra7xx = "1"
>>   SRCIPK_INSTALL_DIR_pn-u-boot-dra7xx = "board-support/u-boot-${PV}-${PR}"
>>   
>> +CREATE_SRCIPK_pn-arm-trusted-firmware = "1"
>> +SRCIPK_INSTALL_DIR_pn-arm-trusted-firmware = "board-support/${PN}-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-arm-trusted-firmware = "true"
>> +
>>   CREATE_SRCIPK_pn-linux-ti-staging = "1"
>>   SRCIPK_INSTALL_DIR_pn-linux-ti-staging = "board-support/linux-${PV}${KERNEL_LOCALVERSION}"
>>   SRCIPK_PRESERVE_GIT_pn-linux-ti-staging = "true"
>> @@ -181,6 +185,7 @@ SRCIPK_INSTALL_DIR_pn-linux-omap4 = "board-support/linux-${PV}"
>>   
>>   CREATE_SRCIPK_pn-cryptodev-module = "1"
>>   SRCIPK_INSTALL_DIR_pn-cryptodev-module = "board-support/extra-drivers/cryptodev-module-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-cryptodev-module = "true"
>>   
>>   CREATE_SRCIPK_pn-cmem-mod = "1"
>>   SRCIPK_INSTALL_DIR_pn-cmem-mod = "board-support/extra-drivers/${PN}-${PV}"
>> @@ -196,6 +201,11 @@ SRCIPK_INSTALL_DIR_pn-ti-sgx-ddk-km = "board-support/extra-drivers/${PN}-${PV}"
>>   
>>   CREATE_SRCIPK_pn-ti-img-rogue-driver = "1"
>>   SRCIPK_INSTALL_DIR_pn-ti-img-rogue-driver = "board-support/extra-drivers/${PN}-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-ti-img-rogue-driver = "true"
>> +
>> +CREATE_SRCIPK_pn-ti-img-encode-decode = "1"
>> +SRCIPK_INSTALL_DIR_pn-ti-img-encode-decode = "board-support/extra-drivers/${PN}-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-ti-img-encode-decode = "true"
>>   
>>   CREATE_SRCIPK_pn-ti-gc320-driver = "1"
>>   SRCIPK_INSTALL_DIR_pn-ti-gc320-driver = "board-support/extra-drivers/${PN}-${PV}"
>> @@ -364,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
>>   CREATE_SRCIPK_pn-uio-module-drv = "1"
>>   SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
>>   
>> +CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
>> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
>> +
>>   CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>>   SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
>>   
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> index fbdc735..558955c 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> @@ -39,6 +39,13 @@ UTILS_append_k2g = " \
>>   UTILS_append_k3 = " \
>>       jailhouse-src \
>>       ti-sci-fw-src \
>> +    ivshmem-uio-driver-src \
> ???
Oops, that should not be added as of now.
I have to submit a recipe for ivshmem-uio-driver first.
Will remove this in v2


Regards,
Nikhil D

>
>
>> +    arm-trusted-firmware-src \
>> +"
>> +
>> +UTILS_append_j7-evm = " \
>> +    ti-img-encode-decode-src \
>> +    ti-img-rogue-driver-src \
>>   "
>>   
>>   UTILS_append_am65xx = " \
>> -- 
>> 1.9.1
>>


