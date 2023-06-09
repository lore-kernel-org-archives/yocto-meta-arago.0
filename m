Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB0BC7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 15:39:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16657.1686325151043684279
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Jun 2023 08:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=yn8oHKjU;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 359Fd7KT062923;
	Fri, 9 Jun 2023 10:39:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686325147;
	bh=SJzUKlZS7LvHYDmWEzAFfYnknO2kDYx4WImurgLqNgo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yn8oHKjUMtKnDfHEHbE5VYjvwtYfP9BapS0ioDEcnEN4yMBsmLdG9EjXb/fI7aG5e
	 lV14wL1w+Y2UqzzQWODDDyHgQjKzifkn5WpEwarZsXOR1AV0mK9rgbpd+x3DxvTM48
	 RtC5HAOKKDHa7yYV4dvG7ehSjbds7dPgSD8UYGf8=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 359Fd7fV081870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Jun 2023 10:39:07 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Jun 2023 10:39:07 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Jun 2023 10:39:07 -0500
Received: from [10.249.33.79] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 359Fd6mk124778;
	Fri, 9 Jun 2023 10:39:06 -0500
Message-ID: <b3e61d81-f568-347a-a936-dcc3b0da3aec@ti.com>
Date: Fri, 9 Jun 2023 10:39:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [meta-arago][kirkstone][PATCH] meta-arago-distro: recipes-kernel:
 Remove docker configs
Content-Language: en-US
To: "Raghavendra, Vignesh" <vigneshr@ti.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20230609052346.414726-1-c-shilwant@ti.com>
 <5f2acd49-c6aa-17c2-dccb-5de66dc29458@ti.com>
 <c186b77e-e7ea-3c2b-f6f5-ced482a9db4f@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <c186b77e-e7ea-3c2b-f6f5-ced482a9db4f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 359Fd7KT062923
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Jun 2023 15:39:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14575



On 6/9/2023 9:42 AM, Raghavendra, Vignesh wrote:
>=20
>=20
> On 6/9/2023 7:01 PM, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>>
>> On 6/9/2023 12:23 AM, Chirag Shilwant wrote:
>>> The necessary configs required for running docker containers have bee=
n
>>> enabled in ti-linux-6.1
>>
>>
>> Generally speaking I support this patch, but from a practical point of
>> view we still have the 5.10 kernel in kirkstone/master.=C2=A0 And appl=
ying
>> this patch as is will break docker support in those kernels.
>>
>> We need to modify this patch to rename the bbappend files to just appl=
y
>> to the 5.10 kernels instead of % (all) kernels.
>>
>=20
> I dont know why this was needed in meta-arago-distro for 5.10 either.
> ti_sdk_*_defconfigs include containers.cfg fragment that has all these
> configs [0][1]
>=20
> [0] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_con=
fig_fragments/v8_defconfig_map.txt?h=3Dti-linux-5.10.y-cicd#n2
> [1] https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/tree/ti_con=
fig_fragments/containers.cfg?h=3Dti-linux-5.10.y-cicd
>=20
> IMO, this patch should not affect 5.10 either

If that is the case, then we just need to reword the commit message to=20
not be so 6.1 specific.


>>
>>> Ref -
>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/patch/?id=3Dc=
a7f239d0814e6a49804b76c0984d6ca5eea0924
>>>
>>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>>> ---
>>>  =C2=A0 .../recipes-kernel/linux/docker.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ----
>>>  =C2=A0 .../recipes-kernel/linux/files/docker.cfg=C2=A0=C2=A0=C2=A0=C2=
=A0 | 20 -------------------
>>>  =C2=A0 .../linux/linux-ti-staging-rt_%.bbappend=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 2 --
>>>  =C2=A0 .../linux/linux-ti-staging-systest_%.bbappend |=C2=A0 2 --
>>>  =C2=A0 .../linux/linux-ti-staging_%.bbappend=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 --
>>>  =C2=A0 5 files changed, 30 deletions(-)
>>>  =C2=A0 delete mode 100644 meta-arago-distro/recipes-kernel/linux/doc=
ker.inc
>>>  =C2=A0 delete mode 100644
>>> meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>>>
>>> diff --git a/meta-arago-distro/recipes-kernel/linux/docker.inc
>>> b/meta-arago-distro/recipes-kernel/linux/docker.inc
>>> deleted file mode 100644
>>> index e926b219..00000000
>>> --- a/meta-arago-distro/recipes-kernel/linux/docker.inc
>>> +++ /dev/null
>>> @@ -1,4 +0,0 @@
>>> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>>> -
>>> -SRC_URI +=3D "file://docker.cfg"
>>> -KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/docker.cfg"
>>> diff --git a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>>> b/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>>> deleted file mode 100644
>>> index 9ac604b8..00000000
>>> --- a/meta-arago-distro/recipes-kernel/linux/files/docker.cfg
>>> +++ /dev/null
>>> @@ -1,20 +0,0 @@
>>> -CONFIG_VETH=3Dm
>>> -CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
>>> -CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
>>> -CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>>> -CONFIG_NET_CLS_CGROUP=3Dm
>>> -CONFIG_IP_VS=3Dm
>>> -CONFIG_IP_VS_RR=3Dm
>>> -CONFIG_VXLAN=3Dm
>>> -CONFIG_IPVLAN=3Dm
>>> -CONFIG_MACVLAN=3Dm
>>> -CONFIG_DUMMY=3Dm
>>> -CONFIG_NF_NAT_FTP=3Dm
>>> -CONFIG_NF_CONNTRACK_FTP=3Dm
>>> -CONFIG_NF_NAT_TFTP=3Dm
>>> -CONFIG_NF_CONNTRACK_TFTP=3Dm
>>> -CONFIG_AUFS_FS=3Dm
>>> -CONFIG_BTRFS_FS=3Dm
>>> -CONFIG_BLK_DEV_DM=3Dm
>>> -CONFIG_DM_THIN_PROVISIONING=3Dm
>>> -CONFIG_OVERLAY_FS=3Dm
>>> diff --git
>>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappen=
d
>>> index df55594e..06f33291 100644
>>> ---
>>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
>>> +++
>>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-rt_%.bbappe=
nd
>>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
>>>  =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>>  =C2=A0 -require docker.inc
>>> -
>>>  =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>>> diff --git
>>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest=
_%.bbappend
>>> index df55594e..06f33291 100644
>>> ---
>>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
>>> +++
>>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging-systest_%.b=
bappend
>>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago1"
>>>  =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>>  =C2=A0 -require docker.inc
>>> -
>>>  =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>>> diff --git
>>> a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>> b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbappend
>>> index 031a8b05..9d9a3593 100644
>>> --- a/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbapp=
end
>>> +++ b/meta-arago-distro/recipes-kernel/linux/linux-ti-staging_%.bbapp=
end
>>> @@ -2,6 +2,4 @@ MACHINE_KERNEL_PR:append =3D ".arago5"
>>>  =C2=A0 =C2=A0 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>>  =C2=A0 -require docker.inc
>>> -
>>>  =C2=A0 ALLOW_EMPTY:kernel-devicetree =3D "1"
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

