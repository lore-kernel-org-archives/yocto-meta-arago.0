Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id 0756B52A69
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:22 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id n16so1042219oag.37
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hykmlFaeVo26azZNADBAwgTq/x2CboOoU7SHnGxLrc4=;
	b=cM2oxwFN6yNCOUFzeNuV5ADf2LV98ZlJfRktOw3RCh9pvt09fOXTRENFunHctYcBY0
	vdN5ukp0R3RLIVxsww7MG2tLhoy6rWiMNf/pN9xJd7yEu4fFred6Qq2v0vuSlbjW/iKH
	XnI5V0LDR0/L+dUV5Sfsz3ElmXAMFmUBB2zHprjokYqelchhsVHqySt1Qtl/+8HA2GAr
	6O6m4V8LA2KxRI847nBaNZ4W5tyD+5jUw2xkFLNWrM2OskbRG6PnxpJIRRsJmrauwbo5
	oDjwVWCIkexa5U4ld8yR06rwhQHE68eWuQ7gq4veBVdaGTSQV1bf51J8IYmncudXfBnY
	3f3g==
X-Received: by 10.182.225.97 with SMTP id rj1mr5659270obc.40.1359151102487;
	Fri, 25 Jan 2013 13:58:22 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.20
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:21 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:54 -0600
Message-Id: <1359150851-23602-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 14/31] ti-crypto-examples: update to latest sources and add DEPENDS
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:23 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Update to the latest sources which use a different method to
  access the HW accelerators.
* Add a missing DEPENDS for openssl

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../ti-crypto-examples/ti-crypto-examples_git.bb   |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
index a35524f..4856ea9 100644
--- a/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
+++ b/meta-arago-extras/recipes-core/ti-crypto-examples/ti-crypto-examples_git.bb
@@ -3,11 +3,12 @@ HOMEPAGE = "http://arago-project.org/git/projects/?p=crypto-example-apps.git;a=s
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://AES/aes_256.c;beginline=9;endline=35;md5=8edbb4dee965d2f2eb5ca2822addcae5"
 SECTION = "console"
+DEPENDS += "openssl"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
-SRCREV = "d3cc223206367a02097c7ad4e997cf2bef975277"
+SRCREV = "7d7092f14005da15f556ef52cad73fb7fd038d7a"
 
 SRC_URI = "git://arago-project.org/git/projects/crypto-example-apps.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


