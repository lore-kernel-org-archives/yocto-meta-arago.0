Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8AF0C52A14
	for <meta-arago@arago-project.org>;
	Wed, 19 Jul 2017 17:50:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6JHoeCk010995
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500486640;
	bh=33HP3HeQ5DCzLf1wuzqTcKyIFdkpJGt7YyzPB55ZK4s=;
	h=From:To:CC:Subject:Date;
	b=aB0Pmy5JOdTEKTJhoQpVrmRwZDYprL0z2apBmGqpSE17DXPAFiOW89SPaMIiHsPQ+
	a6vpHrgNyWvE74EfynNzH36PKjkBfb/gdKTn2DD3ceKmo3cz/emZZwniX/+jLKhVLK
	3f1v06kpcF4Kd9T5jPtuow1CGrWIhl4DSqhasMLk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6JHoe1d019972
	for <meta-arago@arago-project.org>; Wed, 19 Jul 2017 12:50:40 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 19 Jul 2017 12:50:40 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6JHodvs032055;	Wed, 19 Jul 2017 12:50:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jul 2017 13:50:24 -0400
Message-ID: <1500486625-24181-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH 1/2] coresdk-2017.02: add config for ti2017.02 release
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
X-List-Received-Date: Wed, 19 Jul 2017 17:50:40 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...17.01-config.txt => coresdk-2017.02-config.txt} |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 copy configs/coresdk/{coresdk-2017.01-config.txt => coresdk-2017.02-config.txt} (57%)

diff --git a/configs/coresdk/coresdk-2017.01-config.txt b/configs/coresdk/coresdk-2017.02-config.txt
similarity index 57%
copy from configs/coresdk/coresdk-2017.01-config.txt
copy to configs/coresdk/coresdk-2017.02-config.txt
index 7e74037..da17020 100644
--- a/configs/coresdk/coresdk-2017.01-config.txt
+++ b/configs/coresdk/coresdk-2017.02-config.txt
@@ -1,13 +1,13 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.01,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
+bitbake,git://git.openembedded.org/bitbake,1.32,df69c0257aaa9f4e2f4a20d130b7bc0ce2ca0848,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.02,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,6edb45804c5e532fdbca31e9d358d9052eaee90b,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.01,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.02,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,befda6ce3fd916ab04c035d1d82ed173759f7f09,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
1.7.9.5


