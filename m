Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA314CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 21:18:03 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.84.1757711881376185781
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 14:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=oLNfjJSM;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: jm@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58CLHwX71050845;
	Fri, 12 Sep 2025 16:17:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757711878;
	bh=4jHh8vL6eDOaqECSd9d2EW+HFI27sYU20hw0NrgNQ7I=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oLNfjJSMRGmgkyTw3ppRHQ7icvTDcgvlnGn7HV7DV0Xjk8wuB1na/IgBGOSq1vyeV
	 C1HhxQQZRfcGF52BRjkVsQJJdgMLDAiFC4ohtQT4pszO994FW+lgW6Q94m2GjLApXX
	 2e98c8XNhqwkZ7En2Z7iOQDUS4y8XjEgC9N6Bc8Y=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58CLHw2F1573387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 12 Sep 2025 16:17:58 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 12
 Sep 2025 16:17:58 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 12 Sep 2025 16:17:58 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58CLHwkJ306337;
	Fri, 12 Sep 2025 16:17:58 -0500
Message-ID: <3dc9270a-7ab7-4f93-9145-3fe5ec07bb7e@ti.com>
Date: Fri, 12 Sep 2025 16:17:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [master/scarthgap][PATCH v2] hwspinlocktest: Update hwspinlock
 recipe remote repo url
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>,
        Chirag Shilwant <c-shilwant@ti.com>
References: <20250912181407.2647500-1-jm@ti.com>
 <7ef8dc36-9edc-49ce-accc-cafaa8d928a7@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <7ef8dc36-9edc-49ce-accc-cafaa8d928a7@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 58CLHwX71050845
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Sep 2025 21:18:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16578

Hi Ryan,

On 9/12/25 3:57 PM, Ryan Eatmon wrote:
>=20
> This patch does not apply to scarthgap.=C2=A0 Kudos for developing it a=
gainst=20
> master!=C2=A0 Master introduced a number of new requirements that scart=
hgap=20
> does not support so the recipes have diverged.
>=20
> Can you spin new version for scarthgap only.=C2=A0 This patch is fine f=
or the=20
> master patch.

Sure, will send v3 for scarthgap only, thanks.

~ Judith

