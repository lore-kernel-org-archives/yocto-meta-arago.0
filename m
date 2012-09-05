Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id AD712529A1
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 22:43:34 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so1246999obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 15:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TksrI58tT97yExq2yN6OX7UURJbuVso9WgbfGPKF0aQ=;
	b=wPH/+WQcpYDX7JGe4XK8fV49Edo0iCoJ9Oar/cikgUL5F76/F8ihd2eNtVh/4v+NuK
	71K/1EFF2FqEFFsc1w0ddoSwU54++U8dq/xzQBx7m0s9/DekjzLofz0MU54A1rWX/auW
	JHWuP7TZAlqjHJIlM1D3NgfPmAitN0aP3jTtvoVU3Q60Av8qjh3nzaJ+nqRORpSg1VyA
	ENWSEmZPk/SryqfE6lowffDK3F4VlmgZSP1DZlNX7lKZCfbGdQVJmLOxKAUhUI56PwOA
	bJHyMkTr+Uot5DZ9YgsT42nMC4SzhTYwy0okyiGklmahRl45xi1o8gSEwz/dtXHLLvpg
	hhKw==
Received: by 10.182.222.39 with SMTP id qj7mr90334obc.16.1346885014472;
	Wed, 05 Sep 2012 15:43:34 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q3sm249558oef.0.2012.09.05.15.43.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 15:43:34 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 18:00:57 -0500
Message-Id: <1346886057-7807-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1346886057-7807-1-git-send-email-fcooper27jr@gmail.com>
References: <1346886057-7807-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2] thttpd: Port arago changes
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
X-List-Received-Date: Wed, 05 Sep 2012 22:43:35 -0000

* Port changes from arago.
* Set the port used by thttpd to 8080

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../recipes-extended/thttpd/thttpd/init            |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-extended/thttpd/thttpd/init b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
index df6d648..e1ee23f 100644
--- a/meta-arago-distro/recipes-extended/thttpd/thttpd/init
+++ b/meta-arago-distro/recipes-extended/thttpd/thttpd/init
@@ -13,7 +13,7 @@ test -x "$thttpd" || exit 0
 case "$1" in
   start)
     echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
     echo "."
     ;;
   stop)
@@ -22,11 +22,11 @@ case "$1" in
     echo "."
     ;;
   reload|force-reload)
-    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd 
+    start-stop-daemon --stop --quiet --signal 1 --exec $thttpd
     ;;
   restart)
     echo -n "Stopping thttpd"
-    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --stop --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
     echo "."
     echo -n "Waiting for thttpd to die off"
     for i in 1 2 3 ;
@@ -36,7 +36,7 @@ case "$1" in
     done
     echo ""
     echo -n "Starting thttpd"
-    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR
+    start-stop-daemon --start --quiet --exec $thttpd -- -d @@SRVDIR -p 8080
     echo "."
     ;;
   *)
-- 
1.7.0.4


