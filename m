Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id 4AFCD52A62
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:59 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i10so771276oag.0
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=oaHk+o/tWsdXA42BA6xtJEdcaeyoVaht/ZY7zd2Qktw=;
	b=G1hRecxnAVLK6+qfTfY7Uy+7+YWk/TccExmM59to3KkkEauEIeC4e7CevTkNhoHot3
	GPoVDhZLBq1/WYqdH8N+hUuCqB3uaF8dqlerrwweJGyPQFPc+fXFFFtx03O7HAxWsZo2
	ecmK4ixkZsxAiEsmHAI9AUaL16ruOqMOsRxOWhn96zSBxJA/NlUIs2Yy4wXdo5VFDCBt
	GMDNLhcBfuTLVgjfvVKYqOkLGQ/VK+WgePxixpeW4IGdCAMM8i1rRZnNECGYl0X32YuL
	HmddniLn4T0jpkBU0xq0jp3PdfRhkI75rzftpaCfdIyXRcu/uyaP66lOhIuFVPmckagg
	hzjA==
X-Received: by 10.182.147.69 with SMTP id ti5mr9707590obb.88.1359393958838;
	Mon, 28 Jan 2013 09:25:58 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.56
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:57 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:11 -0600
Message-Id: <1359393932-31361-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/32] ti-crypto-examples: Install OpenSSL script
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:59 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Update SRCREV to use the latest commit which tweaks the Makefile to install
  crypto example application scripts.
* Commit also includes some minor cleanup

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index 4856ea9..43810e2 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965
 SECTION = "console"
 DEPENDS += "openssl"
 
-PR = "r1"
+PR = "r2"
 
 BRANCH ?= "master"
-SRCREV = "7d7092f14005da15f556ef52cad73fb7fd038d7a"
+SRCREV = "37aad72a4d49d0a6dbe934495e5c3bd973a72f1a"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


