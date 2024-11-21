Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE40E6400C
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 19:35:50 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.7384.1732217745469699277
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 11:35:45 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=uX0hdgAu;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4ALJZiTW076814;
	Thu, 21 Nov 2024 13:35:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732217744;
	bh=tApsx1DBVACBIOsR9hRtXOlBZ5BCQPkyVMctqkCWcU0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=uX0hdgAuzucui9I6GNu4XcjyrmjVi2Y2rvh8XeiT8ioxyiwJQYxf5CuLWOT2BhdUS
	 zC8Bx1zULeXodcJbkcaaeEeSQpwVkk8DsCbrla/8In86d52OdfXl5pV48wJ5RT1xGY
	 kdfVaL2xMfi00Sm2jkIjP+eXbMIzpRrtqGtu3BCA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ALJZi1j021089
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Nov 2024 13:35:44 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 21
 Nov 2024 13:35:43 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 21 Nov 2024 13:35:43 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ALJZhfG013911;
	Thu, 21 Nov 2024 13:35:43 -0600
Message-ID: <f3a8ea2a-b49c-43a7-9685-42bc96855ef1@ti.com>
Date: Thu, 21 Nov 2024 13:35:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/kirkstone/scarthgap][PATCH RESEND v2] Add
 hwspinlocktest
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        Denys Dmytriyenko
	<denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
References: <20241119011723.3762206-1-jm@ti.com>
 <28e8573a-9615-4f82-88e0-6323d56f3a17@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <28e8573a-9615-4f82-88e0-6323d56f3a17@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4ALJZiTW076814
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 19:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15629

Hi Ryan,

On 11/21/24 9:29 AM, Ryan Eatmon wrote:
>=20
>=20
> On 11/18/2024 7:17 PM, Judith Mendez wrote:
>> Add hwspinlock recipe to build out of tree module hwspinlock test.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> Changes since v2:
>> - Add v2 to subject
>> Changes since v1:
>> - Change SRC_URI to pull from remote repo and add patches on top
>> ---
>> =C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 1 +
>> =C2=A0 .../0001-Add-support-for-AM62-SoCs.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 31 +++++++++++++
>> =C2=A0 ...Fix-Makefile-for-to-build-with-yocto.patch | 46 ++++++++++++=
+++++++
>> =C2=A0 .../hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 18 ++++++++
>> =C2=A0 4 files changed, 96 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support-f=
or-AM62-SoCs.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefile-=
for-to-build-with-yocto.patch
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>>
>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=20
>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> index 695bed5c..91ebec44 100644
>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> @@ -17,6 +17,7 @@ TI_TEST_BASE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>> +=C2=A0=C2=A0=C2=A0 hwspinlocktest \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-tools \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iozone3 \
>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support=
-for-AM62-SoCs.patch b/meta-arago-test/recipes-kernel/hwspinlocktest/file=
s/0001-Add-support-for-AM62-SoCs.patch
>> new file mode 100644
>> index 00000000..b2b99814
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Add-support=
-for-AM62-SoCs.patch
>> @@ -0,0 +1,31 @@
>> +From 2d8d169898fb6615dd5100c4ac4e307c54678153 Mon Sep 17 00:00:00 200=
1
>> +From: Judith Mendez <jm@ti.com>
>> +Date: Mon, 18 Nov 2024 14:57:45 -0600
>> +Subject: [PATCH] Add support for AM62* SoCs
>> +
>> +The K3 AM62* SoCs have a hwspinlock IP in MAIN domain.
>> +Extend the test to add the desired SoC compatible so that
>> +the test can be exercised on these new SoC families.
>> +
>=20
> Both of the patches need an Upstream-Status entry to tell maintainers=20
> what the disposition of the patch is.
>=20
> Add this to both:
>=20
> Upstream-Status: Inactive-Upstream [private repo]
>=20

Sure I can add, thanks.

~ Judith
>=20
>=20
>=20
>> +Signed-off-by: Judith Mendez <jm@ti.
>=20
> com>
>> +---
>> + omap_hwspinlock_test.c | 3 +++
>> + 1 file changed, 3 insertions(+)
>> +
>> +diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
>> +index b180138..46fcc08 100644
>> +--- a/omap_hwspinlock_test.c
>> ++++ b/omap_hwspinlock_test.c
>> +@@ -199,6 +199,9 @@ static const struct hwspinlock_data soc_data[] =3D=
 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0 { "ti,j7200",=C2=A0=C2=A0=C2=A0 256, },
