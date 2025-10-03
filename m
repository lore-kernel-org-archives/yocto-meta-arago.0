Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2920ECAC5B0
	for <webhook@archiver.kernel.org>; Fri,  3 Oct 2025 03:25:47 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.5893.1759461941094176542
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 20:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=WTmtzo45;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5933Pd0W3411877;
	Thu, 2 Oct 2025 22:25:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759461939; i=@ti.com;
	bh=kAubEkP6svCO9ZSb9eTc4q+kKEXwrYvDTQQgDBetrz4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WTmtzo45E4DY8w6NUZ1si4Q+LtLcixprblTmFJTSwG79ixNmspHavl+5uzerWacAB
	 LY+ncPVVHfdX7KR6NfOm78OLlARKhomq7r3kkjOoGrmk8HGkvxjMfatR7FKAY1Tvg3
	 pYKUFEBPa31miIXL3huJQjwHZe28EF2x/l34JQLk=
Received: from DFLE208.ent.ti.com (dfle208.ent.ti.com [10.64.6.66])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5933Pdi84054165
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Oct 2025 22:25:39 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Oct
 2025 22:25:39 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 22:25:39 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5933Pdv8562071;
	Thu, 2 Oct 2025 22:25:39 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 72DF313F52E; Thu,  2 Oct 2025 22:25:39 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
Date: Thu, 2 Oct 2025 22:25:39 -0500
Message-ID: <20251003032539.1043582-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251003032310.860790-1-lcpdbld@list.ti.com>
References: <20251003032310.860790-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Oct 2025 03:25:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16671

meta-arago / na / 20251003032310.860790-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202510021800. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202510021800
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Thu, 2 Oct 2025 22:23:10 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 9eb39faea84ab8f276011a028510e76a155993f7

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




