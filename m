Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCF5CE7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 17:21:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.24932.1734024068742599759
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 12 Dec 2024 09:21:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iA+e32g6;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BCHL7eG2964210
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Dec 2024 11:21:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734024067;
	bh=y6YyJEPtww/BJBK/hU8Vl7Gxiyp7lytpsXB4wF65lzw=;
	h=From:To:Subject:Date;
	b=iA+e32g6moru20HcT7x1HR/4QJCJsGNr0qq2wAM+AldCd9LIRqjaSR199Xju+Qkf4
	 qhtBgdc+/lJXieC2WKL9afK9WHP7Y4vf5pkLEBDx7OcPv3Yq7SsFxrEhSLlHuaD2Vg
	 gFf43QwTjqHD8z1emS+8LObOlqvwEwW/9tCghDsE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BCHL6kb089702
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 Dec 2024 11:21:06 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Dec 2024 11:21:06 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Dec 2024 11:21:06 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BCHL6wv030575;
	Thu, 12 Dec 2024 11:21:06 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tLms5-0002P4-Vm; Thu, 12 Dec 2024 11:21:06 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] README: Update instructions for adding new config
Date: Thu, 12 Dec 2024 11:21:05 -0600
Message-ID: <20241212172105.9198-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 12 Dec 2024 17:21:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15654

Add in the requirements for make and xsltproc, and document the newly
modified convert.pl script.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 README | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/README b/README
index 040d308..8928211 100644
--- a/README
+++ b/README
@@ -1,4 +1,7 @@
 
+History
+===============================================================================
+
 The oe-layersetup repository was created by Texas Instruments back in 2012
 as both a tool for configuring OpenEmbedded builds and the place to house
 the configuration files for rebuilding all of the releases of our software.
@@ -29,6 +32,24 @@ need.  Additionally, we have created a Makefile and XSLT files that can
 generate the various configuration files for oe-layersetup, kas, and
 bitbake-setup.
 
+
+Adding New Configurations
+===============================================================================
+
+There are only two tool requirements for adding a new config:
+  - make
+  - xsltproc
+
+Both tools should be readily available on all distributions, but you might need
+to install the packages.
+
+There are two methods for adding a new configuration: Adding XML directly, or
+converting an oe-layersetup config.
+
+
+Adding XML directly
+-------------------
+
 If you want to add a new configuration, you need to create the appropriate XML
 file in src/configs, run make in src, and then commit all of the new files.
 
@@ -37,3 +58,29 @@ file in src/configs, run make in src, and then commit all of the new files.
 - make
 - git status
 
+
+Converting oe-layersetup config
+-------------------------------
+
+If the flow you are working with already is using a modified oe-layersetup
+config, or generates a locked down oe-layersetup config as an artifact, then
+you can run the convert.pl script to translate that file into the XML config.
+
+./src/bin/convert.pl --input <file> --config-name <name>
+
+The <file> is simply the file you want to import, and the <name> is the name
+of the config to import to.  The name should also include any subdirectories
+under configs where the file should go.  For example:
+
+./src/bin/convert.pl \
+        --input saved-config.txt \
+        --config-name coresdk/coresdk-10.01.08-config
+
+This will create the XML file: src/configs/coresdk/coresdk-10.01.08-config.xml
+
+From there you run the same steps as if you had added the XML config yourself:
+
+- cd src
+- make
+- git status
+
-- 
2.17.1


