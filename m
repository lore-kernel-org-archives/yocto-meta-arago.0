Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF532C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 17:09:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.297.1651165789739387296
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 10:09:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=Ztg15uq4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SH9jwn100418;
	Thu, 28 Apr 2022 12:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651165785;
	bh=3GFs3w5tCBvGNzDZlK+pLRCnECgMMAcVM9/YhFF7szs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Ztg15uq454+d+YWg3+SlHT9pEGGA82Diy5sYezTGRdY7AJQlcKN7lnqLBe0bz1/LB
	 lQmbaEW2YLkSQNpn3V5pe6KU1BWZQbKN/UP/mX3bW6Ch/78gQRR3mHMKArSbhFEqBd
	 FVYjOl1xw8VrpZKZ6gYptUKgjl35irfScYm7KQk0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SH9jIa048277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 12:09:45 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 12:09:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 12:09:45 -0500
Received: from [10.250.37.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SH9iJ0081227;
	Thu, 28 Apr 2022 12:09:44 -0500
Message-ID: <7e813214-5ca1-f9a6-c566-c6fd8435fb95@ti.com>
Date: Thu, 28 Apr 2022 12:09:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [meta-arago][oe-layersetup PATCH 4/6] Rename BB_ENV_EXTRAWHITE to
 BB_ENV_PASSTHROUGH_ADDITIONS
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-4-afd@ti.com> <20220426210811.GC9834@denix.org>
 <e7a7aabf-4dd3-7f3e-1bd4-f17c1a1c0735@ti.com>
 <4685aa02-da18-e1d7-e146-a1790104737c@ti.com>
 <7abea4c5-023d-a750-f72c-e201795a1c4d@ti.com>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <7abea4c5-023d-a750-f72c-e201795a1c4d@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id
 23SH9jwn100418
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 17:09:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13823



On 4/28/2022 11:48, Andrew Davis wrote:
> On 4/28/22 11:11 AM, Ryan Eatmon wrote:
>>
>> On 4/26/2022 16:23, Andrew Davis wrote:
>>> On 4/26/22 4:08 PM, Denys Dmytriyenko wrote:
>>>> On Tue, Apr 26, 2022 at 03:02:49PM -0500, Andrew F. Davis via=20
>>>> lists.yoctoproject.org wrote:
>>>>> This variable was renamed upstream, rename it in our setenv file.
>>>>
>>>> This will break dunfell...
>>>>
>>>
>>>
>>> And not doing it breaks master...
>>>
>>> There is a check for BB_ENV_EXTRAWHITE, having it set will halt
>>> build (think the check is in bitbake but haven't looked).
>>>
>>
>> This one patch seems to be the only hold out.=C2=A0 We clearly cannot =
break=20
>> our current production.=C2=A0 Do you want to resubmit the series witho=
ut=20
>> this patch and we can keep looking in this issue separately?
>>
>>
>=20
>=20
> Not sure what your tooling looks like, but could you just
> take all the other patch in this series skipping this one?
>=20
> Or do you need a full resend?


Full resend as v2 would be best.  Cleanest for the mailing list history=20
and for Patchwork.


> Andrew
>=20
>=20
>>
>>>>
>>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>>> ---
>>>>> =C2=A0 oe-layertool-setup.sh | 2 +-
>>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>>>>> index f171f94..72416b0 100755
>>>>> --- a/oe-layertool-setup.sh
>>>>> +++ b/oe-layertool-setup.sh
>>>>> @@ -853,7 +853,7 @@ unset BITBAKEDIR
>>>>> =C2=A0 unset SCRIPTS
>>>>> =C2=A0 export PATH
>>>>> =C2=A0 export BUILDDIR=3D${builddir}
>>>>> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_prox=
y=20
>>>>> ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID=20
>>>>> SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS=20
>>>>> PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD=20
>>>>> SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND=20
>>>>> TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5=20
>>>>> TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES=20
>>>>> TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE=20
>>>>> ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO=20
>>>>> TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>>>>> +export BB_ENV_PASSTHROUGH_ADDITIONS=3D"MACHINE DISTRO TCMODE TCLIB=
C=20
>>>>> http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy=20
>>>>> SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE=20
>>>>> BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE=20
>>>>> SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH TOOLCHAIN_TYPE=20
>>>>> TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5=20
>>>>> TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES=20
>>>>> TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE=20
>>>>> ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO=20
>>>>> TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>>>>> =C2=A0 EOM
>>>>> =C2=A0 }
>>

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

