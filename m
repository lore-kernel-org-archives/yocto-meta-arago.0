Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90B1FC64EC4
	for <webhook@archiver.kernel.org>; Thu,  9 Mar 2023 19:09:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.94.1678388949578666352
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Mar 2023 11:09:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZIjmaRNo;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 329J957N094245;
	Thu, 9 Mar 2023 13:09:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678388945;
	bh=xmQ+TAASaIIYBz7Jb/uYkSOk5UR6SpcvZZh/UOHoSQY=;
	h=From:To:CC:Subject:Date;
	b=ZIjmaRNoNYW4RG9hJDoOHWxXJnKEeXXKvyYUIrJNrj1DLKcXzteTu4qC7WRuRBUhi
	 Tu/5sNoaU/hnWFh8WTK7DmP1Dz+i+b4mgfrjqk+f/F/v7BRz/s3uhlNBp3vlGHuBZ0
	 eTh3ec++y/w63anN1mNegTJsRgHwLDELSwTQuGd4=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 329J94ps058624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Mar 2023 13:09:04 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 9
 Mar 2023 13:09:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 9 Mar 2023 13:09:03 -0600
Received: from res-desktop.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 329J93tU088833;
	Thu, 9 Mar 2023 13:09:03 -0600
From: Randolph Sapp <rs@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: meta-arago <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [oe-layersetup][master][PATCH] configs: change git:// urls to https://
Date: Thu, 9 Mar 2023 13:08:58 -0600
Message-ID: <20230309190858.395668-1-rs@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 09 Mar 2023 19:09:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14256

We did this in meta-ti and meta-arago but I didn't propagate back into
oe-layersetup yet so I'll give it a go. This is required thanks to
git:// urls clashing with proxy configs.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 configs/amsdk/amsdk-05.06.00.00-config.txt       |  6 +++---
 configs/amsdk/amsdk-05.07.00.00-config.txt       | 10 +++++-----
 configs/amsdk/amsdk-06.00.00.00-config.txt       | 12 ++++++------
 configs/amsdk/amsdk-07.00.00.00-config.txt       | 12 ++++++------
 configs/amsdk/amsdk-07.01.00.00-config.txt       | 12 ++++++------
 configs/amsdk/amsdk-08.00.00.00-config.txt       | 12 ++++++------
 configs/arago-dunfell-config.txt                 | 16 ++++++++--------
 configs/arago-dunfell-next-config.txt            | 16 ++++++++--------
 configs/arago-dunfell-wip-config.txt             | 16 ++++++++--------
 configs/arago-kirkstone-config.txt               | 14 +++++++-------
 configs/arago-kirkstone-next-config.txt          | 14 +++++++-------
 configs/arago-kirkstone-wip-config.txt           | 14 +++++++-------
 configs/arago-master-config.txt                  | 14 +++++++-------
 configs/arago-master-wip-config.txt              | 14 +++++++-------
 configs/coresdk/coresdk-07.00.00.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.01.00.001-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.01.00.004-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.01.00.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.01.00.006-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.02.00.004-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-07.03.00.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.00.00.004-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.01.00.006-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.02.00.006-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.03.00.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.04.00.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.04.01.005-config.txt  | 14 +++++++-------
 configs/coresdk/coresdk-08.05.00.005-config.txt  | 16 ++++++++--------
 configs/coresdk/coresdk-08.05.00.007-config.txt  | 16 ++++++++--------
 configs/coresdk/coresdk-08.06.00.006-config.txt  | 16 ++++++++--------
 configs/coresdk/coresdk-08.06.00.007-config.txt  | 16 ++++++++--------
 configs/coresdk/coresdk-2013.04.00-config.txt    | 12 ++++++------
 .../coresdk/coresdk-2013.04.01-amsdk-config.txt  | 12 ++++++------
 configs/coresdk/coresdk-2013.04.01-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2013.04.02-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2013.12.00-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2013.12.01-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2014.08.00-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2014.10.01-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2014.10.02-config.txt    | 12 ++++++------
 configs/coresdk/coresdk-2015.01-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2015.02-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2015.03-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.01-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.02-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.03-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.04-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.05-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2016.06-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.00-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.01-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.02-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.03-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.04-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.05-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2017.06-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.00-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.01-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.02-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.03-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.04-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2018.05-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2019.00-config.txt       | 12 ++++++------
 configs/coresdk/coresdk-2019.01-config.txt       | 14 +++++++-------
 configs/coresdk/coresdk-2019.02-config.txt       | 14 +++++++-------
 configs/coresdk/coresdk-2019.03-config.txt       | 14 +++++++-------
 configs/coresdk/coresdk-2019.04-config.txt       | 14 +++++++-------
 configs/coresdk/coresdk-2019.05-config.txt       | 14 +++++++-------
 configs/coresdk/coresdk-2019.06-config.txt       | 14 +++++++-------
 configs/distroless-dunfell-config.txt            |  8 ++++----
 configs/distroless-kirkstone-config.txt          |  8 ++++----
 configs/distroless-master-config.txt             |  8 ++++----
 configs/glsdk/glsdk-06.01.00-config.txt          | 12 ++++++------
 configs/glsdk/glsdk-06.02.00-config.txt          | 12 ++++++------
 configs/glsdk/glsdk-06.02.01-config.txt          | 12 ++++++------
 configs/glsdk/glsdk-06.02.01.02-config.txt       | 12 ++++++------
 configs/glsdk/glsdk-06.03.00.01-config.txt       | 12 ++++++------
 configs/glsdk/glsdk-06.04.00.02-config.txt       | 12 ++++++------
 configs/mcsdk/mcsdk-03.00.00.03-config.txt       | 10 +++++-----
 configs/mcsdk/mcsdk-03.00.00.05-config.txt       | 12 ++++++------
 configs/mcsdk/mcsdk-03.00.00.06-config.txt       | 12 ++++++------
 configs/mcsdk/mcsdk-03.00.00.07-config.txt       | 12 ++++++------
 configs/mcsdk/mcsdk-03.00.04.18-config.txt       | 14 +++++++-------
 configs/mcsdk/mcsdk-03.01.00.03-config.txt       | 14 +++++++-------
 configs/mcsdk/mcsdk-03.01.01.04-config.txt       | 14 +++++++-------
 configs/mcsdk/mcsdk-03.01.02.05-config.txt       | 14 +++++++-------
 configs/mcsdk/mcsdk-03.01.03.06-config.txt       | 14 +++++++-------
 configs/mcsdk/mcsdk-03.01.04.07-config.txt       | 16 ++++++++--------
 configs/mcsdk/mcsdk-3.1.0-config.txt             | 14 +++++++-------
 configs/mcsdk/mcsdk-dylan-config.txt             | 14 +++++++-------
 configs/poky-dunfell-config.txt                  |  8 ++++----
 configs/poky-kirkstone-config.txt                | 12 ++++++------
 configs/poky-master-config.txt                   | 12 ++++++------
 configs/poky-master-wip-config.txt               | 12 ++++++------
 .../processor-sdk-linux-07_01_00.txt             | 16 ++++++++--------
 .../processor-sdk-linux-07_03_00.txt             | 16 ++++++++--------
 .../processor-sdk-linux-08_00_00.txt             | 16 ++++++++--------
 .../processor-sdk-linux-08_01_00.txt             |  6 +++---
 .../processor-sdk-linux-08_02_00.txt             |  8 ++++----
 .../processor-sdk-linux-08_02_01_00.txt          |  6 +++---
 .../processor-sdk-linux-08_04_00.txt             |  8 ++++----
 .../processor-sdk-linux-08_05_00.txt             | 10 +++++-----
 .../processor-sdk-01.00.00.00-config.txt         | 14 +++++++-------
 .../processor-sdk-01.00.00.03-config.txt         | 14 +++++++-------
 .../processor-sdk-02.00.00.00-config.txt         | 14 +++++++-------
 .../processor-sdk-02.00.01.07-config.txt         | 14 +++++++-------
 .../processor-sdk-02.00.02.11-config.txt         | 14 +++++++-------
 .../processor-sdk-03.00.00.04-config.txt         | 14 +++++++-------
 .../processor-sdk-03.01.00.06-config.txt         |  8 ++++----
 .../processor-sdk-03.02.00.05-config.txt         |  8 ++++----
 .../processor-sdk-03.03.00.04-config.txt         |  8 ++++----
 .../processor-sdk-04.00.00.04-config.txt         | 14 +++++++-------
 .../processor-sdk-04.01.00.06-config.txt         | 14 +++++++-------
 .../processor-sdk-04.01.00.06-x11-config.txt     | 14 +++++++-------
 .../processor-sdk-04.02.00.09-config.txt         | 14 +++++++-------
 .../processor-sdk-04.03.00.05-config.txt         | 10 +++++-----
 .../processor-sdk-05.00.00.15-config.txt         |  8 ++++----
 .../processor-sdk-05.01.00.11-config.txt         |  8 ++++----
 .../processor-sdk-05.02.00.10-config.txt         | 10 +++++-----
 .../processor-sdk-05.03.00.07-config.txt         | 10 +++++-----
 .../processor-sdk-06.00.00.07-config.txt         | 10 +++++-----
 .../processor-sdk-06.01.00.08-config.txt         | 10 +++++-----
 .../processor-sdk-06.02.00.81-config.txt         | 10 +++++-----
 .../processor-sdk-06.03.00.106-config.txt        | 10 +++++-----
 .../processor-sdk-07.03.00.005-config.txt        | 16 ++++++++--------
 .../processor-sdk-08.00.00.21-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.01.00.39-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.02.00.14-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.02.00.17-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.02.00.23-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.02.00.24-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.03.00.19-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.04.01.03-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.04.01.04-config.txt         | 16 ++++++++--------
 .../processor-sdk-08.04.01.09-config.txt         | 16 ++++++++--------
 .../processor-sdk/processor-sdk-daisy-config.txt | 14 +++++++-------
 .../processor-sdk-dunfell-07.01.00.txt           | 16 ++++++++--------
 .../processor-sdk/processor-sdk-morty-config.txt | 14 +++++++-------
 .../processor-sdk/processor-sdk-rocko-config.txt | 10 +++++-----
 139 files changed, 881 insertions(+), 881 deletions(-)

