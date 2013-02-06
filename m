Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by arago-project.org (Postfix) with ESMTPS id 1F41C529D3
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 02:28:08 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id v19so946481obq.35
	for <meta-arago@arago-project.org>;
	Tue, 05 Feb 2013 18:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Y3H3iZhrJp3tvnTZXCFFuj2VgHiy9vFAzoNTEkZn7XE=;
	b=ZShelR4+mKGkhoPPC1xjjJ6UGgLVaztJhsgR1N0SIT3mJFA54GTJMVBxDmLOsbOemR
	gR48bOkW802P8bZAE/PjmXbUUWIwvvafC7hpCUM4DnzvTUdXA5eAv/UjOEnWNs6JieHk
	OiCq+2QM2VSF8tpGQN/eFK9UMRh1c1M41wChQCNOsEzPArMrX7chc1drUx07b4mI2knp
	qOwez6loB26wij/dR/fPjAmt7DUwZODZ9eJJjoXR5oyzgHiFM2fTB5MfeB1Q2h8BN6gp
	P8le8r6fpG/WDGTPV2o4Esdyg0SesYhbvR4WXg+NAiTuYUR4PUYELr3nj7Ujjv5IG2G/
	kBYg==
X-Received: by 10.60.30.42 with SMTP id p10mr20988157oeh.59.1360117687566;
	Tue, 05 Feb 2013 18:28:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm3307205oeh.8.2013.02.05.18.28.04
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 18:28:06 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2013 20:27:56 -0600
Message-Id: <1360117678-4395-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360117678-4395-1-git-send-email-fcooper@ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/4] nativesdk-qt4-tools: Use new native x11 package name.
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
X-List-Received-Date: Wed, 06 Feb 2013 02:28:08 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Nativesdk-libx11 has now been renamed to libx11-nativesdk.
* This ensure the x11 package is filtered out which prevents parsing/build
  errors due to x11 not being a distro feature.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/nativesdk-qt4-tools_4.8.3.bbappend         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
index 6296fbe..312571e 100644
--- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
+++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
@@ -1,7 +1,7 @@
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
 # For our distribution purposes we only use LGPLv2.1
 LICENSE = "LGPLv2.1"
 
-DEPENDS := "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
+DEPENDS := "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
-- 
1.7.0.4


