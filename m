Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 82AAD52AB8
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 21:43:22 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhMYl065737;
	Wed, 23 Jun 2021 16:43:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624484602;
	bh=Y0MHMqLy/hOdFWJX6tk8ydOGGDUjveUT/p67eC5aAlY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=u76IqWZXEA7dZd7QPJMfUNJScs04w1w5MskybCZQe5T0fH8tSLO26fGkpkwNcvodW
	G+UC8K+mLtNnpSr3lHmUpfoyXJpD1Rfli/leRyuUQ5S3X1DXmc+H6nlC/N1w4PmiH+
	3F9AiwlVvaSbZXTfbesL/P1JCNez4P7mvkUw+s0E=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15NLhMKS041496
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 23 Jun 2021 16:43:22 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 23 Jun 2021 16:43:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15NLhM5b030854;
	Wed, 23 Jun 2021 16:43:22 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Wed, 23 Jun 2021 16:43:20 -0500
Message-ID: <20210623214320.9645-4-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623214320.9645-1-nm@ti.com>
References: <20210623214320.9645-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH V2 3/3] configs: arago*.txt: Revise meta-arago repo towards yoctoproject.org primary
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jun 2021 21:43:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that yoctoproject.org git repo is live, lets move references away
from arago-project.org.

This is one of the initial cleanup steps towards eventually sunsetting
the arago-project.org

See sample-files/gitconfig.sample for examples of how to redirect
repository using older urls to new locations

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since V1:
* Patch is now trimmed to just the relevant arago configurations
* Updated $subject to be more arago focussed.

V1: http://arago-project.org/pipermail/meta-arago/2021-June/013225.html

 configs/arago-dunfell-config.txt      | 2 +-
 configs/arago-dunfell-next-config.txt | 2 +-
 configs/arago-master-config.txt       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 173499bb3f8e..464b835b7a30 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 9f5eeb9a83e7..9657a727fda1 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index f989ee125734..07886793a7ab 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-- 
2.32.0


