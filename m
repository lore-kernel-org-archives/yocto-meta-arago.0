Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 185D4C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 14:04:35 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15869.1678197867581014758
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 06:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=DqkCX0GL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 327E4Naq087559;
	Tue, 7 Mar 2023 08:04:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678197863;
	bh=j5MY63zCU2u2euQ0iCmfn6x3MqBa02RZBcrUbuoK1RM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=DqkCX0GLpiWx3Lpc1z4c68YychSU7tFRJQ6PxCkty+vyBYoJfJWF9ZW//DtxdsbUg
	 sIUpAgbCZ+pXjn0ZBUrBxpNaHcfBTrME+1RjAdo4Yq5pjA0IWot5vPZRkqBB1frUsa
	 QC3BPR5wBt4SWa1QviR9+kxrkPuPS0RwC3j/75Zw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 327E4N1A095947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Mar 2023 08:04:23 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Mar 2023 08:04:23 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Mar 2023 08:04:23 -0600
Received: from [10.249.33.79] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 327E4Ms3099231;
	Tue, 7 Mar 2023 08:04:23 -0600
Message-ID: <3b02b958-3584-adc7-351f-5c54fb13ed08@ti.com>
Date: Tue, 7 Mar 2023 08:04:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [meta-arago] [master/kirkstone][PATCH] all: unbreak populate_sdk
 task (again)
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
References: <17474F7B5189B28F.29542@lists.yoctoproject.org>
 <20230306210233.GV22689@denix.org>
 <1749F28D254109F2.1452@lists.yoctoproject.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <1749F28D254109F2.1452@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 327E4Naq087559
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 07 Mar 2023 14:04:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14253


Merged in.


On 3/6/2023 15:43, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
> Checking now.
>=20
>=20
> On 3/6/2023 15:02, Denys Dmytriyenko wrote:
>> Ping.
>>
>>
>> On Sun, Feb 26, 2023 at 07:32:51AM +0000, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Being able to run populate_sdk task against minimal and base images
>>> has always been supported by Arago, though needed to get fixed once
>>> in a while, e.g.:
>>> https://git.yoctoproject.org/meta-arago/commit/?id=3Dd47710c8219e036c=
b7005bc0a22099e63c5e1901
>>>
>>> This time around the issue is due to upstream packages lmbench and
>>> mbedtls both installing /usr/bin/hello binary and causing a conflict
>>> when the files collide in the sysroot.
>>>
>>> The fix has been submitted upstream to meta-oe and meta-networking
>>> layers of the meta-openembedded repo:
>>> https://patchwork.yoctoproject.org/project/oe/list/?series=3D10748
>>>
>>> For now add local bbappends with the same fix, which can be removed
>>> when the fix is merged upstream and backported to kirkstone.
>>>
>>> While at it, also look into the conflict caused by matrix launcher
>>> packaging function being reused by multiple subpackages, resulting
>>> in lots of file conflicts between them. There's a lot of rework
>>> required for the matrix (and it might get moved to another layer
>>> altogether), but for now just cutoff the reverse dependency from
>>> development -dev packages.
>>>
>>> With this simple change it is now possible to run populate_sdk task
>>> even against the default full/graphics tisdk-default-image.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>> =C2=A0 .../recipes-benchmark/lmbench/lmbench_%.bbappend=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 ++
>>> =C2=A0 .../recipes-connectivity/mbedtls/mbedtls_%.bbappend=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 4 ++++
>>> =C2=A0 meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc=C2=A0=
=C2=A0=C2=A0=C2=A0 | 3 +++
>>> =C2=A0 3 files changed, 9 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>>> =C2=A0 create mode 100644=20
>>> meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
>>>
>>> diff --git=20
>>> a/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend=20
>>> b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>>> new file mode 100644
>>> index 00000000..96dd2010
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-benchmark/lmbench/lmbench_%.bbappend
>>> @@ -0,0 +1,2 @@
>>> +ALTERNATIVE:${PN} +=3D "hello"
>>> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
>>> diff --git=20
>>> a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend=20
>>> b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
>>> new file mode 100644
>>> index 00000000..f3c16796
>>> --- /dev/null
>>> +++ b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappe=
nd
>>> @@ -0,0 +1,4 @@
>>> +inherit update-alternatives
>>> +
>>> +ALTERNATIVE:${PN}-programs +=3D "hello"
>>> +ALTERNATIVE_LINK_NAME[hello] =3D "${bindir}/hello"
>>> diff --git=20
>>> a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc=20
>>> b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>>> index 2bcc908b..adb998e1 100644
>>> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps.inc
>>> @@ -38,3 +38,6 @@ do_install:append(){
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # other appends.
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd -
>>> =C2=A0 }
>>> +
>>> +RDEPENDS:${PN}-dev =3D ""
>>> +RRECOMMENDS:${PN}-dev =3D ""
>>> --=20
>>> 2.25.1
>>
>>
>>
>>
>>
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

