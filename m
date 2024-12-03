Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBF3E64A93
	for <webhook@archiver.kernel.org>; Tue,  3 Dec 2024 13:22:54 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.19136.1733232168226745022
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Dec 2024 05:22:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MpuzicJT;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B3DMkqt1451968
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 3 Dec 2024 07:22:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733232166;
	bh=yaEnwLbf9dACh7oL7MM0LR2iwFOO5W0sfARQwj+U+No=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MpuzicJTzXElEVDvPuUMHZ4Sfd5lZAUHS2U+WJPmgQbl4oeziprqo7uiEzQ04UB7o
	 dV1iFvZqLaLeXPTnIfsz2h07JFzsb/qow0f0nNWFlD1RegewfidMP4MqCnH2sWm3X/
	 gAgmdUMeAMVSTchIzEs6fewKgFs9yCKI9Uh5fDi8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3DMkDV040983;
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 3
 Dec 2024 07:22:46 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 3 Dec 2024 07:22:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B3DMk8r024087;
	Tue, 3 Dec 2024 07:22:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tISrW-0007jl-2N; Tue, 03 Dec 2024 07:22:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v2 2/4] vulkan-cts: Remove bbappend
Date: Tue, 3 Dec 2024 07:22:43 -0600
Message-ID: <20241203132245.29696-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241203132245.29696-1-reatmon@ti.com>
References: <20241203132245.29696-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 03 Dec 2024 13:22:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15638

Upstream moved to a later vulkan version and the bbappend no longer
applied.  Since the contents of the bbappend have already been applied
to meta-openembedded, we can just remove this bbappend completely.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Removed the bbappend instead of renaming it.

 .../recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend      | 2 --
 1 file changed, 2 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend

diff --git a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend b/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
deleted file mode 100644
index 7af2057f..00000000
--- a/meta-arago-distro/recipes-graphics/vk-gl-cts/vulkan-cts_1.3.7.3.bbappend
+++ /dev/null
@@ -1,2 +0,0 @@
-# Workaround an optimization bug that breaks createMeshShaderMiscTestsEXT
-OECMAKE_CXX_FLAGS:remove:toolchain-gcc:aarch64 = "-O2"
-- 
2.17.1