diff --git a/configs/amsdk/amsdk-05.06.00.00-config.txt b/configs/amsdk/amsdk-05.06.00.00-config.txt
index bda8c46..320b8de 100644
--- a/configs/amsdk/amsdk-05.06.00.00-config.txt
+++ b/configs/amsdk/amsdk-05.06.00.00-config.txt
@@ -1,10 +1,10 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
+bitbake,https://git.openembedded.org/bitbake,master,1.15.2,layers=
 meta-arago,http://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-05.06.00.00-integration,amsdk-05.06.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
+meta-openembedded,https://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
 meta-ti,http://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-05.06.00.00-integration,amsdk-05.06.00.00-release,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
 OECORELAYERCONF=./sample-files/denzil/bblayers-denzil.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/amsdk/amsdk-05.07.00.00-config.txt b/configs/amsdk/amsdk-05.07.00.00-config.txt
index 03c7dee..2a96c30 100644
--- a/configs/amsdk/amsdk-05.07.00.00-config.txt
+++ b/configs/amsdk/amsdk-05.07.00.00-config.txt
@@ -1,10 +1,10 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-05.07.00.00-integration,amsdk-05.07.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,ba80b770c8ba6e38383b9ce142af68a8a6553f2e,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-05.07.00.00-integration,amsdk-05.07.00.00-release,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,d961e42674bf929adfff391c6f3f284a7e7b0d95,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-05.07.00.00-integration,amsdk-05.07.00.00-release,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,ba80b770c8ba6e38383b9ce142af68a8a6553f2e,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-05.07.00.00-integration,amsdk-05.07.00.00-release,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,d961e42674bf929adfff391c6f3f284a7e7b0d95,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/amsdk/amsdk-06.00.00.00-config.txt b/configs/amsdk/amsdk-06.00.00.00-config.txt
index 306665a..29a7bc7 100644
--- a/configs/amsdk/amsdk-06.00.00.00-config.txt
+++ b/configs/amsdk/amsdk-06.00.00.00-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-06.00.00.00-integration,amsdk-06.00.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-06.00.00.00-integration,amsdk-06.00.00.00-release,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-06.00.00.00-integration,amsdk-06.00.00.00-release,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-06.00.00.00-integration,amsdk-06.00.00.00-release,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/amsdk/amsdk-07.00.00.00-config.txt b/configs/amsdk/amsdk-07.00.00.00-config.txt
index 8f8487e..1becdf7 100644
--- a/configs/amsdk/amsdk-07.00.00.00-config.txt
+++ b/configs/amsdk/amsdk-07.00.00.00-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/amsdk/amsdk-07.01.00.00-config.txt b/configs/amsdk/amsdk-07.01.00.00-config.txt
index b4ed1cb..f784e62 100644
--- a/configs/amsdk/amsdk-07.01.00.00-config.txt
+++ b/configs/amsdk/amsdk-07.01.00.00-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/amsdk/amsdk-08.00.00.00-config.txt b/configs/amsdk/amsdk-08.00.00.00-config.txt
index 973e98d..06b18a9 100644
--- a/configs/amsdk/amsdk-08.00.00.00-config.txt
+++ b/configs/amsdk/amsdk-08.00.00.00-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.22,8e386a710023e000a504e05c13da0106df0c7f3a,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.22,8e386a710023e000a504e05c13da0106df0c7f3a,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,37e921db22689131144b453d53a8cce4a314aa48,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,f34de2175f1d6a443f219b8ceaaf796cfbc6efd5,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,f34de2175f1d6a443f219b8ceaaf796cfbc6efd5,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-amsdk.conf.sample
diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index c5084a0..bff059d 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 7ad9f92..3c0c3f4 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-dunfell-wip-config.txt b/configs/arago-dunfell-wip-config.txt
index b8c9cce..7bdc0cd 100644
--- a/configs/arago-dunfell-wip-config.txt
+++ b/configs/arago-dunfell-wip-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-wip,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell-wip,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index ebe130a..890076f 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index 4d58445..5214302 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index b293632..9f0b0c2 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index 93d93b5..d5fc21f 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index 55c883b..54fed42 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/coresdk/coresdk-07.00.00.005-config.txt b/configs/coresdk/coresdk-07.00.00.005-config.txt
index e2bf4e6..cd86517 100644
--- a/configs/coresdk/coresdk-07.00.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.00.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,6cc09fa33131f71a3fd0e336ff07a4186b41bf8f
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.00.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,6cc09fa33131f71a3fd0e336ff07a4186b41bf8f
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.00.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,fdd19517e17240b0b61765bd02fc483a1bde986f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,237879d59e11187a49216a88b73a057408e4b3f7,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,e413c1ef621688e69bb7830bb3151ed23b30b73e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.00.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,f8ea9ac3a06f543bd3dc259ffc1b60eb197a132d,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,c88cf750f26f6786d6ba5b4f1f7e5d4f0c800e6e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,237879d59e11187a49216a88b73a057408e4b3f7,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,e413c1ef621688e69bb7830bb3151ed23b30b73e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.00.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,f8ea9ac3a06f543bd3dc259ffc1b60eb197a132d,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,c88cf750f26f6786d6ba5b4f1f7e5d4f0c800e6e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.01.00.001-config.txt b/configs/coresdk/coresdk-07.01.00.001-config.txt
index 5225d3f..80ec067 100644
--- a/configs/coresdk/coresdk-07.01.00.001-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.001-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.001,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.001,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,654ad8bea49f142d20b2b96c0dd44810a6be233a,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.001,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,bec0a45393d968251059f5075add2cf633aecd1a,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,654ad8bea49f142d20b2b96c0dd44810a6be233a,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.001,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,bec0a45393d968251059f5075add2cf633aecd1a,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.01.00.004-config.txt b/configs/coresdk/coresdk-07.01.00.004-config.txt
index a32ea29..8534fa7 100644
--- a/configs/coresdk/coresdk-07.01.00.004-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.004-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.004,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.004,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.004,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,3ee9590f96cb50e93864db768b254773e2ff9465,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.004,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,3ee9590f96cb50e93864db768b254773e2ff9465,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.01.00.005-config.txt b/configs/coresdk/coresdk-07.01.00.005-config.txt
index 9174c92..eb9e11d 100644
--- a/configs/coresdk/coresdk-07.01.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,5f644082fc3c2bbd89b898d5ca7cd4414cda4a64,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,5f644082fc3c2bbd89b898d5ca7cd4414cda4a64,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.01.00.006-config.txt b/configs/coresdk/coresdk-07.01.00.006-config.txt
index 210b52f..81482a9 100644
--- a/configs/coresdk/coresdk-07.01.00.006-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.006-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.02.00.004-config.txt b/configs/coresdk/coresdk-07.02.00.004-config.txt
index a7e9880..a2623f8 100644
--- a/configs/coresdk/coresdk-07.02.00.004-config.txt
+++ b/configs/coresdk/coresdk-07.02.00.004-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.02.00.004,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.02.00.004,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,92cd3467502bd27b98a76862ca6525ce425a8479,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,f2d02cb71eaff8eb285a1997b30be52486c160ae,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.02.00.004,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,72431ee8de5e3a53d259cebf420a7713ac9e1f14,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,92cd3467502bd27b98a76862ca6525ce425a8479,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,f2d02cb71eaff8eb285a1997b30be52486c160ae,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.02.00.004,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,72431ee8de5e3a53d259cebf420a7713ac9e1f14,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-07.03.00.005-config.txt b/configs/coresdk/coresdk-07.03.00.005-config.txt
index 2519cdb..232d9c2 100644
--- a/configs/coresdk/coresdk-07.03.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.03.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.00.00.004-config.txt b/configs/coresdk/coresdk-08.00.00.004-config.txt
index 596a1d7..2e0c63b 100644
--- a/configs/coresdk/coresdk-08.00.00.004-config.txt
+++ b/configs/coresdk/coresdk-08.00.00.004-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.01.00.006-config.txt b/configs/coresdk/coresdk-08.01.00.006-config.txt
index 26dd996..138f834 100644
--- a/configs/coresdk/coresdk-08.01.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.01.00.006-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.02.00.006-config.txt b/configs/coresdk/coresdk-08.02.00.006-config.txt
index 8eab286..c79c00c 100644
--- a/configs/coresdk/coresdk-08.02.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.02.00.006-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.03.00.005-config.txt b/configs/coresdk/coresdk-08.03.00.005-config.txt
index dc683f4..071a1d8 100644
--- a/configs/coresdk/coresdk-08.03.00.005-config.txt
+++ b/configs/coresdk/coresdk-08.03.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0784db7dd0fef6f0621ad8d74372f44e87fef950
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.03.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7dd0fef6f0621ad8d74372f44e87fef950
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.03.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,f6b88c1d2f515ffac90457c0d649d6c805fff736,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,8ff12bfffcf0840d5518788a53d88d708ad3aae0,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.03.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,48ce924dc82aa959fb897ec36873db7dc3813b71,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,f6b88c1d2f515ffac90457c0d649d6c805fff736,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,8ff12bfffcf0840d5518788a53d88d708ad3aae0,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.03.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,48ce924dc82aa959fb897ec36873db7dc3813b71,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.04.00.005-config.txt b/configs/coresdk/coresdk-08.04.00.005-config.txt
index da8fdb8..44a2402 100644
--- a/configs/coresdk/coresdk-08.04.00.005-config.txt
+++ b/configs/coresdk/coresdk-08.04.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,7fc4cffebf5dcc1d050416c0b7f7d58c765c1d69
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,7fc4cffebf5dcc1d050416c0b7f7d58c765c1d69
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.04.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,a63a54df3170fed387f810f23cdc2f483ad587df,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,52cee67833d1975a5bd52e4556c4cd312425a017,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,3f40d5f095ceb099b604750db96058df00fcd49e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,a63a54df3170fed387f810f23cdc2f483ad587df,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,52cee67833d1975a5bd52e4556c4cd312425a017,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.04.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,3f40d5f095ceb099b604750db96058df00fcd49e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-08.04.01.005-config.txt b/configs/coresdk/coresdk-08.04.01.005-config.txt
index b0a3000..a4fdb22 100644
--- a/configs/coresdk/coresdk-08.04.01.005-config.txt
+++ b/configs/coresdk/coresdk-08.04.01.005-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,048d682b031644fb9f0d41a489bacb873aa27bd7
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,048d682b031644fb9f0d41a489bacb873aa27bd7
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
 BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/coresdk/coresdk-08.05.00.005-config.txt b/configs/coresdk/coresdk-08.05.00.005-config.txt
