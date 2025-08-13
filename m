Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874E2CA0FEA
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.10192.1755127549835623994
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R9NMtP9r;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPn0X1750903
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127549; i=@ti.com;
	bh=fYyK3dnYT70w7OYonRYm09OK6JmxuJstRgd4Is2NW9g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R9NMtP9r2d6ymmcaPfeU22xJ8DKSnE1HhIYs35Jp8RFXZloLLxsZ39p+1QiQ7bfqr
	 jyTEHO+kwn8KCxI0PsxqjH4t2cBYPK0/Z/4jMS1Zyob+DSuZGtngyRAPQr6xYw15gT
	 kNifaiITxQgjE1t9WxfWnbK04aVU23v5H2lF9R0Y=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPnfZ1300402
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 18:25:49 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:49 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:49 -0500
Received: from fllvdckhpci027.itg.ti.com (fllvdckhpci027.itg.ti.com [10.64.72.35])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPnrR2710195;
	Wed, 13 Aug 2025 18:25:49 -0500
Received: by fllvdckhpci027.itg.ti.com (Postfix, from userid 60899)
	id DCF2E138DB2; Wed, 13 Aug 2025 18:25:48 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Aparna M <a-m1@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>,
        <nikhil.nd@ti.com>, <nsekhar@ti.com>
Subject: Re: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: Add support for sysfw build for am64xx devices
Date: Wed, 13 Aug 2025 18:25:48 -0500
Message-ID: <20250813232548.1790267-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20220218082530.31503-1-a-m1@ti.com>
References: <20220218082530.31503-1-a-m1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16417

meta-arago / na / 20220218082530.31503-1-a-m1

PRC Results: FAIL

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: FAIL
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][dunfell][PATCH] ti-tisdk-makefile: Add support=
 for sysfw build for am64xx devices
- Submitter: From: "Aparna M" <a-m1@ti.com>=0D
- Date: Date: Fri, 18 Feb 2022 13:55:30 +0530=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: ae24a50ebbaaf845e03778758ba1d86c0=
753402a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][dunfell][PATCH] ti-tisdk-makefile: Add support for sysf=
w build for am64xx devices
    Applying: ti-tisdk-makefile: Add support for sysfw build for am64xx dev=
ices
    Patch failed at 0001 ti-tisdk-makefile: Add support for sysfw build for=
 am64xx devices
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile/Makefile_sysfw-image:1
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile/Makefile_sysfw-image: patch does not apply
    error: patch failed: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/=
ti-tisdk-makefile_1.0.bb:66
    error: meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makef=
ile_1.0.bb: patch does not apply




