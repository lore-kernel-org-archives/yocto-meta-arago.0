Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 989CFC27C4F
	for <webhook@archiver.kernel.org>; Wed, 26 Jun 2024 08:23:58 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.20949.1719390228395430991
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jun 2024 01:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=fmN0MUmQ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45Q8Nj4T053303;
	Wed, 26 Jun 2024 03:23:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719390225;
	bh=4rt8JPMo+L6KHyycfQqXueEuqlsD16vc+r2uwfpaWWY=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fmN0MUmQsfYJ1hvRJOBskyOMnu8pnC+eZie46kAQs7uQD5FyjaGvJx1UErba18XR3
	 4EC4fB8gXjzCNBeJei+pzfZVENSLgrQAg0pWzf1nN+RIqZ5hBLGclmkBJWlm6GtB+L
	 yF3ELlBFwhsVcjIGKnLx7aKVp2qrDd5X/nc88MlM=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45Q8Nj8b062064
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Jun 2024 03:23:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Jun 2024 03:23:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Jun 2024 03:23:44 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45Q8NfgN000402;
	Wed, 26 Jun 2024 03:23:42 -0500
Message-ID: <565aebb1-5a94-4a74-bd40-0dd27c4a2383@ti.com>
Date: Wed, 26 Jun 2024 13:53:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago][scarthgap/master][PATCH] ti-test: add
 wayland-utils as a extra dep
To: <meta-arago@lists.yoctoproject.org>
CC: <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>, <rs@ti.com>,
        Gyan Gupta <g-gupta@ti.com>
References: <20240625163911.2015788-1-rs@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240625163911.2015788-1-rs@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 45Q8Nj4T053303
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 26 Jun 2024 08:23:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15414

On 25/06/24 22:09, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@=E2=80=8Ati.=E2=80=8Acom> Add wayland-utils for=
 Weston related=20
> ltp-ddt tests now that the built in weston-info has been deprecated in=20
> favor of wayland-info. Signed-off-by: Randolph Sapp <rs@=E2=80=8Ati.=E2=
=80=8Acom> ---=20
> meta-arago-test/recipes-core/packagegroups/ti-test.=E2=80=8Abb
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> From: Randolph Sapp <rs@ti.com>
>
> Add wayland-utils for Weston related ltp-ddt tests now that the built i=
n
> weston-info has been deprecated in favor of wayland-info.
>
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---

Acked-by: Chirag Shilwant <c-shilwant@ti.com>

>   meta-arago-test/recipes-core/packagegroups/ti-test.bb | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-arago-test/recipes-core/packagegroups/ti-test.bb b/me=
ta-arago-test/recipes-core/packagegroups/ti-test.bb
> index 8cb27f21..0b189487 100644
> --- a/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> +++ b/meta-arago-test/recipes-core/packagegroups/ti-test.bb
> @@ -56,6 +56,7 @@ TI_TEST_BASE =3D "\
>   TI_TEST_EXTRAS =3D " \
>       piglit \
>       python3-numpy \
> +    wayland-utils \
>   "
>  =20
>   TI_TEST_BASE:append:armv7a =3D " \
> --=20
> 2.45.1
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15412):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-arago/message/15412__;!!G3vK!WNOx0p9_w51_KkPmug65oc=
Jj7r0QCfFLw1UDYfDDbXMQJKn5vfAdciMb7didq0UtcEHXNqIr3Zhi8DlfEsDIQNJ2VmM$
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/106873263/7030289__;!!G3vK!WNOx0p9_w51_KkPmug65ocJj7r0QCfFLw1UDYfD=
DbXMQJKn5vfAdciMb7didq0UtcEHXNqIr3Zhi8DlfEsDIHQp2vDU$
> Group Owner: meta-arago+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-arago/unsub__;!!G3vK!WNOx0p9_w51_KkPmug65ocJj7r0QCfFLw1UDYfDDbXMQJ=
Kn5vfAdciMb7didq0UtcEHXNqIr3Zhi8DlfEsDIcG6oBCM$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

