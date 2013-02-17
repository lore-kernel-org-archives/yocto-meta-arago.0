Return-Path: <fcooperjr27@gmail.com>
Received: from mail-yh0-f53.google.com (mail-yh0-f53.google.com
	[209.85.213.53])
	by arago-project.org (Postfix) with ESMTPS id ED74A52A2C
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:49 +0000 (UTC)
Received: by mail-yh0-f53.google.com with SMTP id q3so886260yhf.26
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=jZ2Igto6qKsesEerbY5KO/R48AQ+UF3gcO/DEc9VmH4=;
	b=pl3uNDYVgYLVOzQEHFTsE27xLFrbzrC/OdXJu8fq40ye+jJo7ILOMWvFQnpT6GNc4W
	91URtyspIfXekiSss2yui4cr3oc2TDi5qud5n7ePkiihPp2uFiE404wFAtg0hxUufdlT
	8GN9uLp/5OVbC0ZJXmnoj0I79x/ALiAVJ2ToRDK+3XcDkjG8o1/D72VBiJdVhQb8FqJH
	DQfTzNDsaLmzbkfoebPL6SgIM/aCM26IVCviM0+X3MqXzTflvcaHkfF6vZd6zmUGt8JI
	HvRBL3gueE/Wa14hR3nF4BdTAng+dvvjyx3IrcNA2WSHunrWorX61fbzAE0Z8DSJh4DW
	afEg==
X-Received: by 10.236.134.136 with SMTP id s8mr17150411yhi.13.1361141629520;
	Sun, 17 Feb 2013 14:53:49 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:48 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:09 -0600
Message-Id: <1361141595-1687-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/20] arm-benchmarks: Package sources for the right architecture.
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:50 -0000

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


