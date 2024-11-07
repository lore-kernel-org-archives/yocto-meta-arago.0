Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E20A5D43377
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 16:30:05 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.76421.1730996998868894160
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 07 Nov 2024 08:29:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JKO+1xMr;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: jm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A7GTt0Y002135;
	Thu, 7 Nov 2024 10:29:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730996995;
	bh=I0EZtkTpbWKayOwKmmXg8jNzmkzJVKrsNz3TKXoavjE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JKO+1xMrJo5KGxfHnvpo8Zk/HBxUunDXTttYm4+MqfoKirh6f7GoCslMIOAgHdoE0
	 NgXq+RU14cgsNV42ta1hEkX/HJzZ3KkgmBY7VLYuTd2hZqOwCtvfVHdC0gtdinkPJ1
	 C9Z4zy9c0hwf3jEeo31joAuGf+SYw8/5ISjFJwRw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7GTtrt099966;
	Thu, 7 Nov 2024 10:29:55 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 7
 Nov 2024 10:29:54 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 7 Nov 2024 10:29:54 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A7GTs47049585;
	Thu, 7 Nov 2024 10:29:54 -0600
Message-ID: <29cb6c7c-5bb6-4231-8eb0-34b2f7a747f9@ti.com>
Date: Thu, 7 Nov 2024 10:29:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/kirkstone/scarthgap][PATCH]
 ti-test: Add hwspinlocktest
To: Chirag Shilwant <c-shilwant@ti.com>, <afd@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>,
        Denys
 Dmytriyenko <denys@konsulko.com>, Randolph Sapp <rs@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>
References: <20241101222330.1900615-1-jm@ti.com>
 <c8152810-3749-4f7e-81a2-1479dd3834f9@ti.com>
 <20241106185136.GN20070@denix.org>
 <a672632f-6bf0-49b5-85b2-2145527ea001@ti.com>
 <d74b764d-6a89-4628-9dd9-0927ff0766b2@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <d74b764d-6a89-4628-9dd9-0927ff0766b2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 4A7GTt0Y002135
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 07 Nov 2024 16:30:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15600

Hi all,

On 11/6/24 10:31 PM, Chirag Shilwant wrote:
> Hi,
> On 07/11/24 01:25, Andrew Davis via lists.yoctoproject.org wrote:
>> On 11/6/24 12:=E2=80=8A51 PM, Denys Dmytriyenko wrote: > On Wed, Nov 0=
6, 2024=20
>> at 12:=E2=80=8A38:=E2=80=8A22PM -0600, Andrew Davis via lists.=E2=80=8A=
yoctoproject.=E2=80=8Aorg=20
>> wrote: >> On 11/1/24 5:=E2=80=8A23 PM, Mendez, Judith via lists.=E2=80=
=8Ayoctoproject.=20
>> =E2=80=8Aorg wrote: >>> Add hwspinlock
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdgPddvNq17YMXE=
9plD3zTLKnyJbVe1FodO6EjXrOaXkmYyXRGdlH8ZSsFNdu-TFl7WbSmHAk_5B3rrQaunEaKBs=
GI$>
>> ZjQcmQRYFpfptBannerEnd
>> On 11/6/24 12:51 PM, Denys Dmytriyenko wrote:
>> > On Wed, Nov 06, 2024 at 12:38:22PM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>> >> On 11/1/24 5:23 PM, Mendez, Judith via lists.yoctoproject.org wrote=
:
>> >>> Add hwspinlock recipe to build out of tree module hwspinlock test.
>> >>>
>> >>> Signed-off-by: Judith Mendez <jm@ti.com>
>> >>> ---
>> >>>=C2=A0=C2=A0 .../recipes-core/packagegroups/ti-test.bb=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 1 +
>> >>>=C2=A0=C2=A0 .../hwspinlocktest/files/LICENSE=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 29 ++
>> >>>=C2=A0=C2=A0 .../hwspinlocktest/files/Makefile=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 19 ++
>> >>>=C2=A0=C2=A0 .../files/omap_hwspinlock_test.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 251=20
>> ++++++++++++++++++
>> >>
>> >> Why are we adding the entire source of this project into=20
>> meta-arago? Is this
>> >> not the upstream:=20
>> https://urldefense.com/v3/__https://github.com/sumananna/omap-hwspinlo=
ck-test__;!!G3vK!WVH4EBhOyWaCKM4e8c1enaXqXi1veX83MJeCPbdmMBnPnQ9I204_9Lt6=
7eVQDP0pvUGsDcd6IPErmS7jF38gQ3nOrODt$=C2=A0 ?
>> >>
>> >> You should point to that and fetch from there like normal recipes.
>> > > FYI, this has been asked and answered already:
>> >=20
>> https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-arag=
o/topic/109054399*msg15583__;Iw!!G3vK!WVH4EBhOyWaCKM4e8c1enaXqXi1veX83MJe=
CPbdmMBnPnQ9I204_9Lt67eVQDP0pvUGsDcd6IPErmS7jF38gQ72NHmnf$
>> >
>> Ah, didn't see any hint to this not being the first version of this=20
>> series..
>>
>> Copying the answer here to respond inline,
>=20
>=20
>=20
> Thanks for doing that. Will use this thread to respond.
>=20
>=20
>>
>> > Apparently we do not want to pull from personal repos
>>
>> Since when? We do that for lots of recipes.
>>
>> > there is a JIRA req to move
>> > the repo to ti.com, but the target date is for 11.0. Since we
>> > want to add the test asap, the idea is to add to yocto and update
>> > the recipe later when the repo has been moved.
>>
>> If you really want to use a ti.com based source repo, then do that fir=
st.
>> If setting up the repo clone is not a priority, then this test can't=20
>> be that
>> important either. Do this in the right order. Copying the whole source
>> into the layer is hacky.
>=20
>=20
>=20
> I agree to Andrew's suggestion (that's the reason I had raised the same=
=20
> question).
> Also, I don't see any harm in using personal repositories as long
> as the LICENSE file seems fine.
>=20
> Till ti.com movement happens, we can use the existing repository on Git=
Hub
>=20

