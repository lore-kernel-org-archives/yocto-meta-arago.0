Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6137BC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:05:37 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web08.2327.1651003532727722159
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TmWFbH0U;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK5Usn015095;
	Tue, 26 Apr 2022 15:05:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003530;
	bh=G0GTyXzSrC+CmNoik5EoEjilB9EBFZiJMSf5BtrUI3U=;
	h=From:To:CC:Subject:Date;
	b=TmWFbH0UQ7Jsbob9RidkGSASze/v2yNsPy4uPVZmeKbhtrEEdRydW1k4JLEfYRaua
	 eMILQbOIxfBdTUHCfR11VO+JB2may+qw/a4jUzP8C0s0ACrcdc0mm2+hlehB3/eYar
	 U6fwdY6FB61gIiaozcl34RBQ+ZQXmHooR02L4yhY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK5UUc123572
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:05:30 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:05:30 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:05:30 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK5TwI020120;
	Tue, 26 Apr 2022 15:05:30 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Nishanth Menon <nm@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH] Fix non-standard shell usage
Date: Tue, 26 Apr 2022 15:05:29 -0500
Message-ID: <20220426200529.19956-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:05:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13799

Remove some Bashisms that prevent prevent this script from working
on stock Ubuntu (with Dash default interpreter).

Signed-off-by: Andrew Davis <afd@ti.com>
---
 oe-layertool-setup.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index f171f94..e05737b 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -780,7 +780,7 @@ print_image_names() {
     for FOLDER in ${FOLDERS}
     do
         RECO=""
-        if [ "${FOLDER}" == "meta-arago" ]; then
+        if [ "${FOLDER}" = "meta-arago" ]; then
             RECO="[recommended]"
         fi
         echo "From ${FOLDER}${RECO}:"
@@ -796,7 +796,7 @@ print_image_names() {
                     if [ -z "${summary}" ]; then
                         summary="No Summary available"
                     fi
-                    echo -e "\t${name}: ${summary}"
+                    echo "    ${name}: ${summary}"
                 done
             fi
         done
-- 
2.17.1


