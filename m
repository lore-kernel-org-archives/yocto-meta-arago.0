Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5663ACA100F
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 18:50:22 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.60524.1758567021548521432
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 22 Sep 2025 11:50:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bLL7ne+5;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58MIoJbf1295046;
	Mon, 22 Sep 2025 13:50:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758567019; i=@ti.com;
	bh=QyXhxniPccZdyAclmrLAGWXcuaPESyVrFy7ysFReMyc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bLL7ne+5F3GICIzeU5viwEbfuXUfHX6hBYrknuA/9/XSsHsJdoFcY1/Flw0ocOqMO
	 kwrp0qK9ZeO+5dOo20v78tC0ETSCrmYIhZrow6P+ppHTlhfXgDGzd9Rr0TFV7eItT6
	 eJgtSp+bhMTwAy0IXAe7NeS/55vF6sOrYpbuGsNg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58MIoJnO2192810
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 22 Sep 2025 13:50:19 -0500
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 22
 Sep 2025 13:50:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 22 Sep 2025 13:50:18 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58MIoIVv2992031;
	Mon, 22 Sep 2025 13:50:18 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A701D13F538; Mon, 22 Sep 2025 13:50:18 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
Date: Mon, 22 Sep 2025 13:50:18 -0500
Message-ID: <20250922185018.1666131-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250922184556.3586969-2-rs@ti.com>
References: <20250922184556.3586969-2-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 22 Sep 2025 18:50:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16611

meta-arago / na / 20250922184556.3586969-2-rs

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
All patches passed



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap][PATCH] emptty: 0.13.0 -> 0.14.0
- Submitter: From: <rs@ti.com>
From: Randolph Sapp <rs@ti.com>
- Date: Date: Mon, 22 Sep 2025 13:45:57 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 99ee4cd55925bd5cddc29108415cb4e5fd1b8979

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
  check-yocto-repo: FAIL
=========================================================
scarthgap
=====================
FAIL
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:10
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pam', '', ',nopam', d)}"
    
    WARN: You might need a " " as the first character for the :append. (APPEND-2)
        meta-arago-distro/recipes-graphics/emptty/emptty_0.14.0.bb:11
            GO_TAGS:append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ',noxlib', d)}"
    
    
    Code Summary
    ============
    
    APPEND-2
    -------------------------------------------
      :append simply takes the specified string and concatenates it
      directly to the variable.  Most of the time we want there to spaces
      between entries.  This check flags us to check if the missing space
      is actually needed.




