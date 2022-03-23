Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1314FC433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 18:28:18 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.814.1648060096333715933
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 11:28:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jA08jwyd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22NISEOM118960;
	Wed, 23 Mar 2022 13:28:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1648060094;
	bh=I4vHjFgxfrRA3Vj/bv8UXPKGga2p75fT75ko/zlG7ok=;
	h=From:To:Subject:Date;
	b=jA08jwyducOaRsX2wovSbTlEfzWySYRgOqVt6qEHq2FsBeQuqGtRowUtlEUnyW6gH
	 RnnpNh52Y2Ep0kkXl1UvweWCtPvlExasf2pbGefv9JFb/nkRLWcGTWGXujFtHVz72O
	 4SHD0JOvICiFxNQkJ+LFudVi0JFlkmuFVknNuvD0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22NISEXR007527
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Mar 2022 13:28:14 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 13:28:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 13:28:13 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22NISD4B022631;
	Wed, 23 Mar 2022 13:28:13 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nX5iP-0006Rn-KY; Wed, 23 Mar 2022 13:28:13 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Switch github repos from git
 to https
Date: Wed, 23 Mar 2022 13:28:13 -0500
Message-ID: <20220323182813.24744-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 23 Mar 2022 18:28:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13727

This is a follow on commit to the previous one that changes all
of the older configs as well so that they remain usable without
users needing to do anything.

github announced removal of support of unencrypted git:// last
year[1], However, we still use git:// in many of our configurations.
Switch them over to https://

[1]
https://github.blog/2021-09-01-improving-git-protocol-security-github/i

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/amsdk/amsdk-07.00.00.00-config.txt                  | 2 +-
 configs/amsdk/amsdk-07.01.00.00-config.txt                  | 2 +-
 configs/amsdk/amsdk-08.00.00.00-config.txt                  | 2 +-
 configs/coresdk/coresdk-07.00.00.005-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.01.00.001-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.01.00.004-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.01.00.005-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.01.00.006-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.02.00.004-config.txt             | 4 ++--
 configs/coresdk/coresdk-07.03.00.005-config.txt             | 4 ++--
 configs/coresdk/coresdk-08.00.00.004-config.txt             | 4 ++--
 configs/coresdk/coresdk-08.01.00.006-config.txt             | 4 ++--
 configs/coresdk/coresdk-08.02.00.006-config.txt             | 4 ++--
 configs/coresdk/coresdk-2013.12.00-config.txt               | 2 +-
 configs/coresdk/coresdk-2013.12.01-config.txt               | 2 +-
 configs/coresdk/coresdk-2014.08.00-config.txt               | 2 +-
 configs/coresdk/coresdk-2014.10.01-config.txt               | 2 +-
 configs/coresdk/coresdk-2014.10.02-config.txt               | 2 +-
 configs/coresdk/coresdk-2015.01-config.txt                  | 2 +-
 configs/coresdk/coresdk-2015.02-config.txt                  | 2 +-
 configs/coresdk/coresdk-2015.03-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.01-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.02-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.03-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.04-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.05-config.txt                  | 2 +-
 configs/coresdk/coresdk-2016.06-config.txt                  | 2 +-
 configs/coresdk/coresdk-2017.00-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.01-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.02-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.03-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.04-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.05-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2017.06-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.00-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.01-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.02-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.03-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.04-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2018.05-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.00-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.01-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.02-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.03-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.04-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.05-config.txt                  | 4 ++--
 configs/coresdk/coresdk-2019.06-config.txt                  | 4 ++--
 configs/glsdk/glsdk-06.03.00.01-config.txt                  | 2 +-
 configs/glsdk/glsdk-06.04.00.02-config.txt                  | 2 +-
 configs/mcsdk/mcsdk-03.00.04.18-config.txt                  | 4 ++--
 configs/mcsdk/mcsdk-03.01.00.03-config.txt                  | 4 ++--
 configs/mcsdk/mcsdk-03.01.01.04-config.txt                  | 4 ++--
 configs/mcsdk/mcsdk-03.01.02.05-config.txt                  | 4 ++--
 configs/mcsdk/mcsdk-03.01.03.06-config.txt                  | 4 ++--
 configs/mcsdk/mcsdk-03.01.04.07-config.txt                  | 2 +-
 configs/mcsdk/mcsdk-3.1.0-config.txt                        | 4 ++--
 configs/mcsdk/mcsdk-dylan-config.txt                        | 4 ++--
 .../processor-sdk-linux/processor-sdk-linux-07_01_00.txt    | 4 ++--
 .../processor-sdk-linux/processor-sdk-linux-07_03_00.txt    | 4 ++--
 .../processor-sdk-linux/processor-sdk-linux-08_00_00.txt    | 4 ++--
 .../processor-sdk-linux/processor-sdk-linux-08_01_00.txt    | 2 +-
 configs/processor-sdk/processor-sdk-01.00.00.00-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-01.00.00.03-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-02.00.00.00-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-02.00.01.07-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-02.00.02.11-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-03.00.00.04-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-03.01.00.06-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-03.02.00.05-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-03.03.00.04-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-04.00.00.04-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-04.01.00.06-config.txt  | 6 +++---
 .../processor-sdk/processor-sdk-04.01.00.06-x11-config.txt  | 6 +++---
 configs/processor-sdk/processor-sdk-04.02.00.09-config.txt  | 6 +++---
 configs/processor-sdk/processor-sdk-04.03.00.05-config.txt  | 6 +++---
 configs/processor-sdk/processor-sdk-05.00.00.15-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-05.01.00.11-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-05.02.00.10-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-05.03.00.07-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-06.00.00.07-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-06.01.00.08-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-06.02.00.81-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-06.03.00.106-config.txt | 4 ++--
 configs/processor-sdk/processor-sdk-07.03.00.005-config.txt | 2 +-
 configs/processor-sdk/processor-sdk-08.00.00.21-config.txt  | 2 +-
 configs/processor-sdk/processor-sdk-08.01.00.39-config.txt  | 4 ++--
 configs/processor-sdk/processor-sdk-daisy-config.txt        | 2 +-
 configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt    | 4 ++--
 configs/processor-sdk/processor-sdk-morty-config.txt        | 6 +++---
 configs/processor-sdk/processor-sdk-rocko-config.txt        | 4 ++--
 oe-layertool-setup.sh                                       | 6 +++---
 91 files changed, 155 insertions(+), 155 deletions(-)