>> +=C2=A0=C2=A0=C2=A0=C2=A0 { "ti,am642",=C2=A0=C2=A0=C2=A0 256, },
>> +=C2=A0=C2=A0=C2=A0=C2=A0 { "ti,j721s2",=C2=A0=C2=A0=C2=A0 256, },
>> ++=C2=A0=C2=A0=C2=A0 { "ti,am625",=C2=A0=C2=A0=C2=A0 256, },
>> ++=C2=A0=C2=A0=C2=A0 { "ti,am62a7",=C2=A0=C2=A0=C2=A0 256, },
>> ++=C2=A0=C2=A0=C2=A0 { "ti,am62p5",=C2=A0=C2=A0=C2=A0 256, },
>> +=C2=A0=C2=A0=C2=A0=C2=A0 { /* sentinel */ },
>> + };
>> +
>> +--
>> +2.47.0
>> +
>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefil=
e-for-to-build-with-yocto.patch b/meta-arago-test/recipes-kernel/hwspinlo=
cktest/files/0001-Fix-Makefile-for-to-build-with-yocto.patch
>> new file mode 100644
>> index 00000000..ac362b2c
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-Fix-Makefil=
e-for-to-build-with-yocto.patch
>> @@ -0,0 +1,46 @@
>> +From 3e1a3e3b9455f4cd40f7cc86a8eaff80206f77ce Mon Sep 17 00:00:00 200=
1
>> +From: Judith Mendez <jm@ti.com>
>> +Date: Mon, 18 Nov 2024 10:26:55 -0600
>> +Subject: [PATCH] Fix Makefile for to build with yocto
>> +
>> +Fix Makefile that builds hwspinlocktest out-of-tree-module
>> +for yocto recipie to be able to build the module.
>> +
>> +Signed-off-by: Judith Mendez <jm@ti.com>
>> +---
>> + Makefile | 18 ++++++++++--------
>> + 1 file changed, 10 insertions(+), 8 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index 23ee629..d8fe76d 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -3,15 +3,17 @@
>> + # TI OMAP HwSpinlock Unit Test
>> + #
>> +
>> +-obj-m =3D omap_hwspinlock_test.o
>> ++obj-m :=3D omap_hwspinlock_test.o
>> ++
>> ++SRC :=3D $(shell pwd)
>> +
>> + all:
>> +-ifeq ($(KERNELDIR),)
>> +-=C2=A0=C2=A0=C2=A0 @echo "Error: KERNELDIR not set, exiting..."
>> +-=C2=A0=C2=A0=C2=A0 @echo "Eg: make ARCH=3Darm CROSS_COMPILE=3Darm-li=
nux-gnueabihf-=20
>> KERNELDIR=3D<linux-kernel rootdir>"
>> +-=C2=A0=C2=A0=C2=A0 @exit 1
>> +-endif
>> +-=C2=A0=C2=A0=C2=A0 make ${MAKE_OPTS} -C $(KERNELDIR) M=3D$(PWD) modu=
les
>> ++=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
>> ++
>> ++modules_install:
>> ++=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_insta=
ll
>> +
>> + clean:
>> +-=C2=A0=C2=A0=C2=A0 $(RM) -r *.o *.ko *.mod* *.dwo .*.dwo .*.cmd *.sy=
mvers=20
>> modules.order
>> ++=C2=A0=C2=A0=C2=A0 rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
>> ++=C2=A0=C2=A0=C2=A0 rm -f Module.markers Module.symvers modules.order
>> ++=C2=A0=C2=A0=C2=A0 rm -rf .tmp_versions Modules.symvers
>> +--
>> +2.47.0
>> +
>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> new file mode 100644
>> index 00000000..6de7bbb5
>> --- /dev/null
>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1=
.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY =3D "Build hwspinlock test as an external Linux kernel module=
"
>> +DESCRIPTION =3D "${SUMMARY}"
>> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://${WORKDIR}/git/LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7eacd4"
>> +
>> +inherit module
>> +
>> +SRC_URI =3D=20
>> "git://github.com/sumananna/omap-hwspinlock-test;protocol=3Dhttps;bran=
ch=3Dmaster \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-Fix-Makefile-for-to-build-with-yocto.patch \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-Add-support-for-AM62-SoCs.patch "
>> +SRCREV =3D "20f15e79a3a0197e06328c252d23aec225de21ed"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +# The inherit of module.bbclass will automatically name module=20
>> packages with
>> +# "kernel-module-" prefix as required by the oe-core build environmen=
t.
>> +
>> +RPROVIDES:${PN} +=3D "kernel-module-hwspinlocktest"
>=20


