Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id A394A52A20
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:37 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id j1so6816943oag.7
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zijskQ8LbcIWiVrex/1GDwpskouruOiO1hrcYajMObw=;
	b=vOdUUsVe9ViBTt3ENtM6Ag3iSm+VsAU3YN9juRPB97Gp1ApYKyO0exysfr+mZBevTA
	lx/ByR30JQ8tACvz5MT1ONR83Uef3plOWbt7J01Nx13D/psbptI2xyaFoag6asxuWVWe
	4HwIOWdrG3soixc+4mTy2A4zDtxEGYzm0woueJ/uXbDdrpt38mh3xoRrXYCPMo75TCKh
	93YkkoG5qAGQgOqKZeFZnAfWLQsGLR1nQ+0zMfyqvFjGo5qu1jEllrf3dunZ1HbxhTXu
	zqpdBeg7L0mlkBteWcuHC6yksuPpHSfNIfWJQYmmig1VPQetyxOse7hs9H6By/keNFKd
	wqmw==
X-Received: by 10.60.12.226 with SMTP id b2mr12245768oec.32.1360629997124;
	Mon, 11 Feb 2013 16:46:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:36 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:07 -0600
Message-Id: <1360629979-24789-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/18] ti-crypto-examples: Tweak SRCIPK_SRC_DIR variable
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:37 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Tweak the directory that the sources are grabbed from. This insures that the
  correct source is grabbed depending on the ARM architecture.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-crypto-examples_git.bbappend                |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend

diff --git a/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend b/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
new file mode 100644
index 0000000..3afd154
--- /dev/null
+++ b/meta-arago-distro/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+SRCIPK_SRC_DIR = "${SOURCE_DIR}"
-- 
1.7.0.4


