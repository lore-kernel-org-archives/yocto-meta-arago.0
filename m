Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E64CAC5BD
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 19:05:26 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.3105.1758913520708969694
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 12:05:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=PRQV66Z2;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58QJ5JT61717739;
	Fri, 26 Sep 2025 14:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758913519; i=@ti.com;
	bh=8l8rBHPqYeENisDJdQjoM2OuedEi5CtfZ9AeZ/2c4vw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PRQV66Z2sZCFqvzhfgYSynjO02Z+zeOU6WAjXT79Bzmawo/WPdvbwldfjh/CwKqPa
	 3kfwb7B6x3r/Js8QkVVWtEdQPz203gT2yvtQF54dskI91Hw15I0K4fTgp1pfbELv7I
	 EDHUBsGiKqGoSJSgpHBNnxpi/5hn1i39UVlyLwA4=
Received: from DFLE209.ent.ti.com (dfle209.ent.ti.com [10.64.6.67])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58QJ5Jod002337
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Sep 2025 14:05:19 -0500
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 26 Sep
 2025 14:05:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 26 Sep 2025 14:05:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58QJ5Ija1776764;
	Fri, 26 Sep 2025 14:05:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9C63113F532; Fri, 26 Sep 2025 14:05:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: LCPD Automation Script <lcpdbld@list.ti.com>
CC: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
Date: Fri, 26 Sep 2025 14:05:18 -0500
Message-ID: <20250926190518.2540824-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250926190250.1349022-1-lcpdbld@list.ti.com>
References: <20250926190250.1349022-1-lcpdbld@list.ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 26 Sep 2025 19:05:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16649

meta-arago / na / 20250926190250.1349022-1-lcpdbld

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
    WARN: Commit message does not include file/recipe name: CI/CD Auto-Merger: cicd.scarthgap.202509260858. (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202509260858
- Submitter: From: LCPD Automation Script <lcpdbld@list.ti.com>
- Date: Date: Fri, 26 Sep 2025 14:02:50 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 38c7f59fb5dd75f289bdcc34c86bdd84ccb4d0be

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Antonios Christidis <a-christidis@ti.com>
- Commit Subject: ti-test: Add libsdl2-tests to packagegroup
- Commit SHA: e17ebd6b74cec787aac86c4eb8b49862277d9c7d

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




