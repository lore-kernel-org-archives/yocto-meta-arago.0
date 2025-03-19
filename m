Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C89EC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:35:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.7012.1742420132043203844
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=CfR2XYPN;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLZVKB442099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:35:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742420131;
	bh=JltMOJ7Kd+nlw9ftfd3hBmh2C5HTCrZEIbL4UVppBqk=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=CfR2XYPNGNAZpZyg5OlWDvYqIufuSMcz5qzhucDlOUdTt1zdU8E29BtvLfEPM07dn
	 XpeoMpeIIk+cxK5vQ955eoe92mAjH11q3sQlqhWrN+1x/WFTXN22pA31ANGclWbtUY
	 US2MyvAY91Wb88ORUZIYObnf7c3wDPQcARWwci4k=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLZVt2001170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:35:31 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:35:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:35:30 -0500
Received: from [128.247.81.112] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLZUEk036689;
	Wed, 19 Mar 2025 16:35:30 -0500
Message-ID: <40db79a3-2053-426e-bbba-7451ff55a9fc@ti.com>
Date: Wed, 19 Mar 2025 16:35:30 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [meta-ti][scarthgap/master][PATCH v6 1/3]
 recipe-graphics: port gc320 driver to work on kernel 6.12
To: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
References: <20250319212729.336516-1-a-christidis@ti.com>
 <182E5170CB1F09B3.26464@lists.yoctoproject.org>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <182E5170CB1F09B3.26464@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 52JLZVKB442099
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:35:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16100

Send this patch series to the wrong mailing list, disregard all of this.

On 3/19/25 4:27 PM, Antonios Christidis via lists.yoctoproject.org wrote:
> From: Antonios Christidis <a-christidis@=E2=80=8Ati.=E2=80=8Acom> Chang=
es made on the=20
> gc320 kernel mode driver in order to work with kernel 6.=E2=80=8A12. Th=
ere is=20
> no other change in functionality with this update, and the driver=20
> version remains the same. Signed-off-by:=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uVdqPBfB1s07yggKf=
P1D3bNEYxFQGuRdQAHFcoCkltLCTmSvR5SjMNIhi1T1Y-mbd2ag4717LB9LDlcfIAf1WxJRBN=
4dIIM$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Antonios Christidis <a-christidis@ti.com>
>
> Changes made on the gc320 kernel mode driver in order to work with kern=
el
> 6.12. There is no other change in functionality with this update, and t=
he
> driver version remains the same.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>   .../recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb    | 4 ++-=
-
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.=
11.p7.bb b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p=
7.bb
> index 818ed683..a6dc3e25 100644
> --- a/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.b=
b
> +++ b/meta-ti-bsp/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.b=
b
> @@ -8,9 +8,9 @@ inherit module features_check
>   REQUIRED_MACHINE_FEATURES =3D "gc320"
>  =20
>   # Need to branch out with ${PV} var
> -BRANCH =3D "ti-${PV}-k5.10"
> +BRANCH =3D "ti-${PV}-k6.12"
>  =20
> -SRCREV =3D "e2a10f31e255a65ec30a6e10b890e77d7e9cb107"
> +SRCREV =3D "83afddf9dbf6a8458267b4dae21ee35bfb11f3d1"
>  =20
>   SRC_URI =3D "git://git.ti.com/git/graphics/ti-gc320-driver.git;protoc=
ol=3Dhttps;branch=3D${BRANCH}"
>  =20
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16096):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/16096__;!!G3vK!X_iHuLdQUe2lFn-IXXzXV5=
jr9kL1OmKldATDjMprZzsTs1QfcPqhASQSXIwJgIa6RmivyekhFD5azM5tFG0CFsnJlKubYOG=
hm8v0$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/111798367/9164840__;!!G3vK!X_iHuLdQUe2lFn-IXXzXV5jr9kL1OmKldATDjMp=
rZzsTs1QfcPqhASQSXIwJgIa6RmivyekhFD5azM5tFG0CFsnJlKubYEDB51V8$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!X_iHuLdQUe2lFn-IXXzXV5jr9kL1OmKldATDjMprZzsTs=
1QfcPqhASQSXIwJgIa6RmivyekhFD5azM5tFG0CFsnJlKubYHmLDGDo$  [a-christidis@t=
i.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

