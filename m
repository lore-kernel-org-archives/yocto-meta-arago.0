Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BDBBD24469
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 15:08:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.57322.1728918520992980340
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 08:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=IByCA5b/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EF8dY3065190;
	Mon, 14 Oct 2024 10:08:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728918519;
	bh=9R8qwmUIb1IOamnXdq8M0r1murdJJ1FAcHy+GUfFamg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=IByCA5b/89ijifgXPvM77p3HechBs7Lbdf4fp+BMDsccYUZ9eRIF0b0D2h1f3l0Z/
	 2rGeQfvmZ+VhwB9hDiG4eJh+DiptvNXKedjjWEeJjzqN+qfy8k8U0rvOBJEA6Dft0F
	 jlv2IhhMv/TOdJ1ymcU9UkQKkHx7sIvcVc6V6okg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EF8d0O022014
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 10:08:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 10:08:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 10:08:39 -0500
Received: from [10.249.35.83] ([10.249.35.83])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EF8chG086509;
	Mon, 14 Oct 2024 10:08:39 -0500
Message-ID: <3de8598d-a144-4e8e-b255-f0938a2fa5c0@ti.com>
Date: Mon, 14 Oct 2024 10:08:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master/scarthgap][PATCH] kernel-selftest:
 Enable more tests
To: Chirag Shilwant <c-shilwant@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
References: <20241011182713.14904-1-reatmon@ti.com>
 <915225e0-4000-41ff-81d7-8bb647ff113e@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <915225e0-4000-41ff-81d7-8bb647ff113e@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 49EF8dY3065190
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 15:08:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15573



On 10/14/2024 8:34 AM, Chirag Shilwant wrote:
> Hi Ryan,
> On 11/10/24 23:57, Ryan Eatmon via lists.yoctoproject.org wrote:
>> Our testing flow is looking to incorporate the kernel-selftests as a=20
>> test. Enable a large number of selected cases. This patch requires a=20
>> set of corrseponding patches on meta-openembeded in upstream: [master]=
=20
>> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//lists.=E2=
=80=8Aopenembedded.=20
>> =E2=80=8Aorg/g/openembedded-devel/message/112802__;!!G3vK!SR7zVae3hhFF=
VplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3=
gF3Y9CkRYUwtA$
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9k0bCiZF=
PJNj_MlZpVwu06fq9NvXRpfEf2O5Vx8jNtMvuUY5nddhxJbS3K0P_MbX07TzwgpxLR4$>
>> ZjQcmQRYFpfptBannerEnd
>> Our testing flow is looking to incorporate the kernel-selftests as a
>> test.=C2=A0 Enable a large number of selected cases.
>>
>> This patch requires a set of corrseponding patches on meta-openembeded
>> in upstream:
>>
>> [master]https://urldefense.com/v3/__https://lists.openembedded.org/g/o=
penembedded-devel/message/112802__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwF=
Mlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CkRYUwtA$
>> [scarthgap]https://urldefense.com/v3/__https://lists.openembedded.org/=
g/openembedded-devel/message/112803__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-=
fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9DCycNl7g$
>=20
>=20
>=20
> On a side note, by any chance does using TARGETS provided by the=20
> kernel-selftest Makefile
> resolves the yocto build issue observed with testptp & kernel 6.12-rc1?

It might.  I'll look into it.



>>
>> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
>> ---
>> =C2=A0 .../kernel-selftest/kernel-selftest.bbappend=C2=A0 | 45 +++++++=
++++++++++++
>> =C2=A0 1 file changed, 45 insertions(+)
>> =C2=A0 create mode 100644=20
>> meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbappen=
d
>>
>> diff --git=20
>> a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbapp=
end b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbap=
pend
>> new file mode 100644
>> index 00000000..68b4b668
>> --- /dev/null
>> +++=20
>> b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bbapp=
end
>> @@ -0,0 +1,45 @@
>> +TEST_LIST +=3D "\
>> +=C2=A0=C2=A0=C2=A0 arm64 \
>> +=C2=A0=C2=A0=C2=A0 breakpoints \
>> +=C2=A0=C2=A0=C2=A0 capabilities \
>> +=C2=A0=C2=A0=C2=A0 cgroup \
>> +=C2=A0=C2=A0=C2=A0 clone3 \
>> +=C2=A0=C2=A0=C2=A0 core \
>> +=C2=A0=C2=A0=C2=A0 cpu-hotplug \
>> +=C2=A0=C2=A0=C2=A0 cpufreq \
>> +=C2=A0=C2=A0=C2=A0 efivarfs \
>> +=C2=A0=C2=A0=C2=A0 exec \
>> +=C2=A0=C2=A0=C2=A0 filesystems \
>> +=C2=A0=C2=A0=C2=A0 filesystems/binderfs \
>> +=C2=A0=C2=A0=C2=A0 filesystems/epoll \
>> +=C2=A0=C2=A0=C2=A0 firmware \
>> +=C2=A0=C2=A0=C2=A0 fpu \
>> +=C2=A0=C2=A0=C2=A0 ftrace \
>> +=C2=A0=C2=A0=C2=A0 futex \
>> +=C2=A0=C2=A0=C2=A0 gpio \
>> +=C2=A0=C2=A0=C2=A0 intel_pstate \
>> +=C2=A0=C2=A0=C2=A0 ipc \
>> +=C2=A0=C2=A0=C2=A0 kcmp \
>> +=C2=A0=C2=A0=C2=A0 kvm \
>> +=C2=A0=C2=A0=C2=A0 livepatch \
>> +=C2=A0=C2=A0=C2=A0 membarrier \
>> +=C2=A0=C2=A0=C2=A0 memfd \
>> +=C2=A0=C2=A0=C2=A0 mqueue \
>> +=C2=A0=C2=A0=C2=A0 mincore \
>> +=C2=A0=C2=A0=C2=A0 net \
>> +=C2=A0=C2=A0=C2=A0 net/mptcp \
>> +=C2=A0=C2=A0=C2=A0 openat2 \
>> +=C2=A0=C2=A0=C2=A0 ptrace \
>> +=C2=A0=C2=A0=C2=A0 resq \
>> +=C2=A0=C2=A0=C2=A0 rtc \
>> +=C2=A0=C2=A0=C2=A0 seccomp \
>> +=C2=A0=C2=A0=C2=A0 sigaltstack \
>> +=C2=A0=C2=A0=C2=A0 size \
>> +=C2=A0=C2=A0=C2=A0 tc-testing \
>> +=C2=A0=C2=A0=C2=A0 timers \
>> +=C2=A0=C2=A0=C2=A0 tmpfs \
>> +=C2=A0=C2=A0=C2=A0 tpm2 \
>> +=C2=A0=C2=A0=C2=A0 user_events \
>> +=C2=A0=C2=A0=C2=A0 vDSO \
>> +=C2=A0=C2=A0=C2=A0 watchdog \
>> +"
>> --=20
>> 2.17.1
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online=20
>> (#15567):https://urldefense.com/v3/__https://lists.yoctoproject.org/g/=
meta-arago/message/15567__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7=
FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9D9Xq8OYA$
>> Mute This=20
>> Topic:https://urldefense.com/v3/__https://lists.yoctoproject.org/mt/10=
8954456/7030289__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO3=
Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9C3ArvQgw$
>> Group Owner: meta-arago+owner@lists.yoctoproject.org
>> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-arago/unsub__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611=
OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CQCK5gXQ$=C2=A0 [c-shilwant=
@ti.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

