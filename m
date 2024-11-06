Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A47D59F56
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 17:22:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.51478.1730913737660509087
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 09:22:17 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=WaoSFC6m;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6HMGHQ022543;
	Wed, 6 Nov 2024 11:22:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730913736;
	bh=d/WvQ+qp/JlAosxZz+Lm+fzFyeQq0gj/Vp2OX1hZfDI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WaoSFC6mFrLUoFVKcxnhScyU1JOBfwwUNtLkAQtSDkkVxtjB/cHRwg5URacMCMtNT
	 00DdaiE/yrelgPhREniQAu2/mchas7x47dJJOmC03nEceWMt4YYRGDMPpX7YW9gTJ5
	 vUrLq5GXPoiyi1JZMyajw3DwxwBSx7I2EGAazODI=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6HMGLv071064;
	Wed, 6 Nov 2024 11:22:16 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 11:22:16 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 11:22:16 -0600
Received: from [10.249.32.170] ([10.249.32.170])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6HMGr0047597;
	Wed, 6 Nov 2024 11:22:16 -0600
Message-ID: <ec32497d-e4ac-424a-b4d4-9ea73a7265a8@ti.com>
Date: Wed, 6 Nov 2024 11:22:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] kernel-selftest: Enable
 more tests
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20241011182713.14904-1-reatmon@ti.com>
 <915225e0-4000-41ff-81d7-8bb647ff113e@ti.com>
 <3de8598d-a144-4e8e-b255-f0938a2fa5c0@ti.com>
 <f54733df-d9b8-4ac8-bb13-77c7526eda3a@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <f54733df-d9b8-4ac8-bb13-77c7526eda3a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4A6HMGHQ022543
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Nov 2024 17:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15595



On 11/6/2024 11:10 AM, Chirag Shilwant wrote:
> Hi Ryan,
> On 14/10/24 20:38, Ryan Eatmon wrote:
>>
>>
>> On 10/14/2024 8:34 AM, Chirag Shilwant wrote:
>>> Hi Ryan,
>>> On 11/10/24 23:57, Ryan Eatmon via lists.yoctoproject.org wrote:
>>>> Our testing flow is looking to incorporate the kernel-selftests as a=
=20
>>>> test. Enable a large number of selected cases. This patch requires a=
=20
>>>> set of corrseponding patches on meta-openembeded in upstream:=20
>>>> [master] https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A=
//lists.=E2=80=8Aopenembedded.=20
>>>> =E2=80=8Aorg/g/openembedded-devel/message/112802__;!!G3vK!SR7zVae3hh=
FFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3=
a3gF3Y9CkRYUwtA$
>>>> ZjQcmQRYFpfptBannerStart
>>>> This message was sent from outside of Texas Instruments.
>>>> Do not click links or open attachments unless you recognize the=20
>>>> source of this email and know the content is safe.
>>>> Report=C2=A0Suspicious
>>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9k0bCi=
ZFPJNj_MlZpVwu06fq9NvXRpfEf2O5Vx8jNtMvuUY5nddhxJbS3K0P_MbX07TzwgpxLR4$>
>>>> ZjQcmQRYFpfptBannerEnd
>>>> Our testing flow is looking to incorporate the kernel-selftests as a
>>>> test.=C2=A0 Enable a large number of selected cases.
>>>>
>>>> This patch requires a set of corrseponding patches on meta-openembed=
ed
>>>> in upstream:
>>>>
>>>> [master]https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-devel/message/112802__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-f=
wFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CkRYUwtA$
>>>> [scarthgap]https://urldefense.com/v3/__https://lists.openembedded.or=
g/g/openembedded-devel/message/112803__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmz=
A-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9DCycNl7g$
>>>
>>>
>>>
>>> On a side note, by any chance does using TARGETS provided by the=20
>>> kernel-selftest Makefile
>>> resolves the yocto build issue observed with testptp & kernel 6.12-rc=
1?
>>
>> It might.=C2=A0 I'll look into it.
>=20
>=20
>=20
>=20
> Did you get a chance to look into this?

I have not.  Feel free to test it out yourself now that all of the=20
needed changes are in place.


