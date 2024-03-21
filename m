Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 489F5C54E68
	for <webhook@archiver.kernel.org>; Thu, 21 Mar 2024 04:22:56 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.693.1710994974788659680
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 21:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=evVo1w+v;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: c-shilwant@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42L4Mrjt017575;
	Wed, 20 Mar 2024 23:22:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710994973;
	bh=3bo6o4iKi2in0q6yl8Y4Gg5YVG0QJZvcEJLRjjzSk14=;
	h=Date:Subject:To:References:CC:From:In-Reply-To;
	b=evVo1w+vsL1Gjruer94ShzkKeV/6OwFEmMWLPvPNKnCm3Xoi5T385NiTPeSDXHUft
	 dPIu2a5WNjQJyVwJ0wLMniJg7fPhGxdJZ9qW7nqkEu6Rjyb1t9TQsrJA9WYRsKz5j+
	 BUueWPy+hPuj1htTiWdPsj4vaPWIz7LT80I0vyFw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42L4MrQ4084438
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 23:22:53 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 23:22:52 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 23:22:52 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42L4MovL021261;
	Wed, 20 Mar 2024 23:22:51 -0500
Message-ID: <3e343cf5-61af-43a0-ae52-ead498b1d050@ti.com>
Date: Thu, 21 Mar 2024 09:52:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap][PATCH] README: update with
 scarthgap specific info
Content-Language: en-US
To: <meta-arago@lists.yoctoproject.org>
References: <20240320200531.24045-1-reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>, <reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240320200531.24045-1-reatmon@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0016.ext.ti.com id 42L4Mrjt017575
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Mar 2024 04:22:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15247

Hi Ryan,

On 21/03/24 01:35, Ryan Eatmon via lists.yoctoproject.org wrote:
> All READMEs were still mentioning master, update that. Signed-off-by:=20
> Ryan Eatmon <reatmon@=E2=80=8Ati.=E2=80=8Acom> --- meta-arago-demos/REA=
DME | 14=20
> +++++++------- meta-arago-distro/README | 16 ++++++++--------=20
> meta-arago-extras/README | 14 +++++++-------
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> All READMEs were still mentioning master, update that.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>   meta-arago-demos/README  | 14 +++++++-------
>   meta-arago-distro/README | 16 ++++++++--------
>   meta-arago-extras/README | 14 +++++++-------
>   meta-arago-test/README   | 12 ++++++------
>   4 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/meta-arago-demos/README b/meta-arago-demos/README
> index bb586c14..8d40e48e 100644
> --- a/meta-arago-demos/README
> +++ b/meta-arago-demos/README
> @@ -1,30 +1,30 @@
>   meta-arago-demos provides demo applications to showcase in TI SDK pro=
ducts
>  =20
> -This layer works with the latest Yocto Project release (currently 2.2+=
) and tracks
> -the stable/maintenance branches (currently "master") of the correspond=
ing layers:
> +This layer works with the latest Yocto Project release (currently 5.0+=
) and tracks
> +the stable/maintenance branches (currently "scarthgap") of the corresp=
onding layers:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta
>  =20
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>  =20
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>  =20
>   URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5_=
_;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2ii=
x_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>  =20
>   Send pull requests to meta-arago@lists.yoctoproject.org
> diff --git a/meta-arago-distro/README b/meta-arago-distro/README
> index 49e9d9e1..8712de4e 100644
> --- a/meta-arago-distro/README
> +++ b/meta-arago-distro/README
> @@ -1,34 +1,34 @@
>   meta-arago-distro provides Arago distribution configuration for TI SD=
K products
>  =20
> -This layer works with the latest Yocto Project release (currently 2.2+=
) and tracks
> -the stable/maintenance branches (currently "master") of the correspond=
ing layers:
> +This layer works with the latest Yocto Project release (currently 5.0+=
) and tracks
> +the stable/maintenance branches (currently "scarthgap") of the corresp=
onding layers:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta
>  =20
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>  =20
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>  =20
>   URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5_=
_;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2ii=
x_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
> -branch: master
> +branch: scarthgap


Hold on, looks like meta-qt5 still hasn't created a scratchgap branch -=20
https://github.com/meta-qt5/meta-qt5/tree/scratchgap


>   revision: HEAD
>  =20
>   URI: git://git.yoctoproject.org/meta-arago
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-arago-extras
>  =20
> diff --git a/meta-arago-extras/README b/meta-arago-extras/README
> index 5b6e8a15..58ac7df2 100644
> --- a/meta-arago-extras/README
> +++ b/meta-arago-extras/README
> @@ -1,30 +1,30 @@
>   meta-arago-extras provides additional TI SDK applications that are di=
stro-agnostic
>  =20
> -This layer works with the latest Yocto Project release (currently 2.2+=
) and tracks
> -the stable/maintenance branches (currently "master") of the correspond=
ing layers:
> +This layer works with the latest Yocto Project release (currently 5.0+=
) and tracks
> +the stable/maintenance branches (currently "scarthgap") of the corresp=
onding layers:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta
>  =20
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>  =20
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>  =20
>   URI:https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5_=
_;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2ii=
x_C6327YVmzoUSbm_RXGBQsrl8nrOtf_Tw$
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>  =20
>   Send pull requests to meta-arago@lists.yoctoproject.org
> diff --git a/meta-arago-test/README b/meta-arago-test/README
> index 8f1f9993..5aa96cd2 100644
> --- a/meta-arago-test/README
> +++ b/meta-arago-test/README
> @@ -1,25 +1,25 @@
>   meta-arago-test provides an additional packagegroup ti-test and some =
of the recipes that go into that group
>  =20
> -This layer works with the latest Yocto Project release (currently 2.2+=
) and tracks
> -the stable/maintenance branches (currently "master") of the correspond=
ing layers:
> +This layer works with the latest Yocto Project release (currently 5.0+=
) and tracks
> +the stable/maintenance branches (currently "scarthgap") of the corresp=
onding layers:
>  =20
>   URI: git://git.openembedded.org/openembedded-core
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta
>  =20
>   URI: git://git.yoctoproject.org/meta-ti
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-ti-bsp, meta-ti-extras
>  =20
>   URI: git://git.yoctoproject.org/meta-arm
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-arm, meta-arm-toolchain
>  =20
>   URI: git://git.openembedded.org/meta-openembedded
> -branch: master
> +branch: scarthgap
>   revision: HEAD
>   layers: meta-oe, meta-networking, meta-python
>  =20
> --=20
> 2.17.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15245):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15245__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAF=
n5SH7_aIUs2NHDS9ndNVtHM_fjh5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8m0k0T=
xog$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/105052432/7030289__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9n=
dNVtHM_fjh5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8lFzaQ9Gg$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!VlsuZXvQH9k6KFvUdbwNAFn5SH7_aIUs2NHDS9ndNVtHM=
_fjh5l_avqOR9pwH2iix_C6327YVmzoUSbm_RXGBQsrl8kep7nvNw$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

