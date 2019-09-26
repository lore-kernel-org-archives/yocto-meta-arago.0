Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 16850520E2
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2019 12:29:05 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8QCRt3u039540
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 07:27:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569500875;
	bh=kuKFRZR7/frGz3P9QL8Sfs2TghkjZFuLR5+MVDqdpHs=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=FzIwp1q17rhrjcO90k5AKOXYsZam5J+ay7cs92j89KBIMpmiOPxt2XvCpM1XaKAuf
	ZW5gp3G1ieOx9IAuHEf+RLCOrM37EwFzPYxALf8r43dY7C+1hoVSV+hUx3X0UMzixz
	o21k1hvTgJwx5grXOoeJL77bNwN26aONeinaOvPQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QCRtGI079003
	for <meta-arago@arago-project.org>; Thu, 26 Sep 2019 07:27:55 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 26 Sep 2019 07:27:47 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 26 Sep 2019 07:27:47 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8QCRqNR050638;
	Thu, 26 Sep 2019 07:27:53 -0500
To: Denys Dmytriyenko <denys@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
References: <1569421729-57631-1-git-send-email-nikhil.nd@ti.com>
	<20190925171609.GE4163@beryl>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <dbf21976-5aee-fb71-2c99-d2109f6879bd@ti.com>
Date: Thu, 26 Sep 2019 17:57:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190925171609.GE4163@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master PATCH v1] recipes-kernel: Add recipe for ivshmem-uio driver
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
X-List-Received-Date: Thu, 26 Sep 2019 12:29:05 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 25/09/19 10:46 PM, Denys Dmytriyenko wrote:
> Can you send patches just to the list? Not critical, but this messes up my
> filters :) And I'm applying patches from Patchwork anyway...
>
>
> On Wed, Sep 25, 2019 at 07:58:49PM +0530, Nikhil Devshatwar wrote:
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   .../conf/distro/include/arago-source-ipk.inc       |  4 ++++
>>   .../recipes-kernel/uio/ivshmem-uio-driver_git.bb   | 27 ++++++++++++++++++++++
>>   2 files changed, 31 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
>>
>> diff --git a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> index 9e105b8..970e3e2 100644
>> --- a/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> +++ b/meta-arago-distro/conf/distro/include/arago-source-ipk.inc
>> @@ -374,6 +374,10 @@ SRCIPK_INSTALL_DIR_pn-hplib-mod = "board-support/extra-drivers/${PN}-${PV}"
>>   CREATE_SRCIPK_pn-uio-module-drv = "1"
>>   SRCIPK_INSTALL_DIR_pn-uio-module-drv = "board-support/extra-drivers/${PN}-${PV}"
>>   
>> +CREATE_SRCIPK_pn-ivshmem-uio-driver = "1"
>> +SRCIPK_INSTALL_DIR_pn-ivshmem-uio-driver = "board-support/extra-drivers/${PN}-${PV}"
>> +SRCIPK_PRESERVE_GIT_pn-ivshmem-uio-driver = "true"
>> +
>>   CREATE_SRCIPK_pn-ipsecmgr-mod = "1"
>>   SRCIPK_INSTALL_DIR_pn-ipsecmgr-mod = "board-support/extra-drivers/${PN}-${PV}"
> Can you split it up and send source-ipk part to meta-arago, while the recipe
> itself rather belongs to meta-ti.
Sure
>
>> diff --git a/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
>> new file mode 100644
>> index 0000000..f41842b
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-kernel/uio/ivshmem-uio-driver_git.bb
> meta-ti/recipes-bsp would probably be better place.
>
>
>> @@ -0,0 +1,27 @@
>> +DESCRIPTION =  "Kernel drivers IVSHMEM UIO driver"
> SUMMARY?
>
>
>> +HOMEPAGE = "https://github.com/henning-schild-work/ivshmem-guest-code"
>> +LICENSE = "GPLv2"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=0546a27aad86c83b75ad4ee6133e9d5e"
>> +
>> +inherit module
>> +
>> +RDEPENDS_${PN} = "jailhouse"
>> +
>> +PROTOCOL = "git"
>> +BRANCH = "jailhouse"
>> +SRCREV = "f3ad79881bebb6c6068966ee3d265d8034c20492"
>> +SRC_URI = "git://github.com/henning-schild-work/ivshmem-guest-code.git;protocol=${PROTOCOL};branch=${BRANCH}"
>> +
>> +S = "${WORKDIR}/git"
>> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> module.bbclass already package to be machine-specific automatically.
Got it.
>
>> +EXTRA_OEMAKE += 'KDIR="${STAGING_KERNEL_DIR}"'
>> +
>> +do_compile_prepend() {
>> +    cd ${S}/kernel_module/uio
>> +}
>> +
>> +do_install() {
>> +    install -d ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
>> +    install -m 644 ${S}/kernel_module/uio/uio_ivshmem.ko ${D}/${base_libdir}/modules/${KERNEL_VERSION}/extra
>> +}
>> -- 
>> 1.9.1
>>
Thanks for review, will send a v2
Nikhil D

