Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC7DCA0FEB
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 23:25:56 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.10204.1755127553615283730
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Aug 2025 16:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=opdA0yv1;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DNPqVV1803069;
	Wed, 13 Aug 2025 18:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755127552; i=@ti.com;
	bh=H9Xc9RT05qCLZcj+hkEF3G8dLOVKB2l7xGhK78BrMJ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=opdA0yv1nAPZOcc248OzoFdB+V0doGKj6VSj0KoPVyp8JoFKj1trYUE+Yhjn/owkD
	 3qcp+Ac1B+IsXFSs+WLsEsnGpvo7YahURJ06VCc0SaIunoLCDa6mruuL6YettB5UDZ
	 Ljn44bHY3ebfwEFDwID+OYraUDdVFhPKSmmWHWHk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DNPqUZ1300433
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 18:25:52 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 18:25:52 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 18:25:52 -0500
Received: from fllvdckhpci077.itg.ti.com (fllvdckhpci077.itg.ti.com [10.64.72.14])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DNPqKS3611095;
	Wed, 13 Aug 2025 18:25:52 -0500
Received: by fllvdckhpci077.itg.ti.com (Postfix, from userid 60899)
	id 4A38A66D5D; Wed, 13 Aug 2025 18:25:52 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x hs platform
Date: Wed, 13 Aug 2025 18:25:52 -0500
Message-ID: <20250813232552.3827588-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20211112233002.26126-1-yogeshs@ti.com>
References: <20211112233002.26126-1-yogeshs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 13 Aug 2025 23:25:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16438

meta-arago / na / 20211112233002.26126-1-yogeshs

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
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x =
hs platform
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 12 Nov 2021 23:30:02 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e959b76e028e2500daecf42196cc2f3c4=
0d4c616

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x hs platfo=
rm
    Applying: arago: conf: Add am64x hs platform
    Patch failed at 0001 arago: conf: Add am64x hs platform
    error: patch failed: meta-arago-distro/conf/distro/arago.conf:52
    error: meta-arago-distro/conf/distro/arago.conf: patch does not apply

dunfell
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x =
hs platform
- Submitter: From: "Yogesh Siraswar" <yogeshs@ti.com>=0D
- Date: Date: Fri, 12 Nov 2021 23:30:02 +0000=0D
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: e959b76e028e2500daecf42196cc2f3c4=
0d4c616

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: dunfell
- Commit Author: Randolph Sapp <rs@ti.com>
- Commit Subject: meta-arago-distro: linux-firmware: remove cadence firmware
- Commit SHA: 86d19ced20934c8383c8a39f88d97c72e7e929ee

Patches
----------------------------------------
FAIL - [meta-arago][master/dunfell][PATCH] arago: conf: Add am64x hs platfo=
rm
    Applying: arago: conf: Add am64x hs platform
    Patch failed at 0001 arago: conf: Add am64x hs platform
    error: patch failed: meta-arago-distro/conf/distro/arago.conf:52
    error: meta-arago-distro/conf/distro/arago.conf: patch does not apply




