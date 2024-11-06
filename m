Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC84D59F55
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 17:10:48 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.51214.1730913044566102521
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 06 Nov 2024 09:10:44 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=HshfoIgg;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4A6HAh4U053214;
	Wed, 6 Nov 2024 11:10:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730913043;
	bh=jQHpEpEnO62bZLxI5mvylaAdK3yl0iCNQNy6XlAy3u4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=HshfoIgglD65Bvg4w+T+iiZHL0DD4TMGJIsgQiw+uTE0Yac+SJWKpOZUznprvULs+
	 kuwLRqlnEok3pj1j+6GEywBr9lFK2dyprQKCZ5O9S+rzESwiDydck3Hqnrxf68w7Gv
	 4bQdgkIMYPWlSSAXM28xQKg4thQh+xGCSjpRIWd0=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4A6HAhFE068876
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 6 Nov 2024 11:10:43 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 6
 Nov 2024 11:10:42 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 6 Nov 2024 11:10:42 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4A6HAeRI077848;
	Wed, 6 Nov 2024 11:10:41 -0600
Message-ID: <f54733df-d9b8-4ac8-bb13-77c7526eda3a@ti.com>
Date: Wed, 6 Nov 2024 22:40:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master/scarthgap][PATCH] kernel-selftest: Enable
 more tests
To: Ryan Eatmon <reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20241011182713.14904-1-reatmon@ti.com>
 <915225e0-4000-41ff-81d7-8bb647ff113e@ti.com>
 <3de8598d-a144-4e8e-b255-f0938a2fa5c0@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <3de8598d-a144-4e8e-b255-f0938a2fa5c0@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 4A6HAh4U053214
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Nov 2024 17:10:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15594

Hi Ryan,
On 14/10/24 20:38, Ryan Eatmon wrote:
>
>
> On 10/14/2024 8:34 AM, Chirag Shilwant wrote:
>> Hi Ryan,
>> On 11/10/24 23:57, Ryan Eatmon via lists.yoctoproject.org wrote:
>>> Our testing flow is looking to incorporate the kernel-selftests as a=20
>>> test. Enable a large number of selected cases. This patch requires a=20
>>> set of corrseponding patches on meta-openembeded in upstream:=20
>>> [master] https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A=
//lists.=E2=80=8Aopenembedded.=20
>>> =E2=80=8Aorg/g/openembedded-devel/message/112802__;!!G3vK!SR7zVae3hhF=
FVplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a=
3gF3Y9CkRYUwtA$
>>> ZjQcmQRYFpfptBannerStart
>>> This message was sent from outside of Texas Instruments.
>>> Do not click links or open attachments unless you recognize the=20
>>> source of this email and know the content is safe.
>>> Report=C2=A0Suspicious
>>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9k0bCiZ=
FPJNj_MlZpVwu06fq9NvXRpfEf2O5Vx8jNtMvuUY5nddhxJbS3K0P_MbX07TzwgpxLR4$>=20
>>>
>>> ZjQcmQRYFpfptBannerEnd
>>> Our testing flow is looking to incorporate the kernel-selftests as a
>>> test.=C2=A0 Enable a large number of selected cases.
>>>
>>> This patch requires a set of corrseponding patches on meta-openembede=
d
>>> in upstream:
>>>
>>> [master]https://urldefense.com/v3/__https://lists.openembedded.org/g/=
openembedded-devel/message/112802__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fw=
FMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CkRYUwtA$=20
>>>
>>> [scarthgap]https://urldefense.com/v3/__https://lists.openembedded.org=
/g/openembedded-devel/message/112803__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA=
-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9DCycNl7g$=20
>>>
>>
>>
>>
>> On a side note, by any chance does using TARGETS provided by the=20
>> kernel-selftest Makefile
>> resolves the yocto build issue observed with testptp & kernel 6.12-rc1=
?
>
> It might.=C2=A0 I'll look into it.




Did you get a chance to look into this?


