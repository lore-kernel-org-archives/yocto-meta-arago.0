Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E739BCED628
	for <webhook@archiver.kernel.org>; Wed,  9 Oct 2024 08:07:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11138.1728461227601349235
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 09 Oct 2024 01:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=rwx6gEW9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 499876tL130797;
	Wed, 9 Oct 2024 03:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728461226;
	bh=ZzCEIiTEiWUtJsNF1bPOc665SevTKJ5qP6QQFBwbBuE=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=rwx6gEW9xnKZNzEY+FYqloh9dA/MI8xksWhRCIT/NWgUHLDLpCG+NstyC2xiIAwCU
	 xJ9E2y2vpcj4p1w8G/sVf246v29cVsJus+IIhv5Xsuj1Dxka9UTOula5SlaYCSueJx
	 lpsZOuglkpx8+pk4fytvPI9lshy6LVJg/Rg5ncio=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 499876Kn078207
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 9 Oct 2024 03:07:06 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 9
 Oct 2024 03:07:05 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 9 Oct 2024 03:07:05 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4998737O046113;
	Wed, 9 Oct 2024 03:07:04 -0500
Message-ID: <220aee0f-aa10-4073-acb5-1311e2096e09@ti.com>
Date: Wed, 9 Oct 2024 13:37:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-arago][master/scarthgap][PATCH]
 packagegroup-arago-base: Add lldpd package
To: <s-vadapalli@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20240927084635.1182552-1-s-vadapalli@ti.com>
 <98ae4444-e803-4f69-b5ae-4c6bd9ff4af2@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <98ae4444-e803-4f69-b5ae-4c6bd9ff4af2@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by lelv0143.ext.ti.com id 499876tL130797
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 09 Oct 2024 08:07:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15565

Hi,
On 09/10/24 11:14, Siddharth Vadapalli via lists.yoctoproject.org wrote:
> On Fri, Sep 27, 2024 at 02:=E2=80=8A16:=E2=80=8A35PM +0530, Siddharth V=
adapalli wrote:=20
> Please review and merge this patch in case of no concerns. Regards,=20
> Siddharth. > Add the lldpd package to support LLDP (Link Layer=20
> Discovery Protocol). > > Signed-off-by:=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uRdrPB2l1u2bqoXOn=
dODvyeyg2FHiJBgQr50WwSjbUPPZQfLtwfySaFvfaxEXZMcmp00Jl9prkNhisvnGQcHX1wt0Z=
k$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Fri, Sep 27, 2024 at 02:16:35PM +0530, Siddharth Vadapalli wrote:
>
> Please review and merge this patch in case of no concerns.


The patch is already pulled in scarthgap-next branch of meta-arago [1]
& is waiting for a cicd promotion before it moves to scarthgap

[1]:=20
https://git.ti.com/cgit/arago-project/meta-arago/commit/?h=3Dscarthgap-ne=
xt&id=3D30fb90c42c4fab9cc7d5a6aa2a57f97d2c4fb956

---
Chirag

> Regards,
> Siddharth.

