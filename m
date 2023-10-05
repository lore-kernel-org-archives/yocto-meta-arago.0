Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA00E7AD45
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 16:57:10 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.20883.1696525024807089978
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 Oct 2023 09:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=thAFJ2c+;
 spf=none, err=SPF record not found (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 395Gv3DG086129;
	Thu, 5 Oct 2023 11:57:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696525023;
	bh=BaFyP84GI0YtaLHFdK/hLGeDF3GfBEYq4E2A3JfSho4=;
	h=From:To:Subject:Date;
	b=thAFJ2c+Nz6gnwgixlaH88leFBuuIba+SrWNYLSZH/90wMAMnwtDryyEDz33Z/MtH
	 wOzpHq3I6RIWs6s9bvNE7CWSaPrSYlLSHZrCkvEkHV0sFxLeZ9/KAksN4W6gjCGsLK
	 IkDr5hkVdB5smxzSOCXqm/aU15+Z1oOy7EFV9Ta0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 395Gv3Jd041509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 Oct 2023 11:57:03 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Oct 2023 11:57:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Oct 2023 11:57:03 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 395Gv39o021997;
	Thu, 5 Oct 2023 11:57:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qoRep-0008TX-4a; Thu, 05 Oct 2023 11:57:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-sw-manifest: Fix generate_sw_manifest_table
Date: Thu, 5 Oct 2023 11:57:03 -0500
Message-ID: <20231005165703.32540-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 Oct 2023 16:57:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14923

The generated manifest file is expected to strictly have 7 columns,
delimited by '|' while the License section also sometimes has '|'
character. Replace this one by 'or' to fix manifest file

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/classes/tisdk-sw-manifest.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
index 041d33b6..c62e3557 100644
--- a/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
+++ b/meta-arago-distro/classes/tisdk-sw-manifest.bbclass
@@ -469,7 +469,7 @@ EOF
         package="`cat $i | grep Package: | awk {'print $2'}`"
         version="`cat $i | grep Version: | awk {'print $2'} | cut -f1-2 -d-`"
         long_version="`cat $i | grep Version: | awk {'print $2'}`"
-        license="`cat $i | grep License: | cut -d: -f2 `"
+        license="`cat $i | grep License: | cut -d: -f2 | sed 's/|/or/g' `"
         architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
         sources="`cat $i | grep Source: | cut -d ':' -f2-`"
         location="$package""_""$long_version""_""$architecture"".ipk"
-- 
2.17.1


