Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 5173A52AB8
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 16:05:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TG5vL4004369
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:05:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504022757;
	bh=YBv1YvEh2DuMYLUIZjDG0FMKKEYY4Cyd5OSSiZTxxKY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=FA+06ixSpnGyjIMy0JgRLvhaQZ/9d91d/3Cs5wbHobVcmC9n+ITdhRFuouWqfvQTc
	KnSgFKqUDfEA0dgrlemP5lPX0pyUO63rCsN/YZJZ1qbE/yOxIiIKE6G9QqdWg7xNZd
	bJ0eldyu7ShyttDFzGd18rJH/9KRRxro96lNTSxA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TG5utN016882
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:05:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 11:05:55 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 11:05:56 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TG5tDr011739
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 11:05:55 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 29 Aug 2017 12:05:53 -0400
Message-ID: <1504022753-20132-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
References: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH 2/2] matrix-gui-apps-git: bump SRCREV for changes and additions
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
X-List-Received-Date: Tue, 29 Aug 2017 16:05:57 -0000
Content-Type: text/plain

* replace webkit-based browsers with the webengine-based ones
* add HMI EVSE demo

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index b805f5e..4d74224 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
+SRCREV = "d910584814644f853f3fe4fbe715f674f24b9bd3"
 BRANCH = "master"
-INC_PR = "r47"
+INC_PR = "r48"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


