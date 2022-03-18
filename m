Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D7DC433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 17:27:19 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.12723.1647624439099696714
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 10:27:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VI/xZ0bp;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IHRFk0081983;
	Fri, 18 Mar 2022 12:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647624435;
	bh=M0+goOOWby0jB5/DDiOb2+E5AQrR34Q5kLY1SYPUb+o=;
	h=From:To:CC:Subject:Date;
	b=VI/xZ0bpAItV7pFek2ERrX80+0VoW/ll432lrconQejAJywPt8zcZKohVH5w5N9hJ
	 08wVHFY9xOsL2P7ItczDLZpFLgpYQBjrx7hb8TWQRnNIp5qLYozBPmy4jI8R31aEfp
	 CvGELw2cgxvv6CnOt51CRC6anNpFyOqkpmmWeXjA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IHRFfD118901
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 12:27:15 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 12:27:14 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 12:27:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IHREm1110162;
	Fri, 18 Mar 2022 12:27:14 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [oe-layersetup PATCH] configs: Switch github repos from git to https
Date: Fri, 18 Mar 2022 12:27:14 -0500
Message-ID: <20220318172714.17656-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 17:27:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13656

github announced removal of support of unencrypted git:// last
year[1], However, we still use git:// in many of our configurations.
Switch them over to https://

[1] https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Also interesting is why are'nt we hearing wide-spread "oh oh.. it fails
to build??" comments?

$ git clone git://github.com/meta-qt5/meta-qt5.git
Cloning into 'meta-qt5'...
fatal: remote error:
  The unauthenticated git protocol on port 9418 is no longer supported.
Please see https://github.blog/2021-09-01-improving-git-protocol-security-github/ for more information.

Also, should we start considering shifting all to https:// ?

 configs/arago-dunfell-config.txt      | 4 ++--
 configs/arago-dunfell-next-config.txt | 4 ++--
 configs/arago-master-config.txt       | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 464b835b7a30..60cc72a8d86f 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -3,9 +3,9 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
-# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 9657a727fda1..e2eb2023fec5 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -3,9 +3,9 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
 meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-# meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+# meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index e4c6d7f0070e..bd0ccec58e16 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -3,8 +3,8 @@
 
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
 meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-#meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
-- 
2.31.1


