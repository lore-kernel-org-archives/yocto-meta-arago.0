Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B4C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 20:35:50 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6391.1754339746923102036
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 13:35:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=speqIvNV;
 spf=pass (domain: list.ti.com, ip: 198.47.19.245, mailfrom: prc@list.ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 574KZkSF3886154
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Aug 2025 15:35:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1754339746; i=@ti.com;
	bh=dyNMJwjjdjpZefXjqWQIzIg/u5ZrEj6qQmRVmQXD8XU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=speqIvNVAGft8ZvGQYildUn5fP2HmQ3hunLvpvOVbLp3RUNE0YAqa7w7qxqf0fksa
	 0pc7HSWj6aAOTD/rtx5OS+TTW6+VC7oEPwfhD5dzvP2+O9NfKLXR6ibrjDAnKBGVkf
	 Bc0V6LH0BI+h67VYDIO1QdMrU1gihb+ilaw7txmk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 574KZkuA2923627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 4 Aug 2025 15:35:46 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 4
 Aug 2025 15:35:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 4 Aug 2025 15:35:46 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 574KZjh8997266;
	Mon, 4 Aug 2025 15:35:45 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id B855A13F52F; Mon,  4 Aug 2025 15:35:45 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Thorsten Lannynd <t-lannynd@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>, <detheridge@ti.com>,
        <rs@ti.com>, <a-christidis@ti.com>
Subject: Re: [meta-arago][oe-layersetup][master][PATCH] configs/arago-scarthgap-*: Update meta-lts-mixins SHA
Date: Mon, 4 Aug 2025 15:35:45 -0500
Message-ID: <20250804203545.3733667-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250804203059.2535032-1-t-lannynd@ti.com>
References: <20250804203059.2535032-1-t-lannynd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 Aug 2025 20:35:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16352

meta-arago / na / 20250804203059.2535032-1-t-lannynd

PRC Results: FAIL

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
  check-yocto-patches: FAIL
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
FAIL - [meta-arago][oe-layersetup][master][PATCH] configs/arago-scarthgap-*: Update meta-lts-mixins SHA
    ERROR: Invalid branch specifier: "oe-layersetup". (META-3)
        patch:42
            Subject: [meta-arago][oe-layersetup][master][PATCH] configs/arago-scarthgap-*: Update meta-lts-mixins SHA