diff --git a/configs/amsdk/amsdk-07.00.00.00-config.txt b/configs/amsdk/amsdk-07.00.00.00-config.txt
index bdece28..8f8487e 100644
--- a/configs/amsdk/amsdk-07.00.00.00-config.txt
+++ b/configs/amsdk/amsdk-07.00.00.00-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
 meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.00.00.00-integration,amsdk-07.00.00.00-release,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/amsdk/amsdk-07.01.00.00-config.txt b/configs/amsdk/amsdk-07.01.00.00-config.txt
index 2a1d8db..b4ed1cb 100644
--- a/configs/amsdk/amsdk-07.01.00.00-config.txt
+++ b/configs/amsdk/amsdk-07.01.00.00-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-oe
 meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-07.01.00.00-integration,amsdk-07.01.00.00-release,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/amsdk/amsdk-08.00.00.00-config.txt b/configs/amsdk/amsdk-08.00.00.00-config.txt
index 374ae16..973e98d 100644
--- a/configs/amsdk/amsdk-08.00.00.00-config.txt
+++ b/configs/amsdk/amsdk-08.00.00.00-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.22,8e386a710023e000a504e05c13da0106df0c7f3a,layers=
 meta-arago,git://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,37e921db22689131144b453d53a8cce4a314aa48,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,37e921db22689131144b453d53a8cce4a314aa48,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-08.00.00.00-integration,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-07.00.00.005-config.txt b/configs/coresdk/coresdk-07.00.00.005-config.txt