>=20
>=20
> On 9/12/2025 1:14 PM, Judith Mendez wrote:
>> The hwspinlock module is now moved to git.ti.com. A new
>> fork has been created and support added for am62*/j722s platforms.
>>
>> Migrate to new forked repo and remove patches that have already been
>> integrated to master.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> =C2=A0 ...test-Remove-hwspin_lock_get_id-calls.patch | 69 ------------=
-------
>> =C2=A0 .../0002-Add-support-for-AM62-SoCs.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 31 ---------
>> =C2=A0 .../hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 6 +-
>> =C2=A0 3 files changed, 2 insertions(+), 104 deletions(-)
>> =C2=A0 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktes=
t/=20
>> files/0001-omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
>> =C2=A0 delete mode 100644 meta-arago-test/recipes-kernel/hwspinlocktes=
t/=20
>> files/0002-Add-support-for-AM62-SoCs.patch
>>
>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-=
=20
>> omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch b/meta-=20
>> arago-test/recipes-kernel/hwspinlocktest/files/0001-=20
>> omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
>> deleted file mode 100644
>> index d4448397..00000000
>> --- a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0001-=20
>> omap_hwspinlock_test-Remove-hwspin_lock_get_id-calls.patch
>> +++ /dev/null
>> @@ -1,69 +0,0 @@
>> -From fb986ed355cd488da64da9eb94d0f260bb329d5b Mon Sep 17 00:00:00 200=
1
>> -From: Ryan Eatmon <reatmon@ti.com>
>> -Date: Fri, 11 Apr 2025 13:49:11 -0500
>> -Subject: [PATCH] omap_hwspinlock_test: Remove hwspin_lock_get_id() ca=
lls
>> -
>> -The hwspin_lock_get_id() function was removed in the most recent
>> -kernel [1].=C2=A0 We can safely stop using this function even for old=
er=20
>> kernels,
>> -so go ahead and take these changes.
>> -
>> -[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=20
>> next.git/commit/?id=3Dfec04edb74126f21ac628c7be763c97deb49f69d
>> -
>> -Upstream-Status: Inactive-Upstream [private repo]
>> -
>> -Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ----
>> - omap_hwspinlock_test.c | 12 ++++++------
>> - 1 file changed, 6 insertions(+), 6 deletions(-)
>> -
>> -diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
>> -index b180138..f3e0912 100644
>> ---- a/omap_hwspinlock_test.c
>> -+++ b/omap_hwspinlock_test.c
>> -@@ -26,12 +26,12 @@ struct hwspinlock_data {
>> -=C2=A0=C2=A0=C2=A0 const unsigned int max_locks;
>> - };
>> -
>> --static int hwspin_lock_test(struct hwspinlock *hwlock)
>> -+static int hwspin_lock_test(struct hwspinlock *hwlock, int lock_num)
>> - {
>> -=C2=A0=C2=A0=C2=A0 int i;
>> -=C2=A0=C2=A0=C2=A0 int ret;
>> -
>> --=C2=A0=C2=A0=C2=A0 pr_err("\nTesting lock %d\n", hwspin_lock_get_id(=
hwlock));
>> -+=C2=A0=C2=A0=C2=A0 pr_err("\nTesting lock %d\n", lock_num);
>> -=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < count; i++) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hwspin_trylock(hwl=
ock);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> -@@ -82,7 +82,7 @@ static int hwspin_lock_test_all_locks(unsigned int=20
>> max_locks)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_test=
(hwlock);
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_test=
(hwlock, i);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("hwspinlock tests failed on lock %d\n", i);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D ret1;
>> -@@ -147,17 +147,17 @@ static int=20
>> hwspin_lock_test_all_phandle_locks(unsigned int max_locks)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_test=
(hwlock);
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_test=
(hwlock, i);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("hwspinlock test failed on DT lock %d, ret =3D %d\n",
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_lock_get_id(hwlock), ret1)=
;
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwlock_id, ret1);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D ret1;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_free(=
hwlock);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr=
_err("hwspin_lock_free failed on lock %d\n",
>> --=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_lock_get_id(hwlock));
>> -+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwlock_id);
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
t =3D ret1;
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> -=C2=A0=C2=A0=C2=A0 }
>> ---
>> -2.17.1
>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-=
=20
>> Add-support-for-AM62-SoCs.patch b/meta-arago-test/recipes-kernel/=20
>> hwspinlocktest/files/0002-Add-support-for-AM62-SoCs.patch
>> deleted file mode 100644
>> index 30d9886a..00000000
>> --- a/meta-arago-test/recipes-kernel/hwspinlocktest/files/0002-Add-=20
>> support-for-AM62-SoCs.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -From 5ea20dff1aba059cc49e11031f731a422f3fd114 Mon Sep 17 00:00:00 200=
1
>> -From: Judith Mendez <jm@ti.com>
>> -Date: Mon, 18 Nov 2024 14:57:45 -0600
>> -Subject: [PATCH 2/2] Add support for AM62* SoCs
>> -
>> -The K3 AM62* SoCs have a hwspinlock IP in MAIN domain.
>> -Extend the test to add the desired SoC compatible so that
>> -the test can be exercised on these new SoC families.
>> -
>> -Upstream-Status: Inactive-Upstream [private repo]
>> -Signed-off-by: Judith Mendez <jm@ti.com>
>> ----
>> - omap_hwspinlock_test.c | 3 +++
>> - 1 file changed, 3 insertions(+)
>> -
>> -diff --git a/omap_hwspinlock_test.c b/omap_hwspinlock_test.c
>> -index b180138..46fcc08 100644
>> ---- a/omap_hwspinlock_test.c
>> -+++ b/omap_hwspinlock_test.c
>> -@@ -199,6 +199,9 @@ static const struct hwspinlock_data soc_data[] =3D=
 {
>> -=C2=A0=C2=A0=C2=A0 { "ti,j7200",=C2=A0=C2=A0=C2=A0 256, },
>> -=C2=A0=C2=A0=C2=A0 { "ti,am642",=C2=A0=C2=A0=C2=A0 256, },
>> -=C2=A0=C2=A0=C2=A0 { "ti,j721s2",=C2=A0=C2=A0=C2=A0 256, },
>> -+=C2=A0=C2=A0=C2=A0 { "ti,am625",=C2=A0=C2=A0=C2=A0 256, },
>> -+=C2=A0=C2=A0=C2=A0 { "ti,am62a7",=C2=A0=C2=A0=C2=A0 256, },
>> -+=C2=A0=C2=A0=C2=A0 { "ti,am62p5",=C2=A0=C2=A0=C2=A0 256, },
>> -=C2=A0=C2=A0=C2=A0 { /* sentinel */ },
>> - };
>> -
>> ---
>> -2.47.0
>> diff --git a/meta-arago-test/recipes-kernel/hwspinlocktest/=20
>> hwspinlocktest_0.1.bb b/meta-arago-test/recipes-kernel/hwspinlocktest/=
=20
>> hwspinlocktest_0.1.bb
>> index 454f0131..61842ffb 100644
>> --- a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1=
.bb
>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1=
.bb
>> @@ -6,13 +6,11 @@ LIC_FILES_CHKSUM =3D "file://=20
>> LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7eacd4"
>> =C2=A0 inherit module
>> =C2=A0 SRC_URI =3D "\
>> -=C2=A0=C2=A0=C2=A0 git://github.com/sumananna/omap-hwspinlock-=20
>> test;protocol=3Dhttps;branch=3Dmaster \
>> +=C2=A0=C2=A0=C2=A0 git://github.com/TexasInstruments/omap-hwspinlock-=
=20
>> test;protocol=3Dhttps;branch=3Dmaster \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0001-Fix-Makefile-for-to-build-w=
ith-yocto.patch \
>> -=C2=A0=C2=A0=C2=A0 file://0002-Add-support-for-AM62-SoCs.patch \
>> -=C2=A0=C2=A0=C2=A0 file://0001-omap_hwspinlock_test-Remove-hwspin_loc=
k_get_id-=20
>> calls.patch \
>> =C2=A0 "
>> -SRCREV =3D "20f15e79a3a0197e06328c252d23aec225de21ed"
>> +SRCREV =3D "a8297c7a2ca9e127929095045228dd4761121d56"
>> =C2=A0 # The inherit of module.bbclass will automatically name module=20
>> packages with
>> =C2=A0 # "kernel-module-" prefix as required by the oe-core build envi=
ronment.
>=20


