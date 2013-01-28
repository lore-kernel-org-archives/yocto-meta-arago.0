Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by arago-project.org (Postfix) with ESMTPS id BF17252A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:02 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wd20so2488046obb.9
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hcvsw/adxSOCafuY24mubV/atxVn7a5ftan779qz98A=;
	b=cx9yBiIin1qWftnunk14XZ2D2WOPhl2MdfpCk2r7PG1Mn3qUUcFeZboYs8DIUCrh7J
	WkYd7JXCQZskcJjOko84v1zxV0sDiFW2xnQpLTUCTpltGkZmoUTKJJaLc/gDDm77vpoc
	qkOcJ5zXwiet8EfJ+GRUlWbnkjgdoDaeGPiEbZDTx/+B36jtsKw53XSDye5qIsLrWbZD
	5/tRlodpYpf4rllRMj9rj23mG7pctNetZ4/SNAFvhTb3ghCVpDGTqi1S7cnXQNznKPFn
	oKMGuaK+VHnvcgCqyddkvrKWYrc3Qg1PUawa96j2F+RsEsDsXmKxZl4K+7JR8A28Hbuv
	9QCg==
X-Received: by 10.60.169.207 with SMTP id ag15mr11573067oec.120.1359393962196; 
	Mon, 28 Jan 2013 09:26:02 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:01 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:13 -0600
Message-Id: <1359393932-31361-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/32] matrix-gui-crypto-demos: Switch to C base crypto applications
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:03 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Matrix crypto applications are now C based.
* Add RDEPENDS to ti-crypto-examples since that package now provides the C
  application.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../matrix/matrix-gui-crypto-demos_2.0.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 1e7fd42..7d8f319 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -4,13 +4,13 @@ LICENSE = "CC-BY-SA"
 
 require matrix-gui-apps-git.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 inherit allarch
 
 S = "${WORKDIR}/git/cryptos_apps"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
-RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl"
+RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl ti-crypto-examples"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
-- 
1.7.0.4