There seems to be a misalignment on whether we should be using
personal repos or not, perhaps we should pull Ryan and Praneeth
to this discussion.

I will wait until everyone aligns on this and then processeed to
send v2 if required.

~ Judith

>>
>> > >>>=C2=A0=C2=A0 .../hwspinlocktest/hwspinlocktest_0.1.bb=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 18 ++
>> >>>=C2=A0=C2=A0 5 files changed, 318 insertions(+)
>> >>>=C2=A0=C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>> >>>=C2=A0=C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>> >>>=C2=A0=C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_te=
st.c
>> >>>=C2=A0=C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> >>>
>> >>> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb=
=20
>> b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> >>> index 85398eaf..98fd0f56 100644
>> >>> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> >>> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
>> >>> @@ -18,6 +18,7 @@ TI_TEST_BASE =3D "\
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 evtest \
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fio \
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git \
>> >>> +=C2=A0=C2=A0=C2=A0 hwspinlocktest \
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hdparm \
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i2c-tools \
>> >>>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iozone3 \
>> >>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>> >>> new file mode 100644
>> >>> index 00000000..f5351a25
>> >>> --- /dev/null
>> >>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/LICENSE
>> >>> @@ -0,0 +1,29 @@
>> >>> +BSD 3-Clause License
>> >>> +
>> >>> +Copyright (c) 2019, Suman Anna
>> >>> +All rights reserved.
>> >>> +
>> >>> +Redistribution and use in source and binary forms, with or withou=
t
>> >>> +modification, are permitted provided that the following=20
>> conditions are met:
>> >>> +
>> >>> +1. Redistributions of source code must retain the above copyright=
=20
>> notice, this
>> >>> +=C2=A0=C2=A0 list of conditions and the following disclaimer.
>> >>> +
>> >>> +2. Redistributions in binary form must reproduce the above=20
>> copyright notice,
>> >>> +=C2=A0=C2=A0 this list of conditions and the following disclaimer=
 in the=20
