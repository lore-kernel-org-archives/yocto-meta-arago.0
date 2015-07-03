Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id B1E9F52AC8
	for <meta-arago@arago-project.org>;
	Fri,  3 Jul 2015 03:02:33 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQW008655RTV7F0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 02 Jul 2015 22:02:23 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Lv5vsSpc c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8	a=9yNYM2NONEdhqhEkmDwA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4973A161AD1;	Thu,
	2 Jul 2015 23:02:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 02 Jul 2015 23:01:34 -0400
Message-id: <1435892533-6046-16-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1435892533-6046-1-git-send-email-denis@denix.org>
References: <1435892533-6046-1-git-send-email-denis@denix.org>
Subject: [PATCH 15/54] qt4: update bbappends from 4.8.5 to 4.8.6
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
X-List-Received-Date: Fri, 03 Jul 2015 03:02:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ivesdk-qt4-tools_4.8.5.bbappend => nativesdk-qt4-tools_4.8.6.bbappend} | 0
 ...{qt4-embedded-gles_4.8.5.bbappend => qt4-embedded-gles_4.8.6.bbappend} | 0
 .../qt4/{qt4-embedded_4.8.5.bbappend => qt4-embedded_4.8.6.bbappend}      | 0
 .../qt4/{qt4-embedded-gles_4.8.5.bb => qt4-embedded-gles_4.8.6.bb}        | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-distro/recipes-qt/qt4/{nativesdk-qt4-tools_4.8.5.bbappend => nativesdk-qt4-tools_4.8.6.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded-gles_4.8.5.bbappend => qt4-embedded-gles_4.8.6.bbappend} (100%)
 rename meta-arago-distro/recipes-qt/qt4/{qt4-embedded_4.8.5.bbappend => qt4-embedded_4.8.6.bbappend} (100%)
 rename meta-arago-extras/recipes-qt/qt4/{qt4-embedded-gles_4.8.5.bb => qt4-embedded-gles_4.8.6.bb} (100%)

diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.5.bbappend
rename to meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.6.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend
rename to meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bbappend
diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.6.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.5.bbappend
rename to meta-arago-distro/recipes-qt/qt4/qt4-embedded_4.8.6.bbappend
diff --git a/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bb b/meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
similarity index 100%
rename from meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bb
rename to meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.6.bb
-- 
2.2.0


