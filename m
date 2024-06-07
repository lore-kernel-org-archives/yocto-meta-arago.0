Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F3DC27C55
	for <webhook@archiver.kernel.org>; Fri,  7 Jun 2024 07:35:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.36400.1717745717530242162
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Jun 2024 00:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=JOpJ2W2q;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4577ZGAi119834;
	Fri, 7 Jun 2024 02:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717745716;
	bh=ZWwKvD1c0rAoSLWzI0oZ4ZzfGuUyM1hE9PMX9gn/hjQ=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=JOpJ2W2qQ4VC6Qxp3ubiRnbpxsznSXlHckcG5I+8ICnAcioN7Cq8nWaFQoaERC/Cz
	 x4hMBOiQwvQMuF/CNb20s3yQje+n8LWSxtrCp5lxCtKqIjAOLuzRUZBNz89l564m8g
	 ayVSZqmC1oAOmGxwBq3EyF6j7OSjgMGqNKGEZPy8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4577ZG0S113252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Jun 2024 02:35:16 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Jun 2024 02:35:15 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Jun 2024 02:35:15 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4577ZDUJ127260;
	Fri, 7 Jun 2024 02:35:14 -0500
Message-ID: <6bf1183b-1846-4b27-97a1-a844099d4d49@ti.com>
Date: Fri, 7 Jun 2024 13:05:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master][PATCH] arm-ddr-bandwidth: Fix
 installtion location
To: <meta-arago@lists.yoctoproject.org>
References: <20240607020109.3174-1-reatmon@ti.com>
Content-Language: en-US
CC: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240607020109.3174-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 4577ZGAi119834
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Jun 2024 07:35:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15376

In Subject,

s/installtion/installation
On 07/06/24 07:31, Ryan Eatmon via lists.yoctoproject.org wrote:
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
> index 9155e0bb..7b77216f 100644
> --- a/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandw=
idth.bb
> +++ b/meta-arago-test/recipes-benchmark/arm-ddr-bandwidth/arm-ddr-bandw=
idth.bb
> @@ -17,8 +17,13 @@ UNPACKDIR =3D "${S}"
>  =20
>   do_install() {
>       install -d ${D}${datadir}/matrix-gui-2.0/apps
> -    install -m 0755 ${S}/runLmDDRBandwidth.sh ${D}${datadir}/matrix-gu=
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
> View/Reply Online (#15374):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15374__;!!G3vK!UFcsQhztly0UgSXzKHaqQe=
kOM1Y8vIeHjOxklsKzmRk0kxH2v0zD7KWR1vkk36_onpx8MyvwU1k12lduQ6yaexAqAWSL6wO=
DXQ$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106536244/7030289__;!!G3vK!UFcsQhztly0UgSXzKHaqQekOM1Y8vIeHjOxklsK=
zmRk0kxH2v0zD7KWR1vkk36_onpx8MyvwU1k12lduQ6yaexAqAWSqi9aioA$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!UFcsQhztly0UgSXzKHaqQekOM1Y8vIeHjOxklsKzmRk0k=
xH2v0zD7KWR1vkk36_onpx8MyvwU1k12lduQ6yaexAqAWTm4yZvYg$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