index 0876538..4b0972d 100644
--- a/configs/coresdk/coresdk-08.05.00.005-config.txt
+++ b/configs/coresdk/coresdk-08.05.00.005-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.05.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.005,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.05.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,1ee082e979baaba871bbe1d91181bb04951faf3b,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,1ee082e979baaba871bbe1d91181bb04951faf3b,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/coresdk/coresdk-08.05.00.007-config.txt b/configs/coresdk/coresdk-08.05.00.007-config.txt
index 7507069..8f7f24e 100644
--- a/configs/coresdk/coresdk-08.05.00.007-config.txt
+++ b/configs/coresdk/coresdk-08.05.00.007-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.007,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.007,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,408bf1b4bb4f4ed126c17fb3676f9fa0513065ba,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/coresdk/coresdk-08.06.00.006-config.txt b/configs/coresdk/coresdk-08.06.00.006-config.txt
index 2d264d4..393b0ca 100644
--- a/configs/coresdk/coresdk-08.06.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.06.00.006-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,c527976e28165de9606497c48d834872fe68372e
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.06.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,c527976e28165de9606497c48d834872fe68372e
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.06.00.006,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,e707e9b7cf5c62bff4fee029965a87b22dd4ccba,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.06.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,e707e9b7cf5c62bff4fee029965a87b22dd4ccba,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.06.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/coresdk/coresdk-08.06.00.007-config.txt b/configs/coresdk/coresdk-08.06.00.007-config.txt
index 1e5fd18..2c41d4c 100644
--- a/configs/coresdk/coresdk-08.06.00.007-config.txt
+++ b/configs/coresdk/coresdk-08.06.00.007-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,a4cd5b0b4b355b7b75fb48c61289700e3e908b2a
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.06.00.007,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,a4cd5b0b4b355b7b75fb48c61289700e3e908b2a
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.06.00.007,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-# meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+# meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,87571345059f82fb7599e3aa82e6fdcfbd361098,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.06.00.007,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,87571345059f82fb7599e3aa82e6fdcfbd361098,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.06.00.007,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,daaee6fcb0d201f041678af433d8e1cd6f924d09,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
diff --git a/configs/coresdk/coresdk-2013.04.00-config.txt b/configs/coresdk/coresdk-2013.04.00-config.txt
index 7db95b7..3ce9b0a 100644
--- a/configs/coresdk/coresdk-2013.04.00-config.txt
+++ b/configs/coresdk/coresdk-2013.04.00-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2013.04.00,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,34e5537e67b655b8d2effbbecc207d88eea52b87,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,ti2013.04.00,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,9ab2fc380fe8b6e48c6501a4630cc3c583ed2da5,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2013.04.00,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,34e5537e67b655b8d2effbbecc207d88eea52b87,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,danny,ti2013.04.00,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,9ab2fc380fe8b6e48c6501a4630cc3c583ed2da5,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2013.04.01-amsdk-config.txt b/configs/coresdk/coresdk-2013.04.01-amsdk-config.txt
index 97cba7b..4c9c537 100644
--- a/configs/coresdk/coresdk-2013.04.01-amsdk-config.txt
+++ b/configs/coresdk/coresdk-2013.04.01-amsdk-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-amsdk.conf.sample
diff --git a/configs/coresdk/coresdk-2013.04.01-config.txt b/configs/coresdk/coresdk-2013.04.01-config.txt
index f9e7802..18a42f1 100644
--- a/configs/coresdk/coresdk-2013.04.01-config.txt
+++ b/configs/coresdk/coresdk-2013.04.01-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2013.04.02-config.txt b/configs/coresdk/coresdk-2013.04.02-config.txt
index 6159262..b63247d 100644
--- a/configs/coresdk/coresdk-2013.04.02-config.txt
+++ b/configs/coresdk/coresdk-2013.04.02-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,ti2013.04.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2013.04.02,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,danny,ti2013.04.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2013.12.00-config.txt b/configs/coresdk/coresdk-2013.12.00-config.txt
index 345f56a..633b6ed 100644
--- a/configs/coresdk/coresdk-2013.12.00-config.txt
+++ b/configs/coresdk/coresdk-2013.12.00-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,28bedc0f3780fc08632f290a20e59d075d4922cf,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,ti2013.12.x,28bedc0f3780fc08632f290a20e59d075d4922cf,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,3d32a8e70192660c0bfe49d4475d3d619e4712dd,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,32c064e567aaba18dfb07b171dde9cc43d0e6de8,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,3d32a8e70192660c0bfe49d4475d3d619e4712dd,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,32c064e567aaba18dfb07b171dde9cc43d0e6de8,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2013.12.01-config.txt b/configs/coresdk/coresdk-2013.12.01-config.txt
index 760205f..fe9297d 100644
--- a/configs/coresdk/coresdk-2013.12.01-config.txt
+++ b/configs/coresdk/coresdk-2013.12.01-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,ti2013.12.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,ti2013.12.x,ti2013.12.01,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,ti2013.12.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,c3f1bedb2494a2465db23a4d89b9f998db953f0d,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,ti2013.12.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,c3f1bedb2494a2465db23a4d89b9f998db953f0d,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2014.08.00-config.txt b/configs/coresdk/coresdk-2014.08.00-config.txt
index 0441ae5..37d9942 100644
--- a/configs/coresdk/coresdk-2014.08.00-config.txt
+++ b/configs/coresdk/coresdk-2014.08.00-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.22,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,daisy,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2014.10.01-config.txt b/configs/coresdk/coresdk-2014.10.01-config.txt
index 7a6343b..7814a6d 100644
--- a/configs/coresdk/coresdk-2014.10.01-config.txt
+++ b/configs/coresdk/coresdk-2014.10.01-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2014.10.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.22,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2014.10.01,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,head,adeaa6128b665920eb98eb7c064f4aacbd74b873,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,ti2014.10.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,f34de2175f1d6a443f219b8ceaaf796cfbc6efd5,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,ti2014.10.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,f34de2175f1d6a443f219b8ceaaf796cfbc6efd5,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2014.10.02-config.txt b/configs/coresdk/coresdk-2014.10.02-config.txt
index a3c7525..129f2f9 100644
--- a/configs/coresdk/coresdk-2014.10.02-config.txt
+++ b/configs/coresdk/coresdk-2014.10.02-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2014.10.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.24,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2014.10.02,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,ti2014.10.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,5094b8268daf8129cc6c7fad9c51a1bb845c99d1,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,ti2014.10.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,5094b8268daf8129cc6c7fad9c51a1bb845c99d1,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/coresdk/coresdk-2015.01-config.txt b/configs/coresdk/coresdk-2015.01-config.txt
index 6049d52..131e1f0 100644
--- a/configs/coresdk/coresdk-2015.01-config.txt
+++ b/configs/coresdk/coresdk-2015.01-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2015.01,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,ti2015.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2015.02-config.txt b/configs/coresdk/coresdk-2015.02-config.txt
index f038b4d..dd14d79 100644
--- a/configs/coresdk/coresdk-2015.02-config.txt
+++ b/configs/coresdk/coresdk-2015.02-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2015.02,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,jethro,0454fb083c38f2155a8be3b61930ad1ddf995695,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,ti2015.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2015.03-config.txt b/configs/coresdk/coresdk-2015.03-config.txt
index 1ae1673..6eb04ba 100644
--- a/configs/coresdk/coresdk-2015.03-config.txt
+++ b/configs/coresdk/coresdk-2015.03-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.03,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,ti2015.03,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,jethro,9bfcf79fcd824efb9f2a9bd72ecbedfee1315c96,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.03,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,ti2015.03,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.01-config.txt b/configs/coresdk/coresdk-2016.01-config.txt
index 1eb020a..1f5dde9 100644
--- a/configs/coresdk/coresdk-2016.01-config.txt
+++ b/configs/coresdk/coresdk-2016.01-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.01,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,b0b91490e4ede61a302eb547da2cc65aa7da87ff,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,b0b91490e4ede61a302eb547da2cc65aa7da87ff,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.02-config.txt b/configs/coresdk/coresdk-2016.02-config.txt
index 5f94d97..dae1513 100644
--- a/configs/coresdk/coresdk-2016.02-config.txt
+++ b/configs/coresdk/coresdk-2016.02-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.02,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,dd330056ace289c8a9c5d77b6bb6e860b9f0913e,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,dd330056ace289c8a9c5d77b6bb6e860b9f0913e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.03-config.txt b/configs/coresdk/coresdk-2016.03-config.txt
index 6eb3092..69cdb40 100644
--- a/configs/coresdk/coresdk-2016.03-config.txt
+++ b/configs/coresdk/coresdk-2016.03-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.03,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.03,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.03,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,8bbfe9bd229e3f795577eb5df1cd5104651e2ba2,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.03,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,8bbfe9bd229e3f795577eb5df1cd5104651e2ba2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.04-config.txt b/configs/coresdk/coresdk-2016.04-config.txt
index ffe0792..05c3e20 100644
--- a/configs/coresdk/coresdk-2016.04-config.txt
+++ b/configs/coresdk/coresdk-2016.04-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,e64564bcaa7331f505baa5209fef1f50dfda1469,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.04,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,e64564bcaa7331f505baa5209fef1f50dfda1469,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.04,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.04,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,a8f44dff13481feaa97e494a3aeafb5b63d40f3f,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.04,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,a8f44dff13481feaa97e494a3aeafb5b63d40f3f,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.05-config.txt b/configs/coresdk/coresdk-2016.05-config.txt
index 1a75225..baa81d3 100644
--- a/configs/coresdk/coresdk-2016.05-config.txt
+++ b/configs/coresdk/coresdk-2016.05-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.05,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.05,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.05,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.05,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2016.06-config.txt b/configs/coresdk/coresdk-2016.06-config.txt
index 424469b..c0e0199 100644
--- a/configs/coresdk/coresdk-2016.06-config.txt
+++ b/configs/coresdk/coresdk-2016.06-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.06,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,krogoth,ti2016.06,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.06,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,ti2016.06,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.00-config.txt b/configs/coresdk/coresdk-2017.00-config.txt
index 29a9816..98ca148 100644
--- a/configs/coresdk/coresdk-2017.00-config.txt
+++ b/configs/coresdk/coresdk-2017.00-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.00,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.00,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.00,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,c7021b53cb86467f4401e36913fbf992e8b90a5a,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.00,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,c7021b53cb86467f4401e36913fbf992e8b90a5a,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.01-config.txt b/configs/coresdk/coresdk-2017.01-config.txt
index f68b11d..80a0235 100644
--- a/configs/coresdk/coresdk-2017.01-config.txt
+++ b/configs/coresdk/coresdk-2017.01-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.01,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.02-config.txt b/configs/coresdk/coresdk-2017.02-config.txt
index a5857c3..1015da0 100644
--- a/configs/coresdk/coresdk-2017.02-config.txt
+++ b/configs/coresdk/coresdk-2017.02-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,df69c0257aaa9f4e2f4a20d130b7bc0ce2ca0848,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,df69c0257aaa9f4e2f4a20d130b7bc0ce2ca0848,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.02,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,6edb45804c5e532fdbca31e9d358d9052eaee90b,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,befda6ce3fd916ab04c035d1d82ed173759f7f09,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,befda6ce3fd916ab04c035d1d82ed173759f7f09,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.03-config.txt b/configs/coresdk/coresdk-2017.03-config.txt
index d73f2b9..85395f7 100644
--- a/configs/coresdk/coresdk-2017.03-config.txt
+++ b/configs/coresdk/coresdk-2017.03-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.03,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.03,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.03,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.03,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.04-config.txt b/configs/coresdk/coresdk-2017.04-config.txt
index 714b970..d1eb255 100644
--- a/configs/coresdk/coresdk-2017.04-config.txt
+++ b/configs/coresdk/coresdk-2017.04-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,32a249cf33f79b579a2cf6224c7d23cdb20d376f,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.04,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,32a249cf33f79b579a2cf6224c7d23cdb20d376f,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.04,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,972cab7ca2402eafbe6d7f5be9756c2d225755b7,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.04,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,6c6a06bb806ecd496bb1c3ad723f074ccb454076,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.04,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,6c6a06bb806ecd496bb1c3ad723f074ccb454076,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.05-config.txt b/configs/coresdk/coresdk-2017.05-config.txt
index 9c6f04d..57254bf 100644
--- a/configs/coresdk/coresdk-2017.05-config.txt
+++ b/configs/coresdk/coresdk-2017.05-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.05,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.05,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.05,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,e3099758a75e439c54ba45c3434fbf22e98ee779,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,c79b479ab4b129007c6679bb0bdd8e2ec7ecb6ad,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.05,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,e3099758a75e439c54ba45c3434fbf22e98ee779,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,c79b479ab4b129007c6679bb0bdd8e2ec7ecb6ad,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2017.06-config.txt b/configs/coresdk/coresdk-2017.06-config.txt
index 0a10d15..969b7d5 100644
--- a/configs/coresdk/coresdk-2017.06-config.txt
+++ b/configs/coresdk/coresdk-2017.06-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.06,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,ti2017.06,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.06,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,1718f0a6c1de9c23660a9bebfd4420e3c4ed37e6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,ti2017.06,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,1718f0a6c1de9c23660a9bebfd4420e3c4ed37e6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.00-config.txt b/configs/coresdk/coresdk-2018.00-config.txt
index 592b582..7534d05 100644
--- a/configs/coresdk/coresdk-2018.00-config.txt
+++ b/configs/coresdk/coresdk-2018.00-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.00,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.00,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,32bb7d18a08d1c48873d7ab6332d4cc3815a4dff,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.00,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,1b18cdf6b8bdb00ff5df165b9ac7bc2b10c87d57,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.00,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,1b18cdf6b8bdb00ff5df165b9ac7bc2b10c87d57,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.01-config.txt b/configs/coresdk/coresdk-2018.01-config.txt
index b21f281..f264b2f 100644
--- a/configs/coresdk/coresdk-2018.01-config.txt
+++ b/configs/coresdk/coresdk-2018.01-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.01,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,fe6dbe144acbcbcbe37f5e9a07a08e414dbce036,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,5fcb57ffd67384b3487d0a1b83a1f13d52a15eb7,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,5fcb57ffd67384b3487d0a1b83a1f13d52a15eb7,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.02-config.txt b/configs/coresdk/coresdk-2018.02-config.txt
index e3bb723..bffda90 100644
--- a/configs/coresdk/coresdk-2018.02-config.txt
+++ b/configs/coresdk/coresdk-2018.02-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.02,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,6c20c550a82aed9e8fa312f09888c8f16250159c,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,6c20c550a82aed9e8fa312f09888c8f16250159c,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.03-config.txt b/configs/coresdk/coresdk-2018.03-config.txt
index 9fab5db..be72aac 100644
--- a/configs/coresdk/coresdk-2018.03-config.txt
+++ b/configs/coresdk/coresdk-2018.03-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.03,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.03,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,d1824f5572faa9d7cc8eb14dd83d61faa8c35988,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.03,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,f6f54155420ae54a34f1ab87e76623c536adf2f9,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,d1824f5572faa9d7cc8eb14dd83d61faa8c35988,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.03,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,f6f54155420ae54a34f1ab87e76623c536adf2f9,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.04-config.txt b/configs/coresdk/coresdk-2018.04-config.txt
index 1f348f8..25c1953 100644
--- a/configs/coresdk/coresdk-2018.04-config.txt
+++ b/configs/coresdk/coresdk-2018.04-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.04,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.04,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.04,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.04,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2018.05-config.txt b/configs/coresdk/coresdk-2018.05-config.txt
index b7fff00..5c97466 100644
--- a/configs/coresdk/coresdk-2018.05-config.txt
+++ b/configs/coresdk/coresdk-2018.05-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.05,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,rocko,ti2018.05,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.05,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,8a2c177c7dad5c838b3c6abd3088a2bc3896a6a3,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,ti2018.05,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,rocko,8a2c177c7dad5c838b3c6abd3088a2bc3896a6a3,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.00-config.txt b/configs/coresdk/coresdk-2019.00-config.txt
index 1b42dfb..451aaf4 100644
--- a/configs/coresdk/coresdk-2019.00-config.txt
+++ b/configs/coresdk/coresdk-2019.00-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.00,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.00,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,3b4b9398154d301a8e39501189da0ad7eee740f7,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.00,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,81060b70e104b4d050b7d2948a4253cf6a6d8203,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,45032e30be70503faeee468159b216031b729309,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.00,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,81060b70e104b4d050b7d2948a4253cf6a6d8203,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,45032e30be70503faeee468159b216031b729309,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.01-config.txt b/configs/coresdk/coresdk-2019.01-config.txt
index cee75dc..85d51ef 100644
--- a/configs/coresdk/coresdk-2019.01-config.txt
+++ b/configs/coresdk/coresdk-2019.01-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.01,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.01,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,0630018c0033c91fddda62a49f59a82ba6ec6850,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,9b568b6ae1bf1bebcb9552703ee40f9b880e07ed,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,9b568b6ae1bf1bebcb9552703ee40f9b880e07ed,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.02-config.txt b/configs/coresdk/coresdk-2019.02-config.txt
index d8487ff..8ff5063 100644
--- a/configs/coresdk/coresdk-2019.02-config.txt
+++ b/configs/coresdk/coresdk-2019.02-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.02,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.02,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.03-config.txt b/configs/coresdk/coresdk-2019.03-config.txt
index e71cb59..c67c506 100644
--- a/configs/coresdk/coresdk-2019.03-config.txt
+++ b/configs/coresdk/coresdk-2019.03-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.03,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.03,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.03,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,d3d3f443039b03f1200a14bfe99f985592632018,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.03,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,d3d3f443039b03f1200a14bfe99f985592632018,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.04-config.txt b/configs/coresdk/coresdk-2019.04-config.txt
index 5a50b12..b697582 100644
--- a/configs/coresdk/coresdk-2019.04-config.txt
+++ b/configs/coresdk/coresdk-2019.04-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.04,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.04,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.04,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,f5be8c8309a932cde507ba24d042880a922df0b6,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.04,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,f5be8c8309a932cde507ba24d042880a922df0b6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.05-config.txt b/configs/coresdk/coresdk-2019.05-config.txt
index a398d27..d494501 100644
--- a/configs/coresdk/coresdk-2019.05-config.txt
+++ b/configs/coresdk/coresdk-2019.05-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,97067634b1f149b56844b10e3a5e8d0d980b6e34
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.05,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,97067634b1f149b56844b10e3a5e8d0d980b6e34
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.05,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.05,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,cd7cf933b3235560ec71576d8f3836dff736a39f,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.05,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,cd7cf933b3235560ec71576d8f3836dff736a39f,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/coresdk/coresdk-2019.06-config.txt b/configs/coresdk/coresdk-2019.06-config.txt
index 808fe39..ce15255 100644
--- a/configs/coresdk/coresdk-2019.06-config.txt
+++ b/configs/coresdk/coresdk-2019.06-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.06,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+meta-arago,https://arago-project.org/git/meta-arago.git,thud,ti2019.06,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.06,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,ti2019.06,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/distroless-dunfell-config.txt b/configs/distroless-dunfell-config.txt
index bb03ac7..8f15d39 100644
--- a/configs/distroless-dunfell-config.txt
+++ b/configs/distroless-dunfell-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local.conf.sample
 BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/distroless-kirkstone-config.txt b/configs/distroless-kirkstone-config.txt
