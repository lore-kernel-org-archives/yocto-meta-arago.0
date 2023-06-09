Return-Path: <vigneshr@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E17BC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 14:42:29 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.15158.1686321739084826245
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 07:42:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=exZVa4+r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vigneshr@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359EgG09049076;
	Fri, 9 Jun 2023 09:42:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686321736;
	bh=bVpDaoLr2Yju2zRNEACO2xMhJK/gT9gfh205jXXS0tg=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=exZVa4+rfpZlkZpkTxib3m1qvHy7TosMDs8fRZKEHdJW7XJarSHl18ngsJ4V5NV/7
	 4TZEZsXRvwxBAkW1nSwbx8GyDuMPvq2f3Jq+YpZok/ar757DogcYECIXtLtkLCnhpq
	 5AtMOIjSY7+BFAMFYeBBGPwHhj/lSCFeYfOrjLtI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359EgGae123474
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 09:42:16 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 09:42:15 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 09:42:15 -0500
Received: from [10.249.142.56] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359EgA8p072594;
	Fri, 9 Jun 2023 09:42:11 -0500
Message-ID: <c186b77e-e7ea-3c2b-f6f5-ced482a9db4f@ti.com>
Date: Fri, 9 Jun 2023 20:12:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-distro: recipes-kernel:
 Remove docker configs
To: <reatmon@ti.com>, Chirag Shilwant <c-shilwant@ti.com>,
        Praneeth Bajjuri
	<praneeth@ti.com>,
        Denys Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230609052346.414726-1-c-shilwant@ti.com>
 <5f2acd49-c6aa-17c2-dccb-5de66dc29458@ti.com>
Content-Language: en-US
From: "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <5f2acd49-c6aa-17c2-dccb-5de66dc29458@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 359EgG09049076
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 14:42:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14574



On 6/9/2023 7:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>=20
>=20
> On 6/9/2023 12:23 AM, Chirag Shilwant wrote:
>> The necessary configs required for running docker containers have been
>> enabled in ti-linux-6.1
>=20
>=20
> Generally speaking I support this patch, but from a practical point of
> view we still have the 5.10 kernel in kirkstone/master.=C2=A0 And apply=
ing
> this patch as is will break docker support in those kernels.
>=20
> We need to modify this patch to rename the bbappend files to just apply
> to the 5.10 kernels instead of % (all) kernels.
>=20

I dont know why this was needed in meta-arago-distro for 5.10 either.=20
ti_sdk_*_defconfigs include containers.cfg fragment that has all these=20
configs [0][1]

[0] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_confi=
g_fragments/v8_defconfig_map.txt?h=3Dti-linux-5.10.y-cicd#n2
[1] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_confi=
g_fragments/containers.cfg?h=3Dti-linux-5.10.y-cicd

IMO, this patch should not affect 5.10 either

>=20
>> Ref -
>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/patch/?id=3Dca=
7f239d0814e6a49804b76c0984d6ca5eea0924
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 .../recipes-kernel/linux/docker.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
>> =C2=A0 .../recipes-kernel/linux/files/docker.cfg=C2=A0=C2=A0=C2=A0=C2=A0=
 | 20 -------------------
>> =C2=A0 .../linux/linux-ti-staging-rt_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 2 --
>> =C2=A0 .../linux/linux-ti-staging-systest_%.bbappend |=C2=A0 2 --
>> =C2=A0 .../linux/linux-ti-staging_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
>> =C2=A0 5 files changed, 30 deletions(-)
>> =C2=A0 delete mode 100644 meta-arago-distro/recipes-kernel/linux/docke=
r.inc
>> =C2=A0 delete mode 100644
>> meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>>
>> diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc
>> b/meta-arago-distro/recipes-kernel/linux/docker.inc
>> deleted file mode 100644
>> index e926b219..00000000
>> --- a/meta-arago-distro/recipes-kernel/linux/docker.inc
>> +++ /dev/null
>> @@ -1,4 +0,0 @@
>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>> -
>> -SRC_URI +=3D "file://docker.cfg"
>> -KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/docker.cfg"
>> diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>> b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>> deleted file mode 100644
>> index 9ac604b8..00000000
>> --- a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>> +++ /dev/null
>> @@ -1,20 +0,0 @@
>> -CONFIG_VETH=3Dm
>> -CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
>> -CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
>> -CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>> -CONFIG_NET_CLS_CGROUP=3Dm
>> -CONFIG_IP_VS=3Dm
>> -CONFIG_IP_VS_RR=3Dm
>> -CONFIG_VXLAN=3Dm
>> -CONFIG_IPVLAN=3Dm
>> -CONFIG_MACVLAN=3Dm
>> -CONFIG_DUMMY=3Dm
>> -CONFIG_NF_NAT_FTP=3Dm
>> -CONFIG_NF_CONNTRACK_FTP=3Dm
>> -CONFIG_NF_NAT_TFTP=3Dm
>> -CONFIG_NF_CONNTRACK_TFTP=3Dm
>> -CONFIG_AUFS_FS=3Dm
>> -CONFIG_BTRFS_FS=3Dm
>> -CONFIG_BLK_DEV_DM=3Dm
>> -CONFIG_DM_THIN_PROVISIONING=3Dm
>> -CONFIG_OVERLAY_FS=3Dm
>> diff --git
>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappen=
d b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappend
>> index df55594e..06f33291 100644
>> ---
>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappen=
d
>> +++
>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappen=
d
>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> =C2=A0 -require docker.inc
>> -
>> =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>> diff --git
>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bb=
append b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_=
%.bbappend
>> index df55594e..06f33291 100644
>> ---
>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bb=
append
>> +++
>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.bb=
append
>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> =C2=A0 -require docker.inc
>> -
>> =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>> diff --git
>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
>> index 031a8b05..9d9a3593 100644
>> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappe=
nd
>> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappe=
nd
>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago5"
>> =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> =C2=A0 -require docker.inc
>> -
>> =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>=20

