Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 367C552A19
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 15:05:48 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NSV00N78GKZ3900@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Aug 2015 10:05:28 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=MU7iauR8p3Pzr1LYDw8A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B02E9161B53;	Mon,
	10 Aug 2015 11:05:23 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 10 Aug 2015 11:05:21 -0400
Message-id: <1439219121-18334-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1439219121-18334-1-git-send-email-denis@denix.org>
References: <1439219121-18334-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/2] oprofile-example: Makefile is not being used, don't do clean too
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
X-List-Received-Date: Mon, 10 Aug 2015 15:05:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/oprofile-example/oprofile-example_git.bb            | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index dbcf5b9..dd013c8 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://signal_parent.c;beginline=1;endline=37;md5=3c72149bb4
 SECTION = "system"
 
 INHIBIT_PACKAGE_STRIP = "1"
+CLEANBROKEN = "1"
 
 PR = "r4"
 
@@ -17,8 +18,8 @@ SRC_URI = "git://git.ti.com/apps/oprofile-example.git;protocol=git;branch=${BRAN
 S = "${WORKDIR}/git"
 
 do_compile() {
-    install -d  ${S}/Debug
-    install -d  ${S}/Debug1
+	install -d ${S}/Debug
+	install -d ${S}/Debug1
 	${CC} ${CFLAGS} ${LDFLAGS} -o Debug/signal_parent signal_parent.c
 	${CC} ${CFLAGS} -DUSE_SIGNALS ${LDFLAGS} -o Debug1/signal_parent.opt signal_parent.c
 }
-- 
2.2.0