index 4cafca7..bbd7a62 100644
--- a/configs/distroless-kirkstone-config.txt
+++ b/configs/distroless-kirkstone-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/distroless-master-config.txt b/configs/distroless-master-config.txt
index e67f916..b938035 100644
--- a/configs/distroless-master-config.txt
+++ b/configs/distroless-master-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-v2.conf.sample
 BITBAKE_INCLUSIVE_VARS=yes
diff --git a/configs/glsdk/glsdk-06.01.00-config.txt b/configs/glsdk/glsdk-06.01.00-config.txt
index 8bb1963..bb55aac 100644
--- a/configs/glsdk/glsdk-06.01.00-config.txt
+++ b/configs/glsdk/glsdk-06.01.00-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_01_00_01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
diff --git a/configs/glsdk/glsdk-06.02.00-config.txt b/configs/glsdk/glsdk-06.02.00-config.txt
index 9a9ca5f..ea548aa 100644
--- a/configs/glsdk/glsdk-06.02.00-config.txt
+++ b/configs/glsdk/glsdk-06.02.00-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
diff --git a/configs/glsdk/glsdk-06.02.01-config.txt b/configs/glsdk/glsdk-06.02.01-config.txt
index 9a9ca5f..ea548aa 100644
--- a/configs/glsdk/glsdk-06.02.01-config.txt
+++ b/configs/glsdk/glsdk-06.02.01-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_00_01,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
diff --git a/configs/glsdk/glsdk-06.02.01.02-config.txt b/configs/glsdk/glsdk-06.02.01.02-config.txt
index 52a4229..ac89e7b 100644
--- a/configs/glsdk/glsdk-06.02.01.02-config.txt
+++ b/configs/glsdk/glsdk-06.02.01.02-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.17.0,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,danny,f00028caf257e386c0f3ae46bd4b3ba53dd0729d,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,danny,DEV_SDK_06_02_01_02,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,danny,d0558fa4304592622423582f8b464e1c22cfe6f1,layers=
+oe-core,https://git.openembedded.org/openembedded-core,danny,0785489d558c34cacf5cb349949a15e27084efbf,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-glsdk.conf.sample
diff --git a/configs/glsdk/glsdk-06.03.00.01-config.txt b/configs/glsdk/glsdk-06.03.00.01-config.txt
index 71e313b..ae9269e 100644
--- a/configs/glsdk/glsdk-06.03.00.01-config.txt
+++ b/configs/glsdk/glsdk-06.03.00.01-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,master,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,691ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,691ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/glsdk/glsdk-06.04.00.02-config.txt b/configs/glsdk/glsdk-06.04.00.02-config.txt
index f09e63b..fb76dd7 100644
--- a/configs/glsdk/glsdk-06.04.00.02-config.txt
+++ b/configs/glsdk/glsdk-06.04.00.02-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,283813dffe8633af04c87faedb4c601518fa3a9c,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,https://arago-project.org/git/projects/meta-arago-glsdk.git,master,283813dffe8633af04c87faedb4c601518fa3a9c,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,96fae48172519a621bb38c875a0b0e89a198868c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,96fae48172519a621bb38c875a0b0e89a198868c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dylan,394fa61d00b97c19610bfb38f02174c4e8aeeb15,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.03-config.txt b/configs/mcsdk/mcsdk-03.00.00.03-config.txt
index 0fdc3d0..a959c6c 100644
--- a/configs/mcsdk/mcsdk-03.00.00.03-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.00.03-config.txt
@@ -1,10 +1,10 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,2012.07,layers=meta-arago-distro:meta-arago-extras
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,f95b2e51ea8194b82d2476b338610782a83ce4de,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,741146fa90f28f7ce8d82ee7f7e254872d519724,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.15.2,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,2012.07,layers=meta-arago-distro:meta-arago-extras
+meta-ti,https://arago-project.org/git/meta-ti.git,denzil,f95b2e51ea8194b82d2476b338610782a83ce4de,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
+oe-core,https://git.openembedded.org/openembedded-core,denzil,741146fa90f28f7ce8d82ee7f7e254872d519724,layers=meta
 OECORELAYERCONF=./sample-files/denzil/bblayers-denzil.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.05-config.txt b/configs/mcsdk/mcsdk-03.00.00.05-config.txt
