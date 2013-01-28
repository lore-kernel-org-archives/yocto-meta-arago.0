Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id C524752A70
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:56 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so2973650obc.4
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=08LQKt9uCIElyjP/sVSFPvSXh2NLLgiSz9BNgD0G6iY=;
	b=MWmDuzDwx/mQgHlNVSzQ8DrAhJMQO7oXKJWv2glZXOyInObOj3lDv1plqmcRNyVRm+
	Y/KL264yV5O/tOsAHuq1UVOcFWtpcz2I2rdmwWnQXYhDQjnctNS2pvmhk5oGHHR925C0
	REU53kmjlQCEUrvkvw4m9PJ+hGZ+Q9ZKPqYDVd/e+sPKdLwA135un1fsvUIawuI3fLI2
	FzpGS7FqnCuZ9qpCGelzpJZAmCFbpDF8QXkSL6QNP3EffeGr+j/5UAiMrTFOLrjq6JHz
	aFILBBy92ldlZm31I/1phuOZDUaHPiiGbUtzSAM7SB2/sBnbnTtebGZCdBCXBkv6l/WU
	SuTw==
X-Received: by 10.60.171.76 with SMTP id as12mr11729723oec.107.1359393956378; 
	Mon, 28 Jan 2013 09:25:56 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:55 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:10 -0600
Message-Id: <1359393932-31361-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/32] task-arago-toolchain-tisdk-target: Add task-arago-tisdk-addons-sdk-target
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:57 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add task-arago-tisdk-addons-sdk-target to toolchain task list.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-toolchain-tisdk-target.bb     |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
index ef1a803..1f7f0f7 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to build and install header and libs into the sdk"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -11,4 +11,5 @@ RDEPENDS_${PN} = "\
     task-arago-tisdk-connectivity-sdk-target \
     task-arago-tisdk-crypto-sdk-target \
     task-arago-tisdk-graphics-sdk-target \
+    task-arago-tisdk-addons-sdk-target \
 "
-- 
1.7.0.4


