Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C571C48BC4
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 06:59:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.36469.1707893952848543389
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 13 Feb 2024 22:59:13 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=czvwXzns;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41E6x9uZ102428;
	Wed, 14 Feb 2024 00:59:09 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707893949;
	bh=r1gtMJcrlNaCDQYH2yey9oFWdr3yysyK3vRvmnJFiSM=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=czvwXznsvjP3HajRM895UhKclqe2Qv70TCgFbsu2e1VCxvyhLza/Vs1Bx/GC09muP
	 NVK3T3OTn01YODfeaiVKdkfrtTTpxciEyUv+wPOZd2Nr8nCQWmDanO19IgvhEC2pPX
	 w/jLe6nqNGiu6ehpZqpQue/zkHzeagn/kz/byL3Q=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41E6x94e100789
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 00:59:09 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 00:59:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 00:59:09 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41E6x735100458;
	Wed, 14 Feb 2024 00:59:08 -0600
Message-ID: <ee0977c3-d1bc-4467-abb5-bd805148a643@ti.com>
Date: Wed, 14 Feb 2024 12:29:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master][PATCH]
 packagegroup-arago-tisdk-addons: Disable big-data-ipc-demo
Content-Language: en-US
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240213225143.1590112-1-afd@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240213225143.1590112-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 41E6x9uZ102428
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Feb 2024 06:59:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15183

Andrew,

On 14/02/24 04:21, Andrew Davis via lists.yoctoproject.org wrote:
> Temporarily disable big-data-ipc-demo until a fix for missing kernel=20
> header dma_buf_phys.=E2=80=8Ah is complete. Signed-off-by: Andrew Davis=
=20
> <afd@=E2=80=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/packagegroups/packagegroup-arago-tisdk-addons.=E2=
=80=8Abb | 2 +- 1 file=20
> changed, 1 insertion(+),
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Temporarily disable big-data-ipc-demo until a fix for missing
> kernel header dma_buf_phys.h is complete.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 2 +=
-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-addons.bb
> index 4dec290a..87782326 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-addons.bb
> @@ -88,8 +88,8 @@ EXTRA_PACKAGES:omapl138 =3D " \
>   EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-linux"
>   EXTRA_PACKAGES:append:omapl138 =3D " ti-ipc-examples-linux"
>  =20
> +# ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo big=
-data-ipc-demo-firmware','',d)}
>   EXTRA_PACKAGES:append:omap-a15 =3D " \
> -    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo b=
ig-data-ipc-demo-firmware','',d)} \
>   "

Nitpick:
Better to remove or atleast comment out entire=20
EXTRA_PACKAGES:append:omap-a15 instead of appending nothing.

>  =20
>   # acontis-atemsys
> --=20
> 2.39.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15182):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15182__;!!G3vK!S39koFTvP49hqT54E3GZnC=
_5QAOePypR-t8aNpB6Ibz8NM2AG-iEJxwhGp16LMS7JD6DBhXMB3qhc4Pu88UNiY21eqsr$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104343049/7030289__;!!G3vK!S39koFTvP49hqT54E3GZnC_5QAOePypR-t8aNpB=
6Ibz8NM2AG-iEJxwhGp16LMS7JD6DBhXMB3qhc4Pu88UNiaKXkIWv$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!S39koFTvP49hqT54E3GZnC_5QAOePypR-t8aNpB6Ibz8N=
M2AG-iEJxwhGp16LMS7JD6DBhXMB3qhc4Pu88UNiTZANzSx$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

