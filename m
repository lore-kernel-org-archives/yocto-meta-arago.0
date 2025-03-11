Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82C86C2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 17:22:02 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.15816.1741713721975159496
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 11 Mar 2025 10:22:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CyYlJ2cj;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52BHM08d1253045
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 12:22:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741713720;
	bh=3qERRd7ULnXgictmjsUjwcHtM7PUqZhdbeagk2eai+4=;
	h=From:To:Subject:Date;
	b=CyYlJ2cj5bFqVfIyzFlr0lYG70Mua04ykDAOqmQA/pWPuAV3kNi56eJJNvfpzGQMR
	 +SZdwaI5wRetRIzpPPXIlCcJ748b6PDjMsytjVvUJ3nwPo5sVZzHYOxwLC1giUv3Qo
	 O7voabFzIhHzdv95VOggxhYauAEDyfvFNcbeBkOg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52BHM0xZ018499
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Mar 2025 12:22:00 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 11
 Mar 2025 12:21:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 11 Mar 2025 12:21:59 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52BHLxvE010691;
	Tue, 11 Mar 2025 12:21:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ts3Il-0001bc-Kc; Tue, 11 Mar 2025 12:21:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2] open62541: fix examples binaries packaging
Date: Tue, 11 Mar 2025 12:21:59 -0500
Message-ID: <20250311172159.6128-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 11 Mar 2025 17:22:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15976

From: Denys Dmytriyenko <denys@konsulko.com>

Recent update in upstream meta-oe changed FILES list to only include
libraries, which is correct when no examples are built. Our bbappend
enables building examples and those are placed into own directory.
But there are 2 exceptions where ua_client and ua_server are placed
under ${bindir} and now those trigger a QA error about unpackaged
files. While these 2 files should probably go along with other example
binaries, for now restore the previous behavior of packaging them
into ${bindir} in case some downstream usage expects them there.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Move the changes over to the .bbappend so that this change can be
accepted right now.  We will rebase master-wip on top of this patch.

 .../recipes-connectivity/open62541/open62541_%.bbappend          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
index 7ce16235..765639fa 100644
--- a/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
+++ b/meta-arago-extras/recipes-connectivity/open62541/open62541_%.bbappend
@@ -27,6 +27,7 @@ do_install:append() {
 }
 
 PACKAGES =+ "${PN}-examples ${PN}-tests"
+FILES:${PN} += "${bindir}"
 FILES:${PN}-dev += "${libdir}/cmake/* ${datadir}/${BPN}/tools"
 FILES:${PN}-examples += "${datadir}/${BPN}/examples"
 FILES:${PN}-tests += "${datadir}/${BPN}/tests"
-- 
2.17.1


