Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7634C77B6F
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 19:45:01 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.55435.1681155899228264131
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Apr 2023 12:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=mRFB1m6r;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33AJiuN3125009;
	Mon, 10 Apr 2023 14:44:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681155896;
	bh=j9HFlp+PxKqBG7hrXawWtkj4ZHDbWuRETAJHcXnKgI4=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=mRFB1m6rjyMLEiXwzJb/s0gJnRPAhLLHP/EAL9jzq/DOstDv7Uk7gWkwLIsZWys3x
	 oh/Cn6wieS9whA1yuaNIlMt669hafpxjw1PY76bzjjbxQdM++1OgQudpufjsW8EaeJ
	 aWvgIBXUJwyEELkV+tH9bJk/oLJb/e4kY6wth9Cg=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33AJiuvn023839
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Apr 2023 14:44:56 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 10
 Apr 2023 14:44:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 10 Apr 2023 14:44:55 -0500
Received: from [10.250.32.15] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33AJitds087668;
	Mon, 10 Apr 2023 14:44:55 -0500
Message-ID: <05fde5f7-fbe6-236d-2a89-652ef945321d@ti.com>
Date: Mon, 10 Apr 2023 14:44:55 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [meta-ti][master/kirkstone][PATCH] big-data-ipc-demo: Update to
 version without CMEM dependency
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20230410182551.11926-1-afd@ti.com>
 <19d0db8a-ba4b-c7fc-3677-0df1b978e946@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <19d0db8a-ba4b-c7fc-3677-0df1b978e946@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 33AJiuN3125009
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Apr 2023 19:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14303



On 4/10/2023 13:27, Andrew Davis wrote:
> On 4/10/23 1:25 PM, Andrew Davis wrote:
>> Latest version does not use CMEM, update this recipe accordingly.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>=20
> For the subject, looks like I have the wrong tag, this should be for=20
> meta-arago.
>=20
> Andrew

Tsk tsk.


>> =C2=A0 .../big-data-ipc-demo/big-data-ipc-demo_git.bb=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
>> =C2=A0 1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git=20
>> a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_g=
it.bb b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-dem=
o_git.bb
>> index 439fac14..e7bf1a1d 100644
>> ---=20
>> a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_g=
it.bb
>> +++=20
>> b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo_g=
it.bb
>> @@ -3,8 +3,8 @@ LICENSE =3D "BSD-3-Clause"
>> =C2=A0 LIC_FILES_CHKSUM =3D=20
>> "file://makefile;beginline=3D1;endline=3D31;md5=3D2f2ea348b98d5cc7807e=
ce7adcc2c43a"
>> =C2=A0 SRC_URI =3D=20
>> "git://git.ti.com/processor-sdk/big-data-ipc-examples.git;protocol=3Dg=
it;branch=3Dmaster"
>> -SRCREV =3D "984edb3c69c8a1f51da02e0abcd2201319650894"
>> -PV =3D "01.03.00.00"
>> +SRCREV =3D "3dedbde2a539834ee8f4d0419888116ea80789d0"
>> +PV =3D "01.03.00.01"
>> =C2=A0 S =3D "${WORKDIR}/git"
>> @@ -19,8 +19,8 @@ DEPENDS =3D "ti-ipc \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ti-xdctools-native \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ti-sysbios \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ti-ipc-rtos \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmem \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ti-cgt6x-native \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual/=
kernel \
>> =C2=A0 "
>> =C2=A0 PLATFORM =3D "UNKNOWN"
>> @@ -33,7 +33,7 @@ EXTRA_OEMAKE =3D "\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XDC_INSTALL_DIR=3D"${XDC_INSTALL_DIR}" =
\
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 BIOS_INSTALL_DIR=3D"${SYSBIOS_INSTALL_D=
IR}" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 IPC_INSTALL_DIR=3D"${IPC_INSTALL_DIR}" =
\
>> -=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STAGING_INCDIR}" \
>> +=C2=A0=C2=A0=C2=A0 LINUX_SYSROOT_DIR=3D"${STAGING_KERNEL_DIR}/include=
/uapi=20
>> -I${STAGING_KERNEL_DIR}/include" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gnu.targets.arm.A15F=3D"${GCC_ARM_NONE_=
TOOLCHAIN}" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti.targets.elf.C66=3D"${STAGING_DIR_NAT=
IVE}/usr/share/ti/cgt-c6x" \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti.targets.arm.elf.M4=3D"${M4_TOOLCHAIN=
_INSTALL_DIR}" \

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

