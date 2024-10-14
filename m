Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3579D16263
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:34:36 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.54991.1728912871670468024
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=DGcc7ooE;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EDYUWI110600;
	Mon, 14 Oct 2024 08:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728912870;
	bh=pq74l5Y+yWjTGGNu5BdfkFXH6MuSfoHMMSQnoBqBrts=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=DGcc7ooEtJajQEItRPU8XfKaPPiosm1A7aOdIupqSDPY7odiiMzwTYmT7pL09U/Jg
	 WVGQLxXgUlo9tpLUlZMyW9/v0JmGXJlxTV9QMvZiB6ObiEzGJPPaepCzrrURhenKNZ
	 WTaPJsKryuM86FvntKlqSZOZyBGfmXi57EZ4Ifpk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EDYUoF050543
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 14 Oct 2024 08:34:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 08:34:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 08:34:30 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EDYSRI051082;
	Mon, 14 Oct 2024 08:34:29 -0500
Message-ID: <915225e0-4000-41ff-81d7-8bb647ff113e@ti.com>
Date: Mon, 14 Oct 2024 19:04:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master/scarthgap][PATCH] kernel-selftest:
 Enable more tests
To: <meta-arago@lists.yoctoproject.org>
References: <20241011182713.14904-1-reatmon@ti.com>
Content-Language: en-US
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241011182713.14904-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 49EDYUWI110600
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:34:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15571

Hi Ryan,
On 11/10/24 23:57, Ryan Eatmon via lists.yoctoproject.org wrote:
> Our testing flow is looking to incorporate the kernel-selftests as a=20
> test. Enable a large number of selected cases. This patch requires a=20
> set of corrseponding patches on meta-openembeded in upstream: [master]=20
> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//lists.=E2=
=80=8Aopenembedded.=E2=80=8Aorg/g/openembedded-devel/message/112802__;!!G=
3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBn=
KARWIdkuwjcSQ3a3gF3Y9CkRYUwtA$
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP9k0bCiZFP=
JNj_MlZpVwu06fq9NvXRpfEf2O5Vx8jNtMvuUY5nddhxJbS3K0P_MbX07TzwgpxLR4$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Our testing flow is looking to incorporate the kernel-selftests as a
> test.  Enable a large number of selected cases.
>
> This patch requires a set of corrseponding patches on meta-openembeded
> in upstream:
>
> [master]https://urldefense.com/v3/__https://lists.openembedded.org/g/op=
enembedded-devel/message/112802__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFM=
lpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CkRYUwtA$
> [scarthgap]https://urldefense.com/v3/__https://lists.openembedded.org/g=
/openembedded-devel/message/112803__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-f=
wFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9DCycNl7g$



On a side note, by any chance does using TARGETS provided by the=20
kernel-selftest Makefile
resolves the yocto build issue observed with testptp & kernel 6.12-rc1?




>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../kernel-selftest/kernel-selftest.bbappend  | 45 ++++++++++++++++++=
+
>   1 file changed, 45 insertions(+)
>   create mode 100644 meta-arago-test/recipes-kernel/kernel-selftest/ker=
nel-selftest.bbappend
>
> diff --git a/meta-arago-test/recipes-kernel/kernel-selftest/kernel-self=
test.bbappend b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-sel=
ftest.bbappend
> new file mode 100644
> index 00000000..68b4b668
> --- /dev/null
> +++ b/meta-arago-test/recipes-kernel/kernel-selftest/kernel-selftest.bb=
append
> @@ -0,0 +1,45 @@
> +TEST_LIST +=3D "\
> +    arm64 \
> +    breakpoints \
> +    capabilities \
> +    cgroup \
> +    clone3 \
> +    core \
> +    cpu-hotplug \
> +    cpufreq \
> +    efivarfs \
> +    exec \
> +    filesystems \
> +    filesystems/binderfs \
> +    filesystems/epoll \
> +    firmware \
> +    fpu \
> +    ftrace \
> +    futex \
> +    gpio \
> +    intel_pstate \
> +    ipc \
> +    kcmp \
> +    kvm \
> +    livepatch \
> +    membarrier \
> +    memfd \
> +    mqueue \
> +    mincore \
> +    net \
> +    net/mptcp \
> +    openat2 \
> +    ptrace \
> +    resq \
> +    rtc \
> +    seccomp \
> +    sigaltstack \
> +    size \
> +    tc-testing \
> +    timers \
> +    tmpfs \
> +    tpm2 \
> +    user_events \
> +    vDSO \
> +    watchdog \
> +"
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15567):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15567__;!!G3vK!SR7zVae3hhFFVplhWtl3dP=
zwmzA-fwFMlpz3lr7FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9D9Xq8=
OYA$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/108954456/7030289__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7=
FA611OmO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9C3ArvQgw$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!SR7zVae3hhFFVplhWtl3dPzwmzA-fwFMlpz3lr7FA611O=
mO3Or3jYueFIp9jIXP6duIBnKARWIdkuwjcSQ3a3gF3Y9CQCK5gXQ$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