index 77a09ed..eb44559 100644
--- a/configs/mcsdk/mcsdk-03.00.00.05-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.00.05-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,2012.11,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,973138efa050a37462c5fbf0f8eeb5cfbdac478f,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.15.2,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,2012.11,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,denzil,973138efa050a37462c5fbf0f8eeb5cfbdac478f,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
+oe-core,https://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
 OECORELAYERCONF=./sample-files/denzil/bblayers-denzil.conf.sample
 OECORELOCALCONF=./sample-files/denzil/local-arago-linaro.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.06-config.txt b/configs/mcsdk/mcsdk-03.00.00.06-config.txt
index 933ac1b..f222a72 100644
--- a/configs/mcsdk/mcsdk-03.00.00.06-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.00.06-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,4385d5306b0dcabb64f81759f090468a12c66fcf,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.15.2,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,4385d5306b0dcabb64f81759f090468a12c66fcf,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,denzil,f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
+oe-core,https://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
 OECORELAYERCONF=./sample-files/denzil/bblayers-denzil.conf.sample
 OECORELOCALCONF=./sample-files/denzil/local-arago-linaro.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.07-config.txt b/configs/mcsdk/mcsdk-03.00.00.07-config.txt
index bab9705..2d64718 100644
--- a/configs/mcsdk/mcsdk-03.00.00.07-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.00.07-config.txt
@@ -1,11 +1,11 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,127b0541e6f2007de0b402233893363b11e5c4c7,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,2ef919df5cfb48755456251836d80083abc7dce7,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
+bitbake,https://git.openembedded.org/bitbake,master,1.15.2,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,127b0541e6f2007de0b402233893363b11e5c4c7,layers=meta-arago-distro:meta-arago-extras
+meta-openembedded,https://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,denzil,2ef919df5cfb48755456251836d80083abc7dce7,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
+oe-core,https://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
 OECORELAYERCONF=./sample-files/denzil/bblayers-denzil.conf.sample
 OECORELOCALCONF=./sample-files/denzil/local-arago-linaro.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.04.18-config.txt b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
