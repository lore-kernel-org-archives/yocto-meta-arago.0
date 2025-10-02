Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13143CAC5B8
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:45:28 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.9415.1759412718491200966
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sOKzWfz2;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592DjHA92891079;
	Thu, 2 Oct 2025 08:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759412717; i=@ti.com;
	bh=6pykqLo5lvRH5qtWVG48Hw91Bz+/Q9nLDdaC1ILJsDw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sOKzWfz2WViZk+oSGbEpM1ydZ0aVpMGh/7/wEGdKLV7JzXfLhh+Jltz3yTepI7Xi+
	 ZAXXW8yEAnFumrWTzpjs8DU0DZ0QwXFDNjtoLTAKLh9YFxg8tajCukhyWSd/JQ6ONP
	 g0oPsbRZthy5kcTKskTVIq6lvliJ0pj3IuhPaT3o=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592DjHID058147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:45:17 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:45:17 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:45:17 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592DjHcX047410;
	Thu, 2 Oct 2025 08:45:17 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 196491801A4; Thu,  2 Oct 2025 08:45:17 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH v2 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
Date: Thu, 2 Oct 2025 08:45:17 -0500
Message-ID: <20251002134517.120725-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251002134224.1818376-1-afd@ti.com>
References: <20251002134224.1818376-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:45:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16668

meta-arago / na / 20251002134224.1818376-1-afd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v2 2/2] meta-arago-extras: hevc-arm-decoder: Remove this recipe
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v2 1/2] gstreamer1.0-plugins-hevc: Remove this gstreamer plugin
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Daniel Schultz <d.schultz@phytec.de>
-From: Denys Dmytriyenko <denys@ti.com>
- Date: Date: Thu, 2 Oct 2025 08:42:23 -0500
-Date: Tue, 6 Aug 2024 11:26:55 +0200
-Date: Tue, 22 Jan 2019 20:39:15 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: 59862324911eb08fb626c563f23bcf170a89a3f1

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-test: Add libsdl2-tests to packagegroup
- Commit SHA: 94aba9851641f221eb7334cc2c4873c0eb04fc35

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




