Return-Path: <nikhil.nd@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id BAEBF529A5
	for <meta-arago@arago-project.org>;
	Fri, 20 Sep 2019 10:08:30 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8KA7MuS043091
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 05:07:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568974042;
	bh=mA6wdaMSFaUGj25FEPsUtxvn2N+xmgl6h0Jmnl6Tmzg=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=TKBZYlIvFFlpSsHKNXsa2w3qxd2gnrkdsovfT2ErFuTCLABpm7K41Jted8+y53p4z
	oMzAUVUM8m+deZ5toE2pg5ublJVzz1FfK7koPUAYxGOJPcTq6zSXRuFNP5ef6P+Xzc
	5pKJcUwX//RCjsIQglZ2tEOm5qKZnY44DMLFhpKQ=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8KA7MhG107401
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Sep 2019 05:07:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 20 Sep 2019 05:07:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 20 Sep 2019 05:07:22 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8KA7KM8084410;
	Fri, 20 Sep 2019 05:07:20 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1568913757-151704-1-git-send-email-nikhil.nd@ti.com>
	<20190919211805.GE5351@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <1b252556-3061-d319-a595-44691f1d0938@ti.com>
Date: Fri, 20 Sep 2019 15:37:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190919211805.GE5351@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v2] packagegroup: tisdk-addons-sdk-host: Add src packages
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
X-List-Received-Date: Fri, 20 Sep 2019 10:08:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 20/09/19 2:48 AM, Denys Dmytriyenko wrote:
> On Thu, Sep 19, 2019 at 10:52:37PM +0530, Nikhil Devshatwar wrote:
>> Add source packages for ATF and external kernel modules
>> Also define the src package proprties for these
>> ---
>>   meta-arago-distro/conf/distro/include/arago-source-ipk.inc | 14 ++++++++++++++
>>   .../packagegroup-arago-tisdk-addons-sdk-host.bb            |  6 ++++++
>>   2 files changed, 20 insertions(+)
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
> Still here^^^
Apologies.
Maybe I should have two yocto builds with and w/o meta-psdkla layer
So that I start getting build errors due to such dependencies.

Nikhil D

>
>
>> +
>>   CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>>   SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
>>   
>> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> index fbdc735..ba2df44 100644
>> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
>> @@ -39,6 +39,12 @@ UTILS_append_k2g = " \
>>   UTILS_append_k3 = " \
>>       jailhouse-src \
>>       ti-sci-fw-src \
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


