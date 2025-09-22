Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D40CCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 19:25:52 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.61374.1758569148548294497
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 12:25:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dXNghTrq;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MJPjfj1300828;
	Mon, 22 Sep 2025 14:25:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758569145;
	bh=ZgGoqDIv52H4NYTpfG+PVksKC4XYmCc36TELN0V4fAg=;
	h=Date:CC:Subject:From:To:References:In-Reply-To;
	b=dXNghTrq0EO42TfyW/fbsN2EWlJQNytt/hQk17BqYJzT3BpvouwmflorpDVoQeKg7
	 VH0lLsxf5ZgFgo3nnxFc5ZAdjgO88QTTijUMohS/YooB/VekSmHP3bzaWY3LaMbvMh
	 RaMGGP3g1llb86sHgHtWTUvOyE+M48vEbf/MafkU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MJPjxs1402377
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 14:25:45 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 14:25:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 14:25:45 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MJPjWN3295679;
	Mon, 22 Sep 2025 14:25:45 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 22 Sep 2025 14:25:45 -0500
Message-ID: <DCZKQGDZYL21.VSHSC8JWZZJ5@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
From: Randolph Sapp <rs@ti.com>
To: PRC Automation <prc@list.ti.com>, Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922184556.3586969-2-rs@ti.com>
 <20250922185018.1666131-1-prc@list.ti.com>
In-Reply-To: <20250922185018.1666131-1-prc@list.ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Sep 2025 19:25:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16612

On Mon Sep 22, 2025 at 1:50 PM CDT, PRC Automation wrote:
> meta-arago / na / 20250922184556.3586969-2-rs
>
> PRC Results: FAIL
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   check-yocto-patches: PASS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> Patches
> ----------------------------------------
> All patches passed
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   apply-yocto-patch: PASS
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> scarthgap
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Summary:
> - Patch Series: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
> - Submitter: From: <rs@ti.com>
> From: Randolph Sapp <rs@ti.com>
> - Date: Date: Mon, 22 Sep 2025 13:45:57 -0500
> - Num Patches: 1
> - Mailing List (public inbox) Commit SHA: 99ee4cd55925bd5cddc29108415cb4e=
5fd1b8979
>
> Applied to:
> - Repository: lcpd-prc-meta-arago
> - Base Branch: scarthgap-wip
> - Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
> - Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
> - Commit SHA: 96f3c5b8e2efec96de9db131992e56272becc174
>
> Patches
> ----------------------------------------
> All patches applied
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
>   check-yocto-repo: FAIL
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> scarthgap
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> FAIL
>     WARN: You might need a " " as the first character for the :append. (A=
PPEND-2)
>         meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:10
>             GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'pa=
m', '', ',nopam', d)}"
>    =20
>     WARN: You might need a " " as the first character for the :append. (A=
PPEND-2)
>         meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:11
>             GO_TAGS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'x1=
1', '', ',noxlib', d)}"
>    =20
>    =20
>     Code Summary
>     =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    =20
>     APPEND-2
>     -------------------------------------------
>       :append simply takes the specified string and concatenates it
>       directly to the variable.  Most of the time we want there to spaces
>       between entries.  This check flags us to check if the missing space
>       is actually needed.

This check in this particular instance is invalid. GO_TAGS is a comma separ=
ated
list of flags. Any whitespace will break parsing of that variable.