index 025c4ed..e2bf4e6 100644
--- a/configs/coresdk/coresdk-07.00.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.00.00.005-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,6cc09fa33131f71a3fd0e336ff07a4186b41bf8f
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.00.00.005,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,fdd19517e17240b0b61765bd02fc483a1bde986f,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,fdd19517e17240b0b61765bd02fc483a1bde986f,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,237879d59e11187a49216a88b73a057408e4b3f7,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,e413c1ef621688e69bb7830bb3151ed23b30b73e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.00.00.005,layers=
diff --git a/configs/coresdk/coresdk-07.01.00.001-config.txt b/configs/coresdk/coresdk-07.01.00.001-config.txt
index af41fda..5225d3f 100644
--- a/configs/coresdk/coresdk-07.01.00.001-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.001-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.001,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,654ad8bea49f142d20b2b96c0dd44810a6be233a,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.001,layers=
diff --git a/configs/coresdk/coresdk-07.01.00.004-config.txt b/configs/coresdk/coresdk-07.01.00.004-config.txt
index 2760297..a32ea29 100644
--- a/configs/coresdk/coresdk-07.01.00.004-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.004-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.004,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0e7015f7a86dda995a39662edbb5c26da647c496,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.004,layers=
diff --git a/configs/coresdk/coresdk-07.01.00.005-config.txt b/configs/coresdk/coresdk-07.01.00.005-config.txt
index c737cf0..9174c92 100644
--- a/configs/coresdk/coresdk-07.01.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.005-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.005,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.005,layers=
diff --git a/configs/coresdk/coresdk-07.01.00.006-config.txt b/configs/coresdk/coresdk-07.01.00.006-config.txt
index 652a5cf..210b52f 100644
--- a/configs/coresdk/coresdk-07.01.00.006-config.txt
+++ b/configs/coresdk/coresdk-07.01.00.006-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
diff --git a/configs/coresdk/coresdk-07.02.00.004-config.txt b/configs/coresdk/coresdk-07.02.00.004-config.txt
index 207aed5..a7e9880 100644
--- a/configs/coresdk/coresdk-07.02.00.004-config.txt
+++ b/configs/coresdk/coresdk-07.02.00.004-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.02.00.004,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,92cd3467502bd27b98a76862ca6525ce425a8479,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,f2d02cb71eaff8eb285a1997b30be52486c160ae,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.02.00.004,layers=
diff --git a/configs/coresdk/coresdk-07.03.00.005-config.txt b/configs/coresdk/coresdk-07.03.00.005-config.txt
index 97e540a..2519cdb 100644
--- a/configs/coresdk/coresdk-07.03.00.005-config.txt
+++ b/configs/coresdk/coresdk-07.03.00.005-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
diff --git a/configs/coresdk/coresdk-08.00.00.004-config.txt b/configs/coresdk/coresdk-08.00.00.004-config.txt
index 2924ec3..596a1d7 100644
--- a/configs/coresdk/coresdk-08.00.00.004-config.txt
+++ b/configs/coresdk/coresdk-08.00.00.004-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
diff --git a/configs/coresdk/coresdk-08.01.00.006-config.txt b/configs/coresdk/coresdk-08.01.00.006-config.txt
index 8995410..26dd996 100644
--- a/configs/coresdk/coresdk-08.01.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.01.00.006-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
diff --git a/configs/coresdk/coresdk-08.02.00.006-config.txt b/configs/coresdk/coresdk-08.02.00.006-config.txt
index 94790b0..8eab286 100644
--- a/configs/coresdk/coresdk-08.02.00.006-config.txt
+++ b/configs/coresdk/coresdk-08.02.00.006-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,d22cc1e587c650fd5f90cda32f5720f8a3105aac
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.02.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,6bfe29d9e8fdd5c2fd17c736814b6df859b3af50,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,c5f61e547b90aa8058cf816f00902afed9c96f72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,0722ff6f021df91542b5efa1ff5b5f6269f66add,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.02.00.006,layers=
diff --git a/configs/coresdk/coresdk-2013.12.00-config.txt b/configs/coresdk/coresdk-2013.12.00-config.txt
index f108491..345f56a 100644
--- a/configs/coresdk/coresdk-2013.12.00-config.txt
+++ b/configs/coresdk/coresdk-2013.12.00-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,28bedc0f3780fc08632f290a20e59d075d4922cf,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,3d32a8e70192660c0bfe49d4475d3d619e4712dd,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2013.12.01-config.txt b/configs/coresdk/coresdk-2013.12.01-config.txt
index 5494aea..760205f 100644
--- a/configs/coresdk/coresdk-2013.12.01-config.txt
+++ b/configs/coresdk/coresdk-2013.12.01-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,ti2013.12.01,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,ti2013.12.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2014.08.00-config.txt b/configs/coresdk/coresdk-2014.08.00-config.txt
index 899ca46..0441ae5 100644
--- a/configs/coresdk/coresdk-2014.08.00-config.txt
+++ b/configs/coresdk/coresdk-2014.08.00-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,daisy,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,daisy,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2014.10.01-config.txt b/configs/coresdk/coresdk-2014.10.01-config.txt
index 40eb3f4..7a6343b 100644
--- a/configs/coresdk/coresdk-2014.10.01-config.txt
+++ b/configs/coresdk/coresdk-2014.10.01-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2014.10.01,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,head,adeaa6128b665920eb98eb7c064f4aacbd74b873,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,head,adeaa6128b665920eb98eb7c064f4aacbd74b873,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,ti2014.10.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,bc63e777ad2748b8bfa7fa70ffd74700fa21a567,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2014.10.02-config.txt b/configs/coresdk/coresdk-2014.10.02-config.txt
index 35e7349..a3c7525 100644
--- a/configs/coresdk/coresdk-2014.10.02-config.txt
+++ b/configs/coresdk/coresdk-2014.10.02-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2014.10.02,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,ti2014.10.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2015.01-config.txt b/configs/coresdk/coresdk-2015.01-config.txt
index 6c544d6..6049d52 100644
--- a/configs/coresdk/coresdk-2015.01-config.txt
+++ b/configs/coresdk/coresdk-2015.01-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.01,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2015.02-config.txt b/configs/coresdk/coresdk-2015.02-config.txt
index d6e8515..f038b4d 100644
--- a/configs/coresdk/coresdk-2015.02-config.txt
+++ b/configs/coresdk/coresdk-2015.02-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.02,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,0454fb083c38f2155a8be3b61930ad1ddf995695,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,jethro,0454fb083c38f2155a8be3b61930ad1ddf995695,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2015.03-config.txt b/configs/coresdk/coresdk-2015.03-config.txt
index 061c2a8..1ae1673 100644
--- a/configs/coresdk/coresdk-2015.03-config.txt
+++ b/configs/coresdk/coresdk-2015.03-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.03,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,9bfcf79fcd824efb9f2a9bd72ecbedfee1315c96,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,jethro,9bfcf79fcd824efb9f2a9bd72ecbedfee1315c96,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.03,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2016.01-config.txt b/configs/coresdk/coresdk-2016.01-config.txt
index b2cd1fe..1eb020a 100644
--- a/configs/coresdk/coresdk-2016.01-config.txt
+++ b/configs/coresdk/coresdk-2016.01-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.01,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2016.02-config.txt b/configs/coresdk/coresdk-2016.02-config.txt
index f9e03f2..5f94d97 100644
--- a/configs/coresdk/coresdk-2016.02-config.txt
+++ b/configs/coresdk/coresdk-2016.02-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.02,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2016.03-config.txt b/configs/coresdk/coresdk-2016.03-config.txt
index 81df114..6eb3092 100644
--- a/configs/coresdk/coresdk-2016.03-config.txt
+++ b/configs/coresdk/coresdk-2016.03-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.03,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.03,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
diff --git a/configs/coresdk/coresdk-2016.04-config.txt b/configs/coresdk/coresdk-2016.04-config.txt
index a659cac..ffe0792 100644
--- a/configs/coresdk/coresdk-2016.04-config.txt
+++ b/configs/coresdk/coresdk-2016.04-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,e64564bcaa7331f505baa5209fef1f50dfda1469,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.04,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.04,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2016.05-config.txt b/configs/coresdk/coresdk-2016.05-config.txt
index 63822f3..1a75225 100644
--- a/configs/coresdk/coresdk-2016.05-config.txt
+++ b/configs/coresdk/coresdk-2016.05-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.05,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.05,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2016.06-config.txt b/configs/coresdk/coresdk-2016.06-config.txt
index 84562a7..424469b 100644
--- a/configs/coresdk/coresdk-2016.06-config.txt
+++ b/configs/coresdk/coresdk-2016.06-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.06,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.06,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.00-config.txt b/configs/coresdk/coresdk-2017.00-config.txt
index 6210bbf..29a9816 100644
--- a/configs/coresdk/coresdk-2017.00-config.txt
+++ b/configs/coresdk/coresdk-2017.00-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.00,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.00,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,c7021b53cb86467f4401e36913fbf992e8b90a5a,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.01-config.txt b/configs/coresdk/coresdk-2017.01-config.txt
index 7e74037..f68b11d 100644
--- a/configs/coresdk/coresdk-2017.01-config.txt
+++ b/configs/coresdk/coresdk-2017.01-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.01,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.02-config.txt b/configs/coresdk/coresdk-2017.02-config.txt
index da17020..a5857c3 100644
--- a/configs/coresdk/coresdk-2017.02-config.txt
+++ b/configs/coresdk/coresdk-2017.02-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,df69c0257aaa9f4e2f4a20d130b7bc0ce2ca0848,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.02,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,6edb45804c5e532fdbca31e9d358d9052eaee90b,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,6edb45804c5e532fdbca31e9d358d9052eaee90b,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.03-config.txt b/configs/coresdk/coresdk-2017.03-config.txt
index ad33f85..d73f2b9 100644
--- a/configs/coresdk/coresdk-2017.03-config.txt
+++ b/configs/coresdk/coresdk-2017.03-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.03,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.03,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.04-config.txt b/configs/coresdk/coresdk-2017.04-config.txt
index e340920..714b970 100644
--- a/configs/coresdk/coresdk-2017.04-config.txt
+++ b/configs/coresdk/coresdk-2017.04-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,32a249cf33f79b579a2cf6224c7d23cdb20d376f,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.04,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,972cab7ca2402eafbe6d7f5be9756c2d225755b7,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,972cab7ca2402eafbe6d7f5be9756c2d225755b7,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.04,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.05-config.txt b/configs/coresdk/coresdk-2017.05-config.txt
index 7b29f11..9c6f04d 100644
--- a/configs/coresdk/coresdk-2017.05-config.txt
+++ b/configs/coresdk/coresdk-2017.05-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.05,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.05,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,e3099758a75e439c54ba45c3434fbf22e98ee779,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2017.06-config.txt b/configs/coresdk/coresdk-2017.06-config.txt
index 1887eed..0a10d15 100644
--- a/configs/coresdk/coresdk-2017.06-config.txt
+++ b/configs/coresdk/coresdk-2017.06-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,991b533f1d61042a7b3edd1fbf3dea0bf9991606,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.06,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.06,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.00-config.txt b/configs/coresdk/coresdk-2018.00-config.txt
index 7a0a42c..592b582 100644
--- a/configs/coresdk/coresdk-2018.00-config.txt
+++ b/configs/coresdk/coresdk-2018.00-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.00,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,32bb7d18a08d1c48873d7ab6332d4cc3815a4dff,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,32bb7d18a08d1c48873d7ab6332d4cc3815a4dff,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.00,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.01-config.txt b/configs/coresdk/coresdk-2018.01-config.txt
index 9d9d685..b21f281 100644
--- a/configs/coresdk/coresdk-2018.01-config.txt
+++ b/configs/coresdk/coresdk-2018.01-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,223a0f68530571d2280f526bddbc718fa803a3dc,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.01,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,fe6dbe144acbcbcbe37f5e9a07a08e414dbce036,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,fe6dbe144acbcbcbe37f5e9a07a08e414dbce036,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,dacfa2b1920e285531bec55cd2f08743390aaf57,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.02-config.txt b/configs/coresdk/coresdk-2018.02-config.txt
index 450d110..e3bb723 100644
--- a/configs/coresdk/coresdk-2018.02-config.txt
+++ b/configs/coresdk/coresdk-2018.02-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.02,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.02,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.03-config.txt b/configs/coresdk/coresdk-2018.03-config.txt
index 56408f0..9fab5db 100644
--- a/configs/coresdk/coresdk-2018.03-config.txt
+++ b/configs/coresdk/coresdk-2018.03-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.03,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,d1824f5572faa9d7cc8eb14dd83d61faa8c35988,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.03,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.04-config.txt b/configs/coresdk/coresdk-2018.04-config.txt
index a3faa17..1f348f8 100644
--- a/configs/coresdk/coresdk-2018.04-config.txt
+++ b/configs/coresdk/coresdk-2018.04-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.04,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.04,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2018.05-config.txt b/configs/coresdk/coresdk-2018.05-config.txt
index 3ea03ce..b7fff00 100644
--- a/configs/coresdk/coresdk-2018.05-config.txt
+++ b/configs/coresdk/coresdk-2018.05-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.05,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.05,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2019.00-config.txt b/configs/coresdk/coresdk-2019.00-config.txt
index cff71bd..1b42dfb 100644
--- a/configs/coresdk/coresdk-2019.00-config.txt
+++ b/configs/coresdk/coresdk-2019.00-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.00,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,3b4b9398154d301a8e39501189da0ad7eee740f7,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,3b4b9398154d301a8e39501189da0ad7eee740f7,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.00,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,81060b70e104b4d050b7d2948a4253cf6a6d8203,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/coresdk/coresdk-2019.01-config.txt b/configs/coresdk/coresdk-2019.01-config.txt
index 1c05f51..cee75dc 100644
--- a/configs/coresdk/coresdk-2019.01-config.txt
+++ b/configs/coresdk/coresdk-2019.01-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,7c1eb51d1e8a4c5f39bf9dddf05fb0b3598da72b
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.01,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,0630018c0033c91fddda62a49f59a82ba6ec6850,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,0630018c0033c91fddda62a49f59a82ba6ec6850,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,9b568b6ae1bf1bebcb9552703ee40f9b880e07ed,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,4cd3a39f22a2712bfa8fc657d09fe2c7765a4005,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.01,layers=
diff --git a/configs/coresdk/coresdk-2019.02-config.txt b/configs/coresdk/coresdk-2019.02-config.txt
index 07eaaf7..d8487ff 100644
--- a/configs/coresdk/coresdk-2019.02-config.txt
+++ b/configs/coresdk/coresdk-2019.02-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.02,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.02,layers=
diff --git a/configs/coresdk/coresdk-2019.03-config.txt b/configs/coresdk/coresdk-2019.03-config.txt
index ab9e5ef..e71cb59 100644
--- a/configs/coresdk/coresdk-2019.03-config.txt
+++ b/configs/coresdk/coresdk-2019.03-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.03,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.03,layers=
diff --git a/configs/coresdk/coresdk-2019.04-config.txt b/configs/coresdk/coresdk-2019.04-config.txt
index 4fd004a..5a50b12 100644
--- a/configs/coresdk/coresdk-2019.04-config.txt
+++ b/configs/coresdk/coresdk-2019.04-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.04,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.04,layers=
diff --git a/configs/coresdk/coresdk-2019.05-config.txt b/configs/coresdk/coresdk-2019.05-config.txt
index 505904f..a398d27 100644
--- a/configs/coresdk/coresdk-2019.05-config.txt
+++ b/configs/coresdk/coresdk-2019.05-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,97067634b1f149b56844b10e3a5e8d0d980b6e34
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.05,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.05,layers=
diff --git a/configs/coresdk/coresdk-2019.06-config.txt b/configs/coresdk/coresdk-2019.06-config.txt
index 1cbc915..808fe39 100644
--- a/configs/coresdk/coresdk-2019.06-config.txt
+++ b/configs/coresdk/coresdk-2019.06-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.06,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.06,layers=
diff --git a/configs/glsdk/glsdk-06.03.00.01-config.txt b/configs/glsdk/glsdk-06.03.00.01-config.txt
index 551a2e6..71e313b 100644
--- a/configs/glsdk/glsdk-06.03.00.01-config.txt
+++ b/configs/glsdk/glsdk-06.03.00.01-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,b838c23aae724496b3aee48b5daa0f458e0526c1,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,691ad445d8d55971ac787a60516aaf91bc4bc3a3,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/glsdk/glsdk-06.04.00.02-config.txt b/configs/glsdk/glsdk-06.04.00.02-config.txt
index e569d2e..f09e63b 100644
--- a/configs/glsdk/glsdk-06.04.00.02-config.txt
+++ b/configs/glsdk/glsdk-06.04.00.02-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-arago,git://arago-project.org/git/projects/meta-arago-glsdk.git,master,283813dffe8633af04c87faedb4c601518fa3a9c,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,775d77e482f1ea203c78003cccd2547075fd720f,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/projects/meta-ti-glsdk.git,dylan,96fae48172519a621bb38c875a0b0e89a198868c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
diff --git a/configs/mcsdk/mcsdk-03.00.04.18-config.txt b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
index 7ff5e60..099975c 100644
--- a/configs/mcsdk/mcsdk-03.00.04.18-config.txt
+++ b/configs/mcsdk/mcsdk-03.00.04.18-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,78d08be08c55440133b12d1db4843fcf72b583b6,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,608fd3be257002256d13422daf0b593b55463d4d,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,1fa7f364f682e5cfaa9d6e565b7ae6b8ec2a90ff,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,1fa7f364f682e5cfaa9d6e565b7ae6b8ec2a90ff,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,14858daa694a559b89881741ad9033acd925143c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,20fa82037c93e6814f1b76c0b8adc73616be8aa2,layers=
+meta-java,https://github.com/woglinde/meta-java,master,20fa82037c93e6814f1b76c0b8adc73616be8aa2,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,58b479f4d4d283e590a55a71151fca481fbe3c24,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.00.03-config.txt b/configs/mcsdk/mcsdk-03.01.00.03-config.txt
index d68f52a..08bb905 100644
--- a/configs/mcsdk/mcsdk-03.01.00.03-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.00.03-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,3bb8b1778790d5f214357a6883914f622b407bbf,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.01.04-config.txt b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
index b894589..4b2fa98 100644
--- a/configs/mcsdk/mcsdk-03.01.01.04-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.01.04-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,832a44b1821a8d509e3461aa03c41fa915fb640b,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.02.05-config.txt b/configs/mcsdk/mcsdk-03.01.02.05-config.txt
index d75166e..46a23fb 100644
--- a/configs/mcsdk/mcsdk-03.01.02.05-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.02.05-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,2bab20e97aa16c9f763c331ae4c5ad5d045040a0,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.03.06-config.txt b/configs/mcsdk/mcsdk-03.01.03.06-config.txt
index 17f4b33..6610364 100644
--- a/configs/mcsdk/mcsdk-03.01.03.06-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.03.06-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,bafae2df01b979fb1ac7c1cbe9d8698b9409e952,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.01.04.07-config.txt b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
index 4dc03e4..3920c68 100644
--- a/configs/mcsdk/mcsdk-03.01.04.07-config.txt
+++ b/configs/mcsdk/mcsdk-03.01.04.07-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,daisy,3ae8cecea6cd076587fb4498ae431bc42489dd9d,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,daisy,dc89e06d2a64f33d9e9662e6f7fe1f8466ff167c,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,c29c317e0f22202bfaa85329a580564bbc179089,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,c29c317e0f22202bfaa85329a580564bbc179089,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,090b02a104924886afd0fa79be7b5d08eebf071f,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
diff --git a/configs/mcsdk/mcsdk-3.1.0-config.txt b/configs/mcsdk/mcsdk-3.1.0-config.txt
index 44feb12..4e04b25 100644
--- a/configs/mcsdk/mcsdk-3.1.0-config.txt
+++ b/configs/mcsdk/mcsdk-3.1.0-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,370ed5e9f68afd0937e01f6cd69863e45ba19c1f,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,ed05b91f137cb229e9ebababf9f72748aece1bf3,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,70ebe86f193decd17d6295bcd4d4e5589585c0cc,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,0056050410c1d5f8627c509490a5650eb082261c,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
+meta-java,https://github.com/woglinde/meta-java,master,ac8c0604d1ed63b1ae0e05f870f53b8241e6dda1,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,7ff1924674871d604f9656f3928b91dc417c7246,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-dylan-config.txt b/configs/mcsdk/mcsdk-dylan-config.txt
index 1489b7b..e534900 100644
--- a/configs/mcsdk/mcsdk-dylan-config.txt
+++ b/configs/mcsdk/mcsdk-dylan-config.txt
@@ -4,11 +4,11 @@
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
 meta-mcsdk,git://arago-project.org/git/projects/meta-mcsdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
