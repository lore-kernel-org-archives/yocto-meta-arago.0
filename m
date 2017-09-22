Return-Path: <manishalocal@uda0393239>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id B3A0452A96
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 19:34:21 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MJYLBI027828
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506108861;
	bh=hZDMBSiT3ZmnzRmob3JrRqMpngP/Z+3XO5IvWlwVynM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mO64XW9JdxdTlLJz2YQTgdccdmnPMZkON4z7elCnGzJ/KVbYV+ThutdYhx667CR7P
	4aDKCeEaqowly1+oeX4TWZZ2pEPWqSvaimQb51Up28S4jFu9f3owxhCat46D8hhsZQ
	xsdTEuGfID1B0wvtMjnvrBJ4mBaFTGW+ILCFjrk0=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLRt029678
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 14:34:21 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 14:34:21 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MJYLKc025337;
	Fri, 22 Sep 2017 14:34:21 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dvTiP-0000QS-35; Fri, 22 Sep 2017 14:34:21 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Sep 2017 14:34:13 -0500
Message-ID: <20170922193417.1595-2-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170922193417.1595-1-manisha.agrawal@ti.com>
References: <20170922193417.1595-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][PATCH v2 2/6] matrix-gui-apps-git : update SRCREV version
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
X-List-Received-Date: Fri, 22 Sep 2017 19:34:22 -0000
Content-Type: text/plain

Add new demo protection-relays-hmi in hmi_apps.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index c6e48586..2d93b340 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "d910584814644f853f3fe4fbe715f674f24b9bd3"
+SRCREV = "094736065e1a15a49da19ef4c5a100aa763c41d1"
 BRANCH = "master"
-INC_PR = "r49"
+INC_PR = "r50"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.13.0


