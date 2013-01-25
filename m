Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id AFE3352ADB
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:24 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id 16so1031523obc.19
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=sbSvrlVbQej0OOvYq+fbBMArTdF6DW5gQU1f6OwQjMI=;
	b=VfrCp0H+8tChdNs5TmzDeNrN/yW9xD0dLLGbRcXHHJYN76x8lKha+F1m6DYu7hKaWH
	ZD76ycazEdNMio23Vr7Oww716jNTRpNFlcXy08FamSlwjacokEdmpzHtQDQo7ZQOj/Gk
	SBBfob/xJIMiVC3gYHPqyte+/htJrqZMwSiG4cM70xF2mWvRjiUUipO6PY9fPyIzytAW
	PU67mcuwxm3XEYI9+oeH+MlKcpgIx8qDhd2sM6eyrdQq/nOPYDUGhO0oUl7iN0NWs+c7
	56rga4ESWJ4JPJz1GBt4TjId1Z8C+iwCkpprBZi7NlGAPXkH5Skaam/eVIFOmpK59bYW
	oCXA==
X-Received: by 10.182.18.133 with SMTP id w5mr5811319obd.64.1359151104121;
	Fri, 25 Jan 2013 13:58:24 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.22
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:23 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:55 -0600
Message-Id: <1359150851-23602-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/31] ti-tisdk-setup: Add 12.04 as a supported OS
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:25 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Update setup-host-check.sh to allow Ubuntu 12.04 to be used.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 92dceee..f7bc055 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
 
-PR = "r3"
+PR = "r4"
 
 BRANCH ?= "master"
-SRCREV = "9f013588bdeaaa5b24a0610d05cb8bb1e18e5e9c"
+SRCREV = "aa88547afb542d0ec7244959b48b792007c7f16d"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.7.0.4


