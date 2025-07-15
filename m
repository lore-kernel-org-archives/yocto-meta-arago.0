Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0110C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.3803.1752607178972752902
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 12:19:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tzZeYp2r;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FJJbGl077629
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Jul 2025 14:19:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752607177;
	bh=S1r2lqPt/1vQLhr+xmPzvaqGYgjLQSR2d4rKZNi3XuY=;
	h=Date:Subject:From:To:References:In-Reply-To;
	b=tzZeYp2rWtiJjdpzPJwib0KcDPpLpwGqm60gB+lBYcSry4zTgwCcQ6JYPaXjruE1Z
	 YgqdrEx8btaH0OqpeZUXBgsvXNnqAffzWkNf5/B/Q3/KDUXLKsyXDZL+qA+8kUaL2w
	 z83ACBjFpM4Nc1c2mIyaYlNmFmaRprIcx83MjxM4=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FJJbtP799720
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 15 Jul 2025 14:19:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 14:19:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 14:19:37 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FJJb5l3100381;
	Tue, 15 Jul 2025 14:19:37 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 15 Jul 2025 14:19:37 -0500
Message-ID: <DBCVE6AXNT6Y.1ELH4UN4EH9LX@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v3 1/2] meta-arago-test:
 recipes-graphics: Add lightweight off-screen demo
From: Randolph Sapp <rs@ti.com>
To: <a-christidis@ti.com>, <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250714184201.1119178-1-a-christidis@ti.com>
 <20250714184201.1119178-2-a-christidis@ti.com>
In-Reply-To: <20250714184201.1119178-2-a-christidis@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Jul 2025 19:19:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16303

On Mon Jul 14, 2025 at 1:42 PM CDT, a-christidis wrote:
> From: Antonios Christidis <a-christidis@ti.com>
>
> Add recipe for lightweight off-screen rendering demo.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---
>
> v3:
> - Changed SRC_URI
>
> v2:
> - Removed mesa-pvr as a dependency
>
>  .../offscreen-demo/offscreendemo_0.0.1.bb        | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 meta-arago-test/recipes-graphics/offscreen-demo/offsc=
reendemo_0.0.1.bb
>
> diff --git a/meta-arago-test/recipes-graphics/offscreen-demo/offscreendem=
o_0.0.1.bb b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_=
0.0.1.bb
> new file mode 100644
> index 00000000..0cdfaf9a
> --- /dev/null
> +++ b/meta-arago-test/recipes-graphics/offscreen-demo/offscreendemo_0.0.1=
.bb
> @@ -0,0 +1,16 @@
> +SUMMARY =3D "Lightweight Render Example"
> +DESCRIPTION =3D "Lightweight Render Example. Heavily inspired by Eduardo=
 Lima's gpu-playground, this attempts to act as the smallest demo of offscr=
een rendering."
> +
> +HOMEPAGE =3D "https://github.com/StaticRocket/lightweight-offscreen"
> +
> +SRC_URI =3D "git://github.com/StaticRocket/lightweight-offscreen.git;pro=
tocol=3Dhttps;branch=3Dmaster"

Both of these should point to https://github.com/TexasInstruments/graphics-=
tests
as I've been requested to move all custom tests under that repository.

> +SRCREV =3D "eac40e0073cb5f81688aee890e0a67f99678a290"
> +
> +LICENSE =3D "CC0-1.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS +=3D "virtual/egl virtual/libgles2"
> +
> +inherit pkgconfig meson


