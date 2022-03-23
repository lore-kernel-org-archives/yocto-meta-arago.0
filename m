Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DBCC433FE
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 21:07:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2734.1648069672869863095
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 14:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fLr+f3vE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7pGM058068;
	Wed, 23 Mar 2022 16:07:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648069671;
	bh=NbfiiR4jA7sjBxN1zXdOMabH6D31EP+zn391sFaWWOU=;
	h=From:To:Subject:Date;
	b=fLr+f3vEoDUeYMHQYfqe2p1vhnQx1y3Q4R7RfsuPuqjo/zBoni6T7su+cYeuKewhB
	 /SrbGUJnyQE+Ig96AARqnkvwDX5MGqiUZLw5nUQbmgBS4d5QgDWV+DZmOJeM4Mnk+f
	 kW61gRywtUgm6Pz2o0m1EOQJrU8I7szDE9Ehqc1A=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NL7pSX058747
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 16:07:51 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 16:07:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 16:07:50 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NL7oqT045051;
	Wed, 23 Mar 2022 16:07:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nX8Cs-00013a-JP; Wed, 23 Mar 2022 16:07:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/dunfell][PATCH v2 0/2] Adding support for am62xx
Date: Wed, 23 Mar 2022 16:07:48 -0500
Message-ID: <20220323210750.3959-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 21:07:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13733

These patches add initial recipe support for am62xx.

--
v2: Changes based on feedback from mailing list:
    - Made additional changes for am62xx in the packagegroups and
      ti-tisdk-makefile files.
    - Changed the variable settings for the graphics to explicitly
      call out the am62xx.


Krunal Bhargav (1):
  packagegroup-*-graphics: add virtual provider for AM62x GPU driver v2

Nishanth Menon (1):
  ti-tisdk-makefile: adding uboot r5 config variable for am62xx

 meta-arago-distro/conf/distro/include/arago-prefs.inc      | 7 +++++++
 .../packagegroup-arago-tisdk-addons-sdk-host.bb            | 4 ++++
 .../packagegroups/packagegroup-arago-tisdk-addons.bb       | 1 +
 .../ti-tisdk-makefile/Makefile_sysfw-image                 | 1 +
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb             | 6 ++++++
 5 files changed, 19 insertions(+)

-- 
2.17.1


