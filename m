Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA22BCCD18E
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 19:15:28 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4654.1760469323644273613
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 12:15:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MRTYhNhp;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EJFMsJ1575785
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 14:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760469322; i=@ti.com;
	bh=Hu8NduUkBd4W7ZC+JICdSejXRYS/9FgOi2X2pp7vO+g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MRTYhNhpwIv4GFaMjaYxK8lRxb5G9JNpvETBmMyrRR0nljVVZaa46r8/LiF4J9pqe
	 sbRwMpcHxh8f1cK5NhINwuYoFO3MydP9+oM5+KH3iSpprZCaLJ3ZG0kIIktgIoROj2
	 vX0qYv5CLWYtUI2vwg3u/GI0ce1J5oRvDCs75fJE=
Received: from DLEE209.ent.ti.com (dlee209.ent.ti.com [157.170.170.98])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EJFMF54028756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 14:15:22 -0500
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 14:15:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 14:15:22 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EJFMAi614042;
	Tue, 14 Oct 2025 14:15:22 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 8330913F536; Tue, 14 Oct 2025 14:15:22 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <detheridge@ti.com>, <rs@ti.com>
Subject: Re: [meta-arago][scarthgap][PATCH] meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer
Date: Tue, 14 Oct 2025 14:15:22 -0500
Message-ID: <20251014191522.3649916-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20251014191133.1359834-1-t-lannynd@ti.com>
References: <20251014191133.1359834-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 14 Oct 2025 19:15:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16691

meta-arago / na / 20251014191133.1359834-1-t-lannynd

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-arago][scarthgap][PATCH] meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer
    WARN: Commit message does not include file/recipe name: meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer.
              meta-arago-distro: (COMMIT-MESSAGE-3)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] meta-arago-distro: chromium: Avoid placing incomplete H264 NALUs in buffer
- Submitter: From: Thorsten Lannynd <t-lannynd@ti.com>
+From: Alexandros Frantzis <alexandros.frantzis@collabora.com>
- Date: Date: Tue, 14 Oct 2025 14:11:33 -0500
+Date: Wed, 11 Jun 2025 11:07:05 +0300
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 952c5e63010911513d7623a66c0aed8350cc1bff

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: meta-arago-extras: hevc-arm-decoder: Remove this recipe
- Commit SHA: 4e4e64fca24816d48a42d84c6973d1e2577b463d

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




