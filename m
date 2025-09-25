Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D6F9CAC5AA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 07:50:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.6021.1758786624477912771
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 00:50:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZJ+Ghin8;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58P7oLqB1850486;
	Thu, 25 Sep 2025 02:50:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758786621; i=@ti.com;
	bh=mteZQT4xnGCStkv0cwZol27GqFKTAyII1S9Hjhi3CQ8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZJ+Ghin89l+NLUq2mNRkFhm25ZneSIuoeJdxE24q+DiFoNHQ33XhuYdkx7b4qLVfq
	 413jLSvxc7vgjvuCEep3uIYqyUCgG4dLzfn/vdo3n1oWJbb/SMVeuIAfti0NMSdECH
	 ZfnSblTPkX5IMr2NY8iWWMLROZ/rQPel9fU3jNqw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58P7oL9W004954
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 25 Sep 2025 02:50:21 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 02:50:20 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 02:50:20 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58P7oKkt1765868;
	Thu, 25 Sep 2025 02:50:20 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id AAEFB1801A0; Thu, 25 Sep 2025 02:50:20 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Yogesh Hegde <y-hegde@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>,
        Praneeth Bajjuri <praneeth@ti.com>,
        Prudhvi
 Veeramachaneni <prudhvi@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH v2]
Date: Thu, 25 Sep 2025 02:50:20 -0500
Message-ID: <20250925075020.2444714-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925074624.ozym2jd6qlxczwtr@yogi-work-pc>
References: <20250925074624.ozym2jd6qlxczwtr@yogi-work-pc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 07:50:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16629

meta-arago / na / 20250925074624.ozym2jd6qlxczwtr

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][master/scarthgap][PATCH v2] packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platforms
    WARN: Commit message does not include file/recipe name: . (COMMIT-MESSAGE-2)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH v2] packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platforms
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 25 Sep 2025 13:16:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1160f033276e999e2ca086732fb1b9f2d3e6cbb4

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: ti-test: Make opencl-cts dependent on DISTRO_FEATURES
- Commit SHA: d3532063218f5c47b5e912554a0b236eb25e61f4

Patches
----------------------------------------
All patches applied

scarthgap
=====================
Summary:
- Patch Series: [meta-arago][master/scarthgap][PATCH v2] packagegroup-arago-tisdk-connectivity: Restrict BT_TI to legacy platforms
- Submitter: From: Yogesh Hegde <y-hegde@ti.com>
- Date: Date: Thu, 25 Sep 2025 13:16:24 +0530
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 1160f033276e999e2ca086732fb1b9f2d3e6cbb4

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
master
=====================
PASS

scarthgap
=====================
PASS