-meta-java,git://github.com/woglinde/meta-java,master,HEAD,layers=
+meta-java,https://github.com/woglinde/meta-java,master,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
index 4c699bc..20a0d0f 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_01_00.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
index e0cef55..2ecb55f 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-07_03_00.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
index f46184a..961c0f9 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_00_00.txt
@@ -4,8 +4,8 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
 meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,3d772074ef93ac47a1a752e22021b0c32207f54b,layers=
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
diff --git a/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
index 5869b67..7ec46da 100644
--- a/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
+++ b/configs/processor-sdk-linux/processor-sdk-linux-08_01_00.txt
@@ -4,7 +4,7 @@
 bitbake,https://git.openembedded.org/bitbake,1.46,f18b65d0b9a6b983d53bde491e1bf2ca56949444
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
 meta-psdkla,git://git.ti.com/jacinto-linux/meta-psdkla.git,master,f030757ec1e3657a26fdfa75c5148eae6c264580,layers=
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
diff --git a/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
index 3c2bb2e..7956f76 100644
--- a/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
+++ b/configs/processor-sdk/processor-sdk-01.00.00.00-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.24,923fc5ee0ace02cc29110bff502a2c65e6bdebf0,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,b12d5ca16701da5b723a691e4d817693ab4dd260,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,a550535f326d48fe2627d76b144368e4ec0551b0,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,87235825459d376bf4537c9523eb2496e15893aa,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,3a95559c124d3ce8c076b3fae5859435977d1ac2,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
index ffb12d1..964c1ba 100644
--- a/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
+++ b/configs/processor-sdk/processor-sdk-01.00.00.03-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,cd92e5dce5f5d61ecb7838bf964a7812e905509a,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,05b7db4f213c0862cdbb6cc3da1fd2b63a834b28,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,daisy,d4315b423207030962c48de7cbc247abec0c0033,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,af94b54a5ee81e7ce098a20514a9cc7f88477f08,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,06008235ca752fea678953e85adaa29a491d246b,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
index f43a511..1fd4a9d 100644
--- a/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.00.00-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,ed30f4ee1cef8db9ea422c5e54b2375c4f3b1d6f,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,bfc49c171cead0cf0b5d859f51c45364a74e1ea7,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,f36422977840d88696e4ea209a82b0caa37a3f5d,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,214e1801d0efc38d3b6142bdc0d8e58ca593e34c,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,0a222c70845d19a2213ac36803361e8531768cca,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,3f1933242062d1cf473d20b86fa4582963ff9441,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
index ea969c5..d55868d 100644
--- a/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,12c6ff170389762b6f7f7bf290cd26bfa316cf47,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,b1bf5b638567cd5be269c5968931de8deeac0c80,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,3b27c871dbf67497ea9a953fe3fa0f819c6e41c9,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
index 5b30303..4d32c2e 100644
--- a/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.02.11-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,80feff781e2a6c3b50a72655a627ca7d629c72ab,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,fido,e6bb433b399c1ad32e596b9c46571fbfe384a86e,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,c93678aa08bc0df0f1f36a84afe48723406de58e,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
index f20825a..bb93208 100644
--- a/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.00.00.04-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.30,26379ff2b686313c82af87a3a35b47adbc0183be,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,1686d851985872f34ca3a2c30d4a0726a20a5c99,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,ti2016.01,36598b78a6d9fbe442f93111f64d3413c04418a8,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,d715f2c1d340fa38f8a9860acc73de5e14a38b75,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,1ae0cadb1200d0007a779958e852a48379d42c26,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
index 0ab5543..c9322bf 100644
--- a/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.01.00.06-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.30,bee144eeed6c08ec2829533e82f94405058ce453,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,6b3984287c3c15fde80dcc5a0999fb85c6a8a6c6,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,b6fea965af0129f552d45e9c7d85937e6076f645,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,008497c611bc381014d310678e7dd39668959fea,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
index 1ae5a96..e63170d 100644
--- a/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.02.00.05-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.30,e82862ba8fedb2c5cd478c731b3d259d16c6e3d8,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,3678d672c9c47a646897286281d4260ac4ace960,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,76381bbc10b93ffc6c014154814872b170b93796,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,851a064b53dca3b14dd33eaaaca9573b1a36bf0e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,d8aa76970a0ba48762c631dfd79dbed49222373b,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,9b616ce6d4293387d254f36800389b2910895420,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
index 6e7e8b0..c5358dd 100644
--- a/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-03.03.00.04-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.30,449dc9b955dfbe048e380f5ab9fd61c3d1489dad,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,70283e8e915126b57e30cc7fcf5286a9435c3829,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,krogoth,c0e32cc7615f7483ae3a674221dd633205b28ee3,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,krogoth,2b1871f0d139dc3caaa779a32a1931409c245a36,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,55c8a76da5dc099a7bc3838495c672140cedb78e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,http://arago-project.org/git/meta-ti.git,krogoth,ed06c3bb58493a40b6fe584251a94f067fc9bdf7,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,2f51d38048599d9878f149d6d15539fb97603f8f,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
index 733ad99..3218acd 100644
--- a/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.00.00.04-config.txt
@@ -4,8 +4,8 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,3d2f620a6a98b1b6abb1103d7dc986921436ed19,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,b727bf8fce8e9cb5a6b5d5b48c45f0088e67eb53,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,880a7bd1d3b9a1b2003f5b0620350f03158bbd43,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,880a7bd1d3b9a1b2003f5b0620350f03158bbd43,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,41d6fdc0fe5ea6054616cfccda13baac3ff33791,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
index 2718148..a199fcd 100644
--- a/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-config.txt
@@ -4,9 +4,9 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,2b7f7b00654eb3faaea7c66271ebe508b9ffc019,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
+meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
index c68147b..692f489 100644
--- a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
@@ -4,9 +4,9 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,cb3ee0c165ef4e71e1aad16812652ca1371a9c80,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
+meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
index e9f5272..7a3f0e9 100644
--- a/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
@@ -5,9 +5,9 @@ bitbake,git://git.openembedded.org/bitbake,1.32,5f5e13bacde95a93633f621ec6b94a02
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,eaac60268857bc56bf89625df93935a272b63341,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e01c6ace0d4f9d700449edad3781e9cd505b5e10,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,d34c861f846f35d089e1caf224ec43079be7b202,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,351ccf1928a18c2b69fd19b09b980c9aa3af2e26,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
index 9837395..a4cf75b 100644
--- a/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
@@ -5,9 +5,9 @@ bitbake,git://git.openembedded.org/bitbake,1.32,da85da9b58ed252c7b80a437fb5babff
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,92db4d8023d88ab59fab2953e7447ec0bd5a6db1,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,morty,5b2a44b0c4d989133bc13d59398fd10375d351bb,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,3dc08477529b31ce887bb22a08201a843ded48f0,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d73e794c7e7ebb1cc5bf495a52a72b26fb118250,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
index e7a7bd4..d60b8a9 100644
--- a/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a850475
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,264dc66c689e0e4212c43358382986ee470619d4,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.01,d54e9d6c1d461dbf3189e691088d328bf4c4fb19,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
 meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.01,8555084679dc5c668e5fb60a16425ca32b10ff21,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
