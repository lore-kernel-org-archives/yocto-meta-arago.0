Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B10EAC4345F
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:37:49 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13838.1713249460313514888
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 15 Apr 2024 23:37:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=eThlRe6Z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43G6baPw030210;
	Tue, 16 Apr 2024 01:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713249456;
	bh=oOMSFooimESTJlMbc6Se7ELhZS7AT4qZJ8HAxRf+yy8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=eThlRe6ZPiyg+OP8jP1/7dUy4qZbgXAecMbnpxYvEtzcqLyLVHahnA1QuM+7m57bU
	 hm941omXeiLSyUMp2ORbhze6lM/6Ij8fGBZb7H7tVOrGLOUKaswiQU94/b6dDmVsCX
	 hclREqDebC21kyzX1pcNYW4x+GFw7eV9WAZiw7TI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43G6babJ008645
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 01:37:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 01:37:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 01:37:36 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43G6bY0f042053;
	Tue, 16 Apr 2024 01:37:34 -0500
Message-ID: <2636a20d-6d1a-40d0-abc4-2d97653764b6@ti.com>
Date: Tue, 16 Apr 2024 12:07:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] meta-arago-extras:
 packagegroups: Fix QA Issue
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
References: <17C6AE87F40E31DD.13290@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17C6AE87F40E31DD.13290@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 43G6baPw030210
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 16 Apr 2024 06:37:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15289

Just a head's up,

Note that the reason to send the patch on scarthgap only is to ensure tha=
t
we don't break compatibility with all the older releases we have listed i=
n
LAYERSERIES_COMPAT in arago master [1] as "inherit_defer" was added in=20
bitbake's latest versions
and someone using arago master:HEAD & bitbake 2.0 for |kirkstone|based=20
buildwill face build issues
related to inherit_defer.

[1]:=20
https://git.ti.com/cgit/arago-project/meta-arago/tree/meta-arago-distro/c=
onf/layer.conf#n11

On 16/04/24 11:53, Chirag Shilwant via lists.yoctoproject.org wrote:
> - Since packagegroup.=E2=80=8Abbclass is using inherit_defer in oe-core=
, some=20
> classes are now appearing after nativesdk resulting in following QA=20
> errors. ``` QA Issue: nativesdk-packagegroup-arago-tisdk-host:=20
> native/nativesdk class is not inherited
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> - Since packagegroup.bbclass is using inherit_defer in oe-core, some cl=
asses are
> now appearing after nativesdk resulting in following QA errors.
>
>   ```
>    QA Issue: nativesdk-packagegroup-arago-tisdk-host: native/nativesdk =
class is not inherited last, this can result in unexpected behaviour. Cla=
sses inherited after native/nativesdk: allarch.bbclass [native-last]
>    QA Issue: nativesdk-packagegroup-arago-qte-toolchain-host: native/na=
tivesdk class is not inherited last, this can result in unexpected behavi=
our. Classes inherited after native/nativesdk: allarch.bbclass [native-la=
st]
>
>   ```
>
> - To fix this issue, use inherit_defer that was added in bitbake recent=
ly [1].
>
> [1]:https://urldefense.com/v3/__https://github.com/openembedded/bitbake=
/commit/5c2e840eafeba1f0f754c226b87bfb674f7bea29__;!!G3vK!XlpMRQ0dPBA3Up6=
LIrRyo2n5gEKzSXWswqZ4IyG9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGLw0=
V9We6idkBab_$
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>   .../nativesdk-packagegroup-arago-qte-toolchain-host.bb         | 3 ++=
-
>   .../packagegroups/nativesdk-packagegroup-arago-tisdk-host.bb   | 3 ++=
-
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-pac=
kagegroup-arago-qte-toolchain-host.bb b/meta-arago-extras/recipes-core/pa=
ckagegroups/nativesdk-packagegroup-arago-qte-toolchain-host.bb
> index 4d2a98ad..23c45abf 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegro=
up-arago-qte-toolchain-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegro=
up-arago-qte-toolchain-host.bb
> @@ -2,7 +2,8 @@ DESCRIPTION =3D "Host packages for Qt Embedded SDK"
>   PR =3D "r10"
>   LICENSE =3D "MIT"
>  =20
> -inherit packagegroup nativesdk
> +inherit packagegroup
> +inherit_defer nativesdk
>  =20
>   RDEPENDS:${PN} =3D "\
>       nativesdk-packagegroup-arago-tisdk-host \
> diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-pac=
kagegroup-arago-tisdk-host.bb b/meta-arago-extras/recipes-core/packagegro=
ups/nativesdk-packagegroup-arago-tisdk-host.bb
> index 7e77d12f..92a80b6b 100644
> --- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegro=
up-arago-tisdk-host.bb
> +++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegro=
up-arago-tisdk-host.bb
> @@ -2,7 +2,8 @@ SUMMARY =3D "Host packages for a standalone Arago SDK w=
ith TI tools"
>   PR =3D "r2"
>   LICENSE =3D "MIT"
>  =20
> -inherit packagegroup nativesdk
> +inherit packagegroup
> +inherit_defer nativesdk
>  =20
>   PACKAGEGROUP_DISABLE_COMPLEMENTARY =3D "1"
>  =20
> --=20
> 2.34.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15288):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15288__;!!G3vK!XlpMRQ0dPBA3Up6LIrRyo2=
n5gEKzSXWswqZ4IyG9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGLw0V9We6o9=
8rRzM$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/105552307/7030289__;!!G3vK!XlpMRQ0dPBA3Up6LIrRyo2n5gEKzSXWswqZ4IyG=
9eG84QRRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGLw0V9We6gD5pc05$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!XlpMRQ0dPBA3Up6LIrRyo2n5gEKzSXWswqZ4IyG9eG84Q=
RRtFjpT5b7c1euiHHKkt_TsDxD6JXb0myK8YtlEGLw0V9We6kxhMuoK$  [c-shilwant@ti.=
com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

