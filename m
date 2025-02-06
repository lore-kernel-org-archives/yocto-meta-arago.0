Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 497F1C02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:32:07 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.51166.1738870321953695365
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 11:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=s7eskICr;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 516JW0RD3610883
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 13:32:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738870320;
	bh=m1vCplZxJq2kRuLH4kDl/mXR41N+upxI9SpPhCWMI0M=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=s7eskICrtNRYtcI1rjjV0QZb0rUzLrG5WVvM3JKm8tDIg1S5JhWZjTiis2AKr4reb
	 i3MC6cHkuEP7v1aVQvdCCdw/cM2BDzzDg0a0MZl/D0hxZ1XODipRJMkcnoUNmkRMXD
	 E6vtaEFHU68TEu4d4f7x4mu/2i529rMsKo0mMktQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 516JW0pU001680
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 13:32:00 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 13:32:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 13:32:00 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 516JVwGV007413;
	Thu, 6 Feb 2025 13:31:59 -0600
Message-ID: <a90482b5-a0f0-4bc1-9bf5-9c5f07c8cb7a@ti.com>
Date: Fri, 7 Feb 2025 01:01:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap/master][PATCH 1/5]
 meta-arago-extras: armnn: Remove default FILESEXTRAPATHS
To: <meta-arago@lists.yoctoproject.org>
References: <20250206190700.1190499-1-afd@ti.com>
Content-Language: en-US
CC: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250206190700.1190499-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 516JW0RD3610883
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Feb 2025 19:32:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15835

On 07/02/25 00:36, Andrew Davis via lists.yoctoproject.org wrote:
> This is being set to the default value, remove this. Signed-off-by:=20
> Andrew Davis <afd@=E2=80=8Ati.=E2=80=8Acom> ---=20
> meta-arago-extras/recipes-devtools/armnn/armnn_24.=E2=80=8A11.=E2=80=8A=
bb | 2 -- 1=20
> file changed, 2 deletions(-) diff --git=20
> a/meta-arago-extras/recipes-devtools/armnn/armnn_24.=E2=80=8A11.=E2=80=8A=
bb
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uBdqXRfP1m1bKsZFH=
NNj3FzquS10oFN33DBLJpsHaAydWL3eq_jWrBjaCvlRkuO7-pDU6-Le3IOCQHtf$>=20
>
> ZjQcmQRYFpfptBannerEnd
> This is being set to the default value, remove this.
>
> Signed-off-by: Andrew Davis <afd@ti.com>

For the entire series,


Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb b/=
meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> index e965382a..d13057c0 100644
> --- a/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> +++ b/meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb
> @@ -3,8 +3,6 @@ DESCRIPTION =3D "Linux software and tools to enable mac=
hine learning workloads on
>   LICENSE =3D "MIT"
>   LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3e14a924c16f7d828b8335a59d=
a64074"
>  =20
> -FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> -
>   BRANCH =3D "branches/armnn_24_11"
>   SRC_URI =3D "git://github.com/ARM-software/armnn.git;branch=3D${BRANC=
H};protocol=3Dhttps"
>   SRC_URI +=3D "file://0001-Fix-type-casting-for-32bit-builds.patch"
> --=20
> 2.39.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15830):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15830__;!!G3vK!WYWQ2ul8JjmprGwRM2OlBV=
8CCuQzz-VTGJ5dCflugGYUi8Hm6ZIqK55S9GmIomfi9WEXEZ11MPxHHsuf8wOqyTEhPPkG$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/111038540/7030289__;!!G3vK!WYWQ2ul8JjmprGwRM2OlBV8CCuQzz-VTGJ5dCfl=
ugGYUi8Hm6ZIqK55S9GmIomfi9WEXEZ11MPxHHsuf8wOqyddlLUiz$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!WYWQ2ul8JjmprGwRM2OlBV8CCuQzz-VTGJ5dCflugGYUi=
8Hm6ZIqK55S9GmIomfi9WEXEZ11MPxHHsuf8wOqyQy3Fods$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