index 33c29d9..cad42bc 100644
--- a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48f
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,012bf1c42b1826380ca7557e5185fe88f939a93c,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.03,85f191c83f7cd7b3b4fb6df08b22fabe24e25773,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
 meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.03,3f26d1f94fbc87740fdfe33292c904e865257e81,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
index 8a8a84d..312891b 100644
--- a/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.36,0c7cf572b8350e7ec1e451d207d67f1f
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,378823175fb71bc7073ff4b745d62ee5b37de7bf,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,44707eb4de002040aac8444030e0f5feae238e6c,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,e9b069beb92f00e6947cdd0f503747774b189358,layers=
diff --git a/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
index f2cd5ff..034d110 100644
--- a/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.36,582f1d7a8d150cf5917dfc1efa844f40
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,f33a37ac6baa8155302fa1faea99f1be5461779e,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,d4bc00af838df7a77f4ddbd3546755c5bad5b880,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,02e852b1a069463f937ea594e13fe5f88ce9b74d,layers=
diff --git a/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
index 09f58d3..6f7c02d 100644
--- a/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa68916
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,e5b633c0aa6d924ab6bea15906e3790c01c86633,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.01,9373674c699c8ad98f8b6b3eac45473448f55e94,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.01,28a2f128fbadd37463060eb5ee40c7c9a47cc530,layers=
diff --git a/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
index 54adc52..2b0d6cf 100644
--- a/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,0d3220f2aa26c6069df78c68bb6009a35067866c,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.03,9736c7d3e5c4c5a823e9caa712aa27ae24a40e4e,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.03,a65f0a338d8f4dcce902cde64fb1413727f1ac20,layers=
diff --git a/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
index 41d4a34..128d35e 100644
--- a/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.02.00.81-config.txt
@@ -6,8 +6,8 @@ meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,
 meta-aws,https://github.com/aws/meta-aws.git,master,b5191c92f6e124f7baaec3513d1338a47fe0caa8,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.05,d2e8f25e059630f6447c8e41d1c20625f10cdb9d,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,e5da84ec50a46ca73c2efbdaa376d30183562986,layers=
