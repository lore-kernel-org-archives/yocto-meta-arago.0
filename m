Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 4157952A6B
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:06 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id o6so1002811oag.32
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RpFNiKIxgx+eyv6x/2AlWlNPGncQvWfdtS2x4aA+zmg=;
	b=Hfe5AAuiw5hqHtySZond9DBZGlJMk2jNdbigFnV4c6ipUP+9Q1lvSTjvOpOgA+DZGx
	ga2bdtP6zyFXJzgZaqKa7rw2SXmEbCVaYn7pdCBWVx8VbHTm83X79e3Ugw9PQ5W0QxWx
	ZDkzKGv+JwZQRQ+lr7UYp8egpVHe6tlm2Yba1HKp0CoIXfdEGlwourKM4aL2VMcbp8Dh
	73YnjXM/rpECnZoT5w2uun1Jqw35R1okt5GDLDvt08AHmbDnNGjFaPkVkwaP5wIdD6Mx
	C43NYJwfxPRBSXg4UnreUhHjukfUlnJpVHMoMGZ7MY0WcMoeLNZZxgZyxv7DtXa8+LOa
	ifiA==
X-Received: by 10.60.31.68 with SMTP id y4mr11953176oeh.121.1359393965841;
	Mon, 28 Jan 2013 09:26:05 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.03
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:04 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:15 -0600
Message-Id: <1359393932-31361-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/32] ti-tisdk-setup: Update to include several bug fixes
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:06 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Update to the latest git repository commit.
* One commit fixes a problem that results in an infinite loop
* Second commit fixes SDK setup scripts

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
index f7bc055..ef4529a 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
@@ -4,10 +4,10 @@ LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c
 
 COMPATIBLE_MACHINE = "am37x-evm|am3517-evm|beagleboard|ti33x|am180x-evm"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "master"
-SRCREV = "aa88547afb542d0ec7244959b48b792007c7f16d"
+SRCREV = "f0c3ec9c0475d7a69b81476141cc45999a11d34d"
 SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git/"
-- 
1.7.0.4


