Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97E0C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 06:48:12 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6299.1707806888289036519
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 22:48:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bZj0pES/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41D6m3GX014506;
	Tue, 13 Feb 2024 00:48:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707806883;
	bh=KnhfBSmjDwpxzCTSraiX6EF00B4skc8AJp9RQkqbvM0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bZj0pES/m7fG02cWFnRbsv3OommvC4FsyTRtWOO8bPnitQIDOLEos34exYPfrto1x
	 GQbKAIhI9BbOjUeG2m6BtZdJFF4jZ3nJB9KZxeiPimWlOOGqptcvm0O5SK5b6fPVNU
	 MuAf0daAVkvd74dlvuzeanmwniWWt1r6SJGuzpKI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41D6m3lB017670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Feb 2024 00:48:03 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 13
 Feb 2024 00:48:02 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 13 Feb 2024 00:48:03 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41D6m1JY098962;
	Tue, 13 Feb 2024 00:48:02 -0600
Message-ID: <fd46d804-07f2-403b-9fd2-deeee00b4c48@ti.com>
Date: Tue, 13 Feb 2024 12:18:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [master][PATCH] layer.conf: add
 compatibility with scarthgap
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>
References: <20240213032513.3884498-1-denis@denix.org>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240213032513.3884498-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 41D6m3GX014506
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 13 Feb 2024 06:48:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15173

On 13/02/24 08:55, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> OE-Core =
master has=20
> switched compatibility requirements from nanbield to scarthgap in=20
> preparation for the upcoming 5.=E2=80=8A0 release.=20
> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//wiki.=E2=
=80=8Ayoctoproject.=E2=80=8Aorg/wiki/Releases__;!!G3vK!XIUsnlrsl_wVVsG9OQ=
3m5Eq5nveRgXV7W1UvD08ey_yYC9RCCuvq6c-YqTRZ8xSExk7V6iMImqp1$
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> OE-Core master has switched compatibility requirements from nanbield
> to scarthgap in preparation for the upcoming 5.0 release.
> https://urldefense.com/v3/__https://wiki.yoctoproject.org/wiki/Releases=
__;!!G3vK!XIUsnlrsl_wVVsG9OQ3m5Eq5nveRgXV7W1UvD08ey_yYC9RCCuvq6c-YqTRZ8xS=
Exk7V6iMImqp1$
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-arago-demos/conf/layer.conf  | 2 +-
>   meta-arago-distro/conf/layer.conf | 2 +-
>   meta-arago-extras/conf/layer.conf | 2 +-
>   meta-arago-test/conf/layer.conf   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta-arago-demos/conf/layer.conf b/meta-arago-demos/conf/l=
ayer.conf
> index ad443057..bcfbf0de 100644
> --- a/meta-arago-demos/conf/layer.conf
> +++ b/meta-arago-demos/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-demos"
>   BBFILE_PATTERN_meta-arago-demos :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-demos =3D "10"
>  =20
> -LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore=
 nanbield"
> +LAYERSERIES_COMPAT_meta-arago-demos =3D "kirkstone langdale mickledore=
 nanbield scarthgap"
>  =20
>   LAYERDEPENDS_meta-arago-demos =3D " \
>       core \
> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf=
/layer.conf
> index 086b0411..6d0a071d 100644
> --- a/meta-arago-distro/conf/layer.conf
> +++ b/meta-arago-distro/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-distro"
>   BBFILE_PATTERN_meta-arago-distro :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-distro =3D "10"
>  =20
> -LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledor=
e nanbield"
> +LAYERSERIES_COMPAT_meta-arago-distro =3D "kirkstone langdale mickledor=
e nanbield scarthgap"
>  =20
>   LAYERDEPENDS_meta-arago-distro =3D " \
>       core \
> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf=
/layer.conf
> index be84afb8..1a415e89 100644
> --- a/meta-arago-extras/conf/layer.conf
> +++ b/meta-arago-extras/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-extras"
>   BBFILE_PATTERN_meta-arago-extras :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-extras =3D "10"
>  =20
> -LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledor=
e nanbield"
> +LAYERSERIES_COMPAT_meta-arago-extras =3D "kirkstone langdale mickledor=
e nanbield scarthgap"
>  =20
>   # Set a variable to get to the top of the metadata location
>   ARAGOBASE :=3D '${@os.path.normpath("${LAYERDIR}/../")}'
> diff --git a/meta-arago-test/conf/layer.conf b/meta-arago-test/conf/lay=
er.conf
> index f31d69c4..3d23e5de 100644
> --- a/meta-arago-test/conf/layer.conf
> +++ b/meta-arago-test/conf/layer.conf
> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS +=3D "meta-arago-test"
>   BBFILE_PATTERN_meta-arago-test :=3D "^${LAYERDIR}/"
>   BBFILE_PRIORITY_meta-arago-test =3D "10"
>  =20
> -LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore =
nanbield"
> +LAYERSERIES_COMPAT_meta-arago-test =3D "kirkstone langdale mickledore =
nanbield scarthgap"
>  =20
>   # Set a variable to get to the top of the metadata location
>   TITESTBASE :=3D '${@os.path.normpath("${LAYERDIR}/")}'
> --=20
> 2.25.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15171):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15171__;!!G3vK!XIUsnlrsl_wVVsG9OQ3m5E=
q5nveRgXV7W1UvD08ey_yYC9RCCuvq6c-YqTRZ8xSExk7V6jJe2aU3$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/104326456/7030289__;!!G3vK!XIUsnlrsl_wVVsG9OQ3m5Eq5nveRgXV7W1UvD08=
ey_yYC9RCCuvq6c-YqTRZ8xSExk7V6mf8S6C3$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!XIUsnlrsl_wVVsG9OQ3m5Eq5nveRgXV7W1UvD08ey_yYC=
9RCCuvq6c-YqTRZ8xSExk7V6jODvYJ9$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

