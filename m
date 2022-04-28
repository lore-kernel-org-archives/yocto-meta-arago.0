Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776E3C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 16:48:59 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.13138.1651164533785923009
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 28 Apr 2022 09:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com
 header.s=ti-com-17q1 header.b=sx7Ks2Iv;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23SGmn6X124660;
	Thu, 28 Apr 2022 11:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651164529;
	bh=wK4s8mOyzlXhowW0dFxHruKqOWYVwQNTNG0bLSBRs+Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=sx7Ks2IviSQJ9zKfP21IPkylZq4bfochcPvxKcF0WmnTkwqirfSBpIIYkmBGquF6c
	 sdx1G2tF9DnKeHbT1P5JQ/qJQOrnSORtNSXW9kA0XJjI8fnQkizWEnZvdZT8i9s7c9
	 gcpXL9BB67QAhSGTyqiwXpXZ0KSQ1ZozUn7ysPVg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23SGmnCO113353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 28 Apr 2022 11:48:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 28
 Apr 2022 11:48:48 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 28 Apr 2022 11:48:48 -0500
Received: from [10.249.34.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23SGmm7D000833;
	Thu, 28 Apr 2022 11:48:48 -0500
Message-ID: <7abea4c5-023d-a750-f72c-e201795a1c4d@ti.com>
Date: Thu, 28 Apr 2022 11:48:47 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago][oe-layersetup PATCH 4/6] Rename BB_ENV_EXTRAWHITE to
 BB_ENV_PASSTHROUGH_ADDITIONS
Content-Language: en-US
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20220426200251.19417-1-afd@ti.com>
 <20220426200251.19417-4-afd@ti.com> <20220426210811.GC9834@denix.org>
 <e7a7aabf-4dd3-7f3e-1bd4-f17c1a1c0735@ti.com>
 <4685aa02-da18-e1d7-e146-a1790104737c@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <4685aa02-da18-e1d7-e146-a1790104737c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id
 23SGmn6X124660
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 28 Apr 2022 16:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13822

On 4/28/22 11:11 AM, Ryan Eatmon wrote:
>=20
> On 4/26/2022 16:23, Andrew Davis wrote:
>> On 4/26/22 4:08 PM, Denys Dmytriyenko wrote:
>>> On Tue, Apr 26, 2022 at 03:02:49PM -0500, Andrew F. Davis via lists.y=
octoproject.org wrote:
>>>> This variable was renamed upstream, rename it in our setenv file.
>>>
>>> This will break dunfell...
>>>
>>
>>
>> And not doing it breaks master...
>>
>> There is a check for BB_ENV_EXTRAWHITE, having it set will halt
>> build (think the check is in bitbake but haven't looked).
>>
>=20
> This one patch seems to be the only hold out.=C2=A0 We clearly cannot b=
reak our current production.=C2=A0 Do you want to resubmit the series wit=
hout this patch and we can keep looking in this issue separately?
>=20
>=20


Not sure what your tooling looks like, but could you just
take all the other patch in this series skipping this one?

Or do you need a full resend?

Andrew


>=20
>>>
>>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>> =C2=A0 oe-layertool-setup.sh | 2 +-
>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>>>> index f171f94..72416b0 100755
>>>> --- a/oe-layertool-setup.sh
>>>> +++ b/oe-layertool-setup.sh
>>>> @@ -853,7 +853,7 @@ unset BITBAKEDIR
>>>> =C2=A0 unset SCRIPTS
>>>> =C2=A0 export PATH
>>>> =C2=A0 export BUILDDIR=3D${builddir}
>>>> -export BB_ENV_EXTRAWHITE=3D"MACHINE DISTRO TCMODE TCLIBC http_proxy=
 ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUT=
H_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PR=
OXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PA=
TH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH TOOLCHAIN=
_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES T=
ISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNE=
L_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K=
3 ARAGO_SYSVINIT SYSFW_FILE"
>>>> +export BB_ENV_PASSTHROUGH_ADDITIONS=3D"MACHINE DISTRO TCMODE TCLIBC=
 http_proxy ftp_proxy https_proxy all_proxy ALL_PROXY no_proxy SSH_AGENT_=
PID SSH_AUTH_SOCK BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_=
MAKE GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE =
META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PAT=
H TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8 EXTRA_TI=
SDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE =
ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECUR=
E_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE"
>>>> =C2=A0 EOM
>>>> =C2=A0 }
>=20

