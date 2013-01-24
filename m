Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id 635EC52A74
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:55 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id 16so3724254obc.33
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Aq8WdLsBMhNv4aiI1d+I7Mo0hRlJg9YhGwdWtrf/eFk=;
	b=cvhRMEP8LvYPv5Cz14YMonPsiJpstfMYAWg3VZJPCFT+XIxQ8wI0Ilmmq8Eny0Ep79
	c6fgp8oOXvIiKz9RKT+cMZG3X6EtDJEUckZQQaARI61nyznsMUXjXjCxzHX+Ga2PBoVw
	czDV2lZob34XQ3+MfNP5JUy3vX7TvPZqWsVb3/GWGk85+EEC1ViA0jKrFxLi1swoAL+N
	pfD16+e4eLbhN8+H5ISY8DTjm8/Bvkf0AtIb6PdqDzlQ4EJBZzNX3C32q0aH8EMN+/Ue
	F411DbbXJESNr5GH/4R+VXQeZmaVVJQXjRfkapFWYF9tMAJaCsD8PpeG/Fw1h3d3XPV0
	K6CQ==
X-Received: by 10.182.2.132 with SMTP id 4mr1608733obu.42.1359037314887;
	Thu, 24 Jan 2013 06:21:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:53 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:20 -0600
Message-Id: <1359037281-12610-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 46/47] ti-tisdk-setup: Pull latest sources for create-sdcard fix
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:55 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Pull the latest sources to pickup a change in create-sdcard.sh
  to allow properly creating the rootfs in the case where there
  is both a .ubi and tar.gz file system in the SDK.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index 4e63986..92dceee 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH ?= "master"
-SRCREV = "49b4f5b891a4bb96990924ce6431e0c01f9f25d4"
+SRCREV = "9f013588bdeaaa5b24a0610d05cb8bb1e18e5e9c"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.7.0.4


