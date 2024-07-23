Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75F7C3DA64
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 08:49:20 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.39792.1721724552399185111
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 23 Jul 2024 01:49:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=u1OScuGj;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46N8nBdX011194
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 03:49:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721724551;
	bh=FYEZdCe0Ew47uA+vUDZ6f0qPbaWmOi4r09ubHCPpQzo=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=u1OScuGjHYjwHe9s+sBO7cvlObX5oobpoUbyuC38Re6UaU0iipVfK0ST5Nnq3nUTq
	 klHfByAy06OOjFXwXE1ywHyf3KvLfP1N5xB5WpnCQllu33DzG1fKv98EoVzSwp8639
	 LRqX9zAXW3XOBh+PKM9OOlflnHPmkgDENLc2ss2I=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46N8nBpL046063
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 03:49:11 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Jul 2024 03:49:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Jul 2024 03:49:11 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46N8n9tl118788;
	Tue, 23 Jul 2024 03:49:10 -0500
Message-ID: <3b83e67c-bb7b-4123-8351-9bb60b490227@ti.com>
Date: Tue, 23 Jul 2024 14:19:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [scarthgap][PATCH] Added ffmpeg package
 to scarthgap
To: <t-lannynd@ti.com>
References: <20240722221657.157473-1-t-lannynd@ti.com>
Content-Language: en-US
CC: <meta-arago@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240722221657.157473-1-t-lannynd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 46N8nBdX011194
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 23 Jul 2024 08:49:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15463

Hi,

On 23/07/24 03:46, Thorsten Lannynd via lists.yoctoproject.org wrote:
> Added ffmpeg package to scarthgap Signed-off-by: Thorsten Lannynd=20
> <t-lannynd@=E2=80=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/packagegroups/packagegroup-arago-tisdk-multimedia=
.=E2=80=8Abb | 1 + 1=20
> file changed, 1 insertion(+) diff --git=20
> a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk=
-multimedia.=E2=80=8Abb
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> Added ffmpeg package to scarthgap



Is this patch limited to scarthgap or applicable on master branch as well=
?
The commit message & title might need an update if we need this patch in=20
master.

---
Chirag


>
> Signed-off-by: Thorsten Lannynd <t-lannynd@ti.com>
> ---
>   .../packagegroups/packagegroup-arago-tisdk-multimedia.bb         | 1 =
+
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-=
arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/=
packagegroup-arago-tisdk-multimedia.bb
> index 6571d484..2085ad09 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-multimedia.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-t=
isdk-multimedia.bb
> @@ -8,6 +8,7 @@ inherit packagegroup
>  =20
>   MULTIMEDIA =3D " \
>       amsdk-av-files \
> +    ffmpeg \
>       libcamera \
>       libcamera-gst \
>   "
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15462):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15462__;!!G3vK!QAWo4b7tM51pltf97F-SN4=
YnlwGwMxcJcUu7V7bZiR4orkpg1Ml-qB_zMVpgGBQFY1cBjmB7ET1BeOr3RrCjljbnYpdZJi3=
OEGne$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/107495232/7030289__;!!G3vK!QAWo4b7tM51pltf97F-SN4YnlwGwMxcJcUu7V7b=
ZiR4orkpg1Ml-qB_zMVpgGBQFY1cBjmB7ET1BeOr3RrCjljbnYpdZJlv_nBPU$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!QAWo4b7tM51pltf97F-SN4YnlwGwMxcJcUu7V7bZiR4or=
kpg1Ml-qB_zMVpgGBQFY1cBjmB7ET1BeOr3RrCjljbnYpdZJsuZFm5d$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

