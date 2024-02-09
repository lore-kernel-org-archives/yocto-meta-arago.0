Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9BFC48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 09:55:05 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8232.1707472497117687411
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 09 Feb 2024 01:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JSihh+TU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4199stbA009368;
	Fri, 9 Feb 2024 03:54:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707472495;
	bh=dnrr9Toe+zbIHkX9R/odUsHSof+yfSNEjPUoM6j6H7Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=JSihh+TUR9jUVD/+pzLjiUjCRxAACPb9Ac4stA/cvFgd1wj0qcYhI9/opuUpYyoL0
	 NyivrA1OAntVrh8IHCDdeG52mijtqRI0GHsav3iKQUUSLPalo9nRH+IYhgGnxYqlQM
	 Ges/OXSXTmMDFWt27OK90QQcxhPNU8huMjsZkzdM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4199stfa050945
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Feb 2024 03:54:55 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 9
 Feb 2024 03:54:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 9 Feb 2024 03:54:54 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4199sq26045764;
	Fri, 9 Feb 2024 03:54:52 -0600
Message-ID: <72b4e178-daea-464d-be46-6affdb80a74f@ti.com>
Date: Fri, 9 Feb 2024 15:24:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][oe-layersetup][PATCH] oe-layersetup: add
 a new kirkstone config for chromium support
Content-Language: en-US
To: <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, Gyan Gupta <g-gupta@ti.com>, Khasim <khasim@ti.com>
References: <20240208190259.6445-1-detheridge@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240208190259.6445-1-detheridge@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 4199stbA009368
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 09 Feb 2024 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15146

LGTM!

On 09/02/24 00:32, Etheridge, Darren via lists.yoctoproject.org wrote:
> From: Darren Etheridge <detheridge@=E2=80=8Ati.=E2=80=8Acom> Add=20
> arago-kirkstone-chromium-config.=E2=80=8Atxt. If this config is instant=
iated,=20
> chromium v111 and clang12 layers will be pulled into the yocto build.=20
> Signed-off-by: Darren Etheridge <detheridge@=E2=80=8Ati.=E2=80=8Acom>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Darren Etheridge <detheridge@ti.com>
>
> Add arago-kirkstone-chromium-config.txt.
>
> If this config is instantiated, chromium v111 and clang12 layers will
> be pulled into the yocto build.
>
> Signed-off-by: Darren Etheridge <detheridge@ti.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   configs/arago-kirkstone-chromium-config.txt | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 configs/arago-kirkstone-chromium-config.txt
>
> diff --git a/configs/arago-kirkstone-chromium-config.txt b/configs/arag=
o-kirkstone-chromium-config.txt
> new file mode 100644
> index 0000000..97d7849
> --- /dev/null
> +++ b/configs/arago-kirkstone-chromium-config.txt
> @@ -0,0 +1,16 @@
> +# This file takes repo entries in the format
> +# repo name,repo uri,repo branch,repo commit[,layers=3Dlayer1:layer2..=
.:layern]
> +
> +bitbake,https://urldefense.com/v3/__https://git.openembedded.org/bitba=
ke,2.0,HEAD__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRENB9cg5x=
bMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku6Y89UBy$
> +meta-arago,https://urldefense.com/v3/__https://git.yoctoproject.org/me=
ta-arago,kirkstone,HEAD,layers=3Dmeta-arago-distro:meta-arago-extras:meta=
-arago-demos:meta-arago-test__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9beMzHP=
5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku_W8Cyv9$
> +meta-browser,https://urldefense.com/v3/__https://github.com/OSSystems/=
meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=3D=
meta-chromium__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRENB9cg=
5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku8EIk_Xk$
> +meta-qt5,https://urldefense.com/v3/__https://github.com/meta-qt5/meta-=
qt5.git,kirkstone,HEAD,layers=3D__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9be=
MzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku48praKL$
> +meta-virtualization,https://urldefense.com/v3/__https://git.yoctoproje=
ct.org/meta-virtualization,kirkstone,HEAD,layers=3D__;!!G3vK!RQ2qI2dJpTo-=
sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CT=
e4dIT2Ku4rZjPtT$
> +meta-openembedded,https://urldefense.com/v3/__https://git.openembedded=
.org/meta-openembedded,kirkstone,HEAD,layers=3Dmeta-networking:meta-pytho=
n:meta-oe:meta-gnome:meta-filesystems__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1=
wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Kuy0Cvep=
O$
> +meta-ti,https://urldefense.com/v3/__https://git.yoctoproject.org/meta-=
ti,kirkstone,HEAD,layers=3Dmeta-ti-extras:meta-ti-bsp__;!!G3vK!RQ2qI2dJpT=
o-sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5=
CTe4dIT2Ku4148xLn$
> +meta-arm,https://urldefense.com/v3/__https://git.yoctoproject.org/meta=
-arm,kirkstone,HEAD,layers=3Dmeta-arm:meta-arm-toolchain__;!!G3vK!RQ2qI2d=
JpTo-sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPL=
UQ5CTe4dIT2Ku5pgD3tO$
> +meta-clang,https://urldefense.com/v3/__https://github.com/kraj/meta-cl=
ang,kirkstone-clang12,HEAD,layers=3D__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1w=
n9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2KuweNwaI9=
$
> +oe-core,https://urldefense.com/v3/__https://git.openembedded.org/opene=
mbedded-core,kirkstone,HEAD,layers=3Dmeta__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU=
7Aj1wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku53=
3jFYu$
> +OECORELAYERCONF=3D./sample-files/bblayers.conf.sample
> +OECORELOCALCONF=3D./sample-files/local-arago64-v2.conf.sample
> +BITBAKE_INCLUSIVE_VARS=3Dyes
> --=20
> 2.36.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15137):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15137__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU=
7Aj1wn9beMzHP5mF6iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku3x=
w7Gej$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104244963/7030289__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9beMzHP5mF6=
iE7mRENB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku6j02Tsx$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!RQ2qI2dJpTo-sk7NlFuKBU7Aj1wn9beMzHP5mF6iE7mRE=
NB9cg5xbMvHx-Ha6BGc3diddFYw3I5whGPLUQ5CTe4dIT2Ku33Vy82c$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

