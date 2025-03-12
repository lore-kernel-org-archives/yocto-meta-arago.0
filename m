Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A22C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.39713.1741792106202024780
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hOFOT6u/;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8O4k1061763
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792104;
	bh=XLE5p609COz7WDp+cN+cHR4lpQKhX4ztol8GKsCMbp8=;
	h=From:To:Subject:Date;
	b=hOFOT6u/Jzway6Hqm0OEkew+vzm3gPRE9D+s+2YS6RvurwjimYv+3pU4HXGsmGzAW
	 xs9QZc5/YcCuuwr0dhtQWlO7UQlUqlGoeePjRuIS3m1Qrhp0+vCCED82OgIp90PjKO
	 tjU0GkbaUdyMk7NRLKGkLY0HkB/tyGgGcN6Pvly0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8O0q110241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:24 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8OJR101375;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001ix-1s; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 0/6] Add COMPATIBLE_MACHINEs
Date: Wed, 12 Mar 2025 10:08:18 -0500
Message-ID: <20250312150824.6579-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16003

We are moving to make the meta-arago layers Yocto Project Compatible.

https://www.yoctoproject.org/development/yocto-project-compatible-layers/

We have been cleaning up the layer according to the yocto-check-layer
tool.  This series addresses the issue that the yocto-check-layer is
running in a machine agnostic manner.  If one recipe has a
COMPATIBLE_MACHINE and another recipe depends on it, then effectively
that recipe also needs a COMPATIBLE_MACHINE setting.  Without it, the
yocto-check-layer tool sees that you depend on package that it cannot
process and so it is not available to "build" and it errors out.

Simple fix is to populate the same COMPATIBLE_MACHINE setting up the
recipe hierarchy for all needed packages.

Ryan Eatmon (6):
  statcol: Add COMPATIBLE_MACHINE
  ti-gc320-tests: Add COMPATIBLE_MACHINE
  arm-compute-library: Fix typo in comment
  armnn: Add COMPATIBLE_MACHINE
  onnxruntime: Add COMPATIBLE_MACHINE
  nnstreamer: Add COMPATIBLE_MACHINE

 .../arm-compute-library/arm-compute-library_24.12.bb        | 2 +-
 meta-arago-extras/recipes-devtools/armnn/armnn_24.11.bb     | 6 ++++++
 meta-arago-extras/recipes-devtools/statcol/statcol.bb       | 3 +++
 .../recipes-framework/onnxruntime/onnxruntime_1.20.1.bb     | 6 ++++++
 .../ti-gc320-tests/ti-gc320-tests_5.0.11.p7.bb              | 2 ++
 .../recipes-multimedia/nnstreamer/nnstreamer_2.4.0.bb       | 6 ++++++
 6 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.17.1