diff --git a/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
index 35435ca..0c8a8fd 100644
--- a/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
+++ b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
@@ -6,8 +6,8 @@ meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,
 meta-aws,https://github.com/aws/meta-aws.git,thud,6432f1b38b9dcbbb55020167f5b1cfe55e858c6d,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,thud,70436496d2617b281c51390faa3d421814055cd6,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,e6e464c9ed9266ce46452f953c1bdcb0e7b2d95f,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,thud,e6e464c9ed9266ce46452f953c1bdcb0e7b2d95f,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,b27317ab4f9be931a66344ca502c7e3f4ec780e5,layers=
diff --git a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
index 548e759..8c5524d 100644
--- a/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
+++ b/configs/processor-sdk/processor-sdk-07.03.00.005-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,017a39ed05d065bf28fd38f91bcde8a098300551
 meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,c467012684e57c914c4070238987e931f329da15,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.03.00.005,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,89abc62b47f6f20db9d00a8ec9b2c1b6b60ac3f9,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,389757a7494221fea1d8437e9a01c6e4fb4700af,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.03.00.005,layers=
diff --git a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
index 78a921c..eb9f519 100644
--- a/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.00.00.21-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,0e0af15b84e07e6763300dcd092b980086b9b9c4
 meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,ea2e8505fdf9948c0e2881af9dacb07e801c9037,layers=
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.00.00.004,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,4d6216a04c2ebe04bf02392c02d9589d35ebf3b4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,7bd47ef6c98323c95a9e527129dca98c9a65ee08,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.00.00.004,layers=
diff --git a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
index cc67eb2..1ab044e 100644
--- a/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
+++ b/configs/processor-sdk/processor-sdk-08.01.00.39-config.txt
@@ -4,8 +4,8 @@
 bitbake,git://git.openembedded.org/bitbake,1.46,c2a3bda3a29e12472ef7862e424ea1552fab2959
 meta-processor-sdk,git://git.ti.com/processor-sdk/meta-processor-sdk.git,dunfell,9d1705ba257f95702fb010c6ed3aba384b1019ba,layers=
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,08.01.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,b4d24d70aca75791902df5cd59a4f4a54aa4a125,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,180241e0eee718fc52c7b6b25dbd1d845a8047c4,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,69f94af4d91215e7d4e225bab54bf3bcfee42f1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,08.01.00.006,layers=
diff --git a/configs/processor-sdk/processor-sdk-daisy-config.txt b/configs/processor-sdk/processor-sdk-daisy-config.txt
index 1ef8f62..3913a09 100644
--- a/configs/processor-sdk/processor-sdk-daisy-config.txt
+++ b/configs/processor-sdk/processor-sdk-daisy-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
diff --git a/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt b/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
index 4c699bc..20a0d0f 100644
--- a/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
+++ b/configs/processor-sdk/processor-sdk-dunfell-07.01.00.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,838a89141fd6a75da9f982ad2b035e823b692d2a
 meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,07.01.00.006,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,0d8eb956015acdea7e77cd6672d08dce18061510,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,ff997b6b3ba800978546098ab3cdaa113b6695e1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,2a5c534d2b9f01e9c0f39701fccd7fc874945b1c,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,07.01.00.006,layers=