>> documentation
>> >>> +=C2=A0=C2=A0 and/or other materials provided with the distributio=
n.
>> >>> +
>> >>> +3. Neither the name of the copyright holder nor the names of its
>> >>> +=C2=A0=C2=A0 contributors may be used to endorse or promote produ=
cts=20
>> derived from
>> >>> +=C2=A0=C2=A0 this software without specific prior written permiss=
ion.
>> >>> +
>> >>> +THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND=20
>> CONTRIBUTORS "AS IS"
>> >>> +AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED=
=20
>> TO, THE
>> >>> +IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A=20
>> PARTICULAR PURPOSE ARE
>> >>> +DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR=20
>> CONTRIBUTORS BE LIABLE
>> >>> +FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR=20
>> CONSEQUENTIAL
>> >>> +DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE=
=20
>> GOODS OR
>> >>> +SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS=20
>> INTERRUPTION) HOWEVER
>> >>> +CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,=20
>> STRICT LIABILITY,
>> >>> +OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY=20
>> OUT OF THE USE
>> >>> +OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMA=
GE.
>> >>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>> >>> new file mode 100644
>> >>> index 00000000..d8fe76dc
>> >>> --- /dev/null
>> >>> +++ b/meta-arago-test/recipes-kernel/hwspinlocktest/files/Makefile
>> >>> @@ -0,0 +1,19 @@
>> >>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> >>> +#
>> >>> +# TI OMAP HwSpinlock Unit Test
>> >>> +#
>> >>> +
>> >>> +obj-m :=3D omap_hwspinlock_test.o
>> >>> +
>> >>> +SRC :=3D $(shell pwd)
>> >>> +
>> >>> +all:
>> >>> +=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SRC)
>> >>> +
>> >>> +modules_install:
>> >>> +=C2=A0=C2=A0=C2=A0 $(MAKE) -C $(KERNEL_SRC) M=3D$(SRC) modules_in=
stall
>> >>> +
>> >>> +clean:
>> >>> +=C2=A0=C2=A0=C2=A0 rm -f *.o *~ core .depend .*.cmd *.ko *.mod.c
>> >>> +=C2=A0=C2=A0=C2=A0 rm -f Module.markers Module.symvers modules.or=
der
>> >>> +=C2=A0=C2=A0=C2=A0 rm -rf .tmp_versions Modules.symvers
>> >>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_=
test.c b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinl=
ock_test.c
>> >>> new file mode 100644
>> >>> index 00000000..b1801389
>> >>> --- /dev/null
>> >>> +++=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/files/omap_hwspinlock_=
test.c
>> >>> @@ -0,0 +1,251 @@
>> >>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> >>> +/*
>> >>> + * OMAP hardware spinlock test driver
>> >>> + *
>> >>> + * Copyright (C) 2014-2021 Texas Instruments Incorporated -=20
>> https://www.ti.com
>> >>> + *=C2=A0=C2=A0=C2=A0 Suman Anna <s-anna@ti.com>
>> >>> + */
>> >>> +
>> >>> +#include <linux/kernel.h>
>> >>> +#include <linux/module.h>
>> >>> +#include <linux/init.h>
>> >>> +#include <linux/err.h>
>> >>> +#include <linux/sched.h>
>> >>> +#include <linux/platform_device.h>
>> >>> +#include <linux/of.h>
>> >>> +#include <linux/of_device.h>
>> >>> +
>> >>> +#include <linux/hwspinlock.h>
>> >>> +
>> >>> +/* load-time options */
>> >>> +static int count =3D 2;
>> >>> +module_param(count, int, 0444);
>> >>> +
>> >>> +struct hwspinlock_data {
>> >>> +=C2=A0=C2=A0=C2=A0 const char *compatible;
>> >>> +=C2=A0=C2=A0=C2=A0 const unsigned int max_locks;
>> >>> +};
>> >>> +
>> >>> +static int hwspin_lock_test(struct hwspinlock *hwlock)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 int i;
>> >>> +=C2=A0=C2=A0=C2=A0 int ret;
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\nTesting lock %d\n", hwspin_lock_get_=
id(hwlock));
>> >>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < count; i++) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hwspin_trylock=
(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("%s: Initial lock failed\n", __func__);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -EFAULT;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("trylock #1 sta=
tus[%d] =3D %d\n", i, ret);
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Verify lock actuall=
y works - re-acquiring it should=20
>> fail */
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hwspin_trylock=
(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("trylock #2 sta=
tus[%d] =3D %d\n", i, ret);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!ret) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 /* Keep locks balanced even in failure cases */
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hwspin_unlock(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 hwspin_unlock(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("%s: Recursive lock succeeded unexpectedly\n",
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __func__);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -EFAULT;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Verify unlock by re=
-acquiring the lock after releasing=20
>> it */
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_unlock(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D hwspin_trylock=
(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("trylock after =
unlock status[%d] =3D %d\n", i, ret);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("%s: Unlock failed\n", __func__);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 return -EINVAL;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_unlock(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 return 0;
>> >>> +}
>> >>> +
>> >>> +static int hwspin_lock_test_all_locks(unsigned int max_locks)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 int i;
>> >>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0, ret1 =3D 0;
>> >>> +=C2=A0=C2=A0=C2=A0 struct hwspinlock *hwlock =3D NULL;
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("Testing %d locks\n", max_locks);
>> >>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < max_locks; i++) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwlock =3D hwspin_lock=
_request_specific(i);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hwlock) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("request lock %d failed\n", i);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D -EIO;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_t=
est(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("hwspinlock tests failed on lock %d\n", i);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D ret1;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 goto free_lock;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +free_lock:
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_f=
ree(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("hwspin_lock_free failed on lock %d\n", i);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D ret1;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 return ret;
>> >>> +}
>> >>> +
>> >>> +static const struct of_device_id omap_hwspinlock_test_of_match[] =
=3D {
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,omap-hwspinlock-test",=C2=
=A0=C2=A0 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,omap4-hwspinlock-test",=C2=
=A0 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,omap5-hwspinlock-test",=C2=
=A0 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,dra7-hwspinlock-test",=C2=
=A0=C2=A0 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,am33xx-hwspinlock-test",=
 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,am43xx-hwspinlock-test",=
 },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,am654-hwspinlock-test",=C2=
=A0 },
>> >>> +=C2=A0=C2=A0=C2=A0 { /* end */ },
>> >>> +};
>> >>> +
>> >>> +static int hwspin_lock_test_all_phandle_locks(unsigned int=20
>> max_locks)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 struct device_node *np =3D NULL;
>> >>> +=C2=A0=C2=A0=C2=A0 struct hwspinlock *hwlock =3D NULL;
>> >>> +=C2=A0=C2=A0=C2=A0 int ret =3D 0, ret1 =3D 0;
>> >>> +=C2=A0=C2=A0=C2=A0 unsigned int i;
>> >>> +=C2=A0=C2=A0=C2=A0 int num_locks;
>> >>> +=C2=A0=C2=A0=C2=A0 int hwlock_id;
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 np =3D of_find_matching_node_and_match(NULL,
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 omap_hwspinlock_test_of_match,
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULL);
>> >>> +=C2=A0=C2=A0=C2=A0 if (!np) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("\nNo test node=
 provided\n");
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 num_locks =3D of_count_phandle_with_args(np, "=
hwlocks",=20
>> "#hwlock-cells");
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("Number of phandles =3D %d max_locks =3D=
 %d\n",
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 num_=
locks, max_locks);
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 for (i =3D 0; i < num_locks; i++) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwlock_id =3D of_hwspi=
n_lock_get_id(np, i);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hwlock_id < 0) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("unable to get hwlock_id : %d\n", hwlock_id);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D -EINVAL;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwlock =3D hwspin_lock=
_request_specific(hwlock_id);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!hwlock) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("unable to get hwlock\n");
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D -EINVAL;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 continue;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_t=
est(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("hwspinlock test failed on DT lock %d, ret =3D=20
>> %d\n",
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_lock_get_id(hwlock), re=
t1);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D ret1;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret1 =3D hwspin_lock_f=
ree(hwlock);
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret1) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 pr_err("hwspin_lock_free failed on lock %d\n",
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hwspin_lock_get_id(hwlock));
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ret =3D ret1;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 return ret;
>> >>> +}
>> >>> +
>> >>> +static
>> >>> +unsigned int omap_hwspinlock_get_locks(const struct=20
>> hwspinlock_data *data)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 unsigned int locks =3D 0;
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 while (data->compatible) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (of_machine_is_comp=
atible(data->compatible)) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 locks =3D data->max_locks;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 break;
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data++;
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 return locks;
>> >>> +}
>> >>> +
>> >>> +static const struct of_device_id omap_hwspinlock_of_match[] =3D {
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,omap4-hwspinlock", },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,am654-hwspinlock", },
>> >>> +=C2=A0=C2=A0=C2=A0 { .compatible =3D "ti,am64-hwspinlock",=C2=A0 =
},
>> >>> +=C2=A0=C2=A0=C2=A0 { /* end */ },
>> >>> +};
>> >>> +
>> >>> +static const struct hwspinlock_data soc_data[] =3D {
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,omap4",=C2=A0=C2=A0=C2=A0 32, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,omap5",=C2=A0=C2=A0=C2=A0 32, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,dra7",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,am33xx",=C2=A0=C2=A0=C2=A0 128, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,am43",=C2=A0=C2=A0=C2=A0 128, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,am654",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,j721e",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,j7200",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,am642",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { "ti,j721s2",=C2=A0=C2=A0=C2=A0 256, },
>> >>> +=C2=A0=C2=A0=C2=A0 { /* sentinel */ },
>> >>> +};
>> >>> +
>> >>> +static int omap_hwspinlock_test_init(void)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 struct device_node *np;
>> >>> +=C2=A0=C2=A0=C2=A0 unsigned int max_locks;
>> >>> +=C2=A0=C2=A0=C2=A0 int ret;
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n** HwSpinLock Unit Test Module initi=
ated **\n");
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 max_locks =3D omap_hwspinlock_get_locks(soc_da=
ta);
>> >>> +=C2=A0=C2=A0=C2=A0 if (!max_locks) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("\nNot a compat=
ible platform\n");
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 np =3D of_find_matching_node_and_match(NULL,=20
>> omap_hwspinlock_of_match,
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 NULL);
>> >>> +=C2=A0=C2=A0=C2=A0 if (!np || !of_device_is_available(np)) {
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("\nNo HwSpinloc=
k node provided/enabled\n");
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENODEV;
>> >>> +=C2=A0=C2=A0=C2=A0 }
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n***** Begin - Test All Locks ****\n"=
);
>> >>> +=C2=A0=C2=A0=C2=A0 ret =3D hwspin_lock_test_all_locks(max_locks);
>> >>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("hwspin_lock_te=
st_all_locks failed, ret =3D %d\n",=20
>> ret);
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n***** End - Test All Locks ****\n");
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n***** Begin - Test All pHandle Locks=
 ****\n");
>> >>> +=C2=A0=C2=A0=C2=A0 ret =3D hwspin_lock_test_all_phandle_locks(max=
_locks);
>> >>> +=C2=A0=C2=A0=C2=A0 if (ret)
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pr_err("hwspin_lock_te=
st_all_locks failed, ret =3D %d\n",=20
>> ret);
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n***** End - Test All pHandle Locks *=
***\n");
>> >>> +
>> >>> +=C2=A0=C2=A0=C2=A0 return 0;
>> >>> +}
>> >>> +
>> >>> +static void omap_hwspinlock_test_exit(void)
>> >>> +{
>> >>> +=C2=A0=C2=A0=C2=A0 pr_err("\n** HwSpinLock Unit Test Module finis=
hed **\n");
>> >>> +}
>> >>> +
>> >>> +module_init(omap_hwspinlock_test_init);
>> >>> +module_exit(omap_hwspinlock_test_exit);
>> >>> +
>> >>> +MODULE_LICENSE("Dual BSD/GPL");
>> >>> +MODULE_DESCRIPTION("Hardware spinlock Test driver for TI SoCs");
>> >>> +MODULE_AUTHOR("Suman Anna <s-anna@ti.com>");
>> >>> diff --git=20
>> a/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> >>> new file mode 100644
>> >>> index 00000000..2edd93f6
>> >>> --- /dev/null
>> >>> +++=20
>> b/meta-arago-test/recipes-kernel/hwspinlocktest/hwspinlocktest_0.1.bb
>> >>> @@ -0,0 +1,18 @@
>> >>> +SUMMARY =3D "Build hwspinlock test as an external Linux kernel mo=
dule"
>> >>> +DESCRIPTION =3D "${SUMMARY}"
>> >>> +LICENSE =3D "GPL-2.0-only | BSD-3-Clause"
>> >>> +LIC_FILES_CHKSUM =3D=20
>> "file://LICENSE;md5=3Dbfa02c83df161e37647ee23a2c7eacd4"
>> >>> +
>> >>> +inherit module
>> >>> +
>> >>> +SRC_URI =3D "file://Makefile \
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://omap_hwspinlock_test.c \
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://LICENSE \
>> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>> >>> +
>> >>> +S =3D "${WORKDIR}"
>> >>> +
>> >>> +# The inherit of module.bbclass will automatically name module=20
>> packages with
>> >>> +# "kernel-module-" prefix as required by the oe-core build=20
>> environment.
>> >>> +
>> >>> +RPROVIDES:${PN} +=3D "kernel-module-hwspinlocktest"
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online=20
>> (#15598):https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-arago/message/15598__;!!G3vK!WVH4EBhOyWaCKM4e8c1enaXqXi1veX83MJeCPbd=
mMBnPnQ9I204_9Lt67eVQDP0pvUGsDcd6IPErmS7jF38gQ6aPeilQ$
>> Mute This=20
>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10=
9343942/7030289__;!!G3vK!WVH4EBhOyWaCKM4e8c1enaXqXi1veX83MJeCPbdmMBnPnQ9I=
204_9Lt67eVQDP0pvUGsDcd6IPErmS7jF38gQwXxQfIh$
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-arago/unsub__;!!G3vK!WVH4EBhOyWaCKM4e8c1enaXqXi1veX83MJeCPbdmMBnP=
nQ9I204_9Lt67eVQDP0pvUGsDcd6IPErmS7jF38gQ-U0q6v0$=C2=A0 [c-shilwant@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>


