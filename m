Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29E9FC021B5
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 23:15:09 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.36634.1740179701815868270
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 15:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=csY/dUe/;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51LNF0C21020386
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 21 Feb 2025 17:15:00 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740179700;
	bh=NkbiZKTfDq/24HYzQHvd+0efiuD0pAHzhZL4WABu52M=;
	h=From:To:CC:Subject:Date;
	b=csY/dUe/TSe07nXNb8NUcznWuAmA+GjliHeet/UVBT6QrynWOUPGs31E7t2xOAjX1
	 jd8vcF/AalK3mg8J4G/m464mIkS094YzAkCz0JxUf2wqHltGols7NhKOrzyUAG1wgc
	 YJVMfG69sc/nmn7C3g/dHzWrN1ZTcgBgvXjfHfF8=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LNF05Z023198;
	Fri, 21 Feb 2025 17:15:00 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Feb 2025 17:15:00 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Feb 2025 17:15:00 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51LNF0kf072477;
	Fri, 21 Feb 2025 17:15:00 -0600
From: <a-christidis@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH v5 0/2] Introducing Opencl-cts
Date: Fri, 21 Feb 2025 17:14:58 -0600
Message-ID: <20250221231500.457741-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:15:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15895

From: Antonios Christidis <a-christidis@ti.com>

Dear all, 

Adding the recipe for opencl-cts, and a patch for it. Also, changing
the version of the opencl-headers, this is done due to compatibility
issues with the header version and cts version.

All of this patch series is meant for scarthgap, which is why I am
not including a patch to add opencl-cts to any package group so that
it can be build and included in our sdk. That patch will be sent out
separately as it is both for scarthgap and master. More info on this
can be found in the upcoming patch.

Regards,
Antonios

Antonios Christidis (2):
  meta-arago-test: add recipe opencl-cts
  meta-arago-test: opencl_headers 2023.12.14 -> 2024.05.08

 .../opencl/opencl-headers_%.bbappend          |  4 ++
 .../opencl/opencl_headers-ti.inc              |  1 +
 .../files/0001-Ignore-Compiler-Warnings.patch | 45 +++++++++++++++++++
 .../opencl/opencl-cts_2024.08.08.bb           | 32 +++++++++++++
 4 files changed, 82 insertions(+)
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
 create mode 100644 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
 create mode 100644 meta-arago-test/recipes-graphics/opencl/files/0001-Ignore-Compiler-Warnings.patch
 create mode 100644 meta-arago-test/recipes-graphics/opencl/opencl-cts_2024.08.08.bb

-- 
2.34.1


