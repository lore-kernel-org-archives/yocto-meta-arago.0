Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 7855852987
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 21:14:10 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAFLE8KT028285
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2012 15:14:09 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLE8UV028970
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 02:44:08 +0530 (IST)
Received: from dbdp32.itg.ti.com (172.24.170.251) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 16 Nov 2012 02:44:08 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp32.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAFLE2b8005211;
	Fri, 16 Nov 2012 02:44:07 +0530
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Nov 2012 15:14:01 -0600
Message-ID: <1353014041-13651-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353014041-13651-1-git-send-email-Chase.Maupin@ti.com>
References: <1353014041-13651-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] tisdk-image: Package gz file systems by default
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
X-List-Received-Date: Thu, 15 Nov 2012 21:14:10 -0000
Content-Type: text/plain

* Allow packaging tar.gz files as well for the root file system
  if they exist.
* Usually only one tar.gz or tar.bz2 should be set to build but
  if both are there they will get packaged.  To set one or the
  other you should set IMAGE_FSTYPES in the machine.conf file
  for your machine.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index 916baa9..bbccdc4 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -37,7 +37,7 @@ TISDK_TOOLCHAIN_PATH ?= "linux-devkit"
 TISDK_TOOLCHAIN ?= "meta-toolchain-arago"
 
 # List of the type of target file system images we want to include
-TARGET_IMAGE_TYPES ?= "tar.bz2 ubi"
+TARGET_IMAGE_TYPES ?= "tar.bz2 tar.gz ubi"
 
 # If EXTRA_TISDK_FILES points to a valid directory then all the contents
 # of that directory will be added to the SDK using the same directory
-- 
1.7.0.4