>=20
>>
>>
>>
>>
>>>>
>>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>>> ---
>>>> =C2=A0 .../kernel-selftest/kernel-selftest.bbappend=C2=A0 | 45=20
>>>> +++++++++++++++++++
>>>> =C2=A0 1 file changed, 45 insertions(+)
>>>> =C2=A0 create mode 100644=20
>>>> meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbapp=
end
>>>>
>>>> diff --git=20
>>>> a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bba=
ppend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bb=
append
>>>> new file mode 100644
>>>> index 00000000..68b4b668
>>>> --- /dev/null
>>>> +++=20
>>>> b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bba=
ppend
>>>> @@ -0,0 +1,45 @@
>>>> +TEST_LIST +=3D "\
>>>> +=C2=A0=C2=A0=C2=A0 arm64 \
>>>> +=C2=A0=C2=A0=C2=A0 breakpoints \
>>>> +=C2=A0=C2=A0=C2=A0 capabilities \
>>>> +=C2=A0=C2=A0=C2=A0 cgroup \
>>>> +=C2=A0=C2=A0=C2=A0 clone3 \
>>>> +=C2=A0=C2=A0=C2=A0 core \
>>>> +=C2=A0=C2=A0=C2=A0 cpu-hotplug \
>>>> +=C2=A0=C2=A0=C2=A0 cpufreq \
>>>> +=C2=A0=C2=A0=C2=A0 efivarfs \
>>>> +=C2=A0=C2=A0=C2=A0 exec \
>>>> +=C2=A0=C2=A0=C2=A0 filesystems \
>>>> +=C2=A0=C2=A0=C2=A0 filesystems/binderfs \
>>>> +=C2=A0=C2=A0=C2=A0 filesystems/epoll \
>>>> +=C2=A0=C2=A0=C2=A0 firmware \
>>>> +=C2=A0=C2=A0=C2=A0 fpu \
>>>> +=C2=A0=C2=A0=C2=A0 ftrace \
>>>> +=C2=A0=C2=A0=C2=A0 futex \
>>>> +=C2=A0=C2=A0=C2=A0 gpio \
>>>> +=C2=A0=C2=A0=C2=A0 intel_pstate \
>>>> +=C2=A0=C2=A0=C2=A0 ipc \
>>>> +=C2=A0=C2=A0=C2=A0 kcmp \
>>>> +=C2=A0=C2=A0=C2=A0 kvm \
>>>> +=C2=A0=C2=A0=C2=A0 livepatch \
>>>> +=C2=A0=C2=A0=C2=A0 membarrier \
>>>> +=C2=A0=C2=A0=C2=A0 memfd \
>>>> +=C2=A0=C2=A0=C2=A0 mqueue \
>>>> +=C2=A0=C2=A0=C2=A0 mincore \
>>>> +=C2=A0=C2=A0=C2=A0 net \
>>>> +=C2=A0=C2=A0=C2=A0 net/mptcp \
>>>> +=C2=A0=C2=A0=C2=A0 openat2 \
>>>> +=C2=A0=C2=A0=C2=A0 ptrace \
>>>> +=C2=A0=C2=A0=C2=A0 resq \
>>>> +=C2=A0=C2=A0=C2=A0 rtc \
>>>> +=C2=A0=C2=A0=C2=A0 seccomp \
>>>> +=C2=A0=C2=A0=C2=A0 sigaltstack \
>>>> +=C2=A0=C2=A0=C2=A0 size \
>>>> +=C2=A0=C2=A0=C2=A0 tc-testing \
>>>> +=C2=A0=C2=A0=C2=A0 timers \
>>>> +=C2=A0=C2=A0=C2=A0 tmpfs \
>>>> +=C2=A0=C2=A0=C2=A0 tpm2 \
>>>> +=C2=A0=C2=A0=C2=A0 user_events \
>>>> +=C2=A0=C2=A0=C2=A0 vDSO \
>>>> +=C2=A0=C2=A0=C2=A0 watchdog \
>>>> +"
>>>> --=20
>>>> 2.17.1
>>>>
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online=20
>>>> (#15567):https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/message/15567__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3l=
r7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9D9Xq8OYA$
>>>> Mute This=20
>>>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/=
108954456/7030289__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611Om=
O3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9C3ArvQgw$
>>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.o=
rg/g/meta-arago/unsub__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA6=
11OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CQCK5gXQ$ [c-shilwant@ti.=
com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>
>>>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

