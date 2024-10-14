Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B995CD16265
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 13:36:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.55050.1728913011066893969
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 14 Oct 2024 06:36:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=ZMUYbCEr;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49EDaoJh111152
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 08:36:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728913010;
	bh=Mbt+n9h2BauMsDdL883xsStEIzTSLTKIf7KWwNpF2SY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=ZMUYbCErlaOG70TYZHmdzZlNkd383EVkLyHzzrAZOSJ3FVHjS3LrF+GORtnmGpfXH
	 uac3svzwdH9Kblweb8bv4a+GHUGrXayTSXd0v4JTdkH5tVUvw3N3wj5VzMyo6YJ3Vl
	 NJFn0y/YpD330rDtXYe5LwSH5kfPo2jtJ99xT9PI=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49EDaoJS112386
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 08:36:50 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 14
 Oct 2024 08:36:50 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 14 Oct
 2024 08:36:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 14 Oct 2024 08:36:50 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49EDanI6053711
	for <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 08:36:49 -0500
Message-ID: <e52c4670-23e3-4759-be50-db0da611f05c@ti.com>
Date: Mon, 14 Oct 2024 19:06:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-arago] [master][PATCH] layer.conf: add
 compatibility with walnascar
To: <meta-arago@lists.yoctoproject.org>
References: <20241012211925.54869-1-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241012211925.54869-1-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0142.ext.ti.com id 49EDaoJh111152
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 14 Oct 2024 13:36:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15572

Hi,
On 13/10/24 02:49, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> The next=
 Yocto Project=20
> release is called walnascar and OE-Core master branch is now marked=20
> accordingly. Add layer compatibility with walnascar. Signed-off-by:=20
> Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom>
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!ubdqXRfP9k0bCkYkH=
PKjnFCqm-DVtifwp_4B7wsFMAJ4PQh4r-qpBCRU96ATv6uuYEnFvM8KI_7fDI2Cg6JD$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> The next Yocto Project release is called walnascar and OE-Core master b=
ranch
> is now marked accordingly. Add layer compatibility with walnascar.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>


Acked-by: Chirag Shilwant <c-shilwant@ti.com>

> ---
>   meta-arago-demos/conf/layer.conf  | 2 +-
>   meta-arago-distro/conf/layer.conf | 2 +-
>   meta-arago-extras/conf/layer.conf | 2 +-
>   meta-arago-test/conf/layer.conf   | 2 +-
>   4 files changed, 4 insertions(+), 4 deletions(-)

