Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFB96CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 19:20:20 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.4813.1758309619364711106
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Sep 2025 12:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iAcXSIfP;
 spf=pass (domain: list.ti.com, ip: 198.47.23.235, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58JJKIEv781698
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758309618; i=@ti.com;
	bh=EkWpPwuQODZJZYhcguPcip+9uI892PoaMCpZbIcFCZg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iAcXSIfPZ+ISyGRYaxt+NERQf8wxKoAyfJAyd6lv4sd2O2cCGkddFMU6eT7KZ41B8
	 n9E0BDrTOLddWPOKKofYaIulcUQP/VVz6zivfbYdujD5jshn6ZqGOAe8mLSLt/VDsG
	 uJ7PGszYTP8zOElBpRnNIqD7339VN4f5Nl8m9ap4=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58JJKImu3380155
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 14:20:18 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 19
 Sep 2025 14:20:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 19 Sep 2025 14:20:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58JJKIr82788018;
	Fri, 19 Sep 2025 14:20:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 7F06616A91C; Fri, 19 Sep 2025 14:20:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Antonios Christidis <a-christidis@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH v2 0/2] Add libsdl2 test support
Date: Fri, 19 Sep 2025 14:20:18 -0500
Message-ID: <20250919192018.2448019-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250919191849.2622310-1-a-christidis@ti.com>
References: <20250919191849.2622310-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Sep 2025 19:20:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16604

meta-arago / na / 20250919191849.2622310-1-a-christidis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH v2 2/2] ti-test: Add libsdl2-tests to packagegroup
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH v2 0/2] Add libsdl2 test support
- Submitter: From: <a-christidis@ti.com>
From: Antonios Christidis <a-christidis@ti.com>
- Date: Date: Fri, 19 Sep 2025 14:18:47 -0500
- Num Patches: 2
- Mailing List (public inbox) Commit SHA: e17fac463a62a75a5bb8594e9ce587dba7ea02aa

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509181257
- Commit SHA: 96f3c5b8e2efec96de9db131992e56272becc174

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




