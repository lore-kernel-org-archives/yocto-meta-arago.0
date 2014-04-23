Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 82F4652A48
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 19:42:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00HL51EU9W00@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 14:42:46 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id C73BC204AB; Wed,
	23 Apr 2014 15:42:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 15:42:26 -0400
Message-id: <1398282148-11547-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398282148-11547-1-git-send-email-denis@denix.org>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 3/5] mcsdk-03.00.00.xx: remove old denzil-based configs
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
X-List-Received-Date: Wed, 23 Apr 2014 19:43:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/mcsdk/mcsdk-03.00.00.03-config.txt | 10 ----------
 configs/mcsdk/mcsdk-03.00.00.05-config.txt | 11 -----------
 configs/mcsdk/mcsdk-03.00.00.06-config.txt | 11 -----------
 configs/mcsdk/mcsdk-03.00.00.07-config.txt | 11 -----------
 4 files changed, 43 deletions(-)
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.03-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.05-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.06-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.07-config.txt

diff --git a/configs/mcsdk/mcsdk-03.00.00.03-config.txt b/configs/mcsdk/mcsdk-03.00.00.03-config.txt
deleted file mode 100644
index 9afaf0e..0000000
--- a/configs/mcsdk/mcsdk-03.00.00.03-config.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,2012.07,layers=meta-arago-distro:meta-arago-extras
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,f95b2e51ea8194b82d2476b338610782a83ce4de,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,741146fa90f28f7ce8d82ee7f7e254872d519724,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.05-config.txt b/configs/mcsdk/mcsdk-03.00.00.05-config.txt
deleted file mode 100644
index 9fba566..0000000
--- a/configs/mcsdk/mcsdk-03.00.00.05-config.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,2012.11,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,973138efa050a37462c5fbf0f8eeb5cfbdac478f,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago-linaro.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.06-config.txt b/configs/mcsdk/mcsdk-03.00.00.06-config.txt
deleted file mode 100644
index 624dd53..0000000
--- a/configs/mcsdk/mcsdk-03.00.00.06-config.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,4385d5306b0dcabb64f81759f090468a12c66fcf,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,f4cc35d3ac44a29d3001a295a99f39ecf19fc9ca,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago-linaro.conf.sample
diff --git a/configs/mcsdk/mcsdk-03.00.00.07-config.txt b/configs/mcsdk/mcsdk-03.00.00.07-config.txt
deleted file mode 100644
index 29ade94..0000000
--- a/configs/mcsdk/mcsdk-03.00.00.07-config.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,127b0541e6f2007de0b402233893363b11e5c4c7,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,c0117f5ad7d1fe18d149bda426c7134ff24daae8,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,2ef919df5cfb48755456251836d80083abc7dce7,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,03bceadf7d9f70d7b013f453e81b2b9d1b7cdbc7,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,0a9e8bf35afd5990c1b586bba5eb68f643458a4b,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago-linaro.conf.sample
-- 
1.9.2


