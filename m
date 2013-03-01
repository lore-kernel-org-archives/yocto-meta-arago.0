Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 4506052AAE
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:11:04 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id un3so625827obb.38
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jZ2Igto6qKsesEerbY5KO/R48AQ+UF3gcO/DEc9VmH4=;
	b=BCPeScOGADXwLzNXmgeIqCj8hMXnZTSOseGcyuiyqcNVexVrSJgQ+JUrrItKeLfXm8
	lh70lbkZLC60WEFo/LVo1DgjQhbdarVTY2oxa03HnLrQny1npQwztkVObSVRKdMX3yan
	zg/ETGHMiqytZLb4iu8FeeMDUCZH3Fa5UJ4zCuNL5LdpnI4wj4vwhhknwENg2bUOhju9
	6/XtSIXpPoJlXWXX6+O9Vnc4JWIi/ZOkNOxkJbl7F9d+fxYjxfdD+8Jo2QwL9+53jDws
	zD8QWfN2+sLcyr9z8qr2MuPOTPGmRG9g3P/YwudvileTS4LtrqVx1Nv5+TWXJOyjUXlP
	HAMg==
X-Received: by 10.182.235.49 with SMTP id uj17mr7384858obc.18.1362107463810;
	Thu, 28 Feb 2013 19:11:03 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.11.01
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:11:02 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:42 -0600
Message-Id: <1362107447-11234-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/9] arm-benchmarks: Package sources for the right architecture.
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:04 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Instead of packaging the sources for armv5te and armv7a package the sources
  depending on the device.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../arm-benchmarks/arm-benchmarks_1.3.bbappend     |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bbappend

diff --git a/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bbappend b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bbappend
new file mode 100644
index 0000000..bdd9124
--- /dev/null
+++ b/meta-arago-distro/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+SRCIPK_SRC_DIR = "${S}/${PLATFORM_ARCH}"
-- 
1.7.0.4


