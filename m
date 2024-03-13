Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0680C54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 06:14:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.10146.1710310458925759811
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 23:14:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZiKZrdew;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42D6EHpT006085;
	Wed, 13 Mar 2024 01:14:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710310457;
	bh=GcOBodk8caO4+wEThnH16h/9Hn0RsyqRKcmmHQIFmaU=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZiKZrdewJTDkM7eoe7f3HNVSGmbehpNCwaQJa7V9BpS+kqVoAsoSuC9uODYUjyW15
	 +VZusP5gIZMtvSiuQBGREq/fKe8tSqPpS0czD3cv4XWHRSMWOTMdbTRoTFKhXqv313
	 LfLAwIhVEF4Hwrb+mGQn4cUeK14y1QIUTZQOmeZ0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42D6EHjM015484
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Mar 2024 01:14:17 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Mar 2024 01:14:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Mar 2024 01:14:17 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42D6EF0W052640;
	Wed, 13 Mar 2024 01:14:15 -0500
Message-ID: <1e86cb69-23e6-4f56-9f0d-1d1a200e6585@ti.com>
Date: Wed, 13 Mar 2024 11:44:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master][PATCH]
 packagegroup-arago-tisdk-addons: Remove ti-ipc-examples-linux
To: <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Ryan Eatmon
	<reatmon@ti.com>, <meta-arago@lists.yoctoproject.org>
References: <20240312151208.15349-1-afd@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240312151208.15349-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 42D6EHpT006085
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:14:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15236

On 12/03/24 20:42, Andrew Davis via lists.yoctoproject.org wrote:
> This IPC example is no longer supported nor recommended for new=20
> designs. The documentation is no not available either (was on=20
> Processors Wiki). Remove this example. Signed-off-by: Andrew Davis=20
> <afd@=E2=80=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/packagegroups/packagegroup-arago-tisdk-addons.=E2=
=80=8Abb
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> This IPC example is no longer supported nor recommended for new designs.
> The documentation is no not available either (was on Processors Wiki).
s/no/now
> Remove this example.
>
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-addons.bb           | 3 --=
-
>   1 file changed, 3 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/pack=
agegroup-arago-tisdk-addons.bb
> index 11d10596..db778699 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-addons.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-addons.bb
> @@ -85,9 +85,6 @@ EXTRA_PACKAGES:omapl138 =3D " \
>       protobuf \
>   "
>  =20
> -EXTRA_PACKAGES:append:omap-a15 =3D " ti-ipc-examples-linux"
> -EXTRA_PACKAGES:append:omapl138 =3D " ti-ipc-examples-linux"
> -
>   #EXTRA_PACKAGES:append:omap-a15 =3D " \
>   #    ${@bb.utils.contains('MACHINE_FEATURES','dsp','big-data-ipc-demo=
 big-data-ipc-demo-firmware','',d)} \
>   #"
> --=20
> 2.39.2
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15235):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15235__;!!G3vK!WOPbjzc4Qyg25gsVJg1LoE=
iHs3JPyvKjG1UN3ZWu5InlW5_Msg-bm7_jszF-fqhoOPYNVE_cGTZNVBmIA4v6NaVEBP1u$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104886314/7030289__;!!G3vK!WOPbjzc4Qyg25gsVJg1LoEiHs3JPyvKjG1UN3ZW=
u5InlW5_Msg-bm7_jszF-fqhoOPYNVE_cGTZNVBmIA4v6NbNInt_H$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!WOPbjzc4Qyg25gsVJg1LoEiHs3JPyvKjG1UN3ZWu5InlW=
5_Msg-bm7_jszF-fqhoOPYNVE_cGTZNVBmIA4v6NZvmxbjm$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

