Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f177.google.com (mail-gg0-f177.google.com
	[209.85.161.177])
	by arago-project.org (Postfix) with ESMTPS id C961B52A1D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:51 +0000 (UTC)
Received: by mail-gg0-f177.google.com with SMTP id q1so464667gge.22
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8cdFM3EkPpjzi1j1PpStpTpvXX4j9m5c9RXaAs65xDk=;
	b=OCBkzxlnC1ggxqSNi8vUa8rzV6DGHq8KSkS4zu/jXwy/Rf6Jity4kLV145M2y1cg1/
	NJR1aX80RlaR4b6FFnMDU6xb85W/NEuiMbAaYqD8y3/ziraLrSteaGvEnyj0Mht9FFTI
	GPNGT14CVTuTCQMgFwKayB55eky603dvhwu6U6S0DMBxDrOAd1VvvH4gU3OCHqCj9uIa
	tdwcZS9E76FTEfAh1beFG79ZwJR3K8D1DwVeTMPtoq3puvmj1hs4HB74jTIOzxUZlzeF
	z1DufDqGJl4f3W4SWcK9awJ5S5sgDSyUvGS45yaTGek33U5EO40MfZjqPafUhQeAykXL
	8IwQ==
X-Received: by 10.101.142.13 with SMTP id u13mr4747123ann.67.1361141631286;
	Sun, 17 Feb 2013 14:53:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:50 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:10 -0600
Message-Id: <1361141595-1687-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/20] arm-benchmarks: Update Rules.make relative path
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:52 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Pull in the change that updates the Rule.make relative path within the
  Makefiles.
* Since the sources are packaged up differently the files have been moved.
---
 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
index 0e4ae85..af677d1 100644
--- a/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
+++ b/meta-arago-extras/recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb
@@ -4,10 +4,10 @@ LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7aefb5e1cffc7b6a3ef18b803f957922"
 SECTION = "system"
 
-PR = "r4"
+PR = "r5"
 
 BRANCH ?= "master"
-SRCREV = "f78411fbd9cb81c36c7067a74fd415ce7ce45dc4"
+SRCREV = "9b7b4fbde8fcf796a23da2a464dbf934e550f6c9"
 
 SRC_URI = "git://gitorious.org/arm_benchmarks/arm_benchmarks.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


