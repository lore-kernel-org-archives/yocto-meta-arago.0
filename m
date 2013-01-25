Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id 3D0C652A9C
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:47 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so1047999obc.15
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=q+Rm2DlmgZtVN37Z9DJCw5SAslryf29OvWXLlYt4dhs=;
	b=jamBG3DA+ALcxbrO89YOW/khsaE/Rw/DaL3nLZ+aNDsZ8vdHQwVvc6oStH534s33Ah
	twF58odtRKblil4N0Cbi1UCUCyM+G91Mu6AMJ5PAiZ3LFa8OqnsZjbwVHeZ0d7E45BdW
	pqnFklDIIzk2j0/rCcLzogtbXtbnjyKs4pC/OAFPi+dh0WLkNIkeRuCp+Fqwp+AOfgGk
	MA0qxPJrDLcHot4Fi0QCvTnYuUNr5qCY85xzX8jEXL/rynRxHhposaNfddJ3ndaBkshX
	r/70+7kdf+6M/Lb/Z/qLb9H3dXMN7MBxG0S0m1adj/czMULEDQ47PcjUuhuVChLxhnJi
	xmYA==
X-Received: by 10.60.21.131 with SMTP id v3mr5787780oee.32.1359151126268;
	Fri, 25 Jan 2013 13:58:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:45 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:07 -0600
Message-Id: <1359150851-23602-26-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 27/31] tisdk-image.bbclass: Update manifest text
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:47 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Update manifest text to be clear that the SDK contains TSU exempt software.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/classes/tisdk-image.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/tisdk-image.bbclass b/meta-arago-distro/classes/tisdk-image.bbclass
index bbccdc4..8ef8ad8 100644
--- a/meta-arago-distro/classes/tisdk-image.bbclass
+++ b/meta-arago-distro/classes/tisdk-image.bbclass
@@ -195,11 +195,11 @@ Your company is responsible for confirming the applicable license terms for any
 
 <h2><b>Export Information</b></h2>
 <p>
-ECCN for Software included in this release: 5D002
+ECCN for Software included in this release: 5D002 License Exception TSU
 </p>
 
 <p>
-ECCN for Technology (e.g., user documentation, specifications) included in this release: 5D002
+ECCN for Technology (e.g., user documentation, specifications) included in this release: 5D002 License Exception TSU
 </p>
 
 <h2><b>Manifest</b></h2>
-- 
1.7.0.4