>
>
>
>
>>>
>>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>>> ---
>>> =C2=A0 .../kernel-selftest/kernel-selftest.bbappend=C2=A0 | 45=20
>>> +++++++++++++++++++
>>> =C2=A0 1 file changed, 45 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappe=
nd
>>>
>>> diff --git=20
>>> a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbap=
pend=20
>>> b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbap=
pend=20
>>>
>>> new file mode 100644
>>> index 00000000..68b4b668
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbap=
pend
>>> @@ -0,0 +1,45 @@
>>> +TEST_LIST +=3D "\
>>> +=C2=A0=C2=A0=C2=A0 arm64 \
>>> +=C2=A0=C2=A0=C2=A0 breakpoints \
>>> +=C2=A0=C2=A0=C2=A0 capabilities \
>>> +=C2=A0=C2=A0=C2=A0 cgroup \
>>> +=C2=A0=C2=A0=C2=A0 clone3 \
>>> +=C2=A0=C2=A0=C2=A0 core \
>>> +=C2=A0=C2=A0=C2=A0 cpu-hotplug \
>>> +=C2=A0=C2=A0=C2=A0 cpufreq \
>>> +=C2=A0=C2=A0=C2=A0 efivarfs \
>>> +=C2=A0=C2=A0=C2=A0 exec \
>>> +=C2=A0=C2=A0=C2=A0 filesystems \
>>> +=C2=A0=C2=A0=C2=A0 filesystems/binderfs \
>>> +=C2=A0=C2=A0=C2=A0 filesystems/epoll \
>>> +=C2=A0=C2=A0=C2=A0 firmware \
>>> +=C2=A0=C2=A0=C2=A0 fpu \
>>> +=C2=A0=C2=A0=C2=A0 ftrace \
>>> +=C2=A0=C2=A0=C2=A0 futex \
>>> +=C2=A0=C2=A0=C2=A0 gpio \
>>> +=C2=A0=C2=A0=C2=A0 intel_pstate \
>>> +=C2=A0=C2=A0=C2=A0 ipc \
>>> +=C2=A0=C2=A0=C2=A0 kcmp \
>>> +=C2=A0=C2=A0=C2=A0 kvm \
>>> +=C2=A0=C2=A0=C2=A0 livepatch \
>>> +=C2=A0=C2=A0=C2=A0 membarrier \
>>> +=C2=A0=C2=A0=C2=A0 memfd \
>>> +=C2=A0=C2=A0=C2=A0 mqueue \
>>> +=C2=A0=C2=A0=C2=A0 mincore \
>>> +=C2=A0=C2=A0=C2=A0 net \
>>> +=C2=A0=C2=A0=C2=A0 net/mptcp \
>>> +=C2=A0=C2=A0=C2=A0 openat2 \
>>> +=C2=A0=C2=A0=C2=A0 ptrace \
>>> +=C2=A0=C2=A0=C2=A0 resq \
>>> +=C2=A0=C2=A0=C2=A0 rtc \
>>> +=C2=A0=C2=A0=C2=A0 seccomp \
>>> +=C2=A0=C2=A0=C2=A0 sigaltstack \
>>> +=C2=A0=C2=A0=C2=A0 size \
>>> +=C2=A0=C2=A0=C2=A0 tc-testing \
>>> +=C2=A0=C2=A0=C2=A0 timers \
>>> +=C2=A0=C2=A0=C2=A0 tmpfs \
>>> +=C2=A0=C2=A0=C2=A0 tpm2 \
>>> +=C2=A0=C2=A0=C2=A0 user_events \
>>> +=C2=A0=C2=A0=C2=A0 vDSO \
>>> +=C2=A0=C2=A0=C2=A0 watchdog \
>>> +"
>>> --=20
>>> 2.17.1
>>>
>>>
>>>
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>> Links: You receive all messages sent to this group.
>>> View/Reply Online=20
>>> (#15567):https://urldefense.com/v3/__https://lists.yoctoproject.org/g=
/meta-arago/message/15567__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr=
7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9D9Xq8OYA$
>>> Mute This=20
>>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/1=
08954456/7030289__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO=
3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9C3ArvQgw$
>>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.or=
g/g/meta-arago/unsub__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA61=
1OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CQCK5gXQ$=20
>>> [c-shilwant@ti.com]
>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>
>>>
>

