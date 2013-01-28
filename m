Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by arago-project.org (Postfix) with ESMTPS id 1BB1B52A6F
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:08 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id ni5so1731528obc.40
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=h1TBeNMiI07BEj4TnEaWZTPA2LMer7TsY29kZxbLo44=;
	b=a2uLAksNgeFgqIx/ckisEe37p7eESUElbAttMNcAAE3/39ZeJ1euD6tLSZZJXGyoVH
	Cqeu7umP9uDLnY87aSy4XCnYmGj7as4n17O5ULaFsb7f9+tawbXH7hISVfKCRHTJzbMZ
	Gxwfvm9+ZMDmd9ePM0I1lYK26tkjWYGlfrbmzDVvoIgcg9dX95gRA1EWq6NrP/5spJLL
	rRNjMDf9kSPQsLYAENYaXITrXyahqNuXri4zvFidjceCPPJPUSQiyul1nc2thxCGoCGy
	vEx1y1GhjTWDBg8AfzP/LTv3Mqc26YqDeuF0qwdvdeKXf17awJsUtm3yQZW11DaMDh5a
	x9fQ==
X-Received: by 10.182.123.78 with SMTP id ly14mr11922944obb.58.1359393967468; 
	Mon, 28 Jan 2013 09:26:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:06 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:16 -0600
Message-Id: <1359393932-31361-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/32] task-arago-tisdk-connectivity: Add obex-client to the runtime dependencies list
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:08 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Obex-client is required for some of the scripts to run problem. Adding it as
  an runtime dependency to insure that it is pulled in.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-tisdk-connectivity.bb         |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
index 06601d6..d09fa0f 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-connectivity.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Task to install wlan and bluetooth packages into the target FS"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r2"
+PR = "r3"
 
 inherit task
 
@@ -23,6 +23,7 @@ WLAN_COMMON = "\
     oppserver \
     bluez-tools \
     obexd \
+    obex-client \
     pulseaudio \
     pulseaudio-server \
     pulseaudio-module-loopback \
-- 
1.7.0.4


