Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6E2DA529C7
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 21:41:49 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93LfnAj029747
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:41:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507066909;
	bh=iZsL4uigwwikiObxivKdAFwFadserlQDzCpbRGTGNJk=;
	h=From:To:CC:Subject:Date;
	b=A5KGTZsXgAQqsX+ZG7WQB9DvWm4dUhWKH3dWfVT+7KV/7QqH0tg70nHnWfDy5OEbD
	srLyO3jBgDNMDY/4Yjk53BV20OkLm59dN8Z+BYckkWm8gC6zE71o8rw372xmMtTbNy
	S+kKjA9uK4dYQBSPEdSDy6MpETFhMFJM4v/XIPrE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93LfnBK010225
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 16:41:49 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 16:41:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 16:41:49 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93Lfm4g032427;
	Tue, 3 Oct 2017 16:41:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 17:41:47 -0400
Message-ID: <1507066907-22282-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][PATCH] qtwebengine: patch no longer applies to 5.9.2, disable for now
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
X-List-Received-Date: Tue, 03 Oct 2017 21:41:49 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-qt/qt5/qtwebengine_git.bbappend        |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
index 794459a..664fdf9 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtwebengine_git.bbappend
@@ -1,8 +1,9 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 PR_append = ".arago0"
 
+#    file://0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch
+
 SRC_URI += " \
-    file://0001-qtwebengine-fix-the-system-crash-due-to-mismatched-G.patch \
     file://0002-qtwebengine-set-default-logging-level-back-to-LOG_FA.patch \
     file://0003-qtwebengine-HACK-disable-SECCOMP-BPF-Sandbox-at-star.patch \
 "
-- 
1.7.9.5


