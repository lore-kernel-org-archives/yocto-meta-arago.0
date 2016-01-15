Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 48B6252A19
	for <meta-arago@arago-project.org>;
	Fri, 15 Jan 2016 16:32:16 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u0FGWFOr027509
	for <meta-arago@arago-project.org>; Fri, 15 Jan 2016 10:32:15 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u0FGWElN008083
	for <meta-arago@arago-project.org>; Fri, 15 Jan 2016 10:32:15 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 15 Jan 2016 10:32:14 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u0FGWE6X023388;	Fri, 15 Jan 2016 10:32:14 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Jan 2016 11:32:11 -0500
Message-ID: <1452875531-11989-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup] [PATCH] configs: Add processor-sdk-02.00.01.07-config
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
X-List-Received-Date: Fri, 15 Jan 2016 16:32:17 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../processor-sdk-02.00.01.07-config.txt}                        | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)
 copy configs/{coresdk/coresdk-2015.02-config.txt => processor-sdk/processor-sdk-02.00.01.07-config.txt} (55%)

diff --git a/configs/coresdk/coresdk-2015.02-config.txt b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
similarity index 55%
copy from configs/coresdk/coresdk-2015.02-config.txt
copy to configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
index d6e8515..ea969c5 100644
--- a/configs/coresdk/coresdk-2015.02-config.txt
+++ b/configs/processor-sdk/processor-sdk-02.00.01.07-config.txt
@@ -2,11 +2,12 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.02,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,0454fb083c38f2155a8be3b61930ad1ddf995695,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,12c6ff170389762b6f7f7bf290cd26bfa316cf47,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,b1bf5b638567cd5be269c5968931de8deeac0c80,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,97ce05c0b2a81f05388d7f727741529fb9177775,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,df2f700d66bace65f5d802225232d01cf511fe81,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.02,layers=
+meta-ti,git://arago-project.org/git/meta-ti.git,fido,3b27c871dbf67497ea9a953fe3fa0f819c6e41c9,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,08a46787862966f2236c5a9b3eb4d4ec68263593,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,fido,9f339f516ab03d598fae0e536b3a420ea4d8ee1a,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