index 099975c..d52b149 100644
--- a/configs/mcsdk/mcsdk-03.00.04.18-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,78d08be08c55440133b12d1db4843fcf72b583b6,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,608fd3be257002256d13422daf0b593b55463d4d,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,78d08be08c55440133b12d1db4843fcf72b583b6,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,608fd3be257002256d13422daf0b593b55463d4d,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,1fa7f364f682e5cfaa9d6e565b7ae6b8ec2a90ff,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,14858daa694a559b89881741ad9033acd925143c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,14858daa694a559b89881741ad9033acd925143c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,20fa82037c93e6814f1b76c0b8adc73616be8aa2,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.00.03-config.txt b/configs/mcsdk/mcsdk-03.01.00.03-config.txt
index 08bb905..6038fc0 100644
--- a/configs/mcsdk/mcsdk-03.01.00.03-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.00.03-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,3bb8b1778790d5f214357a6883914f622b407bbf,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,3bb8b1778790d5f214357a6883914f622b407bbf,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.01.04-config.txt b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
index 4b2fa98..088373d 100644
--- a/configs/mcsdk/mcsdk-03.01.01.04-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,832a44b1821a8d509e3461aa03c41fa915fb640b,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,832a44b1821a8d509e3461aa03c41fa915fb640b,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.02.05-config.txt b/configs/mcsdk/mcsdk-03.01.02.05-config.txt
index 46a23fb..0149a95 100644
--- a/configs/mcsdk/mcsdk-03.01.02.05-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.02.05-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,2bab20e97aa16c9f763c331ae4c5ad5d045040a0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,2bab20e97aa16c9f763c331ae4c5ad5d045040a0,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.03.06-config.txt b/configs/mcsdk/mcsdk-03.01.03.06-config.txt
index 6610364..bc7cbec 100644
--- a/configs/mcsdk/mcsdk-03.01.03.06-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.03.06-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,bafae2df01b979fb1ac7c1cbe9d8698b9409e952,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,bafae2df01b979fb1ac7c1cbe9d8698b9409e952,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.04.07-config.txt b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
index 3920c68..1437793 100644
--- a/configs/mcsdk/mcsdk-03.01.04.07-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,daisy,3ae8cecea6cd076587fb4498ae431bc42489dd9d,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,daisy,dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,daisy,3ae8cecea6cd076587fb4498ae431bc42489dd9d,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,daisy,dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,c29c317e0f22202bfaa85329a580564bbc179089,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,090b02a104924886afd0fa79be7b5d08eebf071f,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
-meta-java,git://git.yoctoproject.org/meta-java,master,66c97ae7461f4c1a13917131787bb76dc34e6b6f,layers=
-oe-core,git://git.openembedded.org/openembedded-core,daisy,e1a2540227250d854d5bba278634bcc9e7572cda,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,090b02a104924886afd0fa79be7b5d08eebf071f,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+meta-java,https://git.yoctoproject.org/meta-java,master,66c97ae7461f4c1a13917131787bb76dc34e6b6f,layers=
+oe-core,https://git.openembedded.org/openembedded-core,daisy,e1a2540227250d854d5bba278634bcc9e7572cda,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-3.1.0-config.txt b/configs/mcsdk/mcsdk-3.1.0-config.txt
index 4e04b25..f4ad4df 100644
--- a/configs/mcsdk/mcsdk-3.1.0-config.txt
+++ b/configs/mcsdk/mcsdk-3.1.0-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-dylan-config.txt b/configs/mcsdk/mcsdk-dylan-config.txt
index e534900..1b7bf56 100644
--- a/configs/mcsdk/mcsdk-dylan-config.txt
+++ b/configs/mcsdk/mcsdk-dylan-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-mcsdk,https://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
 meta-java,https://github.com/woglinde/meta-java,master,HEAD,layers=
-oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/poky-dunfell-config.txt b/configs/poky-dunfell-config.txt
index 5f6c45b..72facf2 100644
--- a/configs/poky-dunfell-config.txt
+++ b/configs/poky-dunfell-config.txt
@@ -1,9 +1,9 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-poky,git://git.yoctoproject.org/poky,dunfell,HEAD,layers=meta:meta-poky:meta-yocto-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
+bitbake,https://git.openembedded.org/bitbake,1.46,HEAD
+poky,https://git.yoctoproject.org/poky,dunfell,HEAD,layers=meta:meta-poky:meta-yocto-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,HEAD,layers=meta-arm:meta-arm-toolchain
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky.conf.sample
 BITBAKE_INCLUSIVE_VARS=no
diff --git a/configs/poky-kirkstone-config.txt b/configs/poky-kirkstone-config.txt
index 5f72081..dc94b1d 100644
--- a/configs/poky-kirkstone-config.txt
+++ b/configs/poky-kirkstone-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,2.0,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,kirkstone,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,kirkstone,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,kirkstone,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,kirkstone,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/configs/poky-master-config.txt b/configs/poky-master-config.txt
index be22018..5cb0383 100644
--- a/configs/poky-master-config.txt
+++ b/configs/poky-master-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/configs/poky-master-wip-config.txt b/configs/poky-master-wip-config.txt
index 657dcb8..3fa74bf 100644
--- a/configs/poky-master-wip-config.txt
+++ b/configs/poky-master-wip-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-yocto,git://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
-meta-ti,git://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
-meta-arm,git://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
-meta-arago,git://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,master,HEAD
+meta-yocto,https://git.yoctoproject.org/meta-yocto,master,HEAD,layers=meta-poky:meta-yocto-bsp
+meta-ti,https://git.yoctoproject.org/meta-ti,master-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
+meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-extras
 
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-poky-v2.conf.sample
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
index 20a0d0f..2dba4e5 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
-meta-psdkla,git://arago-project.org/git/projects/meta-psdkla.git,master,f98f6409bd79f26969be064e8cc70d350b51ab7f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
+meta-psdkla,https://arago-project.org/git/projects/meta-psdkla.git,master,f98f6409bd79f26969be064e8cc70d350b51ab7f,layers=
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,960306c6472ac7fadb9f02af2a045f34cde46f8d,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
index 2ecb55f..6586034 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
-meta-psdkla,git://arago-project.org/git/projects/meta-psdkla.git,master,41ac7fa732f1f030577885a0d06ab2976014d750,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+meta-psdkla,https://arago-project.org/git/projects/meta-psdkla.git,master,41ac7fa732f1f030577885a0d06ab2976014d750,layers=
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,80f6984673aca586e83a8f913ddf7ebc89f3586a,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
index 961c0f9..71e6eb0 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
-meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,3d772074ef93ac47a1a752e22021b0c32207f54b,layers=
+bitbake,https://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/jacinto-linux/meta-psdkla.git,master,3d772074ef93ac47a1a752e22021b0c32207f54b,layers=
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,d3df90635fca4d8267b547dab568058c554014b1,layers=
 meta-jupyter,https://github.com/Xilinx/meta-jupyter.git,master,82db248e2eca36e52cbeafe599b755dc87720383,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
index 7ec46da..da708a6 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
@@ -2,13 +2,13 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
-meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,f030757ec1e3657a26fdfa75c5148eae6c264580,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/jacinto-linux/meta-psdkla.git,master,f030757ec1e3657a26fdfa75c5148eae6c264580,layers=
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
 meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,2f72301f5a73279c4d2f12fc6218876629666e06,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
index fcfe14c..0bcbc80 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_00.txt
@@ -2,13 +2,13 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,1.46,be6ecc160ac4a8d9715257b9b955363cecc081ea
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
-meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,08ef8ff32c2e3b26efc5b2cbae775f0d1f15e7eb,layers=
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/jacinto-linux/meta-psdkla.git,master,08ef8ff32c2e3b26efc5b2cbae775f0d1f15e7eb,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
 meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,2f72301f5a73279c4d2f12fc6218876629666e06,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
index b42f802..4f84137 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_02_01_00.txt
@@ -2,12 +2,12 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
 meta-arm,https://git.yoctoproject.org/meta-arm,HEAD,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2d60d77fb8cb46ffe460402f76ae216ca5,layers=meta
 meta-psdkla,https://git.ti.com/git/jacinto-linux/meta-psdkla.git,am57xx_8.x,PSDKLA-AM57XX-08_02_01_00,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt
