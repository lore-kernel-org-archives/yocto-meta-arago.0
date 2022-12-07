Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9BFC4708E
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 17:37:52 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.22273.1670434665259697666
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Dec 2022 09:37:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aEgsRtEk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B7HbiDR034767
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Dec 2022 11:37:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670434664;
	bh=hVdjOFh5N7SYIC+vh0MK0wmZog0LWpP/5OkRxwiH3wI=;
	h=From:To:CC:Subject:Date;
	b=aEgsRtEkeMfx8nXZZ23LAH37RNGNcsE5A5eJQQE2awZ9OAeAuiS/t1BLW79Lj6kOE
	 fpTIbOXRFMFJiV78M9T/NenUqSXZ3C66cfGzi6murltE69jzDlqn+M9IO2nYbjHl/h
	 m89rQpQshkXKRMjkZL6w65eJT5rMaSWqyYUNIrIk=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B7HbibQ014194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 7 Dec 2022 11:37:44 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 7
 Dec 2022 11:37:44 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 7 Dec 2022 11:37:44 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B7HbhNo046826;
	Wed, 7 Dec 2022 11:37:43 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <g-gupta@ti.com>, <reatmon@ti.com>
CC: <khasim@ti.com>, <dannenberg@ti.com>
Subject: [meta-arago][oe-layersetup][master][PATCH] configs: Add oe-config file for 08.04.01.09 Release
Date: Wed, 7 Dec 2022 23:07:40 +0530
Message-ID: <20221207173740.20664-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Dec 2022 17:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14129

Add oe-config file for AM62x 08.04.01.09 release.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
---
 .../processor-sdk-08.04.01.09-config.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-08.04.01.09-config.txt

diff --git a/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt
new file mode 100644
index 0000000..9c8c9fd
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,cicd.2022.10.28.09.04.44,layers=meta-arago-distro:meta-arago-extras
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,cicd.2022.10.28.09.04.44,layers=
+meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


