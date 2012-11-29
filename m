Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3CE6752A0A
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2012 19:41:02 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qATJevoJ022546
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2012 13:40:58 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qATJetGV003369
	for <meta-arago@arago-project.org>;
	Fri, 30 Nov 2012 01:10:57 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 30 Nov 2012 01:10:55 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qATJer5M003236;
	Fri, 30 Nov 2012 01:10:54 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Nov 2012 13:40:50 -0600
Message-ID: <1354218050-17337-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] ti-crypto-examples: update to latest sources and add DEPENDS
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
X-List-Received-Date: Thu, 29 Nov 2012 19:41:10 -0000
Content-Type: text/plain

* Update to the latest sources which use a different method to
  access the HW accelerators.
* Add a missing DEPENDS for openssl

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
* Updated in version 2
    * Added a dependency on openssl

---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index a35524f..4856ea9 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -3,11 +3,12 @@ HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=s
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
+DEPENDS += "openssl"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "d3cc223206367a02097c7ad4e997cf2bef975277"
+SRCREV = "7d7092f14005da15f556ef52cad73fb7fd038d7a"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


