Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167EBCA0EC4
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 17:45:38 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.54214.1754934333228692147
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 11 Aug 2025 10:45:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=AbmCmhxo;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57BHjV811163063;
	Mon, 11 Aug 2025 12:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754934331; i=@ti.com;
	bh=AFKEDzilp6fSwK2deRC7XFZ+IcCYq2hXP0pPKJj1acU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AbmCmhxo7hmB37hSAiuwN5SACl3jdw4tnjmECZRIxdHt1t+OxLDWLeH/FyJXhZMLv
	 YUbgDG8r/dJcZbxC406j/EX3HWS/V0H2I4ZOcW69Eqaavd4EvkKByT367G9RcqEIus
	 w2QyhMAfnDBkc12Q8g2BpKn1BQya4ZJvGyy5Z4j8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57BHjVku3885935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 11 Aug 2025 12:45:31 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 11
 Aug 2025 12:45:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 11 Aug 2025 12:45:30 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57BHjU7A3566438;
	Mon, 11 Aug 2025 12:45:30 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id DBB0813F52F; Mon, 11 Aug 2025 12:45:30 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][master][PATCH] arago: Pull in the Yocto space optimization settings
Date: Mon, 11 Aug 2025 12:45:30 -0500
Message-ID: <20250811174530.2791054-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250811173948.19890-1-reatmon@ti.com>
References: <20250811173948.19890-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 11 Aug 2025 17:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16358

meta-arago / na / 20250811173948.19890-1-reatmon

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
- Patch Series: [meta-arago][master][PATCH] arago: Pull in the Yocto space optimization settings
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Mon, 11 Aug 2025 12:39:48 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d33a6f12d48e8cba4b8bcaf0a7493b2caadb8220

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-next
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202508010100
- Commit SHA: 644f8b47f0eef26bda636717f5838871ec67d138

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS




