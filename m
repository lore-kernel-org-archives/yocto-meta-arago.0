Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7D5E69E9A
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 22:13:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5583.1733177600362500671
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Dec 2024 14:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DmMtsfRR;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MDIj71527683
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 2 Dec 2024 16:13:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733177599;
	bh=v7ByQN+izuF03T3dhe/kfLNCjuAJNl2xns1QDMX/tMo=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=DmMtsfRRFdJka2gX9Desp8bo/u8NXawLuPXH4J78Ls4ubkce4twjc5n5jx+Xs/bvT
	 Co++PvkGjNQxB3qZEmnk/SOJDPgrToiD/SaVjBglCmGvyN5U4nPUPm25AOjYu21+6T
	 53gz2lXJOfUJ2c1zghiBqv2PBEbDqdOJvjhfnLho=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2MDISo059355
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Dec 2024 16:13:18 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 16:13:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 16:13:18 -0600
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2MDIQ8062887;
	Mon, 2 Dec 2024 16:13:18 -0600
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 2 Dec 2024 16:13:18 -0600
Message-ID: <D61K6KX8S03X.2Z7KWEQBVUQL2@ti.com>
Subject: Re: [meta-arago][master][PATCH 2/4] vulkan-cts: Update to newer
 vulkan version
From: Randolph Sapp <rs@ti.com>
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys Dmytriyenko"
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241130225244.12367-1-reatmon@ti.com>
 <20241130225244.12367-2-reatmon@ti.com>
In-Reply-To: <20241130225244.12367-2-reatmon@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Dec 2024 22:13:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15635

On Sat Nov 30, 2024 at 4:52 PM CST, Ryan Eatmon via lists.yoctoproject.org =
wrote:
> Upstream moved to a later vulkan version and the bbappend no longer
> applied.  Since the bbappend is just adding a compile flag, move the
> file to match all versions.
>
> Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> ---
>  .../{vulkan-cts_1.3.7.3.bbappend =3D> vulkan-cts_%.bbappend}        | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-arago-distro/recipes-graphics/vk-gl-cts/{vulkan-cts_1.3.7.3.=
bbappend =3D> vulkan-cts_%.bbappend} (100%)
>
> diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.=
7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_%.bb=
append
> similarity index 100%
> rename from meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7=
.3.bbappend
> rename to meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_%.bbapp=
end

Sorry for the delayed review. This append can be removed entirely. The
equivalent patch was merged into meta-openembedded.

- Randolph