index aad02c5..9b06139 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_04_00.txt
@@ -2,13 +2,13 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,1.46,7fc4cffebf5dcc1d050416c0b7f7d58c765c1d69
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.00.005,layers=meta-arago-distro:meta-arago-extras
-meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,b6dcf3fe96473cf01b19301f95fdca166141bbef,layers=
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.04.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/jacinto-linux/meta-psdkla.git,master,b6dcf3fe96473cf01b19301f95fdca166141bbef,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,a63a54df3170fed387f810f23cdc2f483ad587df,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,52cee67833d1975a5bd52e4556c4cd312425a017,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.00.005,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.04.00.005,layers=
 meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,dunfell,3f40d5f095ceb099b604750db96058df00fcd49e,layers=meta
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,a64c32254c3731e9b3c40231bd60d2b21efa0488,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt
index 8e99803..4faf3a5 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_05_00.txt
@@ -2,14 +2,14 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,1.46,e3db9c2e9eded3c5cb6040714a6054b44f6b3880
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.05.00.005,layers=meta-arago-distro:meta-arago-extras
-meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,06a6260f965ad7765581878c52b0bed894103847,layers=
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-#meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.05.00.005,layers=meta-arago-distro:meta-arago-extras
+meta-psdkla,https://git.ti.com/jacinto-linux/meta-psdkla.git,master,06a6260f965ad7765581878c52b0bed894103847,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-python2,https://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0ffd3324937252790266e2b2e64d33ef34f,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7203130ed8b58c0df75cb72222ac2bcf546bce44,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.05.00.005,layers=
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.05.00.005,layers=
 meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,https://git.openembedded.org/openembedded-core,dunfell,1ee082e979baaba871bbe1d91181bb04951faf3b,layers=meta
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,49e7a5ffb8799b9eee638a6a5425a13b00c33215,layers=
diff --git a/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
index 7956f76..2424281 100644
--- a/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
+++ b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.24,923fc5ee0ace02cc29110bff502a2c65e6bdebf0,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,b12d5ca16701da5b723a691e4d817693ab4dd260,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,a550535f326d48fe2627d76b144368e4ec0551b0,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.24,923fc5ee0ace02cc29110bff502a2c65e6bdebf0,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,b12d5ca16701da5b723a691e4d817693ab4dd260,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,a550535f326d48fe2627d76b144368e4ec0551b0,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,3a95559c124d3ce8c076b3fae5859435977d1ac2,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,5094b8268daf8129cc6c7fad9c51a1bb845c99d1,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,3a95559c124d3ce8c076b3fae5859435977d1ac2,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,5094b8268daf8129cc6c7fad9c51a1bb845c99d1,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
index 964c1ba..3b066e5 100644
--- a/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
+++ b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,cd92e5dce5f5d61ecb7838bf964a7812e905509a,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,05b7db4f213c0862cdbb6cc3da1fd2b63a834b28,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,daisy,d4315b423207030962c48de7cbc247abec0c0033,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,cd92e5dce5f5d61ecb7838bf964a7812e905509a,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,05b7db4f213c0862cdbb6cc3da1fd2b63a834b28,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,daisy,d4315b423207030962c48de7cbc247abec0c0033,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,af94b54a5ee81e7ce098a20514a9cc7f88477f08,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,317cad797a77db0aa401d13b763181ed492f5462,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,af94b54a5ee81e7ce098a20514a9cc7f88477f08,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,317cad797a77db0aa401d13b763181ed492f5462,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
index 1fd4a9d..bbac065 100644
--- a/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,4c02a30f084408d0a6a5149937ef74520f8346dc,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
index d55868d..8586db7 100644
--- a/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,12c6ff170389762b6f7f7bf290cd26bfa316cf47,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,b1bf5b638567cd5be269c5968931de8deeac0c80,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,12c6ff170389762b6f7f7bf290cd26bfa316cf47,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,master,b1bf5b638567cd5be269c5968931de8deeac0c80,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,3b27c871dbf67497ea9a953fe3fa0f819c6e41c9,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,3b27c871dbf67497ea9a953fe3fa0f819c6e41c9,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
index 4d32c2e..f03f6f0 100644
--- a/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,80feff781e2a6c3b50a72655a627ca7d629c72ab,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,fido,e6bb433b399c1ad32e596b9c46571fbfe384a86e,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,80feff781e2a6c3b50a72655a627ca7d629c72ab,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,fido,e6bb433b399c1ad32e596b9c46571fbfe384a86e,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,c93678aa08bc0df0f1f36a84afe48723406de58e,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,fido,c93678aa08bc0df0f1f36a84afe48723406de58e,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
index bb93208..01ee4fc 100644
--- a/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,1686d851985872f34ca3a2c30d4a0726a20a5c99,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,ti2016.01,36598b78a6d9fbe442f93111f64d3413c04418a8,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,1686d851985872f34ca3a2c30d4a0726a20a5c99,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,ti2016.01,36598b78a6d9fbe442f93111f64d3413c04418a8,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,1ae0cadb1200d0007a779958e852a48379d42c26,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,b0b91490e4ede61a302eb547da2cc65aa7da87ff,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,krogoth,1ae0cadb1200d0007a779958e852a48379d42c26,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,b0b91490e4ede61a302eb547da2cc65aa7da87ff,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
index c9322bf..1277897 100644
--- a/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,bee144eeed6c08ec2829533e82f94405058ce453,layers=
+bitbake,https://git.openembedded.org/bitbake,1.30,bee144eeed6c08ec2829533e82f94405058ce453,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,6b3984287c3c15fde80dcc5a0999fb85c6a8a6c6,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,b6fea965af0129f552d45e9c7d85937e6076f645,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,008497c611bc381014d310678e7dd39668959fea,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,8bbfe9bd229e3f795577eb5df1cd5104651e2ba2,layers=meta
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,8bbfe9bd229e3f795577eb5df1cd5104651e2ba2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
index e63170d..f672498 100644
--- a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
+bitbake,https://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,3678d672c9c47a646897286281d4260ac4ace960,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,76381bbc10b93ffc6c014154814872b170b93796,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,d8aa76970a0ba48762c631dfd79dbed49222373b,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,28da89a20b70f2bf0c85da6e8af5d94a3b7d76c9,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
index c5358dd..2a2b416 100644
--- a/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
+bitbake,https://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,70283e8e915126b57e30cc7fcf5286a9435c3829,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,c0e32cc7615f7483ae3a674221dd633205b28ee3,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-openembedded,https://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,ed06c3bb58493a40b6fe584251a94f067fc9bdf7,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,krogoth,ff8c8859434e56894accc5a63980c1b8904eb935,layers=meta
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,krogoth,ff8c8859434e56894accc5a63980c1b8904eb935,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
index 3218acd..2727d58 100644
--- a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,3d2f620a6a98b1b6abb1103d7dc986921436ed19,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,b727bf8fce8e9cb5a6b5d5b48c45f0088e67eb53,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,3d2f620a6a98b1b6abb1103d7dc986921436ed19,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,b727bf8fce8e9cb5a6b5d5b48c45f0088e67eb53,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,880a7bd1d3b9a1b2003f5b0620350f03158bbd43,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,41d6fdc0fe5ea6054616cfccda13baac3ff33791,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,41d6fdc0fe5ea6054616cfccda13baac3ff33791,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
index a199fcd..7461882 100644
--- a/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,2b7f7b00654eb3faaea7c66271ebe508b9ffc019,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,2b7f7b00654eb3faaea7c66271ebe508b9ffc019,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
 meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
index 692f489..3267018 100644
--- a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,cb3ee0c165ef4e71e1aad16812652ca1371a9c80,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,cb3ee0c165ef4e71e1aad16812652ca1371a9c80,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
 meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
