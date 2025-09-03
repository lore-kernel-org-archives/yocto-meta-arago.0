Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BA4CA1009
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 19:40:24 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.22144.1756928423435885795
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 03 Sep 2025 12:40:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=aSj/HOka;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 583JeMbg2845288;
	Wed, 3 Sep 2025 14:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1756928422; i=@ti.com;
	bh=Mkw1WddSobTIQNJ7Rd/NJCbg2cR9KquWis2iYuSkx3o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aSj/HOkaahP/Ao07AZQRuyS8aU1FHvjRzMFZ8Gnvk0YXkhYd2qh3QemaBKuabNGDn
	 CMVwF5VOmWz7We2YIkC3EJTteqMLnHSDbEg5PKTfPpE/v8ss+QOiX8ASmHUxx/xtoL
	 UvDPBbKCvd6fi3g712lJYjEv6K01qh58xjiKJiVo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 583JeMgJ316901
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 3 Sep 2025 14:40:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 3
 Sep 2025 14:40:21 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 3 Sep 2025 14:40:21 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 583JeLQT2322097;
	Wed, 3 Sep 2025 14:40:21 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8385513F529; Wed,  3 Sep 2025 14:40:21 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] meta-arago-test: Remove qt6 examples PACKAGECONFIG
Date: Wed, 3 Sep 2025 14:40:21 -0500
Message-ID: <20250903194021.2280844-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250903193554.15488-1-reatmon@ti.com>
References: <20250903193554.15488-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 03 Sep 2025 19:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16519

meta-arago / na / 20250903193554.15488-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master][PATCH] meta-arago-test: Remove qt6 examples PACKAGECONFIG
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 3 Sep 2025 14:35:54 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 474c0cc95469955a5436a33035b3d6fae669089b

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202509030100
- Commit SHA: d4cff7e35feff085eaf8f3045bf71177c025af56

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




