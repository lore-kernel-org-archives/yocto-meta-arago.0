Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id E204252A79
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:00 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc18so1690155obb.8
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jWAy/u0A5k3WshmPTsQZxqkrMmSalKPTDjwMGmIzgEg=;
	b=c5ctK5Wz2lvA8qtnUdnpmU1rEe88QYfieDb5aWKPzofnAmivO4iQXr5O42+wsnp4gD
	VA8H4gQNRNjJ+TKXq+oTCP6D//Kha8C1f+8owuzc5/qCDJdlcLyqWVb4Ukacf/G1Q0/y
	Gi2x6hM4nwPHrGGmmhO7GPRw6ZqdOmEl31lrcddAEVujToxZdKUlb7b7qqKUC9RicK1f
	H99PytAPa322Y/Fe9Xg2RSwNR8GVndT0BZBUX3+eN2JcwE0RKxcT/BNrugTUspSSzJ8p
	tawpmRqWOGncu61v5Q+dIEKL2z+84UujP4rtrC2biaNvu9GRxonjOce9cNkuH0XGyDX+
	8vOQ==
X-Received: by 10.60.31.205 with SMTP id c13mr11631560oei.135.1359393960489;
	Mon, 28 Jan 2013 09:26:00 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.58
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:59 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:12 -0600
Message-Id: <1359393932-31361-12-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 12/32] matrix-gui-apps-git: Pull in latest Matrix Apps changes
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:01 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Pull in a change to use scripts for crypto demos.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 050ad2b..3f69d35 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "e739979100810a09a2157682e9000e40e99edbc3"
+SRCREV = "06b699311af0729eb327563f2e0b35570932a990"
 BRANCH = "master"
-INC_PR = "r8"
+INC_PR = "r9"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


