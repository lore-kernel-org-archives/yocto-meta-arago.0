Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id EBE4152AB0
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:50 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j6so2948214oag.12
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RKrK/Hl1VecGeO1RN4s+EW5om3Kl0VExy3H+J69I5wY=;
	b=IkvK/zIiwQEc7LHwVuv72HtZUicvp73hjWIJyXfcpXqaO6DqPpA3miJO9sIrPycRbr
	3Ms2J5QelN2WCU4PLM2zYDqupXaMzG9eABQq7Y9aTPdhchJp1gTZlx4ePXY/VpmyLiUK
	SOrSAx80tTSShINBsILwvph238Vw3ctV2M7hpXy/EU/0Jgz+Eu3TfO8tEpqJbhiBxNoh
	iRA3JGhL0NGXcUvldWRtUSZpJpmSA305uElVvAt+iJ6+bN8NIzaOitrNkzO6esvQBBuZ
	5AOq0h7/cTMxKM8AhE4oowepRSs4ry29pCiTSOu0twe5RasRIFeLWvt7uDL1w3VqiAny
	69yw==
X-Received: by 10.60.25.227 with SMTP id f3mr4691039oeg.17.1358445230395;
	Thu, 17 Jan 2013 09:53:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:49 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:15 -0600
Message-Id: <1358445195-22441-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/12] qt-tstat:Update Thermostat sources
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:51 -0000

* Update to the latest Qt thermostat demo sources*
* This update removes unnecessary debug information.
* Removes unneeded .pro.user file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-qt/qt-apps/qt-tstat_2.0.bb             |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
index d44eb58..143d0a2 100644
--- a/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
+++ b/meta-arago-extras/recipes-qt/qt-apps/qt-tstat_2.0.bb
@@ -10,10 +10,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=93a105adb99011afa5baee932b560714 \
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "2f461242d469871538e6cd05e887457674347e8f"
+SRCREV = "429c802ea04c41f7b29efb89642828091fb83f9b"
 
 SRC_URI = "git://gitorious.org/thermostat-demo/thermostat-demo.git;protocol=git"
 
-- 
1.7.0.4


