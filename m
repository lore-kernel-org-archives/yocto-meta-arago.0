Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id 004F352A29
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:36 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id za17so2853778obc.31
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ajKYlqi0tbWf0IQBZptAdz1MMNw46tduAIIsydW2a7g=;
	b=pKgWWTpG/9J+15mr1B0++2YqbQ2TbVoMApvEMkjHf3gApthLCZmzlp9bb9rloFn7gG
	5JQoC8Fe7b7/ty/wC2MO2ZfCVu9xcpHwf+ggF7TeBc4iqLNcmMTXrG3f63S0w/XnTVnj
	gCZK81NBS1J2VvOudqX6pYlg5e0m0l4usPX99NQjqXzY/OXKmnkmFnZX5C4pb2Q8L9zN
	V9SJFwsu4lTtcZtI3NM1MHY1a1xnZ747Usf9eT25QAN3sQKRM5e49kH5P1zhJJCMzRlI
	j8L3Ag+uh26rxH0S8f4ngZMHTqMvrXmerYxHBSnd//c/Au6lTNcdJTNRoTTjgnSf6XDJ
	BgZg==
X-Received: by 10.182.3.163 with SMTP id d3mr4636005obd.27.1358445216427;
	Thu, 17 Jan 2013 09:53:36 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:35 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:07 -0600
Message-Id: <1358445195-22441-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/12] matrix-gui-apps: Add audio capture demo
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:37 -0000

* Update to the latest Matrix v2 apps commit.
* This updated commit brings in a new audio capture demo.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ddbc7a7..63e73f2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "6a0c9776adfef03463535de6c7059d8525a336aa"
+SRCREV = "df5b70b2f7cd97148855fe4d0508789c710bcc4e"
 BRANCH = "master"
-INC_PR = "r5"
+INC_PR = "r6"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