index 7a3f0e9..aa4a1f3 100644
--- a/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,5f5e13bacde95a93633f621ec6b94a022c476a58,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,eaac60268857bc56bf89625df93935a272b63341,layers=
+bitbake,https://git.openembedded.org/bitbake,1.32,5f5e13bacde95a93633f621ec6b94a022c476a58,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,eaac60268857bc56bf89625df93935a272b63341,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e01c6ace0d4f9d700449edad3781e9cd505b5e10,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,d34c861f846f35d089e1caf224ec43079be7b202,layers=meta-arago-distro:meta-arago-extras
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,d34c861f846f35d089e1caf224ec43079be7b202,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,351ccf1928a18c2b69fd19b09b980c9aa3af2e26,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,1718f0a6c1de9c23660a9bebfd4420e3c4ed37e6,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,351ccf1928a18c2b69fd19b09b980c9aa3af2e26,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,1718f0a6c1de9c23660a9bebfd4420e3c4ed37e6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
index a4cf75b..520cd91 100644
--- a/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,da85da9b58ed252c7b80a437fb5babff9e6dde48,layers=
+bitbake,https://git.openembedded.org/bitbake,1.32,da85da9b58ed252c7b80a437fb5babff9e6dde48,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,92db4d8023d88ab59fab2953e7447ec0bd5a6db1,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,morty,5b2a44b0c4d989133bc13d59398fd10375d351bb,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,3dc08477529b31ce887bb22a08201a843ded48f0,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d73e794c7e7ebb1cc5bf495a52a72b26fb118250,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,39fd8c129e2bff7f2f1649b7f6e036ccc50fd5d8,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,3dc08477529b31ce887bb22a08201a843ded48f0,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,d73e794c7e7ebb1cc5bf495a52a72b26fb118250,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,39fd8c129e2bff7f2f1649b7f6e036ccc50fd5d8,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
index d60b8a9..69fc50a 100644
--- a/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
+bitbake,https://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,264dc66c689e0e4212c43358382986ee470619d4,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.01,d54e9d6c1d461dbf3189e691088d328bf4c4fb19,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
-meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.01,8555084679dc5c668e5fb60a16425ca32b10ff21,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,ti2018.01,8555084679dc5c668e5fb60a16425ca32b10ff21,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,931a52e8698f684ccbb26ddec18764ad9d9a3e8f,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,rocko,931a52e8698f684ccbb26ddec18764ad9d9a3e8f,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
index cad42bc..929df26 100644
--- a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+bitbake,https://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,012bf1c42b1826380ca7557e5185fe88f939a93c,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.03,85f191c83f7cd7b3b4fb6df08b22fabe24e25773,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
-meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.03,3f26d1f94fbc87740fdfe33292c904e865257e81,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,https://git.yoctoproject.org/meta-ti,ti2018.03,3f26d1f94fbc87740fdfe33292c904e865257e81,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
index 312891b..49f2fb1 100644
--- a/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,0c7cf572b8350e7ec1e451d207d67f1f7ce018cb,layers=
+bitbake,https://git.openembedded.org/bitbake,1.36,0c7cf572b8350e7ec1e451d207d67f1f7ce018cb,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,378823175fb71bc7073ff4b745d62ee5b37de7bf,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,44707eb4de002040aac8444030e0f5feae238e6c,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,e9b069beb92f00e6947cdd0f503747774b189358,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,e9b069beb92f00e6947cdd0f503747774b189358,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
index 034d110..87927a3 100644
--- a/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,582f1d7a8d150cf5917dfc1efa844f40131ae4bf,layers=
+bitbake,https://git.openembedded.org/bitbake,1.36,582f1d7a8d150cf5917dfc1efa844f40131ae4bf,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,f33a37ac6baa8155302fa1faea99f1be5461779e,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,d4bc00af838df7a77f4ddbd3546755c5bad5b880,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,02e852b1a069463f937ea594e13fe5f88ce9b74d,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,02e852b1a069463f937ea594e13fe5f88ce9b74d,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,cd9ee776044a2d8943be4cb019f063271e9c684d,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
index 6f7c02d..7aed49c 100644
--- a/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
+bitbake,https://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,e5b633c0aa6d924ab6bea15906e3790c01c86633,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.01,9373674c699c8ad98f8b6b3eac45473448f55e94,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.01,28a2f128fbadd37463060eb5ee40c7c9a47cc530,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,ti2019.01,28a2f128fbadd37463060eb5ee40c7c9a47cc530,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
index 2b0d6cf..0a9fa75 100644
--- a/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
+bitbake,https://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,0d3220f2aa26c6069df78c68bb6009a35067866c,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.03,9736c7d3e5c4c5a823e9caa712aa27ae24a40e4e,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.03,a65f0a338d8f4dcce902cde64fb1413727f1ac20,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,ti2019.03,a65f0a338d8f4dcce902cde64fb1413727f1ac20,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,cd7cf933b3235560ec71576d8f3836dff736a39f,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,thud,cd7cf933b3235560ec71576d8f3836dff736a39f,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
index 128d35e..dd40fd8 100644
--- a/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
@@ -1,17 +1,17 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+bitbake,https://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,6a0a2b1a8e6cbbb1bdeb133e6acc6f37eccb3169,layers=
 meta-aws,https://github.com/aws/meta-aws.git,master,b5191c92f6e124f7baaec3513d1338a47fe0caa8,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.05,d2e8f25e059630f6447c8e41d1c20625f10cdb9d,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,e5da84ec50a46ca73c2efbdaa376d30183562986,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,e5da84ec50a46ca73c2efbdaa376d30183562986,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
index 0c8a8fd..0e32ce1 100644
--- a/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
@@ -1,17 +1,17 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+bitbake,https://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,56d9d47f18eeec31a1086ca29e54b5956c46de84,layers=
 meta-aws,https://github.com/aws/meta-aws.git,thud,6432f1b38b9dcbbb55020167f5b1cfe55e858c6d,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,thud,70436496d2617b281c51390faa3d421814055cd6,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,e6e464c9ed9266ce46452f953c1bdcb0e7b2d95f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud,b27317ab4f9be931a66344ca502c7e3f4ec780e5,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,thud,b27317ab4f9be931a66344ca502c7e3f4ec780e5,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
index 8c5524d..ef2c0af 100644
--- a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
+++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,707036d4ec12ef1a260adcef78627b26e32e6540,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
index eb9f519..3fc391a 100644
--- a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
@@ -1,14 +1,14 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,9b83aefa9c4a21d9dc1eea4a6b00af379466a288,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
index 1ab044e..1b9de5f 100644
--- a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,c2a3bda3a29e12472ef7862e424ea1552fab2959
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,9d1705ba257f95702fb010c6ed3aba384b1019ba,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,c2a3bda3a29e12472ef7862e424ea1552fab2959
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,9d1705ba257f95702fb010c6ed3aba384b1019ba,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
index 313d90c..1f05b12 100644
--- a/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.02.00.14-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,5ad52b6a1e1e5ee7b436dd1c863a4a545d43d2bf,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,5ad52b6a1e1e5ee7b436dd1c863a4a545d43d2bf,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
index f074bdc..a612200 100755
--- a/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.02.00.17-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,d92e20cbcd624d8d94213f48b467706bc837f38c,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,d92e20cbcd624d8d94213f48b467706bc837f38c,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt
index 5768254..6e85aa5 100644
--- a/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.02.00.23-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt b/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt
index 5768254..6e85aa5 100644
--- a/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.02.00.24-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,d22cc1e
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,716008bc1003478d2e6c3e0c741f0fd80dcee5fb,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e5,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,0722ff6,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,51844f2,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt b/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt
index 82f1410..3bdda62 100644
--- a/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.03.00.19-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,b39d454b1622e53a23a08c5470ba6de2162264df,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.03.00.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,b39d454b1622e53a23a08c5470ba6de2162264df,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.03.00.005,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,f6b88c1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,8ff12bf,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.03.00.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,48ce924,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,f6b88c1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,8ff12bf,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.03.00.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,48ce924,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
index 2deeb22..0d1baa8 100644
--- a/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.04.01.03-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt
index 9e466fe..850d196 100644
--- a/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.04.01.04-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,479b10537b422694df4b9bac9c1b39d8cf9d39c5,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,479b10537b422694df4b9bac9c1b39d8cf9d39c5,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,08.04.01.005,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,08.04.01.005,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt b/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt
index 9c8c9fd..6866cf3 100644
--- a/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.04.01.09-config.txt
@@ -1,15 +1,15 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,0784db7
-meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
-meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,cicd.2022.10.28.09.04.44,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,0784db7
+meta-processor-sdk,https://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,7860b1b97635205ebe7af9d3128e8f6dec50e819,layers=
+meta-arago,https://git.yoctoproject.org/meta-arago,dunfell,cicd.2022.10.28.09.04.44,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,5ef3a0f,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,cicd.2022.10.28.09.04.44,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,beea119eb529b4a11f266004aee8b548427aea39,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,6792ebdd966aa0fb662989529193a0940fbfee00,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,cicd.2022.10.28.09.04.44,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,ef38f7acee3f0ae400138fa60f4695a86dffc16e,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
index 3913a09..81eefb8 100644
--- a/configs/processor-sdk/processor-sdk-daisy-config.txt
+++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.26,HEAD,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,https://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt b/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
index 20a0d0f..2dba4e5 100644
--- a/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
+++ b/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
+meta-arago,https://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
-meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
-meta-psdkla,git://arago-project.org/git/projects/meta-psdkla.git,master,f98f6409bd79f26969be064e8cc70d350b51ab7f,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
+meta-arm,https://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
+oe-core,https://git.openembedded.org/openembedded-core,dunfell,4f395ad49ef9035954d0fda7b7df14dea18b49a0,layers=meta
+meta-psdkla,https://arago-project.org/git/projects/meta-psdkla.git,master,f98f6409bd79f26969be064e8cc70d350b51ab7f,layers=
 meta-aws,https://github.com/aws/meta-aws.git,dunfell,960306c6472ac7fadb9f02af2a045f34cde46f8d,layers=
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-morty-config.txt b/configs/processor-sdk/processor-sdk-morty-config.txt
index a8195b3..78fc4b7 100644
--- a/configs/processor-sdk/processor-sdk-morty-config.txt
+++ b/configs/processor-sdk/processor-sdk-morty-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
+bitbake,https://git.openembedded.org/bitbake,1.32,HEAD,layers=
+meta-processor-sdk,https://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
+meta-arago,https://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,HEAD,layers=
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
+meta-openembedded,https://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,https://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
+oe-core,https://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
diff --git a/configs/processor-sdk/processor-sdk-rocko-config.txt b/configs/processor-sdk/processor-sdk-rocko-config.txt
index 304abc7..acef432 100644
--- a/configs/processor-sdk/processor-sdk-rocko-config.txt
+++ b/configs/processor-sdk/processor-sdk-rocko-config.txt
@@ -1,16 +1,16 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
+bitbake,https://git.openembedded.org/bitbake,1.36,HEAD,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
+meta-openembedded,https://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,https://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
+oe-core,https://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
2.39.2


