Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58ACC4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 15:49:09 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.98098.1701100146183158933
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 27 Nov 2023 07:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=tL/TZoh5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3ARFn1G2078685;
	Mon, 27 Nov 2023 09:49:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1701100141;
	bh=mYDqqDP9lrbaZoyXexRtBl6ylBolDAd4RJin4mhCOlM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=tL/TZoh5VUlYk1gF7vloqvZAwsyvCWSFxGGaa66XwFA33plXbQmQshyyhIbgV+9wY
	 7YmiSsmVaLAS6FH8cvE+xsxH6qri/s+kBcwdsIJf1v3oNZ6Bj1c3jJIGTqar7at3Jz
	 lGYruLRDSeHnTmAXxwqB8eXXHu9CnByfqEbVJEaw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3ARFn176029592
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 27 Nov 2023 09:49:01 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 27
 Nov 2023 09:49:00 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 27 Nov 2023 09:49:00 -0600
Received: from [172.24.227.238] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3ARFmwN9030312;
	Mon, 27 Nov 2023 09:48:59 -0600
Message-ID: <901d95df-f036-47b0-ba38-198ca232b2eb@ti.com>
Date: Mon, 27 Nov 2023 21:18:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][oe-layersetup][PATCH] oe-layertool-setup.sh: Add
 DISPLAY_CLUSTER_ENABLE variable to $confdir/setenv
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        <meta-arago@lists.yoctoproject.org>
CC: Sai Sree Kartheek Adivi <s-adivi@ti.com>, Paresh Bhagat <p-bhagat@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20231127124310.3191974-1-c-shilwant@ti.com>
 <1ee0bc6c-81a8-4dcf-bd75-c5ee6f82b8df@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <1ee0bc6c-81a8-4dcf-bd75-c5ee6f82b8df@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 3ARFn1G2078685
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 27 Nov 2023 15:49:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15023


On 27/11/23 20:15, Ryan Eatmon wrote:
>
> On 11/27/2023 6:43 AM, Chirag Shilwant wrote:
>> - Add DISPLAY_CLUSTER_ENABLE variable to $confdir/setenv which can be=20
>> used to
>> optinally build the tisdk-display-cluster-image for AM62P[1].
>>
>> - Users can set this variable to build tisdk-display-cluster-image=20
>> for AM62P.
>
> Should this be done via an environment variable or as a variable in=20
> the local.conf file?=C2=A0 This feels like it breaks the yocto mindset.


This will be done as a variable in local.conf. So while building=20
tisdk-display-cluster-image users

have to set this variable in local.conf (similar to how users build=20
tisdk-jailhouse-image[1])


Reference
---------
[1]=20
https://git.ti.com/cgit/arago-project/oe-layersetup/commit/?id=3D62ad6379=
bae1bf60a0248917d067f099d2945b89=20



>
>
>
>
>> - DISPLAY_CLUSTER_ENABLE is mainly used to pick a different DM=20
>> Firmware which
>> is needed for Display Cluster OOB demo[2].
>>
>> Reference
>> ---------
>> [1]=20
>> https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?h=3Dkirkstone&=
id=3D9db593ee237d9eda91046b21f1e4456e465fdea0
>>
>> [2]=20
>> https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/commit/?h=3Dkirkstone&=
id=3D09d8b3bea7ca39d8baf412f46b4265ce75a91686
>>
>> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
>> ---
>> =C2=A0 oe-layertool-setup.sh | 4 ++--
>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
>> index c711e78..5f512ef 100755
>> --- a/oe-layertool-setup.sh
>> +++ b/oe-layertool-setup.sh
>> @@ -934,9 +934,9 @@ export BUILDDIR=3D"${builddir}"
>> =C2=A0 EOM
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "$BITBAKE_INCLUSIVE_VARS" =3D=
 "no" ]; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf 'export %s=3D"%s"\n=
' 'BB_ENV_EXTRAWHITE' 'MACHINE=20
>> DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy=20
>> ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY=20
>> SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND=20
>> GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH=20
>> TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH=20
>> TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8=20
>> EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE=20
>> ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT=20
>> TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE=20
>> ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf 'export %s=3D"%s"\n=
' 'BB_ENV_EXTRAWHITE' 'MACHINE=20
>> DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy all_proxy=20
>> ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK BB_SRCREV_POLICY=20
>> SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE GIT_PROXY_COMMAND=20
>> GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE META_SDK_PATH=20
>> TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE TOOLCHAIN_PATH=20
>> TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7 TOOLCHAIN_PATH_ARMV8=20
>> EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND ARAGO_RT_ENABLE=20
>> ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX TI_SECURE_DEV_PKG_CAT=20
>> TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3 ARAGO_SYSVINIT SYSFW_FILE=20
>> ARAGO_JAILHOUSE_ENABLE DISPLAY_CLUSTER_ENABLE' >> "$confdir/setenv"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf 'export %s=3D"%s"\n=
' 'BB_ENV_PASSTHROUGH_ADDITIONS'=20
>> 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy=20
>> all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK=20
>> BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE=20
>> GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE=20
>> META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE=20
>> TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7=20
>> TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND=20
>> ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX=20
>> TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3=20
>> ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE' >> "$confdir/setenv"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printf 'export %s=3D"%s"\n=
' 'BB_ENV_PASSTHROUGH_ADDITIONS'=20
>> 'MACHINE DISTRO TCMODE TCLIBC http_proxy ftp_proxy https_proxy=20
>> all_proxy ALL_PROXY no_proxy SSH_AGENT_PID SSH_AUTH_SOCK=20
>> BB_SRCREV_POLICY SDKMACHINE BB_NUMBER_THREADS PARALLEL_MAKE=20
>> GIT_PROXY_COMMAND GIT_PROXY_IGNORE SOCKS5_PASSWD SOCKS5_USER OEBASE=20
>> META_SDK_PATH TOOLCHAIN_TYPE TOOLCHAIN_BRAND TOOLCHAIN_BASE=20
>> TOOLCHAIN_PATH TOOLCHAIN_PATH_ARMV5 TOOLCHAIN_PATH_ARMV7=20
>> TOOLCHAIN_PATH_ARMV8 EXTRA_TISDK_FILES TISDK_VERSION ARAGO_BRAND=20
>> ARAGO_RT_ENABLE ARAGO_SYSTEST_ENABLE ARAGO_KERNEL_SUFFIX=20
>> TI_SECURE_DEV_PKG_CAT TI_SECURE_DEV_PKG_AUTO TI_SECURE_DEV_PKG_K3=20
>> ARAGO_SYSVINIT SYSFW_FILE ARAGO_JAILHOUSE_ENABLE=20
>> DISPLAY_CLUSTER_ENABLE' >> "$confdir/setenv"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> =C2=A0 }
>

