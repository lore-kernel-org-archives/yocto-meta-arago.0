Return-Path: <d-senicic1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id EDF53529BF
	for <meta-arago@arago-project.org>;
	Fri, 15 Mar 2019 15:09:56 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2FF9jCp124568
	for <meta-arago@arago-project.org>; Fri, 15 Mar 2019 10:09:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552662585;
	bh=GOnFi06+01pMl+DmhcvfCHDUkwpiNPUUCfn/SRHrtpE=;
	h=From:To:CC:Subject:Date;
	b=HF9uFu5IKruI/ANvjS9P3qdxPGcl+s7mOUxxnZDK/hSFt8KVW036hnEkjHqlVkpeu
	BOdyD9fTyGgfjEgokjaQ9bgQb8t/jkRc+dQHDzZynjkwHZq2SlUNnrAdXNRNY/pF6p
	Pwb42iiit7mz0EqV+HCa/DF9NZOOqNY8NvAawKJI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2FF9ju7055990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 15 Mar 2019 10:09:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 15 Mar 2019 10:09:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Fri, 15 Mar 2019 10:09:45 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2FF9ieR014409;
	Fri, 15 Mar 2019 10:09:44 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 15 Mar 2019 06:03:10 -0400
Message-ID: <20190315100310.20229-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [rocko/master][PATCH] [matrix-gui-apps] SRCREV bump for TIDL demo file path fix
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
X-List-Received-Date: Fri, 15 Mar 2019 15:09:57 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 82882ea4..8cd90427 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "f9fa5cb158902b6a3520fb7e853cc049ea920ae5"
+SRCREV = "447330830a22028958c361f3f54020dc26427856"
 BRANCH = "master"
-INC_PR = "r67"
+INC_PR = "r68"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.17.1


