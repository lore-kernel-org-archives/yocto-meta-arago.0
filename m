Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9B2CC2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:14 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.424.1747674072172625843
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=o53gaJHF;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1BYu517794
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674071;
	bh=nPHIr4kql8mbXw1oZdMpggLA2RfoDhBMo9x5aJQMa0A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=o53gaJHFSzCel76TVYHqee5UPKJp5i/0LudHiWB0Cl9tyXlxAfXf34jsZrNmdT8Vg
	 qrasbMS/IXIFhs0w46dELd0T9nSs45pKzwSUyqRy3qqGkVyehJkWo9BIx8TM5PQ4Kp
	 ReBCVb579ppIr31FbSi6bsFVJSzdgvp3/ghLEoYY=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1Aeg015601
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:01:10 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:10 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1A9U111278;
	Mon, 19 May 2025 12:01:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rS-0005ry-Hd; Mon, 19 May 2025 12:01:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 2/8] CLEANUP: Variable assignments need spaces
Date: Mon, 19 May 2025 12:01:04 -0500
Message-ID: <20250519170110.22506-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16219

A recent change in bitbake requires that all variable assignments have
whitespace between the variable, the operator and the value.

FOO = "1"

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../conf/distro/include/branding-processor-sdk.inc              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 7873daa7..3ee23dc3 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -10,7 +10,7 @@ The below commit is used for this local branch and is the one used by\\n\
 this sdk:\\n\
 ${SRCREV}."
 
-SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE ="${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
+SRCIPK_SHALLOW_GIT_COMMIT_MESSAGE = "${SRCIPK_GIT_COMMIT_MESSAGE}\\n\\n\
 To reduce the size of the SDK installer only a portion of the git commit\\n\
 history has been preserved. Also links to remote branches and tags do\\n\
 not exist in this copy of the repository.\\n\
-- 
2.17.1


