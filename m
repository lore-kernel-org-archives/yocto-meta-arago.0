Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C04C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 13:52:52 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.45002.1710942772041964945
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 06:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=D40pIeNl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42KDqoA8018864;
	Wed, 20 Mar 2024 08:52:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710942770;
	bh=NBXWbZGfFswpiFOSlMmIgiqYWOU1QDOgARFjyelwx5w=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=D40pIeNlZdhA5RTQm7s19jSKTEZOtu+Z9RLYVxc0vC2jDUjs3BdvgVDUR3eY10OtS
	 0++vV4mvyDb6PDP3vHiM45d/++JctwByaNF16N21xZjl76ZXzY25ZyZn6bhxnWg7d/
	 qdSDWxjBB4iBKI8Xdx9psR5T/jJFVgEBdDiUMbU0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42KDqo8P129968
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 08:52:50 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 08:52:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 08:52:50 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42KDqmXG041156;
	Wed, 20 Mar 2024 08:52:49 -0500
Message-ID: <74cd7a57-f3a8-441c-b658-e9c604139b39@ti.com>
Date: Wed, 20 Mar 2024 19:22:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][master/scarthgap][PATCH] linux-firmware:
 Remove Intel 9260 modules
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240320132738.23778-1-reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240320132738.23778-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 42KDqoA8018864
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Mar 2024 13:52:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15244


On 20/03/24 18:57, Ryan Eatmon via lists.yoctoproject.org wrote:
> oe-core has added the 9260 modules to the upstream linux-firmware=20
> recipe[1], so having these entries causes a QA error with duplicate=20
> packaging. As these are no longer needed, we can remove them. [1]=20
> https:=E2=80=8A//urldefense.=E2=80=8Acom/v3/__https:=E2=80=8A//git.=E2=80=
=8Aopenembedded.=E2=80=8Aorg/openembedded-core/commit/?id=3Dd924307b9cee4=
065ff60d08e3b4298278693ff2c__;!!G3vK!SfuCIDcoffMslhj_VzLJdqT-Am1fCeSSFtH2=
uC1P5P8Ds_2MADtjKs_VQY4XrzmM050j6qhyoNJ67jU0nESo_09NGjZiS_yxBA$
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> oe-core has added the 9260 modules to the upstream linux-firmware
> recipe[1], so having these entries causes a QA error with duplicate
> packaging.  As these are no longer needed, we can remove them.
>
> [1]https://urldefense.com/v3/__https://git.openembedded.org/openembedde=
d-core/commit/?id=3Dd924307b9cee4065ff60d08e3b4298278693ff2c__;!!G3vK!Sfu=
CIDcoffMslhj_VzLJdqT-Am1fCeSSFtH2uC1P5P8Ds_2MADtjKs_VQY4XrzmM050j6qhyoNJ6=
7jU0nESo_09NGjZiS_yxBA$
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>

Acked-by: Chirag Shilwant <c-shilwant@ti.com>


> ---
>   .../recipes-kernel/linux-firmware/linux-firmware_%.bbappend   | 4 ---=
-
>   1 file changed, 4 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firm=
ware_%.bbappend b/meta-arago-distro/recipes-kernel/linux-firmware/linux-f=
irmware_%.bbappend
> index d4f3e679..cb9573a1 100644
> --- a/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.=
bbappend
> +++ b/meta-arago-distro/recipes-kernel/linux-firmware/linux-firmware_%.=
bbappend
> @@ -1,15 +1,11 @@
>   PR:append =3D ".arago1"
>  =20
> -PACKAGES =3D+ "${PN}-iwlwifi-9260"
>   PACKAGES =3D+ "${PN}-ibt-18"
>  =20
> -LICENSE:${PN}-iwlwifi-9260 =3D "Firmware-iwlwifi_firmware"
>   LICENSE:${PN}-ibt-18 =3D "Firmware-ibt_firmware"
>  =20
> -FILES:${PN}-iwlwifi-9260 =3D "${nonarch_base_libdir}/firmware/iwlwifi-=
9260-*.ucode"
>   FILES:${PN}-ibt-18 =3D "${nonarch_base_libdir}/firmware/intel/ibt-18-=
*.sfi ${nonarch_base_libdir}/firmware/intel/ibt-18-*.ddc"
>  =20
> -RDEPENDS:${PN}-iwlwifi-9260 +=3D "${PN}-iwlwifi-license"
>   RDEPENDS:${PN}-ibt-18 +=3D "${PN}-ibt-license"
>  =20
>   do_install:append() {
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15243):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15243__;!!G3vK!SfuCIDcoffMslhj_VzLJdq=
T-Am1fCeSSFtH2uC1P5P8Ds_2MADtjKs_VQY4XrzmM050j6qhyoNJ67jU0nESo_09NGjbevhP=
n7w$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/105044295/7030289__;!!G3vK!SfuCIDcoffMslhj_VzLJdqT-Am1fCeSSFtH2uC1=
P5P8Ds_2MADtjKs_VQY4XrzmM050j6qhyoNJ67jU0nESo_09NGjadhud0Jw$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!SfuCIDcoffMslhj_VzLJdqT-Am1fCeSSFtH2uC1P5P8Ds=
_2MADtjKs_VQY4XrzmM050j6qhyoNJ67jU0nESo_09NGjYGK809dw$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

