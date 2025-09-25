Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DED7FCAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 14:25:20 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.12936.1758810319883259291
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 07:25:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ue0Jg8KA;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PEPJ9i1474599;
	Thu, 25 Sep 2025 09:25:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758810319; i=@ti.com;
	bh=9OJKzwTwcWJbdejjKWuqH7wonVDRqsdimt83IxsM0O8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ue0Jg8KA8m2UT+EGV0vTPfgzXqgl7/kW0o7/mlEZf3DtYjhhjwL5nQXzZmnJZ87IA
	 uaO+D2WAA0yBP3+OnEGMHU7wl8YDNOaUZjoMyk9i9Fx3WS+vHm7pu0asY/d8QlaX9z
	 ijJncqumiMnca1NrHjFrDRg5qNDHRwe21w8fJ/9c=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PEPJR22703839
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 09:25:19 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 09:25:18 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 09:25:18 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PEPIOP2002317;
	Thu, 25 Sep 2025 09:25:18 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 800DE142E2D; Thu, 25 Sep 2025 09:25:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509250412
Date: Thu, 25 Sep 2025 09:25:18 -0500
Message-ID: <20250925142518.2261908-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925142305.4040948-1-lcpdbld@list.ti.com>
References: <20250925142305.4040948-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 14:25:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16633

meta-arago / na / 20250925142305.4040948-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509250412
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509250412. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509250412
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 25 Sep 2025 09:23:05 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 6d94dcd5aa74403899044e92eb94fbc0327706df

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: check_yocto_rules: Flip to regex for files
- Commit SHA: 7aedd68536e2fdc3f84579560e8c5a99c98a12d0

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




