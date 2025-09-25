Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EA8CAC5BA
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 19:35:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.264.1758828934571302598
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Sep 2025 12:35:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=a1xzqvCN;
 spf=pass (domain: list.ti.com, ip: 198.47.23.234, mailfrom: prc@list.ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PJZXPB1523246;
	Thu, 25 Sep 2025 14:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758828933; i=@ti.com;
	bh=ufP8kIgSJLQxu1AMTeRHsZ54EHuMLBp1TGejeo4mvAw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a1xzqvCNx2odRzEuyEgLaOQplRhKICWDtA9l+Ey9jJY+FTTWB6vxYD+bWAS8d9pg+
	 4HC7r4WjV2De6y5jQFdV6XcvGJKKFw+puLKzxJVmE06aVzsXdekrmaOXTk1BNt1CIN
	 5D/pyijd72Rgwh2gItjzYiX2yeK8GRT/4lPOhf+I=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PJZXiq3782067
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Sep 2025 14:35:33 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 25 Sep
 2025 14:35:33 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 14:35:33 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PJZXrm2255469;
	Thu, 25 Sep 2025 14:35:33 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id 5D221142E2F; Thu, 25 Sep 2025 14:35:33 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: Re: [scarthgap][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
Date: Thu, 25 Sep 2025 14:35:33 -0500
Message-ID: <20250925193533.3863931-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250925193024.2938544-1-denis@denix.org>
References: <20250925193024.2938544-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Sep 2025 19:35:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16640

meta-arago / na / 20250925193024.2938544-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [scarthgap][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
    WARN: Commit message does not include file/recipe name: linux-firmware-arago: correct removal of overlapping FW. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Revised patch missing a comment. (REVISION-1)
        patch



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [scarthgap][PATCH v2] linux-firmware-arago: correct removal of overlapping FW
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Thu, 25 Sep 2025 15:30:24 -0400
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: d1308fe277b4e2f93d8bc3f118051f7618a4765a

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.scarthgap.202509250412
- Commit SHA: 61ab0b00a3683d71c0fc9ac62e1200d85edbcecd

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS




