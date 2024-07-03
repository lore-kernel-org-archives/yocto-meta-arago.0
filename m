Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF096C30653
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 05:25:33 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.43811.1719984326714220690
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 22:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=M0EANNUr;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4635PKoc104874;
	Wed, 3 Jul 2024 00:25:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719984320;
	bh=W3GiHSS8y9zNb1fnFOfUPp7rG/gi/uUwv7E1fwrMfNs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=M0EANNUrnwuKaDMVYbNefbD5iUnYlOnb5n4W5Uwmr+9ICTNC4xceMrX0Qf4OJKBHK
	 PCYVYGGGIYdLS+jpOXGsRoeeimqwOS/U1LF3e8A6PPSKMBd57S1DM9p8soepoV8nAW
	 7AJNndS+hE1YDDX3UZ7clCBxRKBYsrwYtCwJwKbk=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4635PKGh056372
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jul 2024 00:25:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 3
 Jul 2024 00:25:19 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 3 Jul 2024 00:25:19 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4635PH70088827;
	Wed, 3 Jul 2024 00:25:18 -0500
Message-ID: <949729c8-9d30-4ea9-a6b4-b7e91dd557e5@ti.com>
Date: Wed, 3 Jul 2024 10:55:16 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [master][PATCH] weston: adjust bbappend
 for minor version bump
To: <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Denys Dmytriyenko
	<denis@denix.org>, Gyan Gupta <g-gupta@ti.com>,
        Ryan Eatmon <reatmon@ti.com>
References: <20240702195208.39626-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240702195208.39626-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 4635PKoc104874
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Jul 2024 05:25:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15428

Hi Denys,
On 03/07/24 01:22, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> Make bba=
ppend less=20
> strict to apply against minor version bumps, such as 3.=E2=80=8A0.=E2=80=
=8A1=20
> Signed-off-by: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom>=
 ---=20
> ..=E2=80=8A.=E2=80=8A/wayland/{weston_13.=E2=80=8A0.=E2=80=8A0.=E2=80=8A=
bbappend =3D> weston_13.=E2=80=8A0.=E2=80=8A%.=E2=80=8Abbappend}
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> Make bbappend less strict to apply against minor version bumps, such as=
 3.0.1
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

>   .../wayland/{weston_13.0.0.bbappend =3D> weston_13.0.%.bbappend}    |=
 0
>   1 file changed, 0 insertions(+), 0 deletions(-)
>   rename meta-arago-distro/recipes-graphics/wayland/{weston_13.0.0.bbap=
pend =3D> weston_13.0.%.bbappend} (100%)
>
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.b=
bappend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappe=
nd
> similarity index 100%
> rename from meta-arago-distro/recipes-graphics/wayland/weston_13.0.0.bb=
append
> rename to meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbap=
pend
> --=20
> 2.35.3
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15427):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15427__;!!G3vK!TR_wceHONoWiamLX3Hpthi=
CbozWD1D_Mzoh-FXjDy8-VpCKm6WnkzAmuLItFvxG8S-B0qs5-JQS4$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/107006908/7030289__;!!G3vK!TR_wceHONoWiamLX3HpthiCbozWD1D_Mzoh-FXj=
Dy8-VpCKm6WnkzAmuLItFvxG8S-B0qjQjN8Bk$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!TR_wceHONoWiamLX3HpthiCbozWD1D_Mzoh-FXjDy8-Vp=
CKm6WnkzAmuLItFvxG8S-B0qtT2G--L$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

