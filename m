Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B47C27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 07:34:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.36392.1717745670378506579
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 00:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=Ce41cKJP;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4577YTue015579;
	Fri, 7 Jun 2024 02:34:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717745669;
	bh=eKKchbwmWzfDftw+DQt9+7xtj/2hdEUIyDtGq8YdEtY=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=Ce41cKJPU8M4ssAO01oCG2MiHvuSJsU3x7NvYFByfiBXuOi2JqU/jl4TJdjRS4RNd
	 Vu/3tLxLaRK/5D64Z9ZBXRCIvS7ErnHSyC472ATaMcXYRf8llLonFRk5jwq5Fgfywd
	 2gT5zcCtZnjIcwewwJziMA8S0fmodZbqXAugh9yE=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4577YTq8112327
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 02:34:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 02:34:28 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 02:34:28 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4577YQto125782;
	Fri, 7 Jun 2024 02:34:27 -0500
Message-ID: <d30fe208-21d4-41dc-b621-d856598b8581@ti.com>
Date: Fri, 7 Jun 2024 13:04:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] arm-ddr-bandwidth: Fix
 installtion location
To: <meta-arago@lists.yoctoproject.org>
References: <20240607020012.2995-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240607020012.2995-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 4577YTue015579
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 07:34:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15375

In Subject,

s/installtion/installation
On 07/06/24 07:30, Ryan Eatmon via lists.yoctoproject.org wrote:
> The script was installed in the wrong directory, but the=20
> /usr/share/matrix-gui-2.=E2=80=8A0/apps needs to also exist. Signed-off=
-by:=20
> Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/arm-ddr-bandwidth/arm-ddr-bandwidth.=E2=80=8Abb |=
 9 +++++++-- 1 file=20
> changed, 7 insertions(+),
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> The script was installed in the wrong directory, but the
> /usr/share/matrix-gui-2.0/apps needs to also exist.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   .../arm-ddr-bandwidth/arm-ddr-bandwidth.bb               | 9 +++++++-=
-
>   1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-dd=
r-bandwidth.bb b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-=
ddr-bandwidth.bb
> index 78f80b55..b6766d56 100644
> --- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandw=
idth.bb
> +++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandw=
idth.bb
> @@ -16,8 +16,13 @@ S =3D "${WORKDIR}"
>  =20
>   do_install() {
>       install -d ${D}${datadir}/matrix-gui-2.0/apps
> -    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gu=
i-2.0/apps/runLmDDRBandwidth.sh
> +
> +    install -d ${D}${bindir}
> +    install -m 0644 ${S}/runLmDDRBandwidth.sh ${D}${bindir}/runLmDDRBa=
ndwidth.sh
>   }
>  =20
> -FILES:${PN} =3D "${datadir}/matrix-gui-2.0/apps/runLmDDRBandwidth.sh"
> +FILES:${PN} =3D " \
> +    ${datadir}/matrix-gui-2.0/apps \
> +    ${bindir}/runLmDDRBandwidth.sh \
> +"
>  =20
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15373):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15373__;!!G3vK!URkGDa08EDbx6Asg9sJfOw=
18p1ejoi9uHh6mYJUg_EkaJk2HzfbqLMdqEJIvZcX80sZSCelTEbgR761Cwcjs91C33FrIBCl=
2jQ$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106536231/7030289__;!!G3vK!URkGDa08EDbx6Asg9sJfOw18p1ejoi9uHh6mYJU=
g_EkaJk2HzfbqLMdqEJIvZcX80sZSCelTEbgR761Cwcjs91C33FpgLdMMZA$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!URkGDa08EDbx6Asg9sJfOw18p1ejoi9uHh6mYJUg_EkaJ=
k2HzfbqLMdqEJIvZcX80sZSCelTEbgR761Cwcjs91C33Fq2G0wHLQ$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