diff --git a/configs/processor-sdk/processor-sdk-morty-config.txt b/configs/processor-sdk/processor-sdk-morty-config.txt
index ad5e815..a8195b3 100644
--- a/configs/processor-sdk/processor-sdk-morty-config.txt
+++ b/configs/processor-sdk/processor-sdk-morty-config.txt
@@ -5,9 +5,9 @@ bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,HEAD,layers=
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-openamp,https://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
diff --git a/configs/processor-sdk/processor-sdk-rocko-config.txt b/configs/processor-sdk/processor-sdk-rocko-config.txt
index 6ea9a41..304abc7 100644
--- a/configs/processor-sdk/processor-sdk-rocko-config.txt
+++ b/configs/processor-sdk/processor-sdk-rocko-config.txt
@@ -5,8 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
 meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
 meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 9294520..f171f94 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -101,17 +101,17 @@ Input Files:
     file.  For example, when configuring openembedded-core the following can be
     used:
 
-    openembedded-core,git://github.com/openembedded/oe-core.git,master,HEAD
+    openembedded-core,https://github.com/openembedded/oe-core.git,master,HEAD
 
     This would select both the meta and meta-skeleton layers.
 
     or, to limit to only the meta layer you could use the syntax
 
-    openembedded-core,git://github.com/openembedded/oe-core.git,master,HEAD,layers=meta
+    openembedded-core,https://github.com/openembedded/oe-core.git,master,HEAD,layers=meta
 
     or, to explicitly set the meta and meta-skeleton layers use
 
-    openembedded-core,git://github.com/openembedded/oe-core.git,master,HEAD,layers=meta:meta-skeleton
+    openembedded-core,https://github.com/openembedded/oe-core.git,master,HEAD,layers=meta:meta-skeleton
 
     It is also possible to specify the sample conf files for bblayers.conf
     and local.conf using settings like:
-- 
2.17.1


