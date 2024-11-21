Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63555D743FD
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 01:33:59 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1021.1732152833332120019
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Nov 2024 17:33:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zpvhc+VN;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AL1XqnA040303;
	Wed, 20 Nov 2024 19:33:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732152832;
	bh=oF2zz14cjj6lePNv3fBQbUJiRKNnudp48vZC+QGNLZc=;
	h=From:To:Subject:Date;
	b=Zpvhc+VNzUH5B87ZZ5HvKRYzkUaMgAjqDGEqarr1ebi3uOm1W8rehvIGLwotq4eyf
	 x6xnpZx37hflD2ifgRfXZhzbHA3JeOaZ3Df/Vz16dQNpLu0sSiET0aSgkJEII5V87l
	 g7DYyhqt3TAHZEtYyhHe1bAgJR/BwrClAHg81I2o=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AL1XqZg025912
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Nov 2024 19:33:52 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Nov 2024 19:33:51 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Nov 2024 19:33:52 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AL1XpgV070736;
	Wed, 20 Nov 2024 19:33:51 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tDw4t-0005ej-Mg; Wed, 20 Nov 2024 19:33:51 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][kirkstone][PATCH] ltp-ddt: Change to ti-ltp-ddt_20230127 branch
Date: Wed, 20 Nov 2024 19:33:51 -0600
Message-ID: <20241121013351.21700-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 21 Nov 2024 01:33:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15622

We need to backport some changes to ltp-ddt from scarthgap.  So a new
branch was created off of the previous commit that kirkstone pointed to
and new commits were added.  Update the recipe to point to this new
branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
index c2367067..44aa6b47 100644
--- a/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
+++ b/meta-arago-test/recipes-devtools/ltp-ddt/ltp-ddt_20230127.bb
@@ -15,7 +15,7 @@ PR = "r7"
 PV:append = "+git${SRCPV}"
 
 SRCREV = "07e0795c14d4bd8bd4857438cf3bb414b1f34eaa"
-BRANCH ?= "master"
+BRANCH ?= "ti-ltp-ddt_20230127"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
 SRC_URI:prepend = "git://git.ti.com/git/test-automation/ltp-ddt.git;protocol=https;branch=${BRANCH} "
-- 
2.17.1


