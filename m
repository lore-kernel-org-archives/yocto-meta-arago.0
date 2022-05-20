Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30BD4C4332F
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 18:28:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.963.1653071298150247138
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 20 May 2022 11:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=qBOOm17l;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24KISBpC084497;
	Fri, 20 May 2022 13:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1653071291;
	bh=4ecZOHc61vywI3j66I1FZtveezWxsGrVrtAWu0d9fC4=;
	h=From:To:Subject:Date;
	b=qBOOm17lWYEHaJvlVLxl0LT8gVF7JX8Q5bDdI0P7Z3suQIHbtaabWAkwgiBpx+6Ux
	 sskzpE+E29NTB9cGHFsDiMlfcYeLULmkhxhMMDGd9PpbbOzBxNWXKvsAASPPZvkLXW
	 JSpxXHvdINpJ05agtGApzRf9SWvbDckNxdus0ZA0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24KISBPF074859
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 May 2022 13:28:11 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 20
 May 2022 13:28:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 20 May 2022 13:28:11 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24KISB84016070;
	Fri, 20 May 2022 13:28:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ns7MA-0006Ko-U1; Fri, 20 May 2022 13:28:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] ltp-ddt: Bump to 08.03.00.005 release
Date: Fri, 20 May 2022 13:28:10 -0500
Message-ID: <20220520182810.24312-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 20 May 2022 18:28:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13872

Updated the ltp-ddt version for 08.03.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
index ac8b46ea..b39f4a75 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210524.bb
@@ -14,7 +14,7 @@ PE = "1"
 PR = "r7"
 PV_append = "+git${SRCPV}"
 
-SRCREV = "57d393379dd74c4d5a53f5b03094b0df8bfc5dfb"
+SRCREV = "b9a158a36b39437c08335c14c33c708df11e5fb5"
 BRANCH ?= "master"
 
 SRC_URI_remove = "git://github.com/linux-test-project/ltp.git;protocol=https;branch=master"
-- 
2.17.1


