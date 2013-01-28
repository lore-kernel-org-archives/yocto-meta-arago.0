Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by arago-project.org (Postfix) with ESMTPS id A89B952A85
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:16 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wd20so2488303obb.9
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=F4cWH5L9AvcMMcEspUJreyqcqzIfWHO7K6NO4yU1OiU=;
	b=wWBSFvwnKnjvRjMh4TbKrhKgX9symW2e3aZoo88U+M3j/C0fan3SqGFhmNzrEKQ/4P
	63MqwDTKjPE17OEz2aZbK+O8YN6eNmu6wF33GvYhdsGMvP4NThoMX5xDLMvwrJsqZnMd
	ECgusBPkvXOdw6JACc8U9RC9kS5ARujpCa5hHds7Fw9gHA148RFGoAa6H/3w9FarkgmC
	dTkb+WG6At+OP3HCOLOEoz/Mj3HTJHeoxRN0vQGsEzclFB+zPE1j+XcapwCiUeCTpZDV
	Yem4sWwCs7tD0yqAc2WB+WmpNANRdPMV45ZpVs+PeoyCR17MyK/z74CwOZt5ZFvj4SRn
	pubw==
X-Received: by 10.60.172.131 with SMTP id bc3mr4665240oec.79.1359393976264;
	Mon, 28 Jan 2013 09:26:16 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.14
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:15 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:21 -0600
Message-Id: <1359393932-31361-21-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 21/32] ti-wif-utils: Only run calibrate on startup
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:16 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Updated initscript parameters to only run the calibrate script on startup.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-wifi-utils/ti-wifi-utils_git.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
index 9bcfa81..142a720 100644
--- a/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
+++ b/meta-arago-extras/recipes-devtools/ti-wifi-utils/ti-wifi-utils_git.bb
@@ -7,8 +7,9 @@ RDEPENDS = "ti-compat-wireless-wl12xx wl12xx-firmware"
 
 inherit update-rc.d
 INITSCRIPT_NAME="calibrate.sh"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 ."
 
-PR ="r1+gitr${SRCPV}"
+PR ="r2+gitr${SRCPV}"
 PV ="0.0"
 
 SRCREV = "ol_R5.SP3.05"
-- 
1.7.0.4


